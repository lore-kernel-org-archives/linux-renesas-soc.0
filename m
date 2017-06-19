Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37832 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752095AbdFSRFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:16 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 00/12] rcar: vin: Add digital input to Gen3
Date: Mon, 19 Jun 2017 19:04:37 +0200
Message-Id: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,
   this patch series implements support for parsing OF nodes describing
digital video inputs such as parallel camera sensor connected to a Gen3 VIN
instance. It also supports linking the camera sub-device to media controller
graph.

Sending as RFC because work is far from being complete, but before everything
I would like to validate some implementation choices I made.

First of all, the DT layout proposed in patches 01 and 02.
I am now registering digital input pins inside port@2 node, while all CSI input
are currently enumerated in port@1. While I found no mention of this being a bad
practice in device tree binding documentation, I would like to validate if having
input of different nature (serial CSI-2 and parallel) in 2 different subnodes is
acceptable.

Patches from 05 to 12 assume this device tree layout and parse the additional
parallel input making use of digital_graph_* routines, used for Gen2 input.
(In future, the distinction between Gen2 and Gen3 use cases can probably be
reduced in the driver, unifying most of those functions, but that's for later).
The digital input subdevice media entity is then linked to the VIN instance it
is connected to.

Patches 03 and 04 are specific to the camera module I am using for testing,
and are required to have the device probe and having it linked in the media
controller graph.

A few words on HW setup: I have an mt9m111 camera sensor module connected to
Salvator-X M3-W EXIO-D connector, through a camera shield designed for another
board (grpeach-audiocamera shield). The camera board provides pull up resistors
for I2c lines and routes 3v3 VCC and GND to its camera connector. The camera
sensor module (designed to fit that connector) has an on-board 27Mhz oscillator
to generate clock fed to the camera sensor, and provides to the camera sensor
the required digital and analog input voltages generated from a single 3v3 input.
The 8 video digital output pins from camera module to the digital input port are
connected to VIN4[15:8] pins, exposed on EXIO-D connector pins.

After the device has probed and has been asynchronously registered by the VIN
driver, it appears in media controller graph, linked to VIN4 instance.

$ ./media-ctl -p -d /dev/media0

...

- entity 95: rcar_vin e6ef4000.video (1 pad, 3 links)
             type Node subtype V4L flags 0
             device node name /dev/video4
        pad0: Sink
                <- "rcar_csi2 feaa0000.csi2":1 [ENABLED]
                <- "rcar_csi2 fea80000.csi2":1 []
                <- "mt9m111 8-0048":0 [ENABLED]
...

- entity 139: mt9m111 8-0048 (1 pad, 1 link)
              type V4L2 subdev subtype Sensor flags 0
              device node name /dev/v4l-subdev4
        pad0: Source
                [fmt:YUYV8_2X8/0x0 field:none
                 crop.bounds:(26,8)/1280x1024
                 crop:(26,8)/1280x1024]
                -> "rcar_vin e6ef4000.video":0 [ENABLED]

Sending to linux-renesas-soc only, as before expanding to other lists/people
at least basic streaming needs to be validated.

Thanks
   j

Jacopo Mondi (12):
  arm64: boot: dts: salvator-x: Add camera module
  arm64: boot: dts: Salvator-X: Add VIN parallel input
  media: i2c: mt9m111: Skip chid identification
  media: i2c: mt9m111: Add source pad
  media: rcar: vin: Prepare to parse Gen3 digital input
  media: rcar: vin: Accept parallel input on Gen3
  media: rcar: vin: Add ID for parallel input on Gen3
  media: rcar: vin: Parse digital input after CSI on Gen3
  media: rcar: vin: Install notifier for digital input
  media: rcar: vin: Add digital input mask to vin_dev
  media: rcar: vin: Store VIN instance id
  media: rcar: vin: Link digital subdev to VIN instance

 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  58 ++++++++++
 drivers/media/i2c/mt9m111.c                        |  36 +++---
 drivers/media/platform/rcar-vin/rcar-core.c        | 127 ++++++++++++++-------
 drivers/media/platform/rcar-vin/rcar-vin.h         |   8 ++
 4 files changed, 166 insertions(+), 63 deletions(-)

--
2.7.4
