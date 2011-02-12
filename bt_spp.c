/*
 * Copyright (c) 2009 PASCO scientific
 * All rights reserved. 
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED 
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwBT Bluetooth stack.
 * 
 * Author: Laine Walker-Avina <lwalkera@ieee.org>
 * Based on code from: Conny Ohult <conny@sm.luth.se>
 *
 */


/**
 * @file bt_spp.c
 *
 * This is a control application that initialises a host controller and
 * connects to a network as a DT through a DUN or LAP enabled device.
 * When a network connection has been established, it initialises its own LAP
 * server.
 */


#include "lwip/mem.h"
#include "lwip/memp.h"
#include "lwip/stats.h"
#include "lwip/inet.h"

#define USE_AND_OR /* To enable AND_OR mask setting */
#include<ports.h>
#include<outcompare.h>

#include "lwbt/phybusif.h"
#include "lwbt/lwbt_memp.h"
#include "lwbt/hci.h"
#include "lwbt/l2cap.h"
#include "lwbt/sdp.h"
#include "lwbt/rfcomm.h"

#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "ctimer.h"

//#include "stdlib.h"

#define BT_SPP_DEBUG LWIP_DBG_ON /* Controls debug messages */

err_t command_complete(void *arg, struct hci_pcb *pcb, u8_t ogf, u8_t ocf, u8_t result);
err_t pin_req(void *arg, struct bd_addr *bdaddr);
err_t link_key_req(void *arg, struct bd_addr *bdaddr);
err_t link_key_not(void *arg, struct bd_addr *bdaddr, u8_t *key);
err_t l2cap_connected(void *arg, struct l2cap_pcb *l2cappcb, u16_t result, u16_t status);
err_t bt_spp_init();

struct bt_state {
	struct bd_addr bdaddr;
	struct pbuf *p;
	u8_t btctrl;
	u8_t cn;
} bt_spp_state;

static const u8_t spp_service_record[] =
{
		SDP_DES_SIZE8, 0x8, 
			SDP_UINT16, 0x0, 0x0, /* Service record handle attribute */
				SDP_UINT32, 0x00, 0x00, 0x00, 0x00, /*dummy vals, filled in on xmit*/ 
		SDP_DES_SIZE8, 0x16, 
			SDP_UINT16, 0x0, 0x1, /* Service class ID list attribute */
			SDP_DES_SIZE8, 17,
				SDP_UUID128, 0x00, 0x00, 0x11, 0x01,
					0x00, 0x00,
					0x10, 0x00,
					0x80, 0x00,
					0x00, 0x80, 0x5f, 0x9b, 0x34, 0xfb,
		SDP_DES_SIZE8, 0x11,
			SDP_UINT16, 0x0, 0x4, /* Protocol descriptor list attribute */
			SDP_DES_SIZE8, 0xc, 
				SDP_DES_SIZE8, 0x3,
					SDP_UUID16, 0x1, 0x0, /*L2CAP*/
				SDP_DES_SIZE8, 0x5,
					SDP_UUID16, 0x0, 0x3, /*RFCOMM*/
					SDP_UINT8, 0x1, /*RFCOMM channel*/
		SDP_DES_SIZE8, 0x8,
			SDP_UINT16, 0x0, 0x5, /*Browse group list */
			SDP_DES_SIZE8, 0x3,
				SDP_UUID16, 0x10, 0x02, /*PublicBrowseGroup*/
};

/* 
 * bt_spp_start():
 *
 * Called by the main application to initialize and connect to a network
 *
 */
void bt_spp_start(void)
{
	hci_reset_all();
	l2cap_reset_all();
	sdp_reset_all();
	rfcomm_reset_all();

	LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_start\n"));

	hci_cmd_complete(command_complete);
	hci_pin_req(pin_req);
	hci_link_key_req(link_key_req);
	hci_link_key_not(link_key_not);
	bt_spp_state.btctrl = 0;
	bt_spp_state.p = NULL;
	hci_reset();

	if(bt_spp_init() != ERR_OK) /* Initialize the SPP role */
	{
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_start: couldn't init role\n"));
		return;
	}
}

