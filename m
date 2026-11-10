Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296701;
	b=SKMDS0uIj0HKBDTpGXTj7mRw35U5cLwii2nIqYoR7JX0jLxwjYL6YpBMZ1MhZ8k3Cbot
	 VQesysws/MchXbVO+KInb98XDWytAJmV88fNHISlwFQJMXAwkndrAAghnSiDa3Mxk7ceA
	 rP4PIUMzZKNIGbdAyINrgx7cPdwyOs22uOwHE9fOkPOS6s5/taIkoPkTLxf1QCmUrfs1z
	 fuAjnUqLGDVp/fVHu3MlVDUv0qCGzgkIHB1ZHxj6HhbURFTYhqEAF+aQ8fKEYg6ACEClc
	 FtSny0YJvCPMcuP7TdbYDu2OvctqRLH9rWCte5jpnk3yP9XFwKMEcqaWD17R+9jkscg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
	b=3UW+1ZmVxbKU90KqGpSBQa8HWvohvFnO/DOPdp1htKHQj6VTa3mlG4DCVp0+a9QeklGy
	 8iSrmmaamrBW5fkPNBXlMcg2Q4Snl9WJPdcLStEUgkHeoSJ2CdiRw0/w1tyAtRZRVAqW+
	 v8zqHyY9P7ua2y0eUFtqTwceSsBavhHih9Twhw2VbkDkj83agjTAQlE2Ec0bEoq131VsK
	 A3Dgjsym1IFXUuBpjdcIj8ek8h4r5KfG36Rp6vDIhRzFyXXwBmuykqCKIGEqoNm8bipT+
	 IXS5RdIsfyPOiH+DOhGX7p8PDhqITPHFsUTVcZiE1UBm6BvbPhHR+bfihUcDUHXDHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2CB9Pdi;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24F60A2603
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 07:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC24F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2CB9Pdi
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53ec92375d2so658833b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296700; x=1794901500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=b2CB9Pdi2KGdYd3XTwHCIhue90S8Rl0qIGulashxnwX7x5aaHQnN8Fw6Bvv12qDcRW
         1SG2fnaCPUNjywRvlLGyrGqFosCigIia1pymGokvRh/s5pH4aQRgJnZKKQrVWWNB+7Zo
         13t24kDwqT/bq+GbU4/xLDTnJohKcehOelvtJ67Wt0AsaNuK2NbSXGc2oSeDQULndhLA
         s6Kor1OaB6+WIzS4jPykCWjrj6PgW+ILtYw6BkkQUycyQSWB1CliQIzwOsXUr0ECPdn7
         LBDIHYlKyTLwOLeIMqxR2MtFoo3BMZwNvTgyvO+VXRLS95ZVocAIv6mYbZwZyC9PaEu0
         3Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296700; x=1794901500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4p84d6kmQsbShYbyTJT0Wg4TRDkWtUX1VnhI2g77QM=;
        b=s7v2ORE6b7qOoxgqZtIeEMj7Gm9p5/AFK8FCsqlAMIR2Y+/AqVP2dnhggrqvcUwCZy
         IiiqmpolA5c3y1ZLiW02DJM8Idi8BG1b08dR6lFwUF5MvnSU3kqUfbmo9bZZt2lAsGkZ
         f9xiMUvueZ3KK8svZxuTQpN0Uc05E5Nfr4Vb4KC0Lw+j4JH5KniQCWq7CYSuFZOSvrhO
         Soq/9PtuXZVy1Zw3JRW5PmKbG+0WvV9iYwRhIFjO0vkCE7gzchQNsuU+Y0q4o7qXK26s
         5JY4eQ3AWHDmsXKEeNLcORgihPOZIMD4zhkXD+xKsCEf7i9MBVM/eOujssu/0F/hMhsC
         aiqg==
X-Forwarded-Encrypted: i=1; AL+hErGlFy7+tysGtfMQmC9XMc5Rr22bKIEmv3tZmwOHbJWFhqrcdxrBj2qQtC3iT++S6b6Sl+Yzhqhlv2H49EH51pA2kw==@vger.kernel.org
X-Gm-Message-State: APuU4Z85uFocNdKSBO7F2NVk45LX+nnEuD/I/UMrmpcw+M11DIiExlPT
	5HFYmNAltkuiyk+SCoh/BevODtpYHD4I26qiz3drfVWkC1h1GZ9Y91N9
X-Gm-Gg: AYBFou2iigTK3ubDZVA2UZsOMqCI/FXuvxcXyUWQ5m1Thot9q5KBpuubyUL2MGfVmVU
	izjreY4I19sP0whPaUeiflPNuv7yCMLyeTJxX0hyw3KAmfnL5FCGeqNpWCM6sBa0lB1l9H/+E+c
	2zWawKw0uJc+zZfISKTSuU4Q8YxVf2TYKzaNif9m2d+tVf9Avtfy+Z/joLg3i3bhjRoz6JkmCZi
	11BgGSLuV84O7SrkdAPhCrlHqLnO3BzaRI33g4TkGhEihQ0lJdwpEEUumLHPI5JTeFZej76XQyh
	l8Qgapv8IRY1ozBQ0AFbO7L8W0et+aDbJvTy9aTcbMGepp2T9g5/hXQSu3cRjKdLOQdB5naptRq
	/z9d9MfEpfbE/Zw9k3a/UXOAM7KaG/kgMuVBwTFdOVu9Us+Cjbvq9SQC4EK5sFFf0vKHnwYyF69
	9wWeTa3+J2xCmElv8MXzsqkXy9mqMvMUqGz6sYJYWM/bQiSbW2zgoM5h5WLje7fyYb3QuZxq/FH
	7F9OnI/i4LFUMC+r6FdSM3NsFu74RUDFhqzIm8c59jeW8A+DWlz0ia2X2BFqGriRigQvrRxA/nl
	4H31l9X1jLhj0YkG5O4sz2jRPL0tZQmUVHnCEjOfCiCYHQedG4CZ+LJOOh15IlZbZ8pdAC+dEaX
	g11OVaSF4i9Zo9uuObKJZkP2QfYwWkZisr2gz9QeHIjVDHtyLs0I2jA18gc8y8k0i+hlyrHmGVC
	L9BufEMVdGTNoIMb+vlgZG+bZjDyfSb407WdfJ0kJE4XBr5dNchiM=
X-Received: by 2002:a05:6808:670b:b0:4d6:9283:1df2 with SMTP id 5614622812f47-5683cdd6dd5mr1430636b6e.61.1794296699815;
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:39 -0700
Subject: [PATCH v2 36/58] mtd: rawnand: renesas: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-36-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 45 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 201dd62b9990..a8d9e701d7d7 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1201,6 +1201,11 @@ static int rnandc_alloc_dma_buf(struct rnandc *rnandc,
 	return 0;
 }
 
+static void rnandc_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rnand_chip, chip));
+}
+
 static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 {
 	struct rnand_chip *rnand;
@@ -1217,8 +1222,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1233,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
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
@@ -1257,23 +1263,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->dev.parent = rnandc->dev;
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
 
+	ret = nand_set_release(chip, rnandc_chip_release);
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
@@ -1282,7 +1294,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1309,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1316,18 +1330,25 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 	return 0;
 }
 
+static void rnandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rnandc, controller));
+}
+
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc_release);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

