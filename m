Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046652;
	b=pBC2qTogBjORFRwXE70jJRDgi9KBpmLfTakrymsbhrtfJIOuahXjkwD99g/vlW37lTxb
	 OXs5JKVbM7tJR/D63qX/Q+xrgECC+xU/j2DiFX48AG26D3ClL7xTCHUPq09xXK2xS/5Dv
	 3LCXOV2iawShBW+e3KxZbOQr6oKL9Rhty+yVYv5dQxaSJCI5luHIfzTiN2TP2gvKWXN+b
	 RTNTL8Z5YHc2+CDJwS1DSqVLgpkG6FQnpS7LIB5Hs37N5gFVeEwbq9PAoCSPPRI7CkXHI
	 kb5XWfge4TB8p1Us8Jfihh5eyOVMXMJxQFEJFQIi9EihBt7OVDodsYvv7U0cExjkYSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
	b=ruwnQeGcAVXV72qpHuUQDq/tTsEk/h115gMJrcAdeTTZ7D6tBTcd3/wjRSX1VERCjCk7
	 OkdgUzW8HQtA65SkpaL+UiPLnZsEbHav9xwoKefLPQbXishmDojM+V0Tp3Q0JQiIYZz7q
	 pegt6cvooTXaFKLfKhJcjt4jB9xe05Y4H6DoncRX60MiEgXrLd0kDjROaC67+7UEpQ8l5
	 iPJxMvgo0TgvnB2hTjOvOBrteeeyAPdKk6gOu+1WP+0Kskbx9Ja5xgaPxcM/kfuTomXoE
	 Qi9+g8CoBAjSMpJyN/OJ2hDkyaB597v7/StLKtrxj13466ajAk2WS8CsLRKgjVzO8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5ED608D978
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5ED608D978
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPzMA4JD
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55e31aso1021392a34.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=xPzMA4JDHfPVpt3nzTwQL8PAdWdfJ5nM0l+kR+QKMn+kjijtsVxzrVwXMySszp2oAh
         pCQWKhevo3lOBJJ5fO/xTslFphOgvEsXd3ocI8c4ITLL2ntkGvFNwkJ200GSVJOcSCrj
         LJExb9VxnR/ynNGO1uiHNNNNTGBKG2rM1QEWhUWRXefcir3aqnCH/pfyOtp6wIlC0FHb
         PB73mRSS5s6MPlE54UVRuOc29Kf/g4E+kXm56xPIjwoOr9fcLIjGrjqYE83WrGszi2xF
         mvnM3DBB9G03gx2WhGPmSuWOWh3wNs4vFXMoJ34LZEHwWW8mHUw7hOoUzBSqdDn4p4Uz
         VHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=ddQPiLdCnBBn7BI9UsnIu47M5cWJwoXDZEAU6YZ38ekdCaQdn1CqT2Cq7AoWY8ISqR
         tYB+M0IaVqRqKQJHC/pfws/gCQkPUjjyROHmLpeg1gc/AsN4ugJr033gtuaMkMX6eqoX
         MfWSQGwiHJEPLLz8L/6BBpB+tnZ8NkvjIN9XhcfwozirJdcQ+/r4Kanc1KYtBl5sSVIE
         iRE7B+v9rYwLZibIjs0OpIVkdYIC1zyggZN8seVkXFRu+d+9MIf5lycMJxItQMCeQszL
         C0L068GSDwr9F2htjlBRb0lCc2IvWeQZ7Hw52zq1SShOKoKF70UchQR8FbMN1mWEqZQg
         sGag==
X-Forwarded-Encrypted: i=1; AKwUvBztSL42xILGLnR1/4e+bvupGoYkkeGMESjq1YlPiaCUSU+viqzScg9ToX1wW7V6aPLt1kxgnhFrCk/L+jiZ+rwV2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cIpJ/X7Tu+lVVjeO14nWFNbcL2Il28Uw0DtHkTCUVpzX+Tyq/
	w0A1K/m6CgzO2k7XuImf1XZe0lNn4x4h5CTVWc8or3T/Qi5hYJTteAgm
X-Gm-Gg: AYBFou0+OnveaTMz33JHHY/MwmT3SjJBeHg6JTV375DwkASDv+Ual7TCNDs6s8H5Z3e
	+1VJn1ocGD+aKsiM5F+eeUjkL74vOVjvszvSn9yKRCAeKHPRtzdtDWWtBLN77af0N62wszVl+vw
	rkhB9qeXFS5mVfkSnJJytfJcR7bHvETzxA7X76wVwwIMrOfVDH6p98F5WEg/fKbcJidW7tzOhu1
	2WXIskeBep5ZO44eLZlbzfsCetaYGrAjOdY53I5zB8DfQ7cZFuSkqQvBJbntG3IZARWVrIq90vU
	dAHm7Hs9+gkuOmbK9nLogo5K5K3ZDRenoVrCUBwfrcYkiPYMRKVsOOBNlr5md1qgNsxFT9kzVAY
	i26Mv6BYZN1TtGtv90HNvXURaDC4AdRkHM7+yU/rswZCa1pMj95pX60W5lx5Ym2mqY8/F7x2GAF
	X0Gslfy7sOX1uQ9/n75BGyE2I5SJynLBoKqjG36Cm4TxzMjzkcqaEFB+ZGfIXTVDppGvt/EPdTe
	G8VZoUgeqd4aTgWdqVg4ovSb8DH7ziMuBjEb1JoR5GM4kk3hqvEW/AiRDPum8/FBXso6wXVvF09
	bZeeX4JUWeAYtriSnVQJp8u7Tr0V4k3YpCTLTLnBE6kDIfa1cTRR5/xTWTT+yhApqT1JGzP1MjG
	fMLL1lhIDK2uYtBLjkXfii312dYLXvMb9o6ak1UobkHlT40HEMPLd55lLzDfQil79z9izN7WraC
	ufa9tkhR+bBzWOjzlvzg0AISmqPT4n/6AkD3X8jlPuXWnriOQbNeaJeCA4XQZdw88fEticTJboo
	VU=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

