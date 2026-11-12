Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446954;
	b=O8t/eEL79t9WHvgTLk1BdZIZ6N+w3xb0+UtTowVxbU0PCZRKl8HYsPmeEs05h1X14UQQ
	 i23LeABJBdJ9Ql/A5c05+G3i21rL/cavULMoMImaYmqBUPTlGZY8wdNBoa+xsvAQZEJdv
	 JUf0ipxFRusvuuobCsD82zS2tX+JME+ndh/335ZyY0hPfp2x1f9KhCackKjfr+wrPYAWr
	 u0jaUNOFwwzUjT+mE8jTSRXGvz/2R2LaTOrBj3tycduUKFFThrw8p7tWIwWuJQOK1HvSz
	 XFnicHXItqjRf76jlARCjbnqt9b4/VPOxwXDeMqEUz9sDfd0e6AVCZbQQi23acVRAsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
	b=Z5CdxTEmNR4expW8VjY/sAuCrMjptIESKwj2Hw988YG+iiljIU5tQQ0H2aX2lsBqu62P
	 mGGmtfNaQR2A7C7o6w9xvUmPwuH82wbsR1cSpDQIfbO4h1+KV0YJJfg2xHsggTK57LUOK
	 DRBxQ3cHOXNSsnkRqkkpf21jhZ1D8YNbcaSm6RyFOFlwr1v5s3NmGjtEs6QCynCpLyXTe
	 R6idFLMg0tr2Q95zfX4PV00Gh+rZBL3UzyxNAAsarh63B93t/omH3Ti7uXb0NdgPSKeqO
	 ItCGaxFZfrjNVZwAjRC+JLccPlusGogUSvosLOIfhi9HPY4i8RbTmx0cRNgW5yl7OgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkiht4um;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCC606AD6D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 01:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCCC606AD6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkiht4um
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2359722b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 17:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446953; x=1795051753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=hkiht4umLB4CyC2Aj57xJZ2myG5WafS1doKajb7jXHKkJVgFb99TKREjnxIa9o7y1y
         tC3NUJlyguKsoXdAZ7NZnVNxHgHARAeCxiYeL47ft+Zg8bsmmR77w2NPIL83U69PkHJb
         jyT+1psknnMvScEl2HfU7hr/lEAOvEoocjcSTqFLqDl0AwJWQXvwG6+GKoL9xjTFnxQY
         ONZp4nbUdQL7j5AzgSpAABbF+FPY4dHS2w05J4kTzlvXKKOBgIVT7UY4Y4TbFIo/Imm2
         lfrFbEXz35XUIh2dbj7M6ZSZv0RgES/7nD8lcgaxJU+sYJrTJ3CxwklXeDP8+AFz7Fmb
         +HYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446953; x=1795051753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=iM3cZtGZf/kk0NbWAeVWnUm3l0jU97E7+Dnp7flz9OZ9ahXqHbtUVYsYiSenRStYlS
         MSWsahZzNoqWc0E6mqdHzfyYQwnA9Q9xYtgRdVthMlFoEHxZLUzhRIrrXpHncNjibwLQ
         J4klK7Z0tQA2w1QJhhNPUPgKAK5aqvahikKJdgcsYKYzPWXR6kul5c6LXY3firLLtYWy
         81PyyZPD3qcHeCGMs9/5kSxbGJIEzTiTd4ykVyj+wKAUH1HMpjVq2hDedtq6xImisbbR
         21jq8PQLeYdoPrZwMronmbmAlNLbFgMKQlTTML/GFbkF6fh7M89FZWeSP2+LI5ZGHCaR
         83QQ==
X-Forwarded-Encrypted: i=1; AL+hErE1fQNMxEMQUCTbhKyZLGGrv0HkZ5/EO3z+EpOBoQfiM+0E4pZ8QPCsZ5+wuEiTqrkw3+LV/Xw5bfDsYYee1SMYIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yk6tvjhNdCVa7KyRaqULW+0TyBESye/oUAGcRPToCejspMIuB
	/n6JSP5nWlfU8yEOnbD7mqIXfJudRtVCZ/LfOgDzEHaEwkQ2u4OptTBS
X-Gm-Gg: AYBFou3tT8IeT/J+U00f07lmHZNm+Ek+zAQtIOCOllXqZjDCmIpzo0DkMUp99Dhwgrc
	xrSLM6bpbpJiZIWhVfjEag3/7W7NoDEL1kE1fTikCfHxI19yQ9JCgHXKTdbeIN9d9+euzApw2vh
	8ej/rnWH2uFQaDg9V0F+eEV/CrTsfIouOvjqcjK/4uNs1Cm/FVgGNiPvDuXfIy27C/tICy96Q/I
	4IubMCWESqcgWzdbNBxtapNGD7RREWdEzgRu//p28r6j6ylDjbKue6t4wDVM3ByIu6QRhFc2pep
	gM0LrOq20d6wx+yybtbuwAz99UIImpt5r+yX58+PiYrJtDSl8FeoIIW3BXPc6Nwf5W1Ih13bejA
	ccwoGBiLoRjkt/YrHxtFYOw+2XPSzr4nbmKfhnkiNdUzUPvBU7yzhLAry+Ri76nGPt5aBZQMkDx
	klvhbZfl7oIZc2bVdgaeNCQNUAqnwLZoo/xcd9ti/BOQQOmuaVVUGEi3FHdMnnLACxOf/yxwwyI
	WTsVM/AJzj7NviahOEEjYk0dc4KrMjinFxG09BiJK9pQgej72jkOXGKCeBglwDrhHwi9tVvKc/G
	U/WgDyQVv4tuRyIKoOqRvo4SfxP+LmcQlEknHUgBj6n6IFvA2ckTIHPG8DaCvK7d+A/VJfnuo1f
	GPnuVjxhefeehzyMePWLb34aJozuuSBBzCDqUPq9+m/trKzsIC/t5Riwd4LjZN0JfC+ruec8d/K
	ft4En9o2aVf0fTUGMfquAeqR1of3lAh1JYDNJh2jOBlNliqk2MKdgUvzSd++MPLTOjGCFuXY6I2
	g==
X-Received: by 2002:a05:6808:1246:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-56b961950cfmr3423531b6e.14.1794446948425;
        Wed, 11 Nov 2026 17:29:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:15 -0700
Subject: [PATCH v3 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-36-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

