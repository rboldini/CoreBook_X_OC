# CoreBook  X   OC

Latest:<br/>
Updated to latest version <br/>
Enabled OpenCanopy picker Apple like at boot<br/>
Updated kexts <br/>
Fixed issues with sleep, now closing the lid cause sleep.

Quick tips:<br/>
Vault is covered by Dortania in the Official OpenCore Install Guide <br/>
When booting for first time disable Force touch from Settings.<br/>
When booting for first time go to Preferences > Keyboard > Modifier Keys and switch Command and Option values.<br/>
Before any iService Activation open the config.plist with OpenCore configurator and in Platform Info tab select MacBookPro14,2 from list in DataHUB and SMBIOS and check for a valid serial.<br/>

The serial number provided is random generated.

For VoodooI2CHID:<.br/>
When downloading a new vesione just do: <br/>
rx_mouse_click>show package contents> Contents > info.plist<br/>

Open it with xCode and change IOClass and Name like the image provided.<br/>
![VoodooI2CHID](https://user-images.githubusercontent.com/51327886/114537073-0f20ef00-9c52-11eb-9644-af826e872b7e.png)


TODO:<br/>
1.  Improvments for battery status.