/* 
 * bt_spp_tmr():
 *
 * Called by the main application to initialize and connect to a network
 *
 */
void bt_spp_tmr(void)
{


}

/* 
 * rfcomm_disconnected():
 *
 * Called by RFCOMM when the remote RFCOMM protocol or upper layer was disconnected.
 * Disconnects the PPP protocol.
 *
 */
err_t rfcomm_disconnected(void *arg, struct rfcomm_pcb *pcb, err_t err) 
{
	err_t ret = ERR_OK;

	LWIP_DEBUGF(BT_SPP_DEBUG, ("rfcomm_disconnected: CN = %d\n", rfcomm_cn(pcb)));
	if(rfcomm_cn(pcb) != 0) {
		; //ppp_lp_disconnected(pcb);
	}
	rfcomm_close(pcb);

	SetDCOC1PWM(0,0);
	SetDCOC2PWM(0,0);

	return ret;
}

/* 
 * l2cap_disconnected_ind():
 *
 * Called by L2CAP to indicate that remote L2CAP protocol disconnected.
 * Disconnects the RFCOMM protocol and the ACL link before it initializes a search for 
 * other devices.
 *
 */
err_t l2cap_disconnected_ind(void *arg, struct l2cap_pcb *pcb, err_t err)
{
	err_t ret = ERR_OK;

	LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_disconnected_ind: L2CAP disconnected\n"));

	if(pcb->psm == SDP_PSM) { 
		sdp_lp_disconnected(pcb);
		l2cap_close(pcb);
	} else if(pcb->psm == RFCOMM_PSM) {
		ret = rfcomm_lp_disconnected(pcb);
		/* We can do this since we know that we are the only channel on the ACL link.
		 * If ACL link already is down we get an ERR_CONN returned */
		hci_disconnect(&(pcb->remote_bdaddr), HCI_OTHER_END_TERMINATED_CONN_USER_ENDED);
		l2cap_close(pcb);
		bt_spp_start();
	}

	return ret;
}

err_t spp_recv(void *arg, struct rfcomm_pcb *pcb, struct pbuf *p, err_t err)
{
	u8_t *data = p->payload;
	struct pbuf *q = NULL;
	char cm1[3];
	char cm2[3];
	u8_t m;
	static int lm1;
	static int lm2;
	int m1;
	int m2;
	
	LWIP_DEBUGF(BT_SPP_DEBUG, ("spp_recv: p->len == %d p->tot_len == %d\n", p->len, p->tot_len));

	q = pbuf_alloc(PBUF_RAW, p->tot_len, PBUF_RAM);
	if(p->tot_len != 0)
	{
		((u8_t*)q->payload)[0] = *((u8_t *)p->payload);
		if(*data == 'm')
		{
			m = 0x10;
			cm1[0] = *(data+2);
			cm1[1] = *(data+3);
			cm1[2] = 0x00;
			m1 = atoi(cm1);

			if(m1 == 0){
				m |= 0x03;
			}else if(*(data+1) == '+'){
				m |= 0x01;
			}else if(*(data+1) == '-'){
				m |= 0x02;
			}
			lm1 = m1;

			cm2[0] = *(data+5);
			cm2[1] = *(data+6);
			cm2[2] = 0x00;
			m2 = atoi(cm2);

			if(m2 == 0){
				m |= 0x0c;
			}else if(*(data+4) == '+'){
				m |= 0x04;
			}else if(*(data+4) == '-'){
				m |= 0x08;
			}
			lm2 = m2;

			LWIP_DEBUGF(BT_SPP_DEBUG, ("spp_recv: m1 %d m2 %d\n", m1, m2));
			
			SetDCOC1PWM((0xffff/10)*m1,0);
			SetDCOC2PWM((0xffff/10)*m2,0);

			mPORTEWrite(m);
		}else{
			if(*data == 'a')
			{
				mPORTEWrite(0x1f);
				DelayMs(3);
				mPORTEWrite(0x15);
			}else if(*data == 's')
			{
				mPORTEWrite(0x1f);
				DelayMs(3);
				mPORTEWrite(0x1a);
			}else if(*data == 'd')
			{
				mPORTEWrite(0x1f);
				DelayMs(3);
				mPORTEWrite(0x19);
			}else if(*data == 'f')
			{
				mPORTEWrite(0x1f);
				DelayMs(3);
				mPORTEWrite(0x16);
			}else if(*data == 'g')
			{
				mPORTEWrite(0x10);
			}else{
			}
		}
	}

	if(rfcomm_cl(pcb)) {
		rfcomm_uih_credits(pcb, PBUF_POOL_SIZE - rfcomm_remote_credits(pcb), q);
	} else {
		rfcomm_uih(pcb, rfcomm_cn(pcb), q);
	}
	pbuf_free(q);

	pbuf_free(p);
	return ERR_OK;
}

