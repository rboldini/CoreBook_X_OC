# CoreBook X OpenCore
<h3><i>Hackintosh on CoreBook X Project</i></br>

<h4>(0.1)
2nd Commit(23/03/2021)</br>

    OpenCore version Update 0.6.7
    Kexts Version Update
	Enabled OpenCanopy with Default Style and black background.
	UIScale = 01
    Remove Useless
</br>
(0.0)
1st Commit 

    Working ver. with sleep issues
    Old OC Version 0.6.0
    Old kext (last update 11/2020)
    
<H2>Status: [WIP]</H2>
<dl>
    <h3><dt>What's working:</dt></h3>
        <dd>~ Grapichs UHD650<br/>
            ~ Audio ALC269<br/>
            ~ Trackpad SYNA3602<br/>
            ~ USB Port<br/>
            ~ Intel Wifi<br/>
            ~ Intel Bluetooth </dd>
    <details>
        <summary>~ Battery</summary>
            1. Working status </br>
            2. Draining to fast </br>
            3. Unplug detect delay </br>
            4. Full charge mismatch the status_led[BLUE] (beside type-c port)
    </details>
        <details>
        <summary>~ Sleep</summary>
            1. Sleep by button press(1s) </br>
            2. Sleep by "Apple > Sleep" option</br>
            3. Open lid -> Wake</br>
            4. Wake on Input detect
    </details>
</dl>
</br>
<dl>
    <h3><dt>Not Working:</dt></br></h3>
        <dd>~ Lid close it's not calling sleep() </br>
    ~ Airpods connection with bluetooth
    [ISSUE](https://github.com/OpenIntelWireless/itlwm/issues/85#issue-621026009)</br>
    ~ SD Card Reader (Hint: inject idDevice/idVendor in AppleStorageDrivers>AppleUSBCardreader.kext)
</dl>
<H2>SYNA3602</H2>
    <H3>Just change SYNA3602 with SYNA3602&Col2 in: </br>
    "VoodooI2CHID.kext>Contents>info.plist" </br>
    and add SSDT-GPI0.aml to OC/ACPI.

