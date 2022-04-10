# MacOS Monterey on ThinkPad X230

> ## Install
### Update from MacOs bigsur
-If you are already using previous EFI release from our repository and running Mac os Big sir 
 and you want to update to MacOs Monterey(any version).Just download one of the update from below link.
 https://mrmacintosh.com/macos-12-monterey-full-installer-database-download-directly-from-apple/
- Once downloaded the installer also download the latest EFI release (April-2K22 Update) from our repository.
- Now you have to start the installer and follow the on screen instruction and wait till it completes. it sure takes a lot of time
  so grab a cup of coffee.
- Once the update is installed.don't restart your pc. now is the time to put the EFI release we downloaded to the EFI partition of your MacOs.To do that
 #### MOUNTING EFI 
  mount EFI boot partition, follow these steps:

    1. Discover the volume identifier for your EFI boot partition.

    Run this command:

    diskutil list
    The output should look something like this:

    /dev/disk0
    #: TYPE                     NAME          SIZE       IDENTIFIER
    0: GUID_partition_scheme                  *251.0 GB  disk0
    1: EFI                                    209.7 MB   disk0s1
    2: Apple_HFS                Macintosh HD  250.1 GB   disk0s2
    3: Apple_Boot               Recovery HD   650.0 MB   disk0s3
    

    In this case, the volume identifier of the EFI partition is disk0s1

    2. mount the volume using the command
    sudo diskutil mount disk0s1
- Now copy paste only the EFI folder from the release file to the EFI partition
- Now it is time to restart your pc. after the restart you may see weird graphics. so follow the graphics fix section to finish the     


### New Installation
- For making the usb follow dortania's guide to setup bootable MacOs Monterey Usb.(Only do the recovery Installer part and we dont need the EFI part)
- Once you have made the bootable usb. Just Copy paste the EFI from our latest release to the root folder of the usb. Make sure you have a good internet connection (Both Ethernet and Wifi must work now. Thanks to the updated Kexts).
- Once installations is over follow the MOUNT_EFI Section of the Update MacOs. Once Done Follow the Below Guide to Fix Graphics

### Intel HD 4000 Fix
- So In Monterey they have dropped a lot of supports which include Intel HD 4000. Thanks to @chris1111 for the Intel HD 4000 Patch.
- I have included the patch in the release file.
- Before going to the patch we have a few steps to follow.We Need to do this is recory mode. so turn off and boot into recovery mode
  SIP fully Disable !
 OpenCore config setup: csrutil authenticated-root disable :
NVRAM > Add > boot-args -v keepsyms=1
csr-active-config > EF0F0000
SecureBootModel > Disabled
PlatformInfo > MacBookPro12,1
 Clover config setup: csrutil authenticated-root disable :
csr-active-config > 0xFEF
Once this is done boot back into MacOs Monterey

### Patch Intel HD 4000
 1. Open the App that comes with the release file. Intel HD 4000 app
 2. Follow the on screen instruction and install the patch. 
 3. you may end up with error 1712. It is just fine
    - The app closes. Dont worry. Wait for a minute or two and Do step 1 and 2 again.
    - This time it will throw a different error saysing the volume is busy. Never mind. Everything is working fine.
    - Now Reboot and you will see the magic. Intel Hd 4000 will work great. If not repeat step 1 and 2 and reboot again.
4. Enjoy you mac.

IF want SIP back follow below steps

SIP Enable !
OpenCore config setup: csrutil enable + csrutil authenticated-root disable :
NVRAM > Add > boot-args -v keepsyms=1
csr-active-config > 00080000
SecureBootModel > Disabled