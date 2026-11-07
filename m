Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082398;
	b=t5OsjGaLkPaJRYp1lJex8lgPpIGxnqCMXxdKIVsuFBS+/vrDcAuLejuj+jxClIIx7G4X
	 oSyR5UQA4J7fuh+8sCKLu3oUEpWuXFGkb3yV0I/+5UXT7DX9oDmItYveJ23IsZjdAwrjv
	 yeIWtzsC3WFINzMQgYX2oqlcRl0wHZ1d8iQXOa4GXENM0NaJifdC1GjiKRn/grkyzYBbN
	 4z5yI0RqU38+vbUuIomdpGm0CNeVHit3GDHdMtSu2UmME0ulqKIcGggeWHaTdsXBu5K2h
	 2DVWwB/p/cEzHOMAKed0OTbpKzGQQrzs1b+zURCRmRocHb3ndypVxErxxSXqWyC+NTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082398;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
	b=d3wpUJ8MFmxu/bh+BQqwc7bTVtlXhJBy2dqYqPDRzF0IwcDsCQf6eoClTb2QDCx6D4/W
	 3FemQOnwswwc+xLg5a4dzX459PBDZrDoZJw4YnZVfQxlWx1SGIBSliDwtBt2rOtbcg0yX
	 ZwCPdYBE8XCdcTcLZtBRKurLa8UcMBxI0dTHSosrFsQWTkNcHO8OLiWVoEtVGJh1XK1qd
	 5ZCBZd8rr8AfXRaq7LtREVGEzlC+3CUk3qzvLOSbVybB7AkZXEor/b2fsU5ZcWaZvOlY5
	 qW5oBAZM7DKMrVCwleFow738NF4YkMOmWUWyWsvEdW0iqx5nJMY5tFSC3rsQyQgRXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C1606D83C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7C1606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso864fac.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082396; x=1794687196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=bGscTi6Z5JRPeTv3JFMQEaUcr54uy/rbWob14y1lzY0TtJ4kIfhJIbPwrNFBXGhepw
         vaecqdTd8vV9Jsr5S+0OheKCJ7xBP6rmvf+ki7hzOkYWkTBneMoApXXCTWuxUk0SeV4q
         nyvZEbLRANvLIIcxKG7MO/AbCwmQTTI5hTg1Yt9H2jN8pqe2sJ44UENu4kIGNjUPxhMx
         F+0Jaejyh7XKXCri4dOTLAtRzXoH5IJC/DPnu2f64WFlJfu3XDODa+uC/HYs+ZRvvgji
         /tPWqvZ6pNrbbvyo1dcwPQlpgn4x8jtWQb4PVdi6Sy1qjlmsA0GUWJWbXddirGDnqgeH
         mi+Q==
X-Forwarded-Encrypted: i=1; AL+hErHo1tXl6iZeThsQsiBY2qXkoJ3YHcAFTld+5/O5ZrZNxy0FAZXi9Ne1d8UNVRLyuj0nUhu1obaNJedyh9GiSxfq0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+RcUfbpFC0Tasnrh9BpDLqax22UHaGOkosleu+9andTS9QQyl7
	CBC1MEU5EvnxtqDXrKczE8OcX9yfFuOLpsuRq0iVw+TUjpCjRLR2raWPTZTLA+gIois=
X-Gm-Gg: AYBFou1rv0NT92UiaQBaAuGabfGM+MABvLXyjUursR1/iTuaLiMjo6TAmF9kwMu0+qD
	xD0Whjb2oG+39Ni4y8SBakg1Jgf+vsXPIuN6Y70llmZZKi5lY7nNWCFsE1s5M25p9/sfcmzvQxP
	SAWfGjs5ZTd0iYG5u5LZS8ClT8sgc9AfguDQnDM5dTp1ZcCEQij7H/xr2lOWZ0AJU9vL8kJwUAp
	JyOyP9ml3My4m65UJapp+EoR6jJDlxWTbUSPRvvdIYyTNpue+gen1Us/Vz0LQADMiUhVzXdq82U
	lgTpSN5JQWPEx4yd9ejuFpE4CTYIB//msLynYjjF6daDKnfJ+9cUUfbqOxjOweZmeT0bMaYxwf/
	0AxsN0t8CD+R3ADSOnDA/5Prr71VGmCkGsIYH1RB79QBkxY/hV738KEZRgMJ/ieWjvmnDDFXquI
	YoKVhqNpUm6TipLST5wRMNvvJUBv0bnHiTmkbEMr6PwWabz1B2Qpl1pz1g2/cUV9aigr/Hk9oAa
	2WgxIcx0rvPVP2xx+/+KRk9TCJus9uVP+qBLIJOJKFyhtGkFJmHoZGikp06aKjOYRewdgzOzBwT
	S+DmU61towOU3FYOzjaPfjvcz3P7+BBkPY9k2ePKszUO4u1RMwEQ+hENWzWH
X-Received: by 2002:a05:6870:16c2:b0:49e:6fbc:cd5b with SMTP id 586e51a60fabf-4ad98df7d0amr4149316fac.55.1794082396094;
        Sat, 07 Nov 2026 12:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:32 -0700
Subject: [PATCH 35/58] mtd: rawnand: marvell: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-35-0181ef0cc4c8@gmail.com>
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

Retain the layout metadata used by OOB queries and unlink before put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..f3967024411c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2600,6 +2600,11 @@ static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.setup_interface = marvell_nfc_setup_interface,
 };
 
+static void marvell_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct marvell_nand_chip, chip));
+}
+
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				  struct device_node *np)
 {
@@ -2630,9 +2635,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2657,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2693,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2708,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2744,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, marvell_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2759,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2783,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2932,6 +2950,11 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 	return 0;
 }
 
+static void marvell_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct marvell_nfc, controller));
+}
+
 static int marvell_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2939,13 +2962,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, marvell_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