err_t rfcomm_accept(void *arg, struct rfcomm_pcb *pcb, err_t err) 
{
	LWIP_DEBUGF(BT_SPP_DEBUG, ("rfcomm_accept: CN = %d\n", rfcomm_cn(pcb)));

	rfcomm_disc(pcb, rfcomm_disconnected);
	if(pcb->cn != 0) {
		//set recv callback
		rfcomm_recv(pcb, spp_recv);
	}
	return ERR_OK;
}

static err_t bt_disconnect_ind(void *arg, struct l2cap_pcb *pcb, err_t err)
{
	err_t ret;

	LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_disconnect_ind\n"));

	if(pcb->psm == SDP_PSM) { 
		sdp_lp_disconnected(pcb);
	} else if(pcb->psm == RFCOMM_PSM) {
		ret = rfcomm_lp_disconnected(pcb);
	}

	l2cap_close(pcb);
	return ERR_OK;
}

err_t bt_connect_ind(void *arg, struct l2cap_pcb *pcb, err_t err)
{
	LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_connect_ind\n"));

	/* Tell L2CAP that we wish to be informed of a disconnection request */
	l2cap_disconnect_ind(pcb, bt_disconnect_ind);

	/* Tell L2CAP that we wish to be informed of incoming data */
	if(pcb->psm == SDP_PSM) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_connect_ind SDP\n"));
		l2cap_recv(pcb, sdp_recv);
	} else if (pcb->psm == RFCOMM_PSM) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_connect_ind RFCOMM\n"));
		l2cap_recv(pcb, rfcomm_input);
	}
	return ERR_OK;  
}

err_t bt_spp_init(void)
{
	struct l2cap_pcb *l2cappcb;
	struct rfcomm_pcb *rfcommpcb;
	struct sdp_record *record;

	if((l2cappcb = l2cap_new()) == NULL) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_init: Could not alloc L2CAP PCB for SDP_PSM\n"));
		return ERR_MEM;
	}
	l2cap_connect_ind(l2cappcb, SDP_PSM, bt_connect_ind);

	if((l2cappcb = l2cap_new()) == NULL) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_init: Could not alloc L2CAP PCB for RFCOMM_PSM\n"));
		return ERR_MEM;
	}
	l2cap_connect_ind(l2cappcb, RFCOMM_PSM, bt_connect_ind);

	LWIP_DEBUGF(RFCOMM_DEBUG, ("bt_spp_init: Allocate RFCOMM PCB for CN 0\n"));
	if((rfcommpcb = rfcomm_new(NULL)) == NULL) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_init: Could not alloc RFCOMM PCB for channel 0\n"));
		return ERR_MEM;
	}
	rfcomm_listen(rfcommpcb, 0, rfcomm_accept);

	LWIP_DEBUGF(RFCOMM_DEBUG, ("bt_spp_init: Allocate RFCOMM PCB for CN 1\n"));
	if((rfcommpcb = rfcomm_new(NULL)) == NULL) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("lap_init: Could not alloc RFCOMM PCB for channel 1\n"));
		return ERR_MEM;
	}
	rfcomm_listen(rfcommpcb, 1, rfcomm_accept);

	if((record = sdp_record_new((u8_t *)spp_service_record, sizeof(spp_service_record))) == NULL) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("bt_spp_init: Could not alloc SDP record\n"));
		return ERR_MEM;
	} else {
		sdp_register_service(record);
	}

	LWIP_DEBUGF(BT_SPP_DEBUG, ("SPP initialized\n"));
	return ERR_OK;
}

