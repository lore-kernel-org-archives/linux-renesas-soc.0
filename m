Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:58030 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844AbcFPK1y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:27:54 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 02/13] soc: renesas: rcar-sysc: Fix uninitialized error code in rcar_sysc_pd_init()
Date: Thu, 16 Jun 2016 12:27:31 +0200
Message-Id: <1466072862-28030-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On success, rcar_sysc_pd_init() returns an uninitialized error code.
Use the return value of of_genpd_add_provider_onecell() to fix this.

This went unnoticed, as early_initcall() doesn't care about the return
value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index a43ca24699bed1ec..59a8152681a59a5c 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -398,7 +398,7 @@ static int __init rcar_sysc_pd_init(void)
 		domains->domains[area->isr_bit] = &pd->genpd;
 	}
 
-	of_genpd_add_provider_onecell(np, &domains->onecell_data);
+	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
 
 out_put:
 	of_node_put(np);
-- 
1.9.1
