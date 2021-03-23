Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268A4C433C1
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Mar 2021 00:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDA83619AD
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Mar 2021 00:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCWANt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 22 Mar 2021 20:13:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58916 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhCWANe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 20:13:34 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6C398F0;
        Tue, 23 Mar 2021 01:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616458412;
        bh=c9St3PMAg/dc793xjbJW6y5cFYN4GGKq4CmLjOpKLdQ=;
        h=From:To:Cc:Subject:Date:From;
        b=nkERauel+drCFAGd9eIO5dAJG4WznGNs5AY3lqOHJI0v6KEgmZQfEnA2/WGS3P09f
         z9xnMcAlaCRFTg6JoEVPj5sboP3O1iXnRxPVFzJTHBXbb7rVcaPL5Drx3yEj+Bd/9u
         Ol5s5qf32FdZ8bDyhEA3uRRH8Gkc5Iy+cJ1+1sAA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Shutdown the display on system shutdown
Date:   Tue, 23 Mar 2021 02:12:46 +0200
Message-Id: <20210323001246.16182-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the system shuts down or warm reboots, the display may be active,
with the hardware accessing system memory. Upon reboot, the DDR will not
be accessible, which may cause issues.

Implement the platform_driver .shutdown() operation and shut down the
display to fix this.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index bfbff90588cb..43de3d8686e8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -561,6 +561,13 @@ static int rcar_du_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void rcar_du_shutdown(struct platform_device *pdev)
+{
+	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&rcdu->ddev);
+}
+
 static int rcar_du_probe(struct platform_device *pdev)
 {
 	struct rcar_du_device *rcdu;
@@ -617,6 +624,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 static struct platform_driver rcar_du_platform_driver = {
 	.probe		= rcar_du_probe,
 	.remove		= rcar_du_remove,
+	.shutdown	= rcar_du_shutdown,
 	.driver		= {
 		.name	= "rcar-du",
 		.pm	= &rcar_du_pm_ops,
-- 
Regards,

Laurent Pinchart

