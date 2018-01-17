Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34227 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753629AbeAQPmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 10:42:07 -0500
Received: by mail-wm0-f65.google.com with SMTP id 81so22422442wmb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jan 2018 07:42:07 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 2/2] clk: renesas: rcar-gen3: Add ZG clock divider support
Date: Wed, 17 Jan 2018 16:41:56 +0100
Message-Id: <1516203716-4606-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1516203716-4606-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds ZG clock divider support for R-Car Gen3 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 5 +++++
 drivers/clk/renesas/rcar-gen3-cpg.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index a7d68ce..cfbefcc 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -76,6 +76,7 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 #define CPG_FRQCRC			0x000000e0
 #define CPG_FRQCRC_ZFC_MASK		GENMASK(12, 8)
 #define CPG_FRQCRC_Z2FC_MASK		GENMASK(4, 0)
+#define CPG_FRQCRC_ZGFC_MASK		GENMASK(28, 24)
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -563,6 +564,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, CPG_FRQCRC_Z2FC_MASK);
 
+	case CLK_TYPE_GEN3_ZG:
+		return cpg_z_clk_register(core->name, __clk_get_name(parent),
+					  base, CPG_FRQCRC_ZGFC_MASK);
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index ea4f8fc..3ae9fe6d 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -23,6 +23,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PE,
 	CLK_TYPE_GEN3_Z,
 	CLK_TYPE_GEN3_Z2,
+	CLK_TYPE_GEN3_ZG,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
-- 
2.7.4
