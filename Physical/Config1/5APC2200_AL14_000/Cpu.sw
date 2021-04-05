<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.8.2.72?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="Main" Source="Programs.Main.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7">
    <Task Name="Sayici" Source="Programs.Sayici.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="McAcpSys" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <Binaries>
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arsvcreg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="McAcpDrv" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arflatprv" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arcoal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="McAcpSim" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ConfigAx2" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ConfigAx1" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="standard" Source="Libraries.BR_Libraries.standard.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="operator" Source="Libraries.BR_Libraries.operator.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.BR_Libraries.runtime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.BR_Libraries.astime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.BR_Libraries.AsIecCon.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="Util" Source="Libraries._Haffner.Util.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="McBase" Source="Libraries.BR_Libraries.McBase.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpAxis" Source="Libraries.BR_Libraries.MpAxis.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="McAxis" Source="Libraries.BR_Libraries.McAxis.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.BR_Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="McAcpAx" Source="Libraries.BR_Libraries.McAcpAx.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="PTP" Source="Libraries._Haffner.PTP.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="fileio" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asepl" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>