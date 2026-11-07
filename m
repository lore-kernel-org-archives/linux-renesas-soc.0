Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079359;
	b=PRJ9r2EYDpgXdp+0YgB2OfGctewn+uyRaF6PAQTf6/zbDIeQJKA/3jTqq10qLZPw4ka3
	 032FC9rxCDMScExcYLSJ/FCtdTMB9AXXiows0LuIRkwBkAfC9I+3l7j7iPlPwQMO5WxUu
	 f3c9krGmpVQ7fVz45XIJaqegVobxp9RncI/+0sQZ70HqzcMaZWx+1ia1VtmZKeD5UjmeD
	 Y1J+6wl9pcZw9hgvrnuWas9BBFIg0CadRQTulr/H/C0b8qFZXc6v5JzD0Zxk2r3TKnXMe
	 UM4fgszgULqr5az8EcSPvherM+omF9SVyvRGW2+ts1KbRRjbCb8UqAeX5hau8de5tOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=iThhB1+F+DV7pBb7vma9NfeOyMXZAWU+gnG6jD6rhwxaHxasaj/rDV5RH9Jp7QTI++/f
	 +1tVhK4trD3gNmL5gldgDqvp+vDHLqRvlsLPvKF9XXfbeICMqXohzZPAg97PY6LPvr5J5
	 3dryq3SV/7e3RQfibBUHFQ/RGOXJ7kpjECzHefClTEur+xzdCT9pYnJk+AAFDpUmC36bO
	 UJyKaCH0swQO704CF85H5Nx9CVaUElvsM2K39CG4a1+pCkBhV27vgncpQZdvkGYz4vxmH
	 PrbxJgbsW3b6vTHCByr7TS3zZgB6N1mcR58uOijFiD2K/wrgOX8JpXxyVIUP17cxsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A5606D80C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246A5606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-490d838b425so858485fac.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=FPlZPym2uXrEKfatPBCADeNjTybQJXizuucFUnEvjPFiQrk6RFjrPRRUf1c8C5HjUv
         iXSgKpx/eBeS+qItB9pkvi+lNcHf7Q/wk7MEj9Kb2lKWJnOgMbFnOG5ICVIS0r5EHGIP
         RuADCBkJKpCSptLef/054xG9ggEVUmwk8VNM39oJ3gStkDC0OeWpFXYAeYlyigfr4H/b
         pKZui1WlPk2zpYfKnOuQWi72Uk9yPBltOwq1N7CizXvAjbtVORCyYiSWP/4BDldotP6W
         fwGkCRB7dN5Jml7MzkLdrUjqC2HxRmqEWBQCzVDwKV7m6aPWoi6uVqIBecfAwGO3jSod
         YcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=lF6PsaTiyn8NhOSg4YEyK3wQDFtHoe38YFqWhP4gB3H2O4fF01mihLZwB6Ot5BBZAR
         QVxPAl+AvCUO5N47txqEnig1f2M+mlXzvCnhdwcnWwP94nUzkGTkNQjVRkq/wtHLJk1a
         WcoQ70cFjjVgt1+s+Z/Y7xRLO97nch82rAtDN/YSzcVa1fkkXQxgax8GhCNyBWe66enj
         DcX5zhxv2uknnehYPEeuK9mjS87CrHqLAKxCykmDWy3pfT3QGSl/5pk7Jy91Y6s/Y/At
         0mJzJSWwtrtnKzXJbhDCwR0cB+wu7aY4jBOrpSWwZ9dtM9PydzUDBuC229Z7ZX85svgN
         nrOA==
X-Forwarded-Encrypted: i=1; AKwUvBw4iG8ftJNdde4VuSdGDSn38Hv4PvIWFPA47Q/pmJvO+/Its1i182QT9JsIXfHFbQxOe67YvQgq8SnlgqpmQrQLfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oE/WjKs/V+dHdgM3EZyMfeVGU1hCIIHWpaaZfPUVONNE82AFQ
	+wVSVW6Xw2HCgETjepMrA2zX2tQU5xnyr6hiRn/g05/DP9PcMWHJsJm6
X-Gm-Gg: AYBFou0JFS7QVopl/vhXDrVZUM00asTKlkEpdnQi/QsEpVZXITjcBxg/w+RhzIIDIxu
	XACC4JgRHx+xiaf2WZYptMAlxO9hXDVEaXXC8SH/GcgAihsyNOAeAhqoS2Jm86YmwYr2Vmj4wOW
	O5gQxj1HA45Q+L1I9GQD48KzpExLkWbZgT5PttkI8/6pvC+3e1AKP2ZZzmw4QLP9uUMPtdxXmF0
	qKXm4husAp9qyesEjzc0mDBrbUiHtIVTplXTq91XuIy1SuZgANW79JR2Nelrg1AAIpfekACnfT7
	yQ5LelLP5cHQ9rbkimkvxU1/EmAgpbfZiN7ILoORJWosV+y6ZShrfAUaTipgBf4QsLsPfzuYgzB
	8aVLEvrrhMVTzl+oLy3+nfFH1qDChh6YMsIKi1gEKn9Yfuc0rDJpI8IcMJqyT/00EWOhVEVYu5C
	rYOncbEo6ur1aARNPvcYAI4AHehzZ6m8jGHU9VMnP1ZXd0IJII33EMhu+mS20wqxUiWEtbIaEZx
	kASeFHTuOYI12RUat6ipDqIeMmttZnRDwDXH8Tx/zdypwOqbNSA76qK82I5jOyll5cgaTFI7deo
	CbmmrICRSCqhOxw2wCBx6CfMsSjlQx6N5O6bbimhG57/NPaLcwdByninfIC7rkYGURt4RDFb6hq
	rLYoXuKtb6UnMWMiq8EOBb4ejPAou8gEdXSwnsymKnU+/XILD6RFHPn6PKZ/1EnmHYJRr/pbvwF
	YpbbCF2LyLeQQzpMkVdTf5avtZ6CZQWE8rYPuC90SkzAF5/pM+ILTyKA==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

