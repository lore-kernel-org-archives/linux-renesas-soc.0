Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046632;
	b=nYy4cNQNDVYvo53ZL83e2Z+TfGx/E4rxHhTDgGG60l+MDlcOeE5uk+bd/xOF+UAKclqR
	 KI8fnQAYMnSn+cM8yQRH+QIgU0cjIC5C4fHXHmor1i4bYdvOYf15oaDCSet1twh89cUfo
	 NMne4Sk2yn/pUcPqcQZMxN3YQHeaF9m3fv3Ag/qvFBWoF+3aCUu74cwYTzsrmJkYMP14C
	 r+zznYITWwnfezeorO8clE2fmZa1M6qxKKdGNb5Jef91NCZm5nyGvJ2coKDypSNzGRHht
	 kEontJGMHYZx2bcE+85jRdeHw0Li5X8qDfOR5w5qKG7d7IeThSLcYivoVMtuOx46cPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
	b=ikp/XKODfhk4lLv9XGMSadL57Vf7J5OX2mwsU48nGsCzfTnnjUlPvnmMfoz1Yld06NrG
	 8ls+Uj3yjBcC7ui7n02qCyk38MCDj6s9of6zXXCi000uoVCOGRv/s8gSBBLUB8ZNzSEoU
	 zUYiSQjg7ksJ+EZ7geNZLbyVU2uoKRjAjLdVV0kNbTzJ0vhTFCO2DSTAHrH20rZjg3R5b
	 4kLFdVkkdDSRC7621YYbKwjqGFB+j1/dO/XHK04XHxfdFQZ3Ihgdv7apdXzS9qui30Phb
	 zDbUtSNhVlRJoilGpdtgDlRFbzG0Das81gilGhhKns3phxuCrWEezNlJexILsUu/E9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0LgfEjO;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF24560A382A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF24560A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0LgfEjO
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-823b938464fso1112728a34.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046631; x=1794651431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=R0LgfEjOjvxttUR1bPYLTYVAkb1Fw62irx7OpW/yoP02O1+0EvX/m9oOqxtseooMW0
         n0GBG+lQbdA+j2vcSKDgDnkt0CLti++IuuCHFAkgRuBYEVPOi2gxsKUbCjHGUC67RjCW
         eIad64+hn/ss/2mtEbFxlzHYjR8EIDrne8AERy9ogwJNwJySvufAMsDPIItHd8Wx1pQE
         uh3uugifRKiEua2l+Zzgu7iLqJj0FqPv3k/tD7R0IurT0iVrZk5jH2vpbPQPG7kGtmDw
         uhno24UlqSsR0UYvQ3115JSpdYl0RKvYHlP5IHxG2JPJxA3K+WmRGj/aT/oGC8M6sZUJ
         Cw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046631; x=1794651431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iwOTpIttsaycTFK1wtXCtnMrK/5VOfeeqeikxO8lVo=;
        b=tb7BU9Q9Z6hBt0PEu0Kw6GiMWVu7vpAj3Urve/T5XlsdDorYFVz1RJVSWTsqRUta6W
         JL20QggS9khMfp/JrdpXH+9tMrbnl/xKWVq334mZ/DlSxKAYXZe6b7JjhzAzmL08JheV
         nV3ZteSEEeUg3oZU3J2V1c4cbGa7MFf1wsEpv9zrluUURY7EbXfUTypBV8xvtMVSTTl3
         7T8/C/JAGySfdQdXSdCZeVQmy+F34UcvYWZxXtI3YE8j4Ex1Ud3kt4dAUX0myqqhc1hX
         igHOXlLj1yKz2HHgHtujjI+Uvow0SBV6AFhLreB6Rj4+4RWqxk5Nev18n5fYaZRLgcgv
         KqHg==
X-Forwarded-Encrypted: i=1; AKwUvBxi1u8DqZezsveHIspmRvuAQ0UWcfHjPxX16AJiIETZEqTZA+8GeEcZE7W3h7hVvf+veT2ORpE0xq/zeV1USS6Acw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pXaD0xosQADPIF/rnsKO3klm8pUHgNGQ1GNzETxggNJdplcHD
	laE+C1J/ivQ8QsvsfObz6t0cyyrAhxw6IaXj8D72cgNfkenxHBm3GkK8
X-Gm-Gg: AYBFou1bUX546gntTZMCZM5xe1aqDNjaHp2LI64po+r3FwAvET/SMH8Q66EpWqfc+cV
	mitpCpw/RKdxloCDW4l6o7LnDLRHbCLDY/pGaWNtZebSUgAeTd/dDZYCT8hsqtZX3SXjbWNL7El
	VHdrkt8l51jH/yf0ToccID12H6plXKYyHA8Im9iunORDhlOfZR87K5iXjEZANMqk7GMe+T1gQkj
	GVRbMdWN9QKaVV+OZ3kZOjLPN8J6GiDrJXRas66qDuyOxMa6Z3SKRjhBt1Rcd1Rzy3JJCxa3LOK
	OUCNORfpZLvUMa2vFzu2vM4nUZCUKEDMu0zYREz05GNG8mXHfHMDzFHEehGCt3h/we/ls2yR6Oi
	wWr25f1pkiJ6prj8bzNAooNq7Up+NVvDIxjdWMbZkuoqzCy1QWlkAe77hxqWBRBq4dGrr7RmJeF
	hZsWFEAuGtMktqruic9Qm+WTlnfH+EHGo79NqEF0idZXmvtH5LPtwKkloI/f6VMdFFkI3N7SW2q
	7bJRECiXxjX1dhiGLm4LsJaFEgpwADm9HNfMxl7Sp4YULP666m8MYvww8NjuWTSZ2Y0l+TZTbzP
	+tVJN/8TXcvGMlLA8bWpqxTMJBZmWVV6b/rzS9ttvv5yntiLZ55QsgdxGHIMy5VoRgLp29ctG0N
	aImL/oxKmhUErfu1587dzAzfGbgyIIpDZE4ffSgHerhg+oefMkcDLBp9HTIctgU9c4r+cHjVeJb
	Lmj/xB2Z0JSy+80KZ4n6UHyKo8bKlLNa6Aed4cpLg3AdGFO4ujj4e6
X-Received: by 2002:a05:6830:82f6:b0:844:ce0e:e43 with SMTP id 46e09a7af769-85f1d0da35dmr4740933a34.29.1794046630781;
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:13 -0700
Subject: [PATCH 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-16-0181ef0cc4c8@gmail.com>
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

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0