/*
 * pin_req():
 *
 * Called by HCI when a request for a PIN code has been received. A PIN code
 * is required to create a new link key.
 * Replys to the request with the given PIN code
 */
err_t pin_req(void *arg, struct bd_addr *bdaddr)
{
	u8_t pin[] = "1234";
	LWIP_DEBUGF(BT_SPP_DEBUG, ("pin_req\n"));
	return hci_pin_code_request_reply(bdaddr, 4, pin);
}

/*
 * link_key_req():
 *
 */
err_t link_key_req(void *arg, struct bd_addr *bdaddr)
{
	LWIP_DEBUGF(BT_SPP_DEBUG, ("link_key_req\n"));
	return hci_link_key_request_negative_reply(bdaddr, 0);
}

/*
 * link_key_not():
 *
 * Called by HCI when a new link key has been created for the connection
 * Writes the key to the Bluetooth host controller, where it can be stored for future
 * connection attempts.
 *
 */
err_t link_key_not(void *arg, struct bd_addr *bdaddr, u8_t *key)
{
	LWIP_DEBUGF(BT_SPP_DEBUG, ("link_key_not\n"));
	return hci_write_stored_link_key(bdaddr, key); /* Write link key to be stored in the
													  Bluetooth host controller */
}

/*
 * l2cap_disconnected_cfm():
 *
 * Called by L2CAP to confirm that the L2CAP disconnection request was successful
 *
 */
err_t l2cap_disconnected_cfm(void *arg, struct l2cap_pcb *pcb) 
{
	LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_disconnected_cfm\n"));
	l2cap_close(pcb);
	return ERR_OK;
}

/*
 * get_rfcomm_cn():
 *
 * Parse the RFCOMM channel number from an SDP attribute list
 *
 */
u8_t get_rfcomm_cn(u16_t attribl_bc, struct pbuf *attribute_list)
{
	u8_t i;
	for(i = 0; i < attribl_bc; i++) {
		if(((u8_t *)attribute_list->payload)[i] == (SDP_DE_TYPE_UUID | SDP_DE_SIZE_16)) {
			if(ntohs(*((u16_t *)(((u8_t *)attribute_list->payload)+i+1))) == 0x0003) {
				return *(((u8_t *)attribute_list->payload)+i+4);
			}
		}
	}
	return 0;
}

/*
 * rfcomm_connected():
 *
 * Called by RFCOMM when a connection attempt response was received.
 * Creates a RFCOMM connection for the channel retreived from SDP.
 * Initializes a search for other devices if the connection attempt failed.
 */
err_t rfcomm_connected(void *arg, struct rfcomm_pcb *pcb, err_t err) 
{
	if(err == ERR_OK) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("rfcomm_connected. CN = %d\n", rfcomm_cn(pcb)));
		rfcomm_disc(pcb, rfcomm_disconnected);
	} else {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("rfcomm_connected. Connection attempt failed CN = %d\n", rfcomm_cn(pcb)));
		l2cap_close(pcb->l2cappcb);
		rfcomm_close(pcb);
		bt_spp_start();
	}
	return ERR_OK;
}

