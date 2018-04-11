Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:58314 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752140AbeDKJgq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Apr 2018 05:36:46 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] soc: renesas: identify R-Car E3
Date: Wed, 11 Apr 2018 18:36:23 +0900
Message-Id: <1523439386-1032-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds support for identifying the R-Car E3 (R8A77990) SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 3912a71..d44d0e6 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -164,6 +164,11 @@ struct renesas_soc {
 	.id	= 0x56,
 };
 
+static const struct renesas_soc soc_rcar_e3 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x57,
+};
+
 static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen3,
 	.id	= 0x58,
@@ -236,6 +241,9 @@ struct renesas_soc {
 #ifdef CONFIG_ARCH_R8A77980
 	{ .compatible = "renesas,r8a77980",	.data = &soc_rcar_v3h },
 #endif
+#ifdef CONFIG_ARCH_R8A77990
+	{ .compatible = "renesas,r8a77990",	.data = &soc_rcar_e3 },
+#endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
-- 
1.9.1
