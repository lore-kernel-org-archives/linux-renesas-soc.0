Return-Path: <SRS0=W/py=6A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0AEC2BB85
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FE4221D92
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Apr 2020 10:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505353AbgDPKjp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Apr 2020 06:39:45 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45197 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505354AbgDPKik (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E28FA60012;
        Thu, 16 Apr 2020 10:38:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 15/20] squash! max9286: Disable overlap window
Date:   Thu, 16 Apr 2020 12:40:47 +0200
Message-Id: <20200416104052.2643098-16-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
  [Jacopo]
  - Write register 0x63 and 0x64 directly as going through the function
    breaks RDACM21 operations
---
 drivers/media/i2c/max9286.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 3ef74ba10074..e0c637d4a7de 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -966,6 +966,18 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
 		      MAX9286_HVSRC_D14);
 
+	/*
+	 * The overlap window seems to provide additional validation by tracking
+	 * the delay between vsync and frame sync, generating an error if the
+	 * delay is bigger than the programmed window, though it's not yet clear
+	 * what value should be set.
+	 *
+	 * As it's an optional value and can be disabled, we do so by setting
+	 * a 0 overlap value.
+	 */
+	max9286_write(priv, 0x63, 0);
+	max9286_write(priv, 0x64, 0);
+
 	/*
 	 * Wait for 2ms to allow the link to resynchronize after the
 	 * configuration change.
-- 
2.26.0