/*
 * sdp_attributes_recv():
 *
 * Can be used as a callback by SDP when a response to a service attribute request or 
 * a service search attribute request was received.
 * Disconnects the L2CAP SDP channel and connects to the RFCOMM one.
 * If no RFCOMM channel was found it initializes a search for other devices.
 */
void sdp_attributes_recv(void *arg, struct sdp_pcb *sdppcb, u16_t attribl_bc, struct pbuf *p)
{
	struct l2cap_pcb *l2cappcb;

	l2ca_disconnect_req(sdppcb->l2cappcb, l2cap_disconnected_cfm);
	/* Get the RFCOMM channel identifier from the protocol descriptor list */
	if((bt_spp_state.cn = get_rfcomm_cn(attribl_bc, p)) != 0) {
		if((l2cappcb = l2cap_new()) == NULL) {
			LWIP_DEBUGF(BT_SPP_DEBUG, ("sdp_attributes_recv: Could not alloc L2CAP pcb\n"));
			return;
		}
		LWIP_DEBUGF(BT_SPP_DEBUG, ("sdp_attributes_recv: RFCOMM channel: %d\n", bt_spp_state.cn));

		l2ca_connect_req(l2cappcb, &(sdppcb->l2cappcb->remote_bdaddr), RFCOMM_PSM, HCI_ALLOW_ROLE_SWITCH, l2cap_connected);

	} else {
		bt_spp_start();
	}
	sdp_free(sdppcb);
}

/*
 * l2cap_connected():
 *
 * Called by L2CAP when a connection response was received.
 * Sends a L2CAP configuration request.
 * Initializes a search for other devices if the connection attempt failed.
 */
err_t l2cap_connected(void *arg, struct l2cap_pcb *l2cappcb, u16_t result, u16_t status)
{
	struct sdp_pcb *sdppcb;
	struct rfcomm_pcb *rfcommpcb;

	u8_t ssp[] = {0x35, 0x03, 0x19, 0x11, 0x02}; /* Service search pattern with LAP UUID is default */ 
	err_t ret;

	u8_t attrids[] = {0x35, 0x03, 0x09, 0x00, 0x04}; /* Attribute IDs to search for in data element 
														sequence form */

	if(result == L2CAP_CONN_SUCCESS) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: L2CAP connected pcb->state = %d\n", l2cappcb->state));
		/* Tell L2CAP that we wish to be informed of a disconnection request */
		l2cap_disconnect_ind(l2cappcb, l2cap_disconnected_ind);
		switch(l2cap_psm(l2cappcb)) {
			case SDP_PSM:
				LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: SDP L2CAP configured. Result = %d\n", result));
				if((sdppcb = sdp_new(l2cappcb)) == NULL) {
					LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: Failed to create a SDP PCB\n"));
					return ERR_MEM;
				}

				l2cap_recv(l2cappcb, sdp_recv);

				ret = sdp_service_search_attrib_req(sdppcb, 0xFFFF, ssp, sizeof(ssp),
						attrids, sizeof(attrids), sdp_attributes_recv);
				return ret;

			case RFCOMM_PSM:
				LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: RFCOMM L2CAP configured. Result = %d CN = %d\n", result, bt_spp_state.cn));
				l2cap_recv(l2cappcb, rfcomm_input);

				if((rfcommpcb = rfcomm_new(l2cappcb)) == NULL) {
					LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: Failed to create a RFCOMM PCB\n"));
					return ERR_MEM;
				}

				hci_link_key_not(link_key_not); /* Set function to be called if a new link key is created */

				return rfcomm_connect(rfcommpcb, bt_spp_state.cn, rfcomm_connected); /* Connect with DLCI 0 */
			default:
				return ERR_VAL;
		}
	} else {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("l2cap_connected: L2CAP not connected. Redo inquiry\n"));
		l2cap_close(l2cappcb);
		bt_spp_start();
	}

	return ERR_OK;
}

/*
 * inquiry_complete():
 *
 * Called by HCI when a inquiry complete event was received.
 * Connects to the first device in the list.
 * Initializes a search for other devices if the inquiry failed.
 */
