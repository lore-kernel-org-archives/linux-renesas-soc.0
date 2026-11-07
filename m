Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082423;
	b=AQv6JGft4NRvyj3KpooHQJZ3v8zsbmFeOFJ1Weew/QKJLACi+igzAxQXZyKsWWTIPjxW
	 QNrSbZTNKSz/dOXYRQVmZtoKdamaChKx/QJ5E4lvlsD716V46HcP3F0AMwXvIVSmOH9UO
	 8Ie5Wt9y1c4Nl/CTU50cCsXc1rjYSNgBypfuDnU9TJiniaAug/vSJdR2L36xzd+zQdXpT
	 /xp6ODBsnRGg1rPfHmgWzWlXTdEc8Jpr2a6d8Fzdihi2EwMdaORju9b9vgsXStU5gklaJ
	 NKa2tQUMgdWXk2Zx+wnoBjB3rtu+855BVlrHBeE6kYmnx/JK0uJU0udhd4BddK8reKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082423;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
	b=pEx3hymHkEMxgp6+aiQL6Kv3D5SZxBxD80/Dc/PWepMpELeq2wkgHPhHfxluH3MEE+yn
	 MO52HUGAoiR9ibfL/W4mVfeTQ0XbDkoF1BGhtyMT6F/oe0CNzT3oqFNJHMuCmsVd2/HgB
	 Ginow7IyzptR4qJlUB54Axz2IHw0V6KTiX3AKebXUZL2dgpF0QT6777grCz2z4aDLitDz
	 LSMgjGOVaPfkCLKFTHSqOL9kzCo2t3abpur2A8d/SY/VScwkIf40grpLHukynzQ8zjKxB
	 Qv0Tm83Es+AceIJ92DXt30W1elidDasX3t1encU6p/HDSssRUHIHLAfw0JVxyFRwpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAE606D80E
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FAE606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-823b938464fso1326445a34.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082423; x=1794687223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=CvZBfvoBeHCz6mdGX1d46hkdLoIcvu8b1iD7UM4bW7gO5XENl8wXQZ7HqMc1QvXc+o
         UHKUdWAOFNdoMWvWVNN/fot3Co2cpZNLzjxWKtOZqEdNOIK/XuZoVS5Ip+Cgyy1EedRs
         VyX9p4ofldT88uhbzYfGbq75ouLbJSNOdjQDiaf24eQscW2pYzH+3OJRUgvP7/NW7aWy
         kxBoWRnQ/oBv8esYFQX1LNEnbTdeCSETi0hq7T/K/8INLlu4SpaZBR27xOVft7EKB4i7
         yr+N4/Y+N6kO2VF6TrhZlfdtw69dTd/wDijmX7XoZRU++789y3oiQCPlDkq47FFp+/bi
         Jm3w==
X-Forwarded-Encrypted: i=1; AKwUvByBhyV7toAJ+Or83lTSZN+lssF4Zh2IgR/4vzwrL6/rf1yb3tWEt7tT/sq/USbWOPlmlM06OUwesAoQgOXz0h+5/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kOLp4VMgrfC0nI9vCyJ8YmYQH370t+AXDmWO0/5Vf2POY6lhp
	LH5FqpM1fbT0kH9T+Z7Rbn9/E9MmVqpNlB3FBzlg4UH6lWLwRKIq4vZMlQYUNLRw2QE=
X-Gm-Gg: AYBFou3sWbmzMCV5DbIR05fxAi+kBhP5v464vKslLo/gQ8pmZtZzCLFaZp1LgHrxJhJ
	ap0FWh3wjIaKXfpz7DyhnbBAhguR5qto1l6YAhpEA6SpIC4rmSaocDWW/xGIGUxSE5ANOMRgqUN
	wFpDXt+jFM2j0aK0glcrzGzgU7NQm2ykL5i8tTMxSA3JxGQFfPXq0/v2QMQrUr7EKgwrsvSwNv8
	FUrgTbS1BJY/FuWNEN9ejGho6EsXs/oP2HwppVGMlLf8jt4pl5y5ATaSggQY9D2PUwUs5umBH+n
	mhnQNxg7GPwb4XH+kvQKvWfP9q3ar6EJCicKSBSXfWuOh3M5+YS8fNHU+/n9Q6qCBRLQz2N746h
	vi3eCrqax4aINL69nVWddGe72iYwxKhqU/5TLnVKLeBtX22fbr+hhi7bth3I8Ta8fuFvtjUUU8c
	W+pa75nLs5pjvaH6f4FLZ7ee/Y04SgWsyBBo84EIw4KzyVONYYcOAttvlqLL4XfVDOKazeT7vEA
	7WU3zS3WRp2Hh5VrrAplwTJTbZ7pU505X/gJhXLerAfwoX2b3Dau8mkVo985aSwy/XS7MI79++m
	ikFdsR97/Xt21TNw8Asu8bP8gln6WGrZxj2XNVfiVCK50IXXFf/xM1bCFOTZ
X-Received: by 2002:a05:6808:670d:b0:564:5fe0:dd60 with SMTP id 5614622812f47-567e0997194mr5082140b6e.9.1794082422526;
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:41 -0700
Subject: [PATCH 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-44-0181ef0cc4c8@gmail.com>
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Retain the chip and controller while MTD references remain, with final
NAND cleanup independent of the device-managed hardware resources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..2231e6a45114 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -895,6 +895,11 @@ static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.setup_interface = davinci_nand_setup_interface,
 };
 
+static void nand_davinci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct davinci_nand_info, controller));
+}
+
 static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
@@ -919,9 +924,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, nand_davinci_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +994,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +1002,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_release(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1033,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

