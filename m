Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22116 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932395AbdIYIyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:54:46 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/2] spi: sh-msiof: Add compatible strings for r8a774[35]
Date: Mon, 25 Sep 2017 09:54:19 +0100
Message-Id: <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/spi/spi-sh-msiof.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 0eb1e95..0080844 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1021,6 +1021,8 @@ static const struct sh_msiof_chipdata rcar_gen3_data = {
 
 static const struct of_device_id sh_msiof_match[] = {
 	{ .compatible = "renesas,sh-mobile-msiof", .data = &sh_data },
+	{ .compatible = "renesas,msiof-r8a7743",   .data = &rcar_gen2_data },
+	{ .compatible = "renesas,msiof-r8a7745",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7790",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7791",   .data = &rcar_gen2_data },
 	{ .compatible = "renesas,msiof-r8a7792",   .data = &rcar_gen2_data },
-- 
2.7.4
