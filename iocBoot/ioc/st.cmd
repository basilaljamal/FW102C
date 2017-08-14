#!../../bin/linux-x86_64/ioc

## You may have to change ioc to something else
## everywhere it appears in this file

# < iocBoot/ioc/envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH","protocol")

# cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ioc.dbd"
ioc_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/diagnostics-thorlabs-fw102c.db")

drvAsynIPPortConfigure ("thorlabs-fw102c", "10.2.8.12:4009",0,0,0)

#drvAsynSerialPortConfigure("serial0","/dev/ttyUSB0",0,0,0) 
#asynSetOption("serial0", -1, "baud", "115200") 
#asynSetOption("serial0", -1, "bits", "8") 
#asynSetOption("serial0", -1, "parity", "none") 
#asynSetOption("serial0", -1, "stop", "1") 

# cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=basilHost"
