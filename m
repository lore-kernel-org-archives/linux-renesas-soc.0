Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082379;
	b=lkKo+VL/3gLg48JeMwzv4gQB65+ji7sGoXjDMO7AUn862t3MN+Aan4cPOtm2Ikd179q2
	 GUfocSvKyJ4kakxxUN5R7UQDMuRasmb6ZlmVxAvb+k4gNWzQt9FH3tilgz/pBetpAhHJd
	 4XF0q6fTYAIwXnxXp3v0db6EPIYE4gi5/VQKagiW4TSmTiJ7NthMG4pqM0zzfOblId4EJ
	 U5MG5zyk9DvMT4ITEdsc+SkSPvyE7LwYH8xTxep+qpJsMshqdygTHddKh+/blctSXHaK/
	 CZvIEZg/l4PNOx7zFYPebtxuNF2IhLNHk9CRMmu6Q1c6MpoCE70hOXo0VFaOi8uG1oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITiDeBlYByumad4I/LuK3iRUkjJJZT9G1thTcrVXBwo=;
	b=D89OARvga9whFDd9ieumqhPoCYNI4ZkCbBY9sRBi6OMeXdqGVG6exKfy5N6VVsftZn2l
	 ynm5VcTfTjsYaagbDHPvk+Bj/9wTJvay/bN9fS47pAWZ/i+ZOshkxZaGps7g1TuCSLKrX
	 LnzNl7H9jucFe6Aculv0Z1x1keADwwIOOS/qvIL2gtu72VNiQOtMYLFbYWwwSbOSURWqP
	 nVRgzMtPcSMYHdigWqUPGh4YSkuBTOnUTCHZFtKN/XJ2JdP/XnFo5sf+g/lQT/2WhjAOC
	 9lnS21+YWRO6XG8vs9/ao2fJGgBvDtVCBa2zNcOJprf10to5txQeyMFOyL0CbShDEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501B606D801
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2501B606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-499f20c7054so7580fac.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082378; x=1794687178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITiDeBlYByumad4I/LuK3iRUkjJJZT9G1thTcrVXBwo=;
        b=zpZx36tQYHIINfetin4GsyrW+K7p3oSljSvsw0GdX6EXLJx/ubJVSVSS6u6x4bi2+L
         SbHcHBLbxoKcqfO28mHWUQ0+lzF/3dspO9ettFGe1ohtvuEFICUnQ60jWYvensqCpJVy
         RNh3d/OngJs1R9uRR+e28fI7DpXpktcbSMvuwx/STGoqaJzbK4qUFvB1JgdMDZiXrPRO
         t88hl/jcvXw60taKs5Shn6xuFnq6SU/LcPWAO5kiLhko7+gd33Wvkh6VwQ6y68zNhI0R
         1CtZngpyg5LWhn6KQkqcRHTz7HLGtlKM6wYgU+bI971arNKt9plV86UfLSVIAmQq/rAi
         47jA==
X-Forwarded-Encrypted: i=1; AL+hErGtsQSvkJ4k0FFrinqmkrp4FDRDaQe+99V8hWQzrinSAbLqftjcytti7k+DwE3aMdhBxpPR/jdefXW8nT8AnMSzkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RMj3ncoKzF7zCbFRu6+Lr/inE40v1E2kknB4GlRTkFhkq/4wL
	Cgkm2jw2XbEodKU3Icln1T4U8d+EFSWvRIzGbmpl80XlCAp3AIAwl9JFC44BJEI70BU=
X-Gm-Gg: AYBFou1lJFufHYr6sRN3bIh5Yuemq9E9wGcLqVM0N2Xy6PR1YbLl+mUEWukZ6LMyeL6
	e2Oo+o5tlcgzHTcARTTuWT1l+6UO87Z9hF3UN5igSBasFL2eIJwE3TNNG3tA0hs0G8PVEQYFbG3
	zk1DdlCTnpmhQzrdjPRgoqMwynTXCR6gmPi/c0JJufa6EycaSscBsMma6mCK86qFHZn9xnof0EH
	h0kAe2um/1MUA84IZdAq9mcqlyAnQBzxIymHvbSx+UyfSOtX812jR1/NJV5DLWrdOC1PmXi+Cgq
	rzEKXf3iGAuQXVk1m+Q0XSWdkrr3rglNebpZz2Q8AUDgoYbfwA4H81cfVLvf7PfOWGBUI2u59w2
	eFakgybf0k5W9DdGz5bHtAZuh3UilrlTZ7mcC4eo+fz51iuKsgYWLFBWJPY8eLQVFY3LIB1dLTd
	QeX+aE9ZQmVJmbLM8D5VkiPoGeQBhhb0Gl51It1NWlR5QX5UVJ8gjuR6n6+dbSZLbQAwN1Vdwcg
	57iAuk1UB4MSV0ZLa8EJTAHD7U8wKOooPUWGGk1fQTz/IZ6x43MkDP3YRcmJIJkwO2VbFoeFYL3
	mzhYmkdKrcorROZwrCUokYwk2iezmBteLzlEmBVv3pkkJFCvxKXAXsnx+4ei
X-Received: by 2002:a05:6871:7426:b0:456:5d8b:5681 with SMTP id 586e51a60fabf-4ad9869f851mr4516599fac.1.1794082377926;
        Sat, 07 Nov 2026 12:12:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:26 -0700
Subject: [PATCH 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-29-0181ef0cc4c8@gmail.com>
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

Unlink each chip before dropping its initial lifetime reference.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 44 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index f659d3a6b9ef..90bdf2635a44 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -849,6 +849,11 @@ static const struct nand_controller_ops ma35_nfc_ops = {
 	.exec_op = ma35_nfc_exec_op,
 };
 
+static void ma35_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct ma35_nand_chip, chip));
+}
+
 static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 			       struct device_node *np)
 {
@@ -866,8 +871,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +880,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -905,17 +911,27 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ma35_nand_chip_release);
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
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +944,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -948,16 +965,23 @@ static int ma35_nand_chips_init(struct device *dev, struct ma35_nand_info *nand)
 	return 0;
 }
 
+static void ma35_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ma35_nand_info, controller));
+}
+
 static int ma35_nand_probe(struct platform_device *pdev)
 {
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, ma35_nand_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

