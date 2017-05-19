Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46073 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751165AbdESQDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 12:03:09 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v4 0/8] Renesas CEU driver
Date: Fri, 19 May 2017 18:02:52 +0200
Message-Id: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent and Renesas list,
    this is new version of Capture Engine Unit driver.

Compared to "RFC v3", still in review, patches [02/08] and [03/08] are
un-changed. I have added changes to the newly developed CEU driver in a
separate patch ([04/08) to ease the review process.

Not having modified the CEU driver sent in "RFC v3", refer to that series for
a more detailed description of patches [02/08] and [03/08].

In this series I have added modification to Migo-R startup code to use the new
CE driver with the two sensors installed on that board. Both sensor drivers were
soc_camera dependent, and I have removed that dependency in patches [06/08] and
[07/08]. The drivers have not been moved yet from soc_camera sub-directory not
to break other platforms.

Patch [05/08] is a fix required to have ov772x probe properly, and has already
been sent to linux-media as stand-alone fix.

Series is in RFC as I have not tested image capture yet, nor I have update
other sh platforms to use the new CEU header, introduced with patch [01/08].

On Migo-R I have verified the sensors probe correctly, and a video device
gets registered after both async sensor notification have been received by
the CEU driver.

ov772x 0-0021: ov7725 Product ID 77:21 Manufacturer ID 7f:a2
tw9910 0-0045: tw9910 Product ID b:0
renesas-ceu renesas-ceu.0: Video device registered

Next step is to test image capture and possibly input selection on Migo-R
platform.

Thanks
   j


Jacopo Mondi (8):
  include: media: Move and update CEU driver interface
  media: platform: soc-camera: Remove SH CEU driver
  media: platform: Add Renesas CEU driver
  media: platform: ceu: Support for multiple subdevs
  media: i2c: ov772x: Force use of SCCB protocol
  media: i2c: ov772x: Remove soc_camera dependencies
  media: i2c: tw9910: Remove soc_camera dependencies
  arch: sh: migor: Use new CEU camera driver

 arch/sh/boards/mach-migor/setup.c                  |  126 +-
 drivers/media/i2c/soc_camera/ov772x.c              |   96 +-
 drivers/media/i2c/soc_camera/tw9910.c              |   68 +-
 drivers/media/platform/Kconfig                     |    8 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/renesas-ceu.c               | 1669 ++++++++++++++++++
 drivers/media/platform/soc_camera/Kconfig          |   10 -
 drivers/media/platform/soc_camera/Makefile         |    1 -
 .../platform/soc_camera/sh_mobile_ceu_camera.c     | 1821 --------------------
 include/media/drv-intf/renesas_ceu.h               |   28 +
 include/media/drv-intf/sh_mobile_ceu.h             |   28 -
 include/media/i2c/ov772x.h                         |    3 +
 include/media/i2c/tw9910.h                         |    6 +
 13 files changed, 1878 insertions(+), 1988 deletions(-)
 create mode 100644 drivers/media/platform/renesas-ceu.c
 delete mode 100644 drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
 create mode 100644 include/media/drv-intf/renesas_ceu.h
 delete mode 100644 include/media/drv-intf/sh_mobile_ceu.h

--
2.7.4
