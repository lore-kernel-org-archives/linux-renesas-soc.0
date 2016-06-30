Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: mchehab@osg.samsung.com,
	linux-media@vger.kernel.org
Cc: kieran@bingham.xyz,
	linux-renesas-soc@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2] v4l: platform: Add Renesas R-Car FDP1 Driver
Date: Thu, 30 Jun 2016 14:41:22 +0100
Message-Id: <1467294083-1811-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Version 2 of the FDP1 driver introduces support for deinterlacing on top
of the previous patch which only supported pixel format conversion.

The FDP1, (Fine Display Processor) is a de-interlacer device, with capability
to convert from various YCbCr/YUV formats to both YCbCr/YUV and RGB formats
at the same time as converting interlaced content to progressive.

Kieran Bingham (1):
  v4l: platform: Add Renesas R-Car FDP1 Driver

 MAINTAINERS                        |    9 +
 drivers/media/platform/Kconfig     |   13 +
 drivers/media/platform/Makefile    |    1 +
 drivers/media/platform/rcar_fdp1.c | 2395 ++++++++++++++++++++++++++++++++++++
 4 files changed, 2418 insertions(+)
 create mode 100644 drivers/media/platform/rcar_fdp1.c

-- 
2.7.4
