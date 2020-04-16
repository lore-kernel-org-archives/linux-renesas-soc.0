Return-Path: <SRS0=W/py=6A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B826C2BB85
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3D9721973
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505337AbgDPKpU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Apr 2020 06:45:20 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54729 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505322AbgDPKiT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:19 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AB9D960012;
        Thu, 16 Apr 2020 10:38:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 03/20] squash!: max9286: Rebase on latest media/master
Date:   Thu, 16 Apr 2020 12:40:35 +0200
Message-Id: <20200416104052.2643098-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Adapt Kconfig to latest upstream changes
Fixes: 32a363d0b0b1 ("media: Kconfig files: use select for V4L2 subdevs and MC")
---
 drivers/media/i2c/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 04186787a2f0..5d810f6f230e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -467,8 +467,9 @@ config VIDEO_VPX3220
 config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
-	depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
 	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
 	help
 	  This driver supports the Maxim MAX9286 GMSL deserializer.
 
-- 
2.26.0