err_t inquiry_complete(void *arg, struct hci_pcb *pcb, struct hci_inq_res *ires, u16_t result)
{
	struct l2cap_pcb *l2cappcb;

	if(result == HCI_SUCCESS) {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("successful Inquiry\n"));
		if(ires != NULL) {
			LWIP_DEBUGF(BT_SPP_DEBUG, ("Initiate L2CAP connection\n"));
			LWIP_DEBUGF(BT_SPP_DEBUG, ("ires->psrm %d\n ires->psm %d\n ires->co %d\n", ires->psrm, ires->psm, ires->co));
			LWIP_DEBUGF(BT_SPP_DEBUG, ("ires->bdaddr %02x:%02x:%02x:%02x:%02x:%02x\n",
						ires->bdaddr.addr[5], ires->bdaddr.addr[4], ires->bdaddr.addr[3],
						ires->bdaddr.addr[2], ires->bdaddr.addr[1], ires->bdaddr.addr[0]));

			/*if((ires->cod[1] & 0x1F) == 0x03) {
				bt_spp_state.profile = LAP_PROFILE;
			} else {
				bt_spp_state.profile = DUN_PROFILE;
			}*/

			if((l2cappcb = l2cap_new()) == NULL) {
				LWIP_DEBUGF(BT_SPP_DEBUG, ("inquiry_complete: Could not alloc L2CAP pcb\n"));
				return ERR_MEM;
			} 

			//if(bt_spp_state.profile == DUN_PROFILE) {
			//	l2ca_connect_req(l2cappcb, &(ires->bdaddr), SDP_PSM, 0, l2cap_connected);
			//} else {
				l2ca_connect_req(l2cappcb, &(ires->bdaddr), SDP_PSM, HCI_ALLOW_ROLE_SWITCH, l2cap_connected);
			//}
		} else {
			hci_inquiry(0x009E8B33, 0x04, 0x01, inquiry_complete);
		}
	} else {
		LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful Inquiry.\n"));
		hci_inquiry(0x009E8B33, 0x04, 0x01, inquiry_complete);
	}
	return ERR_OK;
}

/*
 * acl_wpl_complete():
 *
 * Called by HCI when a successful write link policy settings complete event was
 * received.
 */
err_t acl_wpl_complete(void *arg, struct bd_addr *bdaddr)
{
	hci_sniff_mode(bdaddr, 200, 100, 10, 10);
	return ERR_OK;
}

/*
 * acl_conn_complete():
 *
 * Called by HCI when a connection complete event was received.
 */
err_t acl_conn_complete(void *arg, struct bd_addr *bdaddr)
{
	//hci_wlp_complete(acl_wpl_complete);
	//hci_write_link_policy_settings(bdaddr, 0x000F);
	return ERR_OK;
}

/*
 * read_bdaddr_complete():
 *
 * Called by HCI when a read local bluetooth device address complete event was received.
 */
err_t read_bdaddr_complete(void *arg, struct bd_addr *bdaddr)
{
	memcpy(&(bt_spp_state.bdaddr), bdaddr, 6);
	LWIP_DEBUGF(BT_SPP_DEBUG, ("read_bdaddr_complete: %02x:%02x:%02x:%02x:%02x:%02x\n",
				bdaddr->addr[5], bdaddr->addr[4], bdaddr->addr[3],
				bdaddr->addr[2], bdaddr->addr[1], bdaddr->addr[0]));
	return ERR_OK;
}

/*
 * command_complete():
 *
 * Called by HCI when an issued command has completed during the initialization of the
 * host controller. Waits for a connection from remote device once connected.
 *
 * Event Sequence:
 * HCI Reset -> Read Buf Size -> Read BDAddr -> Set Ev Filter -+
 * +-----------------------------------------------------------+
 * |_/-> Write CoD -> Cng Local Name -> Write Pg Timeout -> Inq -> Complete
 *   \-> Scan Enable -> Complete
 */
