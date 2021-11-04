
___________________________________________________________________________________

# CoreBook  X   OpenCore

> ***I do not take any responsibility if you damage your devices.***
> ***The use of this material is not recommended, the procedure to be followed would be that reported in the Dortania guide with your files.***


### November 2021
> **Device is now 99% working!**

**Working:**
- Wifi and BT Intel
- Brightness Level from preferencies and menu bar
- HD Audio (I can't test the right side plug, i assume it work due to lack of reports)
- I2C Trackpad with Gesture
- Automatic Keyboard backlight (Can't change it like in Linux and Windows with f5)
- Sleep / Wake with Lid detection
- Battery Status (No Service Recommended Notification) & AC Adapter detection

Not working:
- Brightness keys: 
  - No idea in how i can fix. Someone has an hint? Standard patching method are not working
  - If you long press f6 and f7 they will work randomly.
  - Same thing for keyboard backlight, it work but there is no way to change it from keyboard or system.
- Airdrop: 
  - Hope this will be added in AppleIntelWireless Road Map.   Actually not an issue for me..
- Battery Status:
  - Percentage report is missaligned
    - Nothing critical it takes a little more to reach full capability after the system report it as 100% (WIP)
    - Just check it with the led you have beside the plug.

___________________________________________________________________________________

# Guide

- ## BIOS Settings
  - ### Boot your Laptop and press ESC until you enter in BIOS settings.
  - ## Advanced:
    - Intel RC ACPI Settings:
      - Low Power S0 Idle Capability  **[ENABLED]**
      - PCI Delay Optimization        **[ENABLED]**
    - CPU Configuration:
      - CPU Lock Configuration (_BOTTOM_)
        - CFG Lock **[DISABLED]**
    - Platform Thermal Configuration:
      - Active Trip Point 1           **[63]** 
      - > This only if you have encountered a problem with the fans, which start for 1 second and then turn off at limit of idle state
  - ## Chipset:
    - Graphics Configuration:
      - DVMT Pre-Allocated            **[64M]**
    - HD Audio Configuration:
      - HD Audio Advanced Configuration:
        - BT Intel HFP                **[ENABLED]**
        - BT Intel A2DP               **[ENABLED]**
  - ## Boot
      - Fast Boot                       **[DISABLED]**
___________________________________________________________________________________

# First Boot

- When booting for first time disable Force touch from Settings.<br/>
- When booting for first time go to Preferences > Keyboard > Modifier Keys and switch Command and Option values.<br/>
- Before any iService Activation open the config.plist with OpenCore configurator and in Platform Info tab select MacBookPro14,2 from list in DataHUB and SMBIOS and check for a valid (invalid for apple) serial.<br/>

> The serial number provided is random generated.



# For VoodooI2CHID:
- When downloading a new vesione just do: <br/>
1. 'Right Mouse Click on Kext -> Show Package Contents -> Contents -> info.plist'

2. Open it with xCode and change IOClass and Name like the image provided.<br/>
![VoodooI2CHID](https://user-images.githubusercontent.com/51327886/114537073-0f20ef00-9c52-11eb-9644-af826e872b7e.png)
