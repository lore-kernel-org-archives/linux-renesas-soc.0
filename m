Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082382;
	b=cGb48FszPmZwtka6UZZnPt69jKbIuBFgDMlrH++8pGm0DlVCpPNlnUQsyklPzGgDGwuw
	 W/cBmkVwkNUfV0g+WSAqV0wh+vAx5HtF8grTesI2QRJcKqTzYV22onQn9G9o9LeRTaHGe
	 D4By+2a+vlA3sDqLP/c0wG0tGAS4TyqHxwSTGDQdsiFNkwvW+lZBiDoiAMGHgnGFNWCnE
	 tNpTiPUf6HdVM6Y2pNBA6R8+13GsDjm9YELAQbuGEUmAwVYuMt/11O+58e93x2o2Pz/a6
	 Hdwz00Mgs/12Q0zVkKP68ew60nsLVb8lC8DqsElcYlobyY+ke6kt8atdyFJmgiDUnGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082382;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=q10HEz8kiYMrWgvOwqfdg5IG6VH+ZxR/JVM/7JXlHp0=;
	b=4cgiLi8en8wq8C6CZ47RFPbXb/JwIpp7YsH8qZbl+D4v5NM+95PV60fEC2HKgIaoaWiC
	 KvWd6ZUn8mR0bZlX6p4Wg1zMkIr/MRBkGZQB8v4qatxp0ZOSGNE1YiBUb7OqJ2GvXmCS0
	 l5Pns9Oj3oqg9pXEhOIJniZx2RVHOeJOcBdM9tfXkWwgETXuH2W8bLsDUSHzSGpYUC823
	 70+/0vKASPuov9NO5HkGn/J7RHcSE5zdadbaPPStMIlZSVCzc+NCjrZLM+kBRRcK4gQMj
	 37tWS4SD9XwnK6sPf4FnZoQzEWQpipAZHsF2J8hr0ZYuf8N9gnlthW0B/J4rj9OD/cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2991606A339
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2991606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-483d290f398so3955fac.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082381; x=1794687181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q10HEz8kiYMrWgvOwqfdg5IG6VH+ZxR/JVM/7JXlHp0=;
        b=0H/1S2Iq2++fVkZfOSi1bp/PKRRFEu0IaO/5z/3v3dVbj98lQ5J+G13KPXaPmF/1/E
         yYUKEaqOA86aZKz8Ov7hkHaFifNKr3hbXI+v/IPg8eXTh0PQ2RC77+twuLyRY3zRUYFF
         mDmf4aTFhOQgNetN1tYQu1OEYvQ9PBWTdOKZIQqAVgPOrwy/Xl1KzXGJ3P4jicjRySAT
         G6mFhmClBMJfBiJYbVwteXKEJaw2JUOdEtUV7Zv7G5xXlOco/6cNGCQu36ScC3CuC0+f
         Hu47GE/aE2JsIBfENjKWDSjIAX7pjEi19Xgamv/gi6nDiq2PdwPcJLBRb5WVnWhSseZR
         G+Vw==
X-Forwarded-Encrypted: i=1; AKwUvByMGc6Vn4C8yI8RXKfGA0Z1b5LNRjMqPldUdJ/dRV5GoU/aPkUrxJ3Rm89ejHXOso5KvXiayfLzy4AMHMYD+9earg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pBT2T3YJ/bWSHeBMlq22FmXor+K6cRC1+XzUsDPvbiEgnI8dk
	RD9lEXZ9v/hzndYYW8c/mxpNOKEmAkVfwjE3tAYlznTHkD/Pwe3QW6AFVTdEB/azF3Q=
X-Gm-Gg: AYBFou1VIYjb2LivS2bhiWOb7O6/+xJkPzu2qpufBU5rEnZkzKSbm3LF7ACvNEYZCq/
	x0nbxMxSzXJFg1l6xk20tsi6+DdlvogT998SBJDwAM7TIjfyfJsewU5y/WEYgvAxV73XLRQNodO
	07CsjUQP8lBGJ7WMtfMpNZHsGcD56P80lwucynmGkBc6hdPldqorXk2E6HiHCNlOCkuQS08ER0X
	V6GQs6VBl3saikw10L7L8kxPi+iu8s6bZebOOpFrVY+OCxF19VIVvA1Nl6Q+Oi3qDa/dE0KedXz
	Tr30xw0597mD0pMSYpln3Lc4T4YiElU7gG+Ar3Mgf9Ume6sFLWHDAdl50tGxEiF9aYg7KtJd7IL
	UrbBDPyreUXSt/GdEblNN5bzeFaJBo1mLacszXg/yG4HRK6NjAi1QyODDGIEUj745n3NK8d0kov
	Y+P1/5gwZar4OyUUyPAuiLjld1hX4XFlL7f5hkq9FM9ELfnIeOdNftpzHUOzqa22rvafh//pdeX
	7J9gRhlz2fLObefavx1/ZFUxxq+023R8Dxa2pbQUONe3hBzkj6SztXgRiNvwa4JjgUE07YITfAY
	uE5QkhoNc22grYRlXJMeRprw/W/AWPvX43lRxGROIMapD2KLv0/AM9Up7SNX
X-Received: by 2002:a05:6808:4f67:b0:4f5:cb60:33c5 with SMTP id 5614622812f47-567e098c179mr5133579b6e.6.1794082380862;
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:27 -0700
Subject: [PATCH 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-30-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 26b61d856143..952fe5dcc84d 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1049,6 +1049,11 @@ static int pl35x_nand_reset_state(struct pl35x_nandc *nfc)
 	return 0;
 }
 
+static void pl35x_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct pl35x_nand, chip));
+}
+
 static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 				struct device_node *np)
 {
@@ -1057,22 +1062,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1096,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, pl35x_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1136,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1146,6 +1165,11 @@ static int pl35x_nand_chips_init(struct pl35x_nandc *nfc)
 	return ret;
 }
 
+static void pl35x_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pl35x_nandc, controller));
+}
+
 static int pl35x_nand_probe(struct platform_device *pdev)
 {
 	struct device *smc_dev = pdev->dev.parent;
@@ -1153,12 +1177,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, pl35x_nand_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

