# CoreBook  X   OC
<br/>
November 2021<br/>
<br/>
https://github.com/rboldini/CoreBook_X_OC/issues/9 <br/>
<br/>
Device is now 99% working:<br/>
<br/>
Not working:<br/><br/>
Brightness keys -> No idea in how it deal with it and the EC. Someone has an hint? Standard patching method are not working.<br/>
If you long press f6 and f7 they will work randomly.<br/>
Same thing for keyboard backlight, it work but there is no way to change it from keyboard or system.<br/>
<br/>
Airdrop -> Hope this will be added in AppleIntelWireless Road Map.   Actually not an issue for me..
<br/><br/>
Battery -> Status reported is missaligned, nothing critical it takes a little more to reach full capability after the system report it as 100% (WIP) just check it with the led you have beside the plug.<br/>
<br/><br/>
More settings in BIOS then before, give me some hours...
<br/>
<br/>
___________________________________________________________________________________
<br/><br/><br/>

Latest:<br/>
Updated to latest version <br/>
Enabled OpenCanopy picker Apple like at boot<br/>
Updated kexts <br/>
Fixed issues with sleep, now closing the lid cause sleep.

Quick tips:<br/>
1st thing to do: at boot press ESC and in bios settings go to CHIPSET > GRAPICHS > DVMT and change the value from 32M to 64M.<br/>
Vault is covered by Dortania in the Official OpenCore Install Guide <br/>
When booting for first time disable Force touch from Settings.<br/>
When booting for first time go to Preferences > Keyboard > Modifier Keys and switch Command and Option values.<br/>
Before any iService Activation open the config.plist with OpenCore configurator and in Platform Info tab select MacBookPro14,2 from list in DataHUB and SMBIOS and check for a valid (invalid for apple) serial.<br/>

The serial number provided is random generated.

For VoodooI2CHID:<.br/>
When downloading a new vesione just do: <br/>
rx_mouse_click>show package contents> Contents > info.plist<br/>

Open it with xCode and change IOClass and Name like the image provided.<br/>
![VoodooI2CHID](https://user-images.githubusercontent.com/51327886/114537073-0f20ef00-9c52-11eb-9644-af826e872b7e.png)


TODO:<br/>
1.  Improvments for battery status.
