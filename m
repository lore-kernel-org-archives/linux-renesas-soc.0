Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33453 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968587AbdDSRsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 13:48:08 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: cs2000: Fix the setting of saved_rate during the resume process
Date: Thu, 20 Apr 2017 02:46:32 +0900
Message-Id: <1492624001-3758-12-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Gaku Inami <gaku.inami.xw@bp.renesas.com>

In the resume process, there is the case that other drivers call
cs2000_enable before cs2000_resume is called. Since the order of
resume process is not guaranteed, it is needed to reset the clk
rate in any cases before cs2000 is used.

Also, the current cs2000 driver is using resume_early function.
The using .resume_early is bad idea because the dependency with
other drivers is to be complicated.

This patch adds to reset the clk rate in cs2000_enable and
changes to use from .resume_early to .resume.

Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/clk-cs2000-cp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 5b3516d..de6e8c6 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -338,6 +338,10 @@ static int cs2000_enable(struct clk_hw *hw)
 	struct cs2000_priv *priv = hw_to_priv(hw);
 	int ret;
 
+	ret = cs2000_set_saved_rate(priv);
+	if (ret < 0)
+		return ret;
+
 	ret = cs2000_enable_dev_config(priv, true);
 	if (ret < 0)
 		return ret;
@@ -530,7 +534,7 @@ static int cs2000_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs2000_pm_ops = {
-	.resume_early	= cs2000_resume,
+	.resume		= cs2000_resume,
 };
 
 static struct i2c_driver cs2000_driver = {
-- 
1.9.1
