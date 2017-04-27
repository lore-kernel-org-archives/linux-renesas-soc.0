Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50375 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdD0InB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 04:43:01 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v2 0/2] SH CEU camera driver
Date: Thu, 27 Apr 2017 10:42:26 +0200
Message-Id: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Edit: re-sending as new driver to ease review. Remove the existing
soc-camera one in patch [2/2].

Hello Renesas list,
   this is a first attempt to move SH Mobile CEU driver away from soc_camera
framework.

The driver is -not tested- for lack of available platforms, just compiled in.
Sending it as RFC to collect early feedbacks.

The driver lacks functionalities provided by the original one, such as
re-scaling and cropping, originally performed using soc_camera provided helpers.
Not yet sharing with linux-media but with original driver authors only, and
Renesas SoC list.

I'm particularly interested in feedbacks in size/bus_parameters configuration
functions. While I have used most of the original driver code for functions
dealing with hardware configuration, those two have changed quite a lot, as the
number of FIXMEs and TODOs there show.

Thanks
   j

v1 -> v2:
- resend as new driver and remove soc-camera based one

Jacopo Mondi (2):
  media: platform: Add SH CEU camera interface driver
  media: platform: soc-camera: Remove SH CEU driver

 drivers/media/platform/Kconfig                     |    9 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/sh_ceu_camera.c             | 1597 +++++++++++++++++
 drivers/media/platform/soc_camera/Kconfig          |   10 -
 drivers/media/platform/soc_camera/Makefile         |    1 -
 .../platform/soc_camera/sh_mobile_ceu_camera.c     | 1821 --------------------
 6 files changed, 1608 insertions(+), 1832 deletions(-)
 create mode 100644 drivers/media/platform/sh_ceu_camera.c
 delete mode 100644 drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c

--
2.7.4
