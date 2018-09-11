Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:28051 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726722AbeIKPSZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:18:25 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 05/10] soc: renesas: rcar-rst: Add support for RZ/G1N
Date: Tue, 11 Sep 2018 11:12:46 +0100
Message-Id: <1536660771-32278-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/soc/renesas/rcar-rst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index a447873..1e11776 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -43,6 +43,7 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* RZ/G1 is handled like R-Car Gen2 */
 	{ .compatible = "renesas,r8a7743-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a7744-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7745-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77470-rst", .data = &rcar_rst_gen2 },
 	/* RZ/G2 is handled like R-Car Gen3 */
-- 
2.7.4
