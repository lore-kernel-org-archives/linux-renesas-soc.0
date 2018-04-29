Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45176 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753781AbeD2Tsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Apr 2018 15:48:42 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
Date: Mon, 30 Apr 2018 04:48:15 +0900
Message-Id: <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

This patch adds r8a77965 support in SDHI.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index ba38252..ee978c9 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -26,6 +26,7 @@ Required properties:
 		"renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
 		"renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
 		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
+		"renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
 		"renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
 		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
 		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index a6bf123..733ea8e 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -99,6 +99,7 @@
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{},
 };
@@ -276,6 +277,7 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
 	/* generic ones */
 	{ .soc_id = "r8a7795" },
 	{ .soc_id = "r8a7796" },
+	{ .soc_id = "r8a77965", .revision = "ES1.0" },
 	{ .soc_id = "r8a77980" },
 	{ .soc_id = "r8a77995" },
 	{ /* sentinel */ }
-- 
1.9.1
