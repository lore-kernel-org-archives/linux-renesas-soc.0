Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:45805 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751000AbdAQUAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 15:00:16 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] mmc: sh_mobile_sdhi: add support for 2 clocks
Date: Tue, 17 Jan 2017 14:59:38 -0500
Message-Id: <20170117195940.25092-2-chris.brandt@renesas.com>
In-Reply-To: <20170117195940.25092-1-chris.brandt@renesas.com>
References: <20170117195940.25092-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some controllers have 2 clock sources instead of 1, so they both need
to be turned on/off.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/mmc/host/sh_mobile_sdhi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
index 59db14b..5ad5744 100644
--- a/drivers/mmc/host/sh_mobile_sdhi.c
+++ b/drivers/mmc/host/sh_mobile_sdhi.c
@@ -143,6 +143,7 @@ MODULE_DEVICE_TABLE(of, sh_mobile_sdhi_of_match);
 
 struct sh_mobile_sdhi {
 	struct clk *clk;
+	struct clk *clk2;
 	struct tmio_mmc_data mmc_data;
 	struct tmio_mmc_dma dma_priv;
 	struct pinctrl *pinctrl;
@@ -190,6 +191,10 @@ static int sh_mobile_sdhi_clk_enable(struct tmio_mmc_host *host)
 	if (ret < 0)
 		return ret;
 
+	ret = clk_prepare_enable(priv->clk2);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * The clock driver may not know what maximum frequency
 	 * actually works, so it should be set with the max-frequency
@@ -255,6 +260,8 @@ static void sh_mobile_sdhi_clk_disable(struct tmio_mmc_host *host)
 	struct sh_mobile_sdhi *priv = host_to_priv(host);
 
 	clk_disable_unprepare(priv->clk);
+	if (priv->clk2)
+		clk_disable_unprepare(priv->clk2);
 }
 
 static int sh_mobile_sdhi_card_busy(struct mmc_host *mmc)
@@ -572,6 +579,10 @@ static int sh_mobile_sdhi_probe(struct platform_device *pdev)
 		goto eprobe;
 	}
 
+	priv->clk2 = devm_clk_get(&pdev->dev, "carddetect");
+	if (IS_ERR(priv->clk2))
+		priv->clk2 = NULL;
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
-- 
2.10.1
