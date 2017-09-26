Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967968AbdIZKGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:20 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 7831121508
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:06 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 09/13] v4l: rcar-fcp: Configure the number of outstanding read transactions
Date: Tue, 26 Sep 2017 13:06:01 +0300
Message-Id: <20170926100605.2313-12-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCPV has a selectable number of outstanding read transactions.
According to the documentation the value must be set based on the type
of the VSP the FCPV is connected to. Set the register accordingly at
probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index ddbc960f8458..e93e9c4227d9 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -67,6 +67,7 @@
 enum rcar_fcp_type {
 	RCAR_FCPF,
 	RCAR_FCPV,
+	RCAR_FCPVI,
 };
 
 struct rcar_fcp_device {
@@ -89,6 +90,12 @@ static u32 rcar_fcp_read(struct rcar_fcp_device *fcp, unsigned int reg)
 	return ioread32(fcp->mmio + reg);
 }
 
+static void rcar_fcp_write(struct rcar_fcp_device *fcp, unsigned int reg,
+			   u32 value)
+{
+	iowrite32(value, fcp->mmio + reg);
+}
+
 /* -----------------------------------------------------------------------------
  * Public API
  */
@@ -194,6 +201,7 @@ static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
 	static const char * const models[] = {
 		[RCAR_FCPF] = "FCPF",
 		[RCAR_FCPV] = "FCPV",
+		[RCAR_FCPVI] = "FCPVI",
 	};
 	static struct {
 		u32 version;
@@ -228,12 +236,29 @@ static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
 	dev_dbg(fcp->dev, "%s %s device found\n", models[fcp->type],
 		versions[i].name);
 
+	/* Set the processing mode (needed for FCPV only). */
+	switch (fcp->type) {
+	case RCAR_FCPV:
+		/* 64 outstanding read transactions */
+		rcar_fcp_write(fcp, FCP_CFG0, 0);
+		break;
+
+	case RCAR_FCPVI:
+		/* 16 outstanding read transactions */
+		rcar_fcp_write(fcp, FCP_CFG0, FCP_CFG0_FCPVSEL);
+		break;
+
+	default:
+		break;
+	}
+
 	return 0;
 }
 
 static const struct of_device_id rcar_fcp_of_match[] = {
 	{ .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
 	{ .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
+	{ .compatible = "renesas,fcpvi", .data = (void *)RCAR_FCPVI },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
-- 
Regards,

Laurent Pinchart
