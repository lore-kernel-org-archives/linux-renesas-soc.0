Return-Path: <SRS0=bwCI=4E=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A80EC2BA83
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Feb 2020 10:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59F4720718
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Feb 2020 10:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgBPKsb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Feb 2020 05:48:31 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45877 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgBPKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Feb 2020 05:48:31 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9D84860002;
        Sun, 16 Feb 2020 10:48:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 0/6] RDACM20 and RDACM21 GMSL camera support
Date:   Sun, 16 Feb 2020 11:50:59 +0100
Message-Id: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,
   this patch series introduces support for the RDACM20 and RDACM21 camera
modules.

Both cameras use a Maxim MAX9271 serializer, and the associated driver is
here proposed as a library module in order to maximize code use from the
camera module drivers.

RDACM20 support has been proposed several times already, associated with
MAX9286 support (hence the v7 in the patch series).

RDACM21 is a new addition, whose support required several changes in the
rdacm20 driver compared to its v6, particularly the split of max9271 handling
to a library module and reworking of DT bindings description to support both
sensors.

In order to capture from RDACM21 driver a few changes on the deserializer side
are required. All changes to the max9286 driver are based on the most recently
sent v7 from Kieran. Particularly change 1/6 disables overlap window interval
calculation, which help achieving frame synchronization with RDACM21. The change
is not disruptive for RDACM20 and could be considered for inclusion. Patches
4/6 and 5/6 instead modify the max9286 behavior to better support communication
with RDACM21, but interfere with RDACM20 operations, making the deserializer
driver not usable for both cameras. These two changes (4/5 in particular) are
the only reasons why the patches have not yet been sent to linux-media for
collection as we need to discuss how handle differences in the reverse channel
setup configuration to support different camera modules.

Finally, patch 6/6 introduces the new rdacm21 driver, based on the BSP version
available at
https://github.com/CogentEmbedded/meta-rcar/tree/v3.21.0/meta-rcar-gen3-adas/recipes-kernel/linux/linux-renesas

Testing has been performed by capturing from 2 RDACM20 cameras (reverting
patche 4/6 and 5/6) and from 2 RDACM21 cameras on Eagle V3M.

Changelog is reported per-patch if the patch, and a testing branch is available
at
git:://jmondi.org/linux #gmsl/jmondi/platform/rdacm21

Thanks
   j

Jacopo Mondi (6):
  media: i2c: max9286: Disable overlap window
  dt-bindings: media: i2c: Add bindings for IMI RDACM2x
  media: i2c: Add driver for RDACM20 camera module
  media: i2c: max9286: Adjust reverse channel amplitude
  media: i2c: max9286: Adjust image format size
  media: i2c: Add driver for RDACM21 camera module

 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 161 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  24 +
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   4 +
 drivers/media/i2c/max9271.c                   | 338 +++++++
 drivers/media/i2c/max9271.h                   | 217 ++++
 drivers/media/i2c/max9286.c                   |  18 +-
 drivers/media/i2c/rdacm20-ov10635.h           | 953 ++++++++++++++++++
 drivers/media/i2c/rdacm20.c                   | 398 ++++++++
 drivers/media/i2c/rdacm21.c                   | 516 ++++++++++
 11 files changed, 2647 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/rdacm20-ov10635.h
 create mode 100644 drivers/media/i2c/rdacm20.c
 create mode 100644 drivers/media/i2c/rdacm21.c

--
2.25.0

