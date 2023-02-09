class: center, middle, intro

# Service Catalogue

### Firmware Division



---
class: page-2
### Firmware Devision <br> **Revision v1.0.0 12/02/2020**
# Table **of contents**

.left-column55[
1. About Us
2. Our areas of expertise
3. Industries we have experience with
4. Programming languages
5. Firmware frameworks, bootloaders
and hypervisors
6. Tools and libraries
7. Open-source project we contribute to
8. Hardware experience
9. Reference Projects
10. Contact
]
---
class: page-3
###▶ About **Us**
# About **Us**
.left-column55[We’re hands-on firmware experts with
years of experience writing elegant,
scalable and custom code for clients.
Our team of engineers brings broad
and expansive Linux knowledge to the
projects we take on. We are experts at
firmware development, OS development
and application development, with
a special focus on Embedded Linux
solutions.
## Our **Clients Map**
<img src='remark-templates/3mdeb-catalogue-template/images/map.png'
class='image-60 image'>
<br>
## Our **Partners**
]
<img src='remark-templates/3mdeb-catalogue-template/images/partners.png'
class='image-80 image'>

---
class: page-4
###▶ Our areas **of expertise**<br>▶ Industries we have **experience with**
# Our areas **of expertise**
.left-column45[
* coreboot:
  * firmware development customization
  * payload development (libpayload, SeaBIOS and more)
  * mainboard porting mainboard maintenance
* UEFI firmware development
  * UEFI applications
  * UEFI payload for coreboot
  * UEFI customization
* S-RTM/D-RTM solutions
* hypervisor development (Xen, Bareflank, ACRN)
* bootloader development (GRUB2)
* Firmware consulting
* Continuous Integration and Continuous Delivery for firmware
* Boot time optimization
* Firmware flashing
* Hardware/firmware security features enablement
* Firmware security analysis]
.right-column45[
<br><br><br><br><br><br><br><br><br><br><br>
## Industries we have **experience with**
* Network appliance
* Edge Computing
* Consumer electronics
* Digital signage
* Medical
* Robotics (consumer and military applications)]

