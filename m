Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046612;
	b=1iaBqFo2JA+dL++/DdZHuU/9p4kHnuBFNroxJt5VJethCd5VqivV2JUxhNmx2c3o4Y/b
	 BROZ6Haq17zKrPb7oFXEnw7CSyc7kgO/SerqmiIu9kYOrByY534KslZ9KYEiz08ZxyWvj
	 QVpsGeOJYxMKZaVnVR61ixJbGotnEar8SCPMGEgTDesOtpKNA/ACmX1Jt45XjUZHdoCIB
	 j5q6u9jf3z6Z8xtNp94/NPBfur4WuXjtpAuNanY62OUOww0UVwi0INuO3kGGrYM+zCyuu
	 xsivMvzbNKaTCUr42/Z9uv5Rt6+NISuSWTP6QP37au3Bv4l0VXbJLO0YJvUL3i/zkcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
	b=2q+uIUp5KmDODE52rjtQMlwUCEzg0hZR9/jklro4B2Dg1CK8WAl8Jp2fi9X3ruty+jIu
	 yxFkObisEsopiucdvRi6t99O5jPYBKOauRzfpJsjanrYGDBH97DT5vO0VQK5Up4QDKmdw
	 7sz4zWoy8KvHAr8lyOnRExuWBokwldMY4oK7LLfg6g06SrZrW8rAk5W3d3wqlIMMQu1zE
	 LlflRUxQKXAVRLvcZmpugAkxbEk5Hsb0Y6NeizggPLraYbGW+ty+AlRj5qVT5YrmhZ8FT
	 Dd+KLxcJAzWiluLgK5nwbCw5u+IUESgQPH6gAQsKUjI6kZ8e5fJql4maJB/rPOrftFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4CD608360C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4CD608360C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGXtLhLY
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-844a8bf7e25so793989a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=KGXtLhLY4/Y9dF950dN43n4TeFvCnD3q/hYowhMCzMuob6nih1BChoNV05vj2XYuCS
         B08M43QBn+KPN9O0miEQ6HdflDVIgT7IbN5AB9x+9i0se1jH0rCwvfAbBPkwpj8mNg/P
         zCvFJKoPoX4KfY9sosN80pS7W0peF91H2z8PWbQpLtOZRg60HG3UGLIa446OBOBy6KI7
         3hwLqP4xaYSLiMI3VyAYh8XqdipLKqaVvToQkdMVrBYOfWdf7tGz/54oPjNqzEoS2h/O
         YKBP8Eec4x+uApYBgFZ08C0QYd/aehU/4lfFdQZDVLf/YFM3ooG/H2Udd/TQFvTyxR9V
         2Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=SqN7U8jc5Q8V5q5vTUVh3lhC43pY9bpJ1srb2/yE/wLWfr3vpFdmmdhufYKP27Ci1Q
         C+WIgJVeN+rin3Z7tnlblzfJQxKV7MhSG/j+JDx6snA6DDuVpFVJTW9uuP/7zB0j0Gri
         EVY7ITHoOxUOXsAe9Q+TApgSIbMd82l7j/81ZoG0YJJ6uIN3BPQnmtNN0ic/N+wmWycV
         S5Yo/EIr8YMGL6R2MvDtjHLfPQRRcSabJjUQjcr+R36P/inaZNQy5C5B1gDLO3+IgOTB
         TGwBR7JD54NfhQ0QDpzqid0SEBQVW6iX7U+2XAcoPkT6w56gBW9ekSAv4tJCyU+bbURF
         2ygg==
X-Forwarded-Encrypted: i=1; AKwUvBy4C6NPqqjXEQtkSyNTsZ988H/C4z+Z2qQFjriv5n1g/w1vgE1j+bk2wEvrqI5pZ5SpGKqNFJlcVSIBzm9md5yu0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+L0v1OQBDJMQJ6ycB5oWwXmIdQ0ObAZAz82sWQX24U4ndrbYr
	sJsedm0u9S+eXGuIRSpk7/ZaXGBCUszytTKJiPVRtqid7ZtzNAKKXlyV
X-Gm-Gg: AYBFou0P5gQy3DQAJOLuRFkx66BO/IMElfwVQUhXWQ06uJbpA8mnPg6f449ZTux5J8A
	InAMveKgJEDeCbcT5hOR3sfdlu5pSwc0XtIlcvGS9DUQTSe7xTTTr8KxwIjINN7xsQp3j1XwHJv
	Hn8MIZA4XAeylkzVdjcecnyoNKIp7HHenM4yJGAELJw2l/SnsGoIKSMM502EPQbiowyBfVMrZHp
	U3kOXrWze7Lci5LTVbPnF+T/pwSPWfxMa4QNneL8z34uTX5ns8og85R8Cs2DPU0hrW2P6cKLJo9
	jKghTd9dbss3WeMatQvfPKXEDVPPDSdgUmDjgzKj8CHImst5eRdrzS2gPY13Frtp2qJGFzZVIkq
	IYiuLoO0t0DgymcexlnSIuoO3RCcpkh+cF92Iu5wMIG1cuUqDx8/T4P4ZpxUctXHBTZ2xFkI8Tx
	POPZvFUXHJojWaUtmgANHguwVqHliEpv7ktH6TU7fwqB3jdOEQX8uFiH3MO5qpt/sNBQvgYZQGv
	NrkHqMP0BcMT4HCelTRjXx7AR9VotE9e+147ITu3I5zJYlfrTLZo/oWg3j+HLYckyT4UlL0xlLu
	89Ftv+hCX3fcO1ZxsUKQlBhAO0p8B+G7yyQ36JdnqWg6am90LTYUNQo3He50cAmPwyaX2gibYhr
	RFnRsiWnRrppFqQXPlmap5TzPvzDzR7FWFDrGijNNN2Ra0wPoH8c8YDO2KTbU+iLVrocdO7hwqS
	EZ79/Xy6yTSnBHsX+K8IEmwZZRQ7r2A2SkH/Afo1KZ1G1hwzjXUMl/m3DkiUB8IzRROHnQL8Sfx
	A==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

