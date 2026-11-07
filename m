Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046592;
	b=BZvijGyIOBYlsbjOvFYJ0rKhWnSsZH4z/mvc4pTifOVqhetKtvQw3NR0CO8ygOHke0Yz
	 pY9O1RhsF8EVqeiKYJWtwbVHoDf69M2LdW2H5awoyZqjLYzNFby8z6TArCZIkv46k+LmL
	 nuw+Q3/iCsQ2Yqb1EPWYY5sCylLOCItkK0JKJQNZ8WBcqwytPsU6l9MHht1TEdeaq/OFt
	 yd3dRBd/emIG50Nwu/jR2syc8FFIFO4ht8AA9SI7AuOxMUpIsx/N6PmnSpF4qvh6qkrvz
	 GyAaqcKRhvC/pVwIQgdtGtFywyszG8lxnWxxVPUqkE0GSlTGUEpM0JK6atfUUw0BvlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
	b=35oC97DncwGRpRgVPESwItIQabvkFHWBe8vq8Z8fcSCFTsLyk3rZnyWlJ65v8Tt0MR7n
	 l22WXUWteOzlHG3ZKZCsjDKXZJBkVSG/ZtnB4ehLVF9Yh2AMYPEQ3Z7l/1Ka1Nng9YSc7
	 XLEcYt1pq8VH/QOpnvkrHBrHO2JFlbwDtV8JketOy9BiPlt/UUIii24lr2datmcYYIFiq
	 sBYM3skM78ZzuY+vhixyGmdLSddpIuefQ6cnXCbCVXxl2CkJ1HIZECgm/eZfGqLHhZB6g
	 tUUN56/PGYDv/YJjxYJ4g66zuvYlE/qgwfmK3KK5mQL8xR7zksq055ZY5biiUctoHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A8606D836
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808A8606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-85c1135c286so1028219a34.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046590; x=1794651390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=hf5XVAUsF8EPd/RdVeIWVS5oZGsS0lby/+9Kj4QlGxI7nmPIXVSyQF7JqySogUecbd
         yRFpCeLuScpBXGbVWXv4fQxq54pXgi4KnhAQvkI0KOlqaD6k65pYeD+leZOff63AtnOp
         vwgCjG/FpYB1e7s2J6kUroDzwPkTebX92DPPuYqdHlU831TrCt+WHho8CY6aszmEKM2F
         /XYdhwHchv3jUMRW0vBpNMie5Iss++8mGpZHCGvcbCMgKxBWNNrvFR1RvqpBkDvlIh/P
         woaS2DxX7uQfjoQ36gFraLZmORdjMXrIPemQWt/Q+pC48wS4VEiQkwU9TX1WkyT3NT55
         KKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046590; x=1794651390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=yjn3npqPRSr/EOZhQFuOHCkM+OgTls0pmP4v33ylvwKVLtrGZAnfzXKyfm9kLP+Frd
         UEK14K/qmFvnAMpjF5fFJaoALltH5DqZ3PHB2fpD5TgUHzb0WhN99M69K8kMpj6TUhlz
         MVqLVXkZEiMrXiuH4HWao2N+4YCi32vwMvGzoo+2k44ktB2MGUNbaq7zHRMglK5+op6T
         bE61OPJZhdNdVPOMKM3b+Cdr20Q8QcJYjexBsbNFvEvxhHgfAyyHv6rjFipwn12n+3gF
         uIrbFwg2FCc/OFB8ZX+8RuwSNWzHu261/yJXy1wFCNdJ+0ZpHo40/RSKTxi7rC+w2IwX
         nI1w==
X-Forwarded-Encrypted: i=1; AKwUvByyzU/wEOpHeRxdntwJ+rmc4a8DUFt9puAe+yeqA2b+Jki8JD9wkbsqPqnWupLjBEwhwRYsNmDYSV2PQoShjiPuUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/YAjVIiP48R72R16llGKhikw/juMuIDuqVUMppCAAaMpKMdhC
	zzafP+5nQMgsIVg1k6Oq7/f5Fy9nVkJlZ/80/vg1Gyv8aT2LEAeFZQCF
X-Gm-Gg: AYBFou1kBDIe/mU5xw8CxmqCrdwK6zOTpCJIBuK/hYelI/d2QcYBFdfbv392bIRLtj9
	46BYtLlB/JpMCbedZG6H7pcTBvCOjFRynnEPpFGWFAKqgNqs2M8r0Awn27JdtDsqoNKH6VMA5Z6
	SI5u+i9B7vEhnPUsDw+2iOKCMh/SySclNvLoYTXayfJKIUjhrMI4exnT2oAnYx3+IeNckeeWCV2
	Lkz2MKkY0qBY7gli8fOox5b9IjPceYQ/4yrQdqzfqiYujjYCvRhS5ogxXc61bFK3CMFEUhWslP8
	G1W1cJnXcZVEwtwuBseruqmmyKGmxuBPPQYQpRpsX6w4cpfSNcdtycJH1oX9TQ+440/qugt9Qes
	x8C4HqfY6vM6fImAUGfh/YDu9EYbyWnT4yBgpfOg7jbZqJAyMIWZwzVnw2U5mGfcWDIwhXufz8c
	95GmexTAN7aoCaeScrtqVgMSxHvnPcaG90c1xgfcWOvV2R5peOTHROosCD7lK57Nl8oMH4ys6wG
	hhUs5IocI26U4U45gxfwE2m+SvLuXWGBvTlsMA+3gTcOO89XEZ7BgSB24xVhEmuAq/tlgyiah0Y
	H1UDnN/mcUKrCuKumyp867w7M0Op/at+zv0J80VTrvMjMvxBn9KMtZ6VbonUpQFzR9JUV5GTNpn
	t/B+2BKNPCJYxI13D1hqF9dtWtuRG+J86dgyrKJQkjc5VKGT2IovBXnoB3e4L8Anvml4GipH3mw
	0vMbjgnlJV/vIyicoQ1+PxWlVp+ZqO2MZrsEl1JqKdVlOeO2sb5tLw
X-Received: by 2002:a05:6830:4c05:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85f1cf838e3mr5603674a34.9.1794046590411;
        Sat, 07 Nov 2026 02:16:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:59 -0700
Subject: [PATCH 02/58] nvmem: retain provider context through final device
 release
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
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

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together and document the associated module lifetime
requirement.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 12 +++++++++++-
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h | 10 ++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..851fa5cabecb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,8 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +898,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +927,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +956,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..dcf5d81ca1b9 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..03e8522bab17 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,8 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +109,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. These callbacks must also retain any
+ * module needed to execute @priv_put until it returns.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +140,8 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0