---
class: page-5
###▶ Programming **languages**<br>▶ Bootloaders **validation**
# Programming **languages**
.left-column45[
* C
* C++
* x86 assembly
* Python
* Go
* Shell script

<br>
<img src='remark-templates/3mdeb-catalogue-template/images/programming-languages.png'
class='image image-100'>
]
.right-column45[
<br><br><br><br><br><br><br><br><br><br>
## Bootloaders **validation**
* coreboot
* tianocore/EDKII
* heads
* Xen
* Bareflank
* ACRN
* GRUB2
* SeaBIOS
* Genode
* iPXE
* LinuxBoot
<br>
<img src='remark-templates/3mdeb-catalogue-template/images/bootloaders-validation.png'
class='image image-100'>
]
---
class: page-6
###▶ Tools **and libraries**
# Tools **and libraries**
.left-column45[
* GNU toolchains
* SCM:
  * Git
  * gerrit
* GNU/Linux build systems:
  * make
  * cmake
  * custom
* Firmware flashing:
  * flashrom
  * DediProg software
  * Linux SPI on OrangePi/RaspberryPi
* Payloads:
  * tianocore UEFI payload
  * coreboot libpayload
  * Bareflank SDK
  * BITS
  * Python
* Libraries:
  * gnu-efi:
]
.right-column45[
* Continuous Integration / Delivery:
  * Jenkins
  * Travis CI
  * Gitlab CI
  * Circle CI
* Security:
  * TPM2 tools
  * tpm tools
  * LUV
  * chipsec
]
.left-column100[
<br><br><br>
<img src='remark-templates/3mdeb-catalogue-template/images/libraries.png'
class='image image-90'>
]
---
class: page-7
###▶ Open-source projects **we contribure to**<br>▶ Hardware **Experience**
# Open-source projects<br> **we contribure to**
.left-column45[
<br>
* [coreboot](https://review.coreboot.org/cgit/coreboot.git/)
* [SeaBIOS](https://git.seabios.org/cgit/seabios.git)
* [GRUB2](https://git.savannah.gnu.org/git/grub.git/)
* [TrenchBoot Landing Zone](https://github.com/TrenchBoot/landing-zone)
* [memtest86+](https://review.coreboot.org/cgit/memtest86plus.git/)
]
<br><br><br><br><br><br><br><br><br><br><br><br>
.right-column55[
## Hardware **Experience**
**Architectures**
* ARMv6, ARMv7, ARMv8 (Arm 64-bit)
* x86, x86_64
* FPGA/CPLD

**SoC/CPU**
* AMD embedded SoCs (GX412-TC, <br>G-T40N, G-T40E)
* Intel Celeron J3060, J3160, 3865U
* Intel Core i3-7100U, i5-7200U, i7-6500U
* Intel Atom E3826, E3845, x5-E3940
]
---
class: page-8
###▶ Reference **validation projects**
# Reference **validation projects**
.left-column50[
**coreboot firmware maintanership
for PC Engines**<br>
PC Engines company produces routers based on AMD processors called APU.
3mdeb responsibilities are:
* monthly coreboot firmware updates
with rebases to official repository
* new features development and bug
fixing support
* upstream changes and fixes to official
coreboot repository
* maintain code repositories and release
page with binaries and release notes
* CI/CD for firmware building and
testing (with Validation Team
cooperation)

The cooperation with PC Engines lasts 4
years and still goes on.
Programming languages used:<br>
**C, x86 assembly, Shell script**<br>
Hardware used:<br>
**AMD GX412-TC, AMD G-T40E. <br>AMD
G-T40N**<br>
Technologies used: <br>
**Linux, make, GCC, Gitlab CI**
]
.right-column45[
**Network appliance device porting to
coreboot**<br>
Customer had few network appliance
products based on Intel processors.
They wanted its firmware to be opensource
and available in coreboot. 3mdeb
responsibilities:<br>
* develop the support for mainboard in
coreboot
* upstream the mainboard support to
official coreboot repository

Programming languages used:<br>
**C, x86 assembly, Shell script<br>**
Hardware used:<br>
**Intel Celeron J3060,
J3160, 3865U; Intel Core i3-7100U,
i5-7200U<br>**
Technologies used:<br>
**coreboot, Linux, make, GCC**<br>
<img src='remark-templates/3mdeb-catalogue-template/images/reference1.png'
class='image image-60'>
]
---
class: page-9
###▶ Reference **validation projects**
# Reference **validation projects**
.left-column49[
**Chromebooks lock PIN for retail distributors**<br>
Customer had an idea of putting a PIN
code verification in the firmware in order
to prevent stealing the devices from the
shop. 3mdeb responsibilities:<br>
* analyze the possibility to modify
original firmware code and boot path
* develop a prompt for PIN code
displayed at the LCD panel of the
Chromebook device
* prepare a possibility to provision and
lock the device with PIN code using
the verified boot mode of Chrome
devices

Programming languages used:**<br>
C, Shell script<br>**
Hardware used:<br>
**Intel Celeron J3060, J3160, 3865U; Intel
Core i3-7100U, i5-7200U<br>**
Technologies used: **<br>coreboot, Linux,
make, GCC, vboot<br>**
<img src='remark-templates/3mdeb-catalogue-template/images/reference2.png'
class='image image-70'>
]
.right-column49[
**UEFI loader for properitary UEFI
application**<br>
Customer had a proprietary UEFI
application for Ethernet controller and
wanted to implement a loader which
would launch the application with a
predefined set of parameters in EFI
Shell-like manner and then proceed
with booting to Shell/OS. 3mdeb
responsibilities:<br>
* develop an UEFI Loader application
* analyze the proprietary application in
terms of required protocols
* fit the UEFI Loader into the
platform’s UEFI firmware image so
that the loader would be launched
automatically at startup

Programming languages used:<br>
**C, Shell script<br>**
Hardware used:<br>
**Intel Atom E3826, E3845<br>**
Technologies used:<br>
**UEFI, Linux, make, GCC, gnu-efi**
]
---
class: page-10
###▶ Reference **validation projects**
# Reference **validation projects**
.left-column49[
**Firmware validation payload**<br>
Customer had a very old coreboot
firmware used on a medical robot. This
firmware was undergoing a certification.
In order to assure that the firmware is
compliant with necessary standards and
specification to obtain the certification,
customer asked us to develop a validation
and verification payload. 3mdeb
responsibilities:<br>
* replace customer’s special payload
application with validation payload
using
* specified multiboot boot protocol
* develop a payload that will verify
firmware initialization correctness
* develop a test suite in payload that
would check ACPI tables, SMBIOS
tables and MP table conformance to
their specifications

References:<br>
[OSFC 2018 - BITS and CHIPSEC as
coreboot payloads](https://2018.osfc.io/talks/bits-and-chipsec-as-coreboot-payloads.html)

Programming languages used:<br>
**C, Shell script, Python, assembly x86<br>**
Hardware used:<br>
**Intel Atom E3826, E3845<br>**
Technologies used:<br>
**coreboot, make, GCC, BITS, GRUB**
]
.right-column49[
**Custom embedded hypervisor**<br>
Customer wanted to launch multiple
applications on his platform, however
the restriction was that every binary
must be placed in SPI flash and no
external storage is allowed. 3mdeb
responsibilities:<br>
* choose an appropriate hypervisor/
hypervisor SDK that would fit
requirements
* develop a embedded hypervisor from
scratch using hypervisor SDK
* develop software-based hardware
resources isolation due to lack of
IOMMU
* embed the hypervisor as coreboot
payload
* port libpayload to x86_64 in order to
support the hypervisor requiring 64bit
mode

References:<br>
[OSFC 2019 - Consideration about
enabling hypervisor in open source firmware](https://www.youtube.com/watch?v=4nZfsU-o1b4)

Programming languages used:<br>
**C, C++, Shell script, assembly x86**<br>
Hardware used:<br>
**Intel Atom E3826, E3845**<br>
Technologies used:<br>
**coreboot, make, GCC, Bareflank, libpayload**
]
---
class: page-11
###▶ Reference **validation projects**
# Reference **validation projects**
.left-column49[
**D-RTM implementation for AMD
processors**<br>
3mdeb own initiative to participate in
Trenchboot project. First open-source
working implementation of AMD Secure
Startup feature was developed. 3mdeb
responsibilities:<br>
* cooperation with landing-zone
implementation (Secure Loader for
AMD D-RTM)
* cooperation with GRUB2 support for
Secure Startup
* cooperation with Linux development
for D-RTM launch
* implementing kexec mechanism for
Xen

References:<br>
* [OSFC 2019 - TrenchBoot - Open DRTM
implementation for AMD platforms](https://www.youtube.com/watch?v=9NcVjsSu59w)
* PSEC 2019 - Less-Insecure Network
Edge Virtualization with Low Size,
Weight and Power

Programming languages used:<br>
**C, Go, Shell script, assembly x86<br>**
Hardware used:<br>
**AMD GX-412TC<br>**
Technologies used:<br>
**coreboot, Linux, GRUB2, Xen, u-root**
]
.right-column49[
**Firmware security analysis for modern
high-end laptop**<br>
Customer wanted to evaluate the security
of the firmware of Dell XPS laptop. 3mdeb
responsibilities were:<br>
* perform firmware security analysis
with commonly available tools
likechipsec, LUV
* check the firmware against various
attacks
* analyze the BIOS setup
* analyze 3rd party components in
terms of possible persistence of
attacker data
* analyze 3rd party firmware (SSD,
Thunderbolt, Realtek HDA)
* SMI fuzzing

Programming languages used:<br>
**C, Python, Shell script, assembly x86**<br>
Hardware used:<br>
**Dell XPS 9560, Dediprog SF100**<br>
Technologies used:<br>
**UEFI, Linux, Dediprog software, LUV,
chipsec, BITS**
<img src='remark-templates/3mdeb-catalogue-template/images/reference3.png'
class='image image-100'>
]
---

class: center, middle, outro
## Feel free to ask
## if you have any questions.
<br>
<br>
##Languages
English, Polish<br>
.book-a-call[
[BOOK A CALL](https://calendly.com/3mdeb)]
