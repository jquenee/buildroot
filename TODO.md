# GCW0 Issue (based on jz-5.3-gcw0 https://github.com/OpenDingux/linux.git)
* analog stick not active in gMenu2X and in game (eduke32)
  * https://bugzilla.libsdl.org/show_bug.cgi?id=4955
* gMenu2X screen size detection issue 
```
$ python -c 'import pygame; pygame.init(); infoObject = pygame.display.Info(); print(infoObject);'
<VideoInfo(hw = 1, wm = 0,video_mem = 900
         blit_hw = 0, blit_hw_CC = 0, blit_hw_A = 0,
         blit_sw = 0, blit_sw_CC = 0, blit_sw_A = 0,
         bitsize  = 32, bytesize = 4,
         masks =  (16711680, 65280, 255, 0),
         shifts = (16, 8, 0, 0),
         losses =  (0, 0, 0, 8),
         current_w = 320, current_h = 240
>

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
```
sudo evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	pwm-vibrator
/dev/input/event1:	gcw0-audio Headphones
/dev/input/event2:	board:gpio-keys
/dev/input/event3:	OpenDingux mouse daemon
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
