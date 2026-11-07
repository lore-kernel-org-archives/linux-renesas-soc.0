Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046626;
	b=EGCKu1p2Zb+wSh1zyzSZS6Z5nK4xHK8R5gsRFQrXI8mc2Ddylk+jwRUkeKQ5N/byLDIC
	 KYN4gTYDQqYIf2C5PwWNzp5+nCQQox+xJ8ouufi5CdQpC1klYsRXN9d82Ev8Q+txk5Mbg
	 OZ0F771kmAiNkbNN8w1SjpuLTgdieAXfqlPswcyml3/lJ9b8aNgfmVs64iRJjfo9F4w0g
	 1ISzNj3RMGgsAPB7gw099JcQNmdqn20XSWKI8coHoCfWoYf5UizP65SI8LJTgCvDod4YT
	 FeuF3F5QZty7bSjUjFfd6U1R9e1G/vyt1aGJsNaCA8mX4tqvOzYNz4L+h17h2+W5qBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
	b=Ler1GB9OTJ3v6iiRJ+ndSx50jfyqlzh8WAWLTEMsWH9lWMRdWYkRcY1KyAorH4tEsB2S
	 cI2P+FjWg/SRY9eqpTEc1Yi8gkCj7FGB0a6967TPVPIByeclx6xkZP1SRxpWhz1x62p+R
	 XDrCQflMq3kE58dvyF2kKzWKyjYYLs5AdBitQKEZeBhbNxRfLuKil43UJG/w/evfYpABa
	 I6iqczL6IFX5JHdNjlMXCZn1/4Fcb8LdfYrmZwNTJRQZhBlE3yvev5s6ezIG30H3bH1AC
	 VxG6ySso0T57iXRg8lm+nfZME9/+UFqmZn6qp22+tIUUMO5K8ea0790tbJ9ovkQmNvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1iBT70m;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEC60A380F
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EEC60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1iBT70m
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843cf077f10so2137949a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=V1iBT70mVG9wwLbrqhjeZf7YBnAvB7h28aXBX5rG91Ifz0uWckD7JUISKRdc1cNesu
         UDTdDTGugMPkmC/jcPLmuPZjqoMb5v4p4PyPsyQ51ryIx10Jc75oxTDtrxscn/ZSlbYg
         NFVDsDym462lUl8e4dU56lkLbTROl2C6+p9GerUvV2UHlDKdWcwFZsdxBCByR+zA7oiQ
         KoO+uh7ixyp4UlhFT5wpcys3w3RWL2bSLEkX9Awsk7MiWSxeo7H581L5ravwDoHt38um
         S8Ra2RDmtd+S2f+JWuybnOIsdrwVU6XSJpHuceMcHDplR4otS1joyymV81TADZVTzYOR
         2pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=FTBXgkx0QMsxoGTAE8ASHlkyI5yQhD5LYiN+2DHFm3fdnVhJC/zG3OptvTE8FcqLj+
         /YbeLseR5iDVLQ2j8H5RDIbSAT/upf0JnJUtAdogUJCqKgmoebkNlqTzPUfWg7ps8Alu
         488rl+4DFFDZb4B7h7BjHwkATabukwQRCxrj1Tw6YXJyH0sQXAmnMiVC7L0hVxWtZ2to
         DqUggrmGNHya0NqeQhwrOsBVK/K/S6Diaionczy2j51KDebEdc+uPXS45xDAjnZ4hBpe
         rYUufo+VY1ecjBQG4Kq0Aja6Y/Ds8UCM7eke2z7PqxEbHwKvDnXmCCmfKGld0Y/Pr1vY
         u0Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwR+zQ5ovsXLjnczyYT2B3j5vNqX4w/Z1xEme9Fm6Fb83wwu44a9Iza1bspe4b85CtvzeRGEnyKsL4xa7lCKKP9OQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y58dvQPSMsZ59NPNqN57U3qtBtqsD4p9hzPIk6/CITUBfYUWi
	hF6eXXBCKh5GRkzHeqdTWsSJNPXxjwhjXfPdCCsZM6zNW3KTW/GzES4x
X-Gm-Gg: AYBFou2LH0/6cEPqOtn0HTkhDQoHWEZIY6uS0Ykm+IxmBjXjT7YpnRsc+A48SG/y550
	u8ndj3rY92Nw48pj3tZ0DmCE2eJ6wg8HQrnK7halMsJU9uz8XhilhvItWqpewZuWQA+RBstSHu7
	ZW5t8V6tfld6i3QOnSyZ/Eqofxg84I/JcPGWkFgfLHcp8Y478ChwumhcQ6nxJwVCUhQQZ6TEmIS
	YYWi72fdE0BFCghzxsHpAUQHmY575tKl/mu3PR4cN3/0F88eiFU+DxPW1hZTuzQWbEdpsH0l6Xa
	rua5+h4Z+FT+KKdwmnUStVMNiOyViMT/4z5u20ubIseNHziZADsLO3PjZE9bNY3UWZsi943IHQ3
	w27qs5jsXAAfRVnx/HiyS4gATk9FSUb5d86GoqMfew3uQul20AHO+DFFQDTkQHyowqe37o6fii0
	jhe94TVpa/fA7UQF10TstnpDmuCx8SIcvXYm8nrcOGgRDvApZl1zrsPfDiG97/nET+SUmn+Nd+Z
	8fh7nhGOZqZqytKLVzPKu+7pQxNwyW5+RE11tDnu8GSQrHbHpQ1ijr3fnj7wNINc0AjTfjDG04I
	g7rjiVZhhCPL8b0Pr1E0PrIFDj40HtiV4gxORfGGBJuGnTZIEPos6mec/7OfMrYODBREtYDPHJe
	LF7WE9k/B/yALW/4bPzfNVK7LHJjQXoVCkFe9xtduYB/KtAuTV7EwdyN0ZdonLr6Q3U7Sx7MbuW
	tBzKTup3yyQkwBnry6M1vY3pb39UqgVecvWhxZhFfn1GBiYiChL3n4
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

