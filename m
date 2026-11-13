Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593773;
	b=k8KYlw0aWq170FVmcAaHCkMucb1IJ1vEUV8P9zCNcnu/2O0Q5tX747oJtdV78btincGq
	 WQVm/94juPJOMNFK6Xvj/0e+W4/5ulMFeM+fsi2upux2eetGXBwIdugL5jXf5rySlfoSF
	 kJRGAUsS3TEksBdqJTuLe/aGLYaAbX72+GxBntI1jyndtI6j9msMLCx04W6+Nqs9L7wcw
	 /FI9YbsmEjbc2Lo/I+Se3CxZBZ58XTZq2ksz9hxbNC73j/dWXwCC6rHyS9CYHttu84n8u
	 qE/uUXPsdelDObfNDtydKpDCprikB1Oh4dMsc13lCRLIlPrFskouOOSOgaWFr5o04fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
	b=Cc5Vh1dgAv0uBXul2Uc8W7H8Sdh6LDzpLZ84GBybIRKR5Zi0/CFdfvriYZHnMGLhRAGx
	 f+QAk+OvB5H05Rmu6hYgkoQ66UjwW+Hrk9yYHDfZ4QB0bA2x1fpp8Ar3J9DYUxXH5tNX5
	 f4BHkGs8hiUkjCT2/XgcFOtwaVRo7/Ix5z7CQGbBZK2+vQOJfjFsIIbtfRe52rIFg9zRT
	 olifduDPTjBp95MCkTXcxyIVlK1bajrRNYBPkGsyvegUTN0FZWl4gSWvNo+qUtCTGOwAn
	 5SWP2BVcNLvGDVuKI0qosCiS93GaoGYQ03YVVuieJIMEs5j8PzwvtpBt/oi0Ghn78ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j1/9ewcD";
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE7606B21F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 18:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECE7606B21F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1/9ewcD
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8241a56cd70so1487059a34.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593773; x=1795198573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=j1/9ewcDwV4PgRumsbyVzaUAtn7p2u4jx7Utu+V/bsMTCiyEoR25jsPjZnlGkkF1Gg
         V26YbWnz96whgiESQe6KKoZgf0fScL45BZRkUPpjBnY0Cs63yWowets/TqP0cxxtbtUZ
         PB4ZTXQhuRntoKzIFQoPFqb80AfxOUKBbauSQJtCBWDvs90f0h7Jq98wpgCQ3wNutQW1
         SAeEChYgyrprAN7MZnrQGp6OIFNzt89mM+Y0GbUfxYEc1Tbfbw+2Kg0iEDEOQAbatZf9
         WxhxhMf3k5qKd4CS/kd+ruHCmwt5qirAqk/NLLLKVfNUEGklel1l9fptfwtuwL2MUNdl
         z2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593773; x=1795198573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=CAuHiXIzKzoVt1i91weXUDLeDznvO8g2Vf2e48ixYe/9z4EAhClynEPq3mzl04Z9ab
         yHtJYyxOgF//bsT/iUeqBl68tBuleo13k197Lpllk5CAhrntm3bgsY+Y49hWVwOPmNqJ
         Xnxh42eNjVcaiRG81Qbasosq10Fs0lfxi85450Gilr5dYbKInOBrQuKvp0pGMlJueJri
         3mZ0o4G00AGNHD3TZFHZvt3zRvDUMjsr95Y+Oua+r+NOM9Ao4N524P0wpaWp/8kAfdOd
         CHNeEovIHG40g6NFt4BI6TuID+hB70Ndun/VRe+RFI4/ynBngOSkEsFOT09zhR4TNbN5
         tDCQ==
X-Forwarded-Encrypted: i=1; AL+hErEan9gfMxCpO9NlOhe3P1n7VXmGx+kFTmo79GI+lHtcxEv20VfefrOT7QXoD478qUyUGNw0athoyeNyWsRMlRMITA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5iVvVw+lmxITWD/S2fv7uDVYNfJQsIuCCxvXuqQSYYGhYW1kN
	EA4ioT/y9CCLbdbl/dwnZDGciwtMc0+LoL+2htOCEOcq2s9wK8locoXd
X-Gm-Gg: AYBFou3GM2HWa3S6KcYY8svByLzA3jWUE3//9nWDpBwWIanwxbiTOQjjb/vjxjaS5rj
	5+EYk6j4GUBQAknxcicdm8Mg5IFOI8EvsiKhCsi3D1yUazunl3Fs82CdoA57ZA8mVw+ePz40CfK
	hvYunWtp1X/PcU7+LaJ6qQGL+xqZJhxaoGkkOO5Q3HUm8Z/b39NzhqeJzMtd9Z9zY5lggzTM+1q
	ctPMNg/hO3l4+lfD53D2PISri8xuNeZO2efWY2gVdcKmMaQu4ey1qSCA1nPyNPqtHXfseCwp5BK
	Mk84cqoGLKjcSfJmNjGSJC0b4aUrNcgHR9KkZLElGWL+t8oic5L2U73uoHJJkIq93hTsI/o2XfJ
	gjrFlKL0XVm49aIuc5UHxZZ2+GaXZbcRFiJLvS8EnphUjOn1nVrTISDFwIUqsHYqw3T646vTcpE
	v1WBMNlqGbm4WKoI75db9CBLKAxxq/yURBzjAhAMz/4zrCK5NdGdnwIulmSlrad8LJxq0NVxXS1
	mGw1/KU87qsFIY/7nwh22lbtwYqqFuvTHVTYT6DakHLmhZh89X79ngSDFlViYPRCevjXDtazqRG
	uvsYngweabsort5U82P26IgzOF9EtfKU/6Yf3HiezEHYBqklbgav+twL/uzdfcIjqF2gPPYbpFK
	vQdRiWwyfut4iNNCPBzztSZry2AM6hf537jiDNQxqDuAbtUrMJRv0n3QqvVEcwDsH2IWIBcUwE5
	xvbXeN0UGpNmSmOdPXsYhRKjHndoPjhHis3mpYTFlxiN9i0jM5vOA=
X-Received: by 2002:a05:6830:310d:b0:7f6:5536:8b7f with SMTP id 46e09a7af769-8628982a042mr4014286a34.7.1794593772589;
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:52 -0700
Subject: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

