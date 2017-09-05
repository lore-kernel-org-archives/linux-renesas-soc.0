Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbdIEIHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:51 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 13/13] clk: cs2000: add Suspend/Resume feature
Date: Tue,  5 Sep 2017 10:06:48 +0200
Message-Id: <1504598808-19810-14-git-send-email-horms@verge.net.au>
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

CS2000 needs re-setup when redume, otherwise, it can't
handle correct clock rate.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
[Kuninori: cleanup original patch]
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

(cherry picked from commit c567fb37f123511d752a454fb11d8bcaf46a7895)
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/clk-cs2000-cp.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 021f3daf34e1..3fca0526d940 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -59,6 +59,10 @@ struct cs2000_priv {
 	struct i2c_client *client;
 	struct clk *clk_in;
 	struct clk *ref_clk;
+
+	/* suspend/resume */
+	unsigned long saved_rate;
+	unsigned long saved_parent_rate;
 };
 
 static const struct of_device_id cs2000_of_match[] = {
@@ -286,6 +290,9 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 	if (ret < 0)
 		return ret;
 
+	priv->saved_rate	= rate;
+	priv->saved_parent_rate	= parent_rate;
+
 	return 0;
 }
 
@@ -489,9 +496,24 @@ static int cs2000_probe(struct i2c_client *client,
 	return ret;
 }
 
+static int cs2000_resume(struct device *dev)
+{
+	struct cs2000_priv *priv = dev_get_drvdata(dev);
+	int ch = 0; /* it uses ch0 only at this point */
+
+	return __cs2000_set_rate(priv, ch,
+				 priv->saved_rate,
+				 priv->saved_parent_rate);
+}
+
+static const struct dev_pm_ops cs2000_pm_ops = {
+	.resume_early	= cs2000_resume,
+};
+
 static struct i2c_driver cs2000_driver = {
 	.driver = {
 		.name = "cs2000-cp",
+		.pm	= &cs2000_pm_ops,
 		.of_match_table = cs2000_of_match,
 	},
 	.probe		= cs2000_probe,
-- 
2.1.4
