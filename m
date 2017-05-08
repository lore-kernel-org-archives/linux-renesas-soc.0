Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36905 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751439AbdEHPcj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2017 11:32:39 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v3 0/2] Renesas CEU driver
Date: Mon,  8 May 2017 17:32:30 +0200
Message-Id: <1494257552-10836-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent and Renesas list,
    this is new version of Capture Engine Unit driver.

Sending as RFC as the driver has not yet been tested due to the lack of a
suitable hardware platform.

This new version is a re-write of the existing and in-tree soc-camera based
driver (drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c).

In "RFC v2" I tried to just move the existing driver away from soc-camera
framework, but as many of the review comments I have received were directed
to code I took from that driver, I ended up rewriting most of that; this new
version is effectively a new driver, based on review comments from Laurent on
existing and previously sent items.

I have inserted a lot of "annotations" as FIXMEs and TODOs in code (being this
an RFC I felt I could go in sketchbook mode a bit more freely), mainly to
keep reference of what I have changed from the original driver mostly in HW
manipulation sequences, in order not to lose details that could get painful to
investigate when testing on an actual platform.

Laurent: I have tried to keep the driver structure as consistent as I could
with the version you have already reviewed to ease review of this new one. Hope
it doesn't get too confusing...

Thanks
   j


Jacopo Mondi (2):
  media: platform: soc-camera: Remove SH CEU driver
  media: platform: Add Renesas CEU driver

 drivers/media/platform/Kconfig                     |    8 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/renesas-ceu.c               | 1444 ++++++++++++++++
 drivers/media/platform/soc_camera/Kconfig          |   10 -
 drivers/media/platform/soc_camera/Makefile         |    1 -
 .../platform/soc_camera/sh_mobile_ceu_camera.c     | 1821 --------------------
 6 files changed, 1454 insertions(+), 1832 deletions(-)
 create mode 100644 drivers/media/platform/renesas-ceu.c
 delete mode 100644 drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c

--
2.7.4
