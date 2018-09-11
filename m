Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:28051 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726720AbeIKPSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:18:21 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 03/10] soc: renesas: rcar-sysc: Add r8a7744 support
Date: Tue, 11 Sep 2018 11:12:44 +0100
Message-Id: <1536660771-32278-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for RZ/G1N (R8A7744) SoC power areas to the R-Car SYSC driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig     | 2 +-
 drivers/soc/renesas/rcar-sysc.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 00d4c9d..a3a34d2 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -6,7 +6,7 @@ config SOC_RENESAS
 			   ARCH_R8A774A1 || ARCH_R8A7795 || ARCH_R8A7796 || \
 			   ARCH_R8A77965 || ARCH_R8A77970 || ARCH_R8A77980 || \
 			   ARCH_R8A77990 || ARCH_R8A77995
-	select SYSC_R8A7743 if ARCH_R8A7743
+	select SYSC_R8A7743 if ARCH_R8A7743 || ARCH_R8A7744
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A77470 if ARCH_R8A77470
 	select SYSC_R8A774A1 if ARCH_R8A774A1
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index fe32f7a..4d8eee4 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -268,6 +268,8 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A7743
 	{ .compatible = "renesas,r8a7743-sysc", .data = &r8a7743_sysc_info },
+	/* RZ/G1N is identical to RZ/G2M w.r.t. power domains. */
+	{ .compatible = "renesas,r8a7744-sysc", .data = &r8a7743_sysc_info },
 #endif
 #ifdef CONFIG_SYSC_R8A7745
 	{ .compatible = "renesas,r8a7745-sysc", .data = &r8a7745_sysc_info },
-- 
2.7.4
