Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046649;
	b=vegU58NV5X5GhgFjVSkZW7gpW0+jfLHfsqG+WgRm5gqSHMABDA9wLpH6bbIeH2LWDgiy
	 dgXC1Z7PUeUpUNBHbUftvROZ6XZ+culYrSYDHtZl4qcYYM895guI0Y/+U6S10uax85nWD
	 96diB/wWBhufKBbvGWIHAMUgaWXf7Sy6ImplY+PXSwOUGjNdFH4sA8n9D3JNznsvPpy49
	 QZ0twjY3gjnJvY7ZhWF7d4iu8BcQCqQtXZoaFNJfPkZ/SEhYxvt53JkpfgDBF6kEVX+RX
	 1vDstMm2OQHVx8B3S6LrgVF/6oyAP4W6rOCMVsS50DN7BL2oMVPPpJxgYs1XpRgHdRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=nc9HuE03K+H1LVZ3WMS+aMdB03WWbfYZP4CkzrjaQcIplX8//2h3/Aipu4s2T2pbBuE+
	 I4F8HB/QhtPDk/ZH7w56T6i5PxFZhLLfvg38MJtCgoAB/s0xWC4M57SCf8LznLt8zYQeE
	 15Agy+JyOI5GxZm69YPzf5hUC9Ec0uisPSfMiCx1o9HMWePs9CSH8Ny0QGHaP2TzJLvax
	 GDEd+W/Uil7fIDJBqUQCy53dvEBzkaAccpQSR7O9hDCfL8/CfgxLpsGfWaqNFOzlqtLLJ
	 zZpXnZZJRCF2I0izfI6eCrjsEvpmUR3kfELSlB8zkp4oX2SUp+wL8ww78vniAjkZm7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB98608D963
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB98608D963
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQSJNtam
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882140a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=zQSJNtamhK5SrvhCY6qJK7P2GezzcQ77DYD3sYjRLULvrn1hy8viO3/ptg4ahw+t+T
         gY1SnDZ/2WzQuZXBrp3PVyhaII0cm0UAlYH+eBsPIBTvDG6L1OVKkhg5Pm9jIb64ySGc
         xu98+BrvSRilZ8CztSrSAWXFFaUjRxRqV+EW3bNUbjJ4KLOXBQ4PPVQip4OBQGKbMLcE
         3+lBZD52VHWHZSRJS5mLRKEUEjHO8gKLRUT3Z57ftGTAlfnYbB9+UKvkuebdIHaBfT1D
         UPr0uCtIlKt4/eaYmPO/8uG/eH1/GH2IOqfax9dre5G/486CMtclECzKfyO0G7dg2MgW
         V/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046648; x=1794651448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=Mq8vqB27WUot5ulvoRsox/9YCEqyuTBv6JZNu/86nd+CacBtCnrF5i+TS3PTOOrQ4w
         TjKaDuixTeOuTZ//XhMMgg8dN5V6vjFhUBLfoHCZzYEFLxHoUVBed6qMw+P3WdKG66lk
         5pdm3Fvcdeg8cudPKb+9x4WrLmixhILh+n1nDlBnolZQc0CzNR8lgLNU7H6KifV3URed
         HNVNF/3p5AefpX5/jE2en1ui8pPmA+WJBTaIR1LATihJDvPU0q+PjQLQeFu9F5njGfbj
         yV+1Wta5hjVS99cgybJY0O0Jg1yTqk0dnHp1EZIdvvFYHd7SPW7bdCBZ3ruJItieYx+l
         neAw==
X-Forwarded-Encrypted: i=1; AKwUvBwV+tL55pz34WnISrI/WPOHTqCp85WxySz8OAQxfbKlvSurILGvWOc5DYLFDbn8aREWGg92e79vCoKhs0WwQGwPjw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mREVQq8ow9GI/U/FArxrwvUd2R4woFBcERc7idfH4ePv35D2r
	q416M/cAZyy1WJqXMfQx6LbpY/PwUctzuWouWhkTYKNCufdnWooIsFOd
X-Gm-Gg: AYBFou1Iy6QMGequ/HseGZJ+S9cV6WV5o3Vg0DtI1kSn0j4mdLlGmx/xkI2+WIeLX9i
	slwyqEpgHm/wDq8Njmsoaqqp5HqpavMa2iNQSoxhHzbMH4GJs+eBgPE43tP7L55wIhnLm9N7xg3
	fIU6ah/dv+Asge5kPr4Le+YQ2wYkgKGdiAeTPhk6cB3fHOr3MFUj11oZ1tC0rklt0XEnnpwF8Ks
	BpDMtsbU7VXDLqbAZ8lvOcG6ckQO+UdypPOSSwWSHd8MsU1kChduaBECj4NGqStL/iwV98UAGD3
	a52N1elHDaepZDslzAhWJxr3Jz0UyNwIb8y718TmSk7SAkwm8AokPi5oEFJ5Q0RlksMO1lMrmQu
	ILjxM+Js/sM1Z+UfzPmYYbuXVf3O3TTAoY3OlpGcFDBOp+/L5aiN0mmSTCduAXqGgOmQjlhR7LN
	AfY3te4TeIqpY6YBsMRU5X+rwUT8jmvBec/S2yeCKvVonWjVZN9avie9qiF7nX3emyaCG/zEFdC
	odKNniZEYxiccDJvJsUvyBavKZgn1zomLpCSSmfQlJDakj+saFq/UUgF7HnSWciJQjiv7gq69lY
	1yCFz8cFo0bZF9vhZRvYNPA7ZTNUkYG7ISif3zJgv6+TJOK9ReEQFjZQhD62Ul0Zb+E7ufIderC
	VxCSCc16XyJE7PFiREk3khAax66hH9yiNH0WGbOpOy32RUBSs686EbyVhOijFZR1YldBnOvuF3S
	cPjLswI+WdYdf5hTlegx7TOLG2RqpAnfXnCQZ2HnEJhu5wwFHgk11G
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