err_t command_complete(void *arg, struct hci_pcb *pcb, u8_t ogf, u8_t ocf, u8_t result)
{
	u8_t cod_spp[] = {0x80,0x08,0x04};
	u8_t devname[] = "PIC24F------";
	u8_t n1, n2, n3;
	u8_t flag = HCI_SET_EV_FILTER_AUTOACC_ROLESW;

	switch(ogf) {
		case HCI_INFO_PARAM:
			switch(ocf) {
				case HCI_READ_BUFFER_SIZE:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_READ_BUFFER_SIZE.\n"));
						hci_read_bd_addr(read_bdaddr_complete);
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_READ_BUFFER_SIZE.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_READ_BD_ADDR:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_READ_BD_ADDR.\n"));
						/* Make discoverable */
						hci_set_event_filter(HCI_SET_EV_FILTER_CONNECTION,
								HCI_SET_EV_FILTER_ALLDEV, &flag);

					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_READ_BD_ADDR.\n"));
						return ERR_CONN;
					}
					break;
				default:
					LWIP_DEBUGF(BT_SPP_DEBUG, ("Unknown HCI_INFO_PARAM command complete event\n"));
					break;
			}
			break;
		case HCI_HC_BB_OGF:
			switch(ocf) {
				case HCI_RESET:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_RESET.\n")); 
						hci_read_buffer_size();
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_RESET.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_WRITE_SCAN_ENABLE:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_WRITE_SCAN_ENABLE.\n")); 
						hci_write_page_timeout(0x4000); /* 10.24s */
						//hci_cmd_complete(NULL); /* Initialization done, don't come back */
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_WRITE_SCAN_ENABLE.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_SET_EVENT_FILTER:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_SET_EVENT_FILTER.\n"));
							hci_write_cod(cod_spp);
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_SET_EVENT_FILTER.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_CHANGE_LOCAL_NAME:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Successful HCI_CHANGE_LOCAL_NAME.\n"));
						hci_write_scan_enable(HCI_SCAN_EN_INQUIRY | HCI_SCAN_EN_PAGE);
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_CHANGE_LOCAL_NAME.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_WRITE_COD:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Successful HCI_WRITE_COD.\n"));
						n1 = (u8_t)(bt_spp_state.bdaddr.addr[0] / 100);
						n2 = (u8_t)(bt_spp_state.bdaddr.addr[0] / 10) - n1 * 10;
						n3 = bt_spp_state.bdaddr.addr[0] - n1 * 100 - n2 * 10;
						devname[9] = '0' + n1;
						devname[10] = '0' + n2;
						devname[11] = '0' + n3;
						hci_change_local_name(devname, sizeof(devname));
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_WRITE_COD.\n"));
						return ERR_CONN;
					}
					break;
				case HCI_WRITE_PAGE_TIMEOUT:
					if(result == HCI_SUCCESS) {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("successful HCI_WRITE_PAGE_TIMEOUT.\n"));
						//hci_cmd_complete(NULL); /* Initialization done, don't come back */
						hci_connection_complete(acl_conn_complete);
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Initialization done.\n"));
						//LWIP_DEBUGF(BT_SPP_DEBUG, ("Discover other Bluetooth devices.\n"));
						//hci_inquiry(0x009E8B33, 0x04, 0x01, inquiry_complete); //FAILED????
					} else {
						LWIP_DEBUGF(BT_SPP_DEBUG, ("Unsuccessful HCI_WRITE_PAGE_TIMEOUT.\n"));
						return ERR_CONN;
					}
					break;
				default:
					LWIP_DEBUGF(BT_SPP_DEBUG, ("Unknown HCI_HC_BB_OGF command complete event\n"));
					break;
			}
			break;
		default:
			LWIP_DEBUGF(BT_SPP_DEBUG, ("Unknown command complete event. OGF = 0x%x OCF = 0x%x\n", ogf, ocf));
			break;
	}
	return ERR_OK;
}

