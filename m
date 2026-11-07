Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046629;
	b=aTumtA8srjCIVgPUXZTRDI5T3Xgx4B4iIsISAO+1FIaLy37i16457IXfzO3DGPpsF5J4
	 2AUDjiICxoAm89CUI5b1kx/sBxlbTzQYBu3ekIlgjw8W2Nc9TGe2TyEu5CNMqFsJutrgy
	 fu1iXvq5ciSAFVW7rqK3qPTKbb9EB5yBcwUs1g0yrXHXqY456wwRfl0q3h+8l0oJJjeMb
	 1qRoiipMUJrLKU46c5hzhyh51Z8rzB0z6td5PD5udawtXDdE9JGVw6k4agTtoQYzjgThX
	 SqdHnmDJbV0kii4qLn+GAMEoSVwwrD7sJUlskfe/M8IJoPji7Gy4yAG+YqhfylkxSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
	b=Ub/NWC87MZ3IiZpfnvPB3MDbmzDaAba7y23iliE/vTpGsVrwvuNZuoklGACG3bytivC6
	 vFeTfYTFvRruDW7WMeOXPSUxlnTVZWeJWhXsL9yaQtQpqb/IrJasACLlQUdM3qLfLbxjO
	 kknK44iWbYWtBKp7/VpORcFk4Dzx1LGNb53y0vix0bwWDdL0piNvtvmkbUIMwZDYdpGz5
	 6lfMYm4LTT2XBGE4UjYZ1L8YabR/5R3Adjp1u1LfxYQT6LmPsaU+YBEfp49nixzWbzASc
	 yvHNChsO2i0dQ7Z+UFxc3AnPZdLiTBEGEETBHkr25OPLLmNAUB5FFLEyi+ho58HFPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0ZOO6XL;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FF060A3824
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FF060A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0ZOO6XL
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-844a8bf7e25so794073a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046628; x=1794651428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=M0ZOO6XLRhTxTCxQ8ejdFZDnDu4xEffxeM69iD4dlIYKXcIWLKG/zjenlizr4O3VCz
         7vx2OPD/iKo2EDYmLkpx4+U+v+oc7Iso3k1qJLntk5HRyBIgaWQ55HyAiF96DjIPWaAE
         7awGjB32jsVBAT6n3Ln+xz+flfAKw0tcjydr9MfGAoxe0eaxwMb++If0JknQpStjGb+W
         c5xcfI5Xyi1131tX5oFYJSS/9vQlgRhESipR0cCXIx2eu7fZepXcOdeldyw/XBi8HUSx
         LC48umPapEEkftVKvLtgKtUnpBjwTDRv2DzmxqjZmRSdrWaDaQFyPpDOLb9/BZ2234Q6
         /Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046628; x=1794651428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=jK5nnFGgxkY+Ivj5N0k4upQz9p3ecN2jOfn6J4R8K6tWZfucFgNeK1/bcYJZf7xs4D
         w9M+y+lKsuU8JaJSQoIFpax9/4fdQIRo3eK8FEoTk2cWygxMShNt2/Cjp4TzI4i/lTLa
         hhwh0BJBrMdh1qSHyQN8viCtp/+sAC58flcHtCQKNbhWYQvJ1IHRC0lSMTmL2M9KY0mz
         zkourHnY943P0lOfdHD9s1AehUqbbQeWT+DXUdiKg9axLt+J0JRVy2gQT9xJ4EdW26gU
         VyR0qQIu/j2SV+yDwu7f0R808bOGBlXXeUveefh+VPigfMGXEfVIgK1oaSOp1U/HrChT
         Z1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBx2xll9aHZUr8GgrhFyHE8/xZs+ViBYI26tXCyaStOlmVv+AgOYqtPzoTzfIxbfOeecGPgaokI+pPQvOWhN16+ooA==@vger.kernel.org
X-Gm-Message-State: APuU4Z85y9jsvKa+fiez/bmM0gefaSpXUw5W9fAK7TS0STyVObOBnEMX
	ftFb8vtV57fWr9AcVYYNYm83oRwgH5PC1zQnjRihk+GAwtersURcZP/k
X-Gm-Gg: AYBFou1irQAxExjTFqG7fzZ7gQCr7wnCg8jVNUuP9SZeMterlsKxvH+EFkkdphkWP9i
	N0OkW3vialV5G8LhaU0JNs7OaRipX3lSg3nYGm1mQ57M9oUaBzONKFZTcnzUODa4EKBw7hD6yBg
	oKbhdj6SsBLoMZYubpoTp1MwdYmn/G0VxSzv1kL2VENoQQM+3C9Sn/lXR8LVT0kCh8dUfgEC7us
	now5wBuKOcf6jdQhLYtC+8dMg8Qc9R4MAGRZdTKfLEiDSCu9vxfwV2NI6vpnhZYi88Z8oIltqLw
	l558HY6s+QkDFL+zgSRwxiIJMNPcwYWwFTS/wPab0GmcJBcZFV246sb4Qmtf7iKAmkC6om2qcAs
	L/3C9fHamVCHBpFzO1fxY5bfJDulkNyXxtoWRAcmooZIEzq52cFXqMKbHF5EBco5BSMTJxoxLu8
	QcCtezqbyjQCFIby7PugmJzMbXKJxNrglXE83RTZkPAEcQXDnx/BTosNuhjwBGcuQ2O1wRFvJx8
	w+SqZL77otSh5j5SFZueV5c6SHCm0++jOpF5RhypU+mLrg7NE520UCkwee+naBqEUHqb5SyzX67
	ZaWHCQ0y6rj7k4BxbANdOJo1laoAAHmD93QhYNf/6sVk4usGF1NlLs5PImbGIobyVInmP0Fb0lg
	WOfHDc/IICGfySyqYLvk4uvkr4iSC6c7umdAQCE0P9zUcO2Qxuz9NvR2fuiqmDGe/mzS7l6C6V3
	U8XB2tWCVC0vBhOa87oVTavm3V2AlYNkK2h1jU7Hv4dWZTPZZa/PMO
X-Received: by 2002:a05:6830:410e:b0:844:ec25:c7f2 with SMTP id 46e09a7af769-85f1cfdc445mr4024752a34.13.1794046627839;
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:12 -0700
Subject: [PATCH 15/58] mtd: rawnand: tegra: retain open-handle state on
 removal
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..da7791741b9d 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,6 +1064,11 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1232,10 +1254,11 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0

