Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46143 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933608AbdIYHyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:54:31 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] soc: renesas: identify R-Car V3M
Date: Mon, 25 Sep 2017 09:53:57 +0200
Message-Id: <bb0030752f288a2e2d27cc110d6d4139fe7a948d.1506325468.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506325468.git.horms+renesas@verge.net.au>
References: <cover.1506325468.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add support for identifying the R-Car V3M (R8A77970) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 90d6b7a4340a..9f4ee2567c72 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -144,6 +144,11 @@ static const struct renesas_soc soc_rcar_m3_w __initconst __maybe_unused = {
 	.id	= 0x52,
 };
 
+static const struct renesas_soc soc_rcar_v3m __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x54,
+};
+
 static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen3,
 	.id	= 0x58,
@@ -204,6 +209,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A7796
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
+#ifdef CONFIG_ARCH_R8A77970
+	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
+#endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
-- 
2.1.4
