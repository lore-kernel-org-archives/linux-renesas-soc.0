Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046640;
	b=0WmIBzLt/hwqKx9fniT4+y/erEIgexbu1aCVJjHmTUvnlrlakhplo1+vTAliY6MUJajZ
	 JQmQ1CqqW8VG/evmopU0IzCPaQquUAOEj84BLzpHfDW2pFyblvHnNUBOpG+uN3AkaqNmR
	 DbuktgVPsocXQiG0HApz+mYbcMK6MLeU/gGJ8+1lLQxh2Fi1Mcy2DLmoColdq1yYN3o4g
	 v/VCXVJDItF/tjBaeMcecKBgpIveZBLJTq3g563AKQrtWWgqOEDbIvvyBpA+MQO8p6UtM
	 wLqlyPkMlzmoSuBYluXCGvgSK+0pv0sBvMFPC/5V3Q0Y6C4MW9x/h93qZl0oduRO93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
	b=sbAom1uedG2avo+9p42K5YK45n5uVCzEVZdBMSb0QdOB5cFZEteGsFkM6TQLmlBetYBd
	 B+CMhycEVfeaELYoWUs3/su7nn970xxdL0Tlrn+AGUgH4BCXVYOAl9j4uRPtIsvusAMD7
	 7XXDKFtW+w/Gg2Bp6AqDjXoLEreXl75QL/MComMGL5lkT9ZYZb2rc4G27fSswmnyIV0GW
	 Fxi7ZO/u5MeYsiRQ9LAwaFFIBTs+gx9IO8K224EOjaWTFsDU1198SqYoB0Ml+q0+geN/M
	 crgb0ZaMIEukSKbCpSRbcHKg9MWd/on/Urt1SCnruCfaA7rTMRFMlWpHe2RgdjYObqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D560A5BE9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9D560A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHUgbn86
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8253bc5a613so872378a34.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=yHUgbn86YqwQOiacZRyNmE3TVXyFkyf52wf/O92NFm1zTow3d+AyXnqY0kBJeOc1G+
         Mqqm7a1TeUjxxtja/U+7P2iWNyv8qfVOQ+5MhpVeB1MWUn1YhWkLJ75VQhX0oP4ZKmmG
         HpVOkjzToiDMSp21/T6J2W3tUI7a5IWD7+8riPB3ao0kFfp8br44JNVpwIpThD36x1qV
         Tu8oFiHQysf6s8JSKzCJy7K/y9z7JOM8nNzjbuHEoAmvCcXb/B6AjUpOOWjauTd6mWCo
         iWqOCBaWxoAHrN0VJXziRKXPl+bfyFJQbb3wRxMBezXITPUyyGNE9Hm6BiOmIybX/KE1
         D/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=ldhKHSTUGwrMxDfim76d2wgFLazv+RpPhwFjuH3d/7Q6tinnyGR6ItxBOOe4KzmcdN
         DqxD7TGmlalCnaDJ8QpJDcScuNvrluKg+jgt1StzDKElREuG99eEG1AzWQ5lYIVB+GfI
         Yca4Tcj5UgxGreC+GvJRqwxInfBN5/ZazGuJ17g9kHBAGZq6IbOuQhAbDNbPVWroh6gj
         KzrEgBiLPwTONjJr7NQpQUvbSwxHnQM7qPexQ8Q5ZrcaqE6Y6UQOG6vTn3LQ3Ni5hvCc
         4M5633jeQveli3RlO2rOKGIcwV1hHgOQICP7iV1kBm8g0Gp90OkicV7PA4Fw7n/t2CFC
         ZLsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmq/hRu0MvXfxwe7gq4hA1rwZBzoMIITnaY51lI+GWPdGQU+TsBgmXHHG+7ORojuWKIdU4qmar1VYtXk3Fmx/nkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+S3J/O7/13g/n48j3w6fLc8L9vVWGPFP2A5X7iETXM9kQIJ2tv
	nl+0LswQBMNVJ1Kx1xr9+XnpXli3hHqqYjsrx02E0MJXYIi7h+wfOh7a
X-Gm-Gg: AYBFou2/V+yosq82Fr5yAEgzmr2gHeri1l/GcMYz8F0yidHDT1BS0JMu3fOnmh8TBhc
	DGVp3yKFpqtEnYIYYiH/Y1B0po2bFyWUxT+yn3ezWOJdJ6UuGtBsnIgkb/YthxetFhfjLGTkMww
	/U/V1bYzNgJLbMPFS08p9xGbcaDZGO87whEOeZf8muaXZuxPPHH6psvZQzRSMrhZfuMRfNW57J9
	yXiR3aPS3QY91w8zmlzupYJbZJPUf8jVXexgvf7ZR1o8K0u5/72Acc4+jOkCGiw009xIVWyFF5n
	VjGwCjOKUylK2g/SBXaQh+0X++7JtSd5bLDwSIMT77UGWWSbIXYrLmtMX30Dvx/3p8DLSJxa2RU
	zUXj+2gr6Y/XAy/5Du0z4R9yhgYK+0/zyp/AKnN4Hz9m7RM+kf+7X95QZppAuJyYoa9oLcNheUO
	fKvUxCXKf9ZflWsD6qfyGoAW/d8nX1TyFVbPTr1Z/Bhj/kbMFnfHr+YSmtOCjg4pNjT37aIGrVi
	cUQRi9jBPtSET81TugZZ9s3KAnEyJIoPVAhWV/1Rxi0es8geMjP7SjIxf4T46eSB2B7MYUyWfvN
	WOPjU1NG9sMaB44hJdNUN7Gsen6qFx5z67qSVix8iVWBL+3Llj8PB91Q3RjuddlkK5/o3MNwQrX
	cqCj968OyE29fcB/kDaCrSzU86I1faZxLdA0IqW3hUUuXEqGRvErX5J0Rsi6wAnoUvaFjysDJ4a
	4LvZCHOfhRXNXwrTUUwBRzhvHERnB0/m6QPvU0QwAPLxho+TxIDZmA9A==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

