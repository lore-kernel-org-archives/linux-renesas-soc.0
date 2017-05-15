Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41458 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934374AbdEOOvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 10:51:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: [ANN] R-Car H3 VIN and RDACM20 camera support prototype
Date: Mon, 15 May 2017 17:51:14 +0300
Message-ID: <3171910.thmLy2MtYL@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

[ANN] stands for announcement: I have managed to capture images from the 
RDACM20 camera on R-Car H3 using the Gen3 VIN driver developed by Niklas.

The RDACM20 camera is a GMSL (Gigabit Multimedia Serial Link) camera module 
based on an Omnivision 10635 camera sensor and a Maxim MAX9271 GMSL 
serializer. The GMSL link carries power, control (I2C) and video data over a 
single coax cable.

The R-Car H3 Salvator-X is plugged to an extension board based on a Maxim 
MAX9286 quad-channel GMSL deserializer. Up to four cameras can be connected to 
the deserializer, which outputs the four video streams on separate virtual 
channels over one CSI-2 connections.

Based on this hardware setup, I have ported the BSP core developed against the 
old soc-camera VIN driver to the mainline kernel, on top of Niklas R-Car Gen3 
VIN support series (available from his git tree under the tag rcar-vin-elinux-
v7). After more cleanups than my sleep schedule was comfortable with, but not 
enough to let me post the patches to public mailing lists without shame, I 
ended up with the following five patches.

- v4l: Add MAX9286 driver
- v4l: Add RDACM20 driver
- arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
- arm64: dts: renesas: salvator-x-max9286: Add RDACM20 cameras
- arm64: dts: renesas: salvator-x: Connect GMSL cameras to VIN

Those patches are all hacks to some extent.

Patches 1/5 and 2/5 add drivers for the MAX9286 GMSL deserializer and for the 
RDACM20 camera respectively. They are currently interdependent as they both 
touch registers of the other one (don't blame me, the original version was 
worse). This needs to be fixed.

Patches 3/5 to 5/5 add the corresponding devices to DT. The DT bindings 
haven't been documented yet and need to be reworked anyway. How to describe 
the I2C connections between the devices is under discussion. Additionally, due 
to restrictions of the VIN driver that the code is based on, the RDACM20 
cameras' endpoints are connected directly to the CSI-2 receivers' endpoints. 
This will be fixed when rebasing the code on top of a more recent VIN driver 
version.

All patches are available from

	git://linuxtv.org/pinchartl/media.git vin-gmsl-20170515

Testing is pretty straightforward.

On the hardware side, make sure to set SW29 to OFF-OFF on the Salvator-X board 
to select the external CSI-2 devices, to remove the J19 jumper from the 
MAX9286 expansion board to disable the second MAX9286, and to connect RDACM20 
cameras to the first four GMSL ports (J1 to J4).

On the software side, you need recent versions of the media-ctl and yavta 
tools on your system. The kernel must be compiled with the following options.

CONFIG_VIDEO_MAX9286=y
CONFIG_VIDEO_RDACM20=y
CONFIG_VIDEO_RCAR_CSI2=y
CONFIG_VIDEO_RCAR_VIN=y
# CONFIG_VIDEO_RENESAS_FDP1 is not set
# CONFIG_VIDEO_RENESAS_JPU is not set
# CONFIG_VIDEO_RENESAS_VSP1 is not set

Disabling FDP1, JPU and VSP1 ensure that the media controller and video device 
nodes will have known names. You can enable those drivers if you update the 
device names accordingly in the commands below.

After booting the system, simply run

$ media-ctl -V "'rcar_csi2 feaa0000.csi2':0 [fmt:UYVY8_2X8/1280x800 
field:none]"
$ yavta -f YUYV -s 1280x800 -c10 --skip 7 -F /dev/video0

This will capture three images from the first camera to files 
frame-000007.bin, frame-000008.bin and frame-000009.bin. You can convert them 
to pnm with the raw2rgbpnm tool (which doesn't have to be run on the target 
system, you can use it in your development environment).

$ raw2rgbpnm -f YUYV -s 1280x800 frame-000007.bin frame-000007.pnm

All these information are available from the elinux.org wiki at 
http://elinux.org/R-Car/Tests:rcar-vin.

Notwithstanding the ability to capture images, the to-do list is still long. A 
first non-exhaustive list of items will contain

- Defining the software architecture to handle I2C devices (including address 
translation)
- Defining the corresponding DT bindings for the I2C devices
- Moving the MAX9271 and OV10635 code out of the MAX9286 driver
- Moving the MAX9286 code out of the RDACM20 driver
- Connecting the DT video endpoints to describe the hardware correctly 
(RDACM20 -> MAX9286 -> CSI-2 receivers)
- Splitting, if at all possible, the RDACM20 driver into a MAX9271 driver and 
an OV10365 driver
- Implementing support for multi-channel capture

-- 
Regards,

Laurent Pinchart
