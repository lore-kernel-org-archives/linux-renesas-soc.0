Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60158 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbcJDJZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 05:25:32 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/4] clk: renesas: cpg-mssr: Add support for fixing up clock tables
Date: Tue,  4 Oct 2016 11:25:24 +0200
Message-Id: <1475573127-30054-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
References: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The same SoC may have different clocks and/or module clock parents,
depending on SoC revision.  One option is to use different sets of clock
tables for each SoC revision.  However, if the differences are small, it
is much more space-efficient to have a single set of clock tables, and
fix those up at runtime instead.

Hence provide three helpers:
  - Two helpers to NULLify core and module clocks that do not exist on
    some revisions (NULLified clocks are skipped during the registration
    phase),
  - One helper to reparent module clocks that have different clock
    parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 50 ++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h | 22 +++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a1d5b7431ec479b5..6bc73d18517b2c82 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -259,6 +259,11 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
+	if (!core->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
@@ -329,6 +334,11 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
+	if (!mod->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
 	parent = priv->clks[mod->parent];
 	if (IS_ERR(parent)) {
 		clk = parent;
@@ -603,5 +613,45 @@ static int __init cpg_mssr_init(void)
 
 subsys_initcall(cpg_mssr_init);
 
+void __init cpg_core_nullify_range(struct cpg_core_clk *core_clks,
+				   unsigned int num_core_clks,
+				   unsigned int first_clk,
+				   unsigned int last_clk)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_core_clks; i++)
+		if (core_clks[i].id >= first_clk &&
+		    core_clks[i].id <= last_clk)
+			core_clks[i].name = NULL;
+}
+
+void __init mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
+			     unsigned int num_mod_clks,
+			     const unsigned int *clks, unsigned int n)
+{
+	unsigned int i, j;
+
+	for (i = 0, j = 0; i < num_mod_clks && j < n; i++)
+		if (mod_clks[i].id == clks[j]) {
+			mod_clks[i].name = NULL;
+			j++;
+		}
+}
+
+void __init mssr_mod_reparent(struct mssr_mod_clk *mod_clks,
+			      unsigned int num_mod_clks,
+			      const struct mssr_mod_reparent *clks,
+			      unsigned int n)
+{
+	unsigned int i, j;
+
+	for (i = 0, j = 0; i < num_mod_clks && j < n; i++)
+		if (mod_clks[i].id == clks[j].clk) {
+			mod_clks[i].parent = clks[j].parent;
+			j++;
+		}
+}
+
 MODULE_DESCRIPTION("Renesas CPG/MSSR Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index ee7edfaf14089cef..a9f27a4f36bdec1f 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -132,4 +132,26 @@ struct cpg_mssr_info {
 
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+
+
+    /*
+     * Helpers for fixing up clock tables depending on SoC revision
+     */
+
+struct mssr_mod_reparent {
+	unsigned int clk, parent;
+};
+
+
+extern void cpg_core_nullify_range(struct cpg_core_clk *core_clks,
+				   unsigned int num_core_clks,
+				   unsigned int first_clk,
+				   unsigned int last_clk);
+extern void mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
+			     unsigned int num_mod_clks,
+			     const unsigned int *clks, unsigned int n);
+extern void mssr_mod_reparent(struct mssr_mod_clk *mod_clks,
+			      unsigned int num_mod_clks,
+			      const struct mssr_mod_reparent *clks,
+			      unsigned int n);
 #endif
-- 
1.9.1
