# GCW0 Issue (based on jz-5.3-gcw0 https://github.com/OpenDingux/linux.git)
* analog stick not active in gMenu2X and in game (eduke32)
  * https://bugzilla.libsdl.org/show_bug.cgi?id=4955
* gMenu2X screen size detection issue 
* gMenu2X random crash during menu browsing
* hardware scaling (certainly VPU issue)
```
gcw0 kern.info kernel: remoteproc remoteproc0: ingenic-vpu is available
gcw0 kern.warn kernel: remoteproc remoteproc0: Direct firmware load for rproc-ingenic-vpu-fw failed with error -2`
```
* mouse cursor in Pcsx4all 2.4 (SDL_ShowCursor(SDL_DISABLE))
```
gcw0 kern.info kernel: input: OpenDingux mouse daemon as /devices/virtual/input/input3
```
* input tester needs to be rewrite for using SDL2/gamepad API
* gcwconnect needs to be rewrite for using iw tool
* iw wlan0 issue
```
/etc/udev/rules.d/81-modules-unload.rules
```
```
$ iw dev wlan0 link
Not connected.
$ sudo iw dev wlan0 connect TNCAP664B1D
command failed: No such device (-19)
```
