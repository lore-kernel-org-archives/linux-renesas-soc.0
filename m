Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay0.mail.gandi.net ([217.70.178.220]:50327 "EHLO
        relay0-d.mail.gandi.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751089AbeCMPSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 11:18:38 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert@linux-m68k.org, horms@verge.net.au,
        yoshihiro.shimoda.uh@renesas.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: cpg-mssr: r8a77965: Replace DU2 clock
Date: Tue, 13 Mar 2018 16:18:20 +0100
Message-Id: <1520954300-15884-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car M3-N does not have DU2 unit but DU3 instead. Fix the module clocks
definition to reflect that.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 41e506a..b1acfb6 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -173,7 +173,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D4),
 	DEF_MOD("csi20",		714,	R8A77965_CLK_CSI0),
 	DEF_MOD("csi40",		716,	R8A77965_CLK_CSI0),
-	DEF_MOD("du2",			722,	R8A77965_CLK_S2D1),
+	DEF_MOD("du3",			721,	R8A77965_CLK_S2D1),
 	DEF_MOD("du1",			723,	R8A77965_CLK_S2D1),
 	DEF_MOD("du0",			724,	R8A77965_CLK_S2D1),
 	DEF_MOD("lvds",			727,	R8A77965_CLK_S2D1),
--
2.7.4
