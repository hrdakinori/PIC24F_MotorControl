#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PIC24FJ64GB002.mk)" "nbproject/Makefile-local-PIC24FJ64GB002.mk"
include nbproject/Makefile-local-PIC24FJ64GB002.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC24FJ64GB002
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2108356922/uart2.o ${OBJECTDIR}/_ext/760822260/fcs.o ${OBJECTDIR}/_ext/760822260/hci.o ${OBJECTDIR}/_ext/760822260/l2cap.o ${OBJECTDIR}/_ext/760822260/lwbt_memp.o ${OBJECTDIR}/_ext/760822260/rfcomm.o ${OBJECTDIR}/_ext/760822260/sdp.o ${OBJECTDIR}/_ext/760822260/usbif.o ${OBJECTDIR}/_ext/760822047/inet.o ${OBJECTDIR}/_ext/760822047/mem.o ${OBJECTDIR}/_ext/760822047/memp.o ${OBJECTDIR}/_ext/760822047/pbuf.o ${OBJECTDIR}/_ext/760822047/stats.o ${OBJECTDIR}/_ext/760822047/sys.o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o ${OBJECTDIR}/_ext/1360907413/usb_host.o ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o ${OBJECTDIR}/_ext/1472/bt_spp.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/usb_config.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2108356922/uart2.o.d ${OBJECTDIR}/_ext/760822260/fcs.o.d ${OBJECTDIR}/_ext/760822260/hci.o.d ${OBJECTDIR}/_ext/760822260/l2cap.o.d ${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d ${OBJECTDIR}/_ext/760822260/rfcomm.o.d ${OBJECTDIR}/_ext/760822260/sdp.o.d ${OBJECTDIR}/_ext/760822260/usbif.o.d ${OBJECTDIR}/_ext/760822047/inet.o.d ${OBJECTDIR}/_ext/760822047/mem.o.d ${OBJECTDIR}/_ext/760822047/memp.o.d ${OBJECTDIR}/_ext/760822047/pbuf.o.d ${OBJECTDIR}/_ext/760822047/stats.o.d ${OBJECTDIR}/_ext/760822047/sys.o.d ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d ${OBJECTDIR}/_ext/1360907413/usb_host.o.d ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d ${OBJECTDIR}/_ext/1472/bt_spp.o.d ${OBJECTDIR}/_ext/1472/Delay.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/1472/usb_config.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2108356922/uart2.o ${OBJECTDIR}/_ext/760822260/fcs.o ${OBJECTDIR}/_ext/760822260/hci.o ${OBJECTDIR}/_ext/760822260/l2cap.o ${OBJECTDIR}/_ext/760822260/lwbt_memp.o ${OBJECTDIR}/_ext/760822260/rfcomm.o ${OBJECTDIR}/_ext/760822260/sdp.o ${OBJECTDIR}/_ext/760822260/usbif.o ${OBJECTDIR}/_ext/760822047/inet.o ${OBJECTDIR}/_ext/760822047/mem.o ${OBJECTDIR}/_ext/760822047/memp.o ${OBJECTDIR}/_ext/760822047/pbuf.o ${OBJECTDIR}/_ext/760822047/stats.o ${OBJECTDIR}/_ext/760822047/sys.o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o ${OBJECTDIR}/_ext/1360907413/usb_host.o ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o ${OBJECTDIR}/_ext/1472/bt_spp.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/usb_config.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-PIC24FJ64GB002.mk dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2108356922/uart2.o: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2108356922 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Common/uart2.c  -o ${OBJECTDIR}/_ext/2108356922/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2108356922/uart2.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2108356922/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/fcs.o: ../lwbt/fcs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/fcs.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/fcs.c  -o ${OBJECTDIR}/_ext/760822260/fcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/fcs.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/fcs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/hci.o: ../lwbt/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/hci.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/hci.c  -o ${OBJECTDIR}/_ext/760822260/hci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/hci.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/hci.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/l2cap.o: ../lwbt/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/l2cap.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/l2cap.c  -o ${OBJECTDIR}/_ext/760822260/l2cap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/l2cap.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/l2cap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/lwbt_memp.o: ../lwbt/lwbt_memp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/lwbt_memp.c  -o ${OBJECTDIR}/_ext/760822260/lwbt_memp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/rfcomm.o: ../lwbt/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/rfcomm.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/rfcomm.c  -o ${OBJECTDIR}/_ext/760822260/rfcomm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/rfcomm.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/rfcomm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/sdp.o: ../lwbt/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/sdp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/sdp.c  -o ${OBJECTDIR}/_ext/760822260/sdp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/sdp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/sdp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/usbif.o: ../lwbt/usbif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/usbif.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/usbif.c  -o ${OBJECTDIR}/_ext/760822260/usbif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/usbif.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/usbif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/inet.o: ../lwip/inet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/inet.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/inet.c  -o ${OBJECTDIR}/_ext/760822047/inet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/inet.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/inet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/mem.o: ../lwip/mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/mem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/mem.c  -o ${OBJECTDIR}/_ext/760822047/mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/mem.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/memp.o: ../lwip/memp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/memp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/memp.c  -o ${OBJECTDIR}/_ext/760822047/memp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/memp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/memp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/pbuf.o: ../lwip/pbuf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/pbuf.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/pbuf.c  -o ${OBJECTDIR}/_ext/760822047/pbuf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/pbuf.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/pbuf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/stats.o: ../lwip/stats.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/stats.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/stats.c  -o ${OBJECTDIR}/_ext/760822047/stats.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/stats.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/stats.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/sys.o: ../lwip/sys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/sys.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/sys.c  -o ${OBJECTDIR}/_ext/760822047/sys.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/sys.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/sys.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o: ../USB/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host.o: ../USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host_generic.o: ../USB/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host_generic.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/bt_spp.o: ../bt_spp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/bt_spp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../bt_spp.c  -o ${OBJECTDIR}/_ext/1472/bt_spp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/bt_spp.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/bt_spp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Delay.c  -o ${OBJECTDIR}/_ext/1472/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_config.c  -o ${OBJECTDIR}/_ext/1472/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/2108356922/uart2.o: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2108356922 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Common/uart2.c  -o ${OBJECTDIR}/_ext/2108356922/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2108356922/uart2.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2108356922/uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/fcs.o: ../lwbt/fcs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/fcs.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/fcs.c  -o ${OBJECTDIR}/_ext/760822260/fcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/fcs.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/fcs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/hci.o: ../lwbt/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/hci.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/hci.c  -o ${OBJECTDIR}/_ext/760822260/hci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/hci.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/hci.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/l2cap.o: ../lwbt/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/l2cap.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/l2cap.c  -o ${OBJECTDIR}/_ext/760822260/l2cap.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/l2cap.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/l2cap.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/lwbt_memp.o: ../lwbt/lwbt_memp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/lwbt_memp.c  -o ${OBJECTDIR}/_ext/760822260/lwbt_memp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/lwbt_memp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/rfcomm.o: ../lwbt/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/rfcomm.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/rfcomm.c  -o ${OBJECTDIR}/_ext/760822260/rfcomm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/rfcomm.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/rfcomm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/sdp.o: ../lwbt/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/sdp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/sdp.c  -o ${OBJECTDIR}/_ext/760822260/sdp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/sdp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/sdp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822260/usbif.o: ../lwbt/usbif.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822260 
	@${RM} ${OBJECTDIR}/_ext/760822260/usbif.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwbt/usbif.c  -o ${OBJECTDIR}/_ext/760822260/usbif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822260/usbif.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822260/usbif.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/inet.o: ../lwip/inet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/inet.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/inet.c  -o ${OBJECTDIR}/_ext/760822047/inet.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/inet.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/inet.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/mem.o: ../lwip/mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/mem.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/mem.c  -o ${OBJECTDIR}/_ext/760822047/mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/mem.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/memp.o: ../lwip/memp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/memp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/memp.c  -o ${OBJECTDIR}/_ext/760822047/memp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/memp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/memp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/pbuf.o: ../lwip/pbuf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/pbuf.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/pbuf.c  -o ${OBJECTDIR}/_ext/760822047/pbuf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/pbuf.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/pbuf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/stats.o: ../lwip/stats.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/stats.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/stats.c  -o ${OBJECTDIR}/_ext/760822047/stats.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/stats.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/stats.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/760822047/sys.o: ../lwip/sys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/760822047 
	@${RM} ${OBJECTDIR}/_ext/760822047/sys.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../lwip/sys.c  -o ${OBJECTDIR}/_ext/760822047/sys.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/760822047/sys.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/760822047/sys.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o: ../USB/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_hal_pic24.c  -o ${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host.o: ../USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360907413/usb_host_generic.o: ../USB/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360907413 
	@${RM} ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../USB/usb_host_generic.c  -o ${OBJECTDIR}/_ext/1360907413/usb_host_generic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360907413/usb_host_generic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/bt_spp.o: ../bt_spp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/bt_spp.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../bt_spp.c  -o ${OBJECTDIR}/_ext/1472/bt_spp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/bt_spp.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/bt_spp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../Delay.c  -o ${OBJECTDIR}/_ext/1472/Delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/Delay.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/Delay.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../usb_config.c  -o ${OBJECTDIR}/_ext/1472/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/usb_config.o.d"        -g -omf=elf -mlarge-code -mlarge-data -O1 -I".." -I"../Common" -I"../Include" -I"../USB" -I"../lwbt" -I"../lwip" -I"../arch" -I"../Include/USB" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2048,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}/MotorControl_.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2048,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}/MotorControl_.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/MotorControl_.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC24FJ64GB002
	${RM} -r dist/PIC24FJ64GB002

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
