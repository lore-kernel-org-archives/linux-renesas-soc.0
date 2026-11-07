Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046604;
	b=xRSxRg9Itg2juMdeogvWf0k4brkGvFaQoebh1bIo3bOpyfv1CDCzBjQCxJLlkNFa2/CO
	 /0H98XrR9J6EJZIVhVtFRFEFKbZTo5O31MhFaE2LUGQC4b0tH5AC+L1+Go/AzP4ZD9B1e
	 FMzW5Xo5BmC12kOD8+kJ870BhJsVsQujnnWB4lJnSOo/vQbHnCwVh6kgx/5LC4zuRF0Uk
	 r4N7E4przf+uotcn+EFEJ0+FIBt0K1p58NB2vNvhwGgwNDfdfxu3QZerXRtEX7Ji2CaYV
	 zxHpJesPcPMK9zzRbOR0a/WjW+zUiYVfy8SpD+cS+P6CEnZkqTdLjUxgNYiFos/t0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
	b=VF9VfcUfbTBMgR7uWKhjWsiezI7WUYANZJes0Bf5uaYe8eqGjTHPW1oz9iUNcGRCpUbL
	 hyecgACYRs6GhhLmT7b8fk9ZFTZ9aZ9kXJphTERXadQ8Dw8GTus+QJQEmPg4fOVaUTHRg
	 /RPKcFxQeR1rTkjlaFMLcI+CuEUEgWBgT8nQUQENvyLPPFFZA/MIKIdD4IZ8v/53Fmnit
	 qnGalIA8Q37cF7d4XqdFLGv7YONA5tPLbWDLx+qCwAgFOzWGV71ri9Hgl4+oRH+noZ3G2
	 SDagNDjbRHvvYS3ghBPKPsBMkHRS+k9jz2L5Mk2GMtRYFInYl6LhKYG9j9e98tScK+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZu6jtfF;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE2606EEB9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFE2606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZu6jtfF
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84e513877a3so369792a34.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046603; x=1794651403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=qZu6jtfFCX9Y7Nx+wV+sJcthc1T+/jS6dWRNm5jDSKT7zVVWZ8TAghcJA9KtR53+p0
         zLB0QLEKSmnS6AoTEutJel6BDpYTXYqDmCbekwJHDYDv6kD2KKw1oB/v2Z/LQ+WfE7N0
         9+IS6Wn1X8Zm3+YEiHoNjWOT5pA5x88Qlx8NXwBN8hwsggyle/v49AR/9PylWDLztaSp
         LK3BNzuMWgT6khD/AwEYU9YXrRVQz4t5DBEU2TdyuQDBnfkfXskwxaHkb6HUffdJYvu3
         r7VrjZrkvRQMy59vdvnJ2j9ewLAxU9nlgwkLhzM2GQUczc8qmSJ8mbdubzJkLgFdBjKf
         OjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046603; x=1794651403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=gKzwcwLbLSIb0JmNqcq76Km2LYNBPDU+4vUVAmc7aJiKXn6vkf0sOncjGU9Ywqvbcg
         HFZTAmbw5dI5soj/I2F7TW+cIMxe0tCVgCHiDVytuB/9aHWJDOHq3mBSDPXQmlId4cOP
         /2AmGMLP+EPZsCwTnfAhP5Qr9CoFuzTMr0A6Wzlqq8b2WnU7ADC34tlOH8bhMDpG5gFS
         T788nHWkwLhtjmtEMz1/xj3Snis/vwLrwK+F6VTunw6hvy1SntBbrtXik2PQhSzYdUdp
         l+XbDBMRQ6hmcMoPzstz643+aa/vefqgWf1gs1fhpbashN8eTXAfNcsTwxTEUFcUs0uK
         EKlA==
X-Forwarded-Encrypted: i=1; AKwUvByKhBIbuGDKmD29SoAuPjFuFyzjRg4J0CvMmt0ECr/ai03gaGyuBsj9X+zD5Z/DQi5HGnCiGZA6swRx53x3R4bmWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uXfucDsG1mWjNHksUhYhqCGrtu20dvWCiSLfTtUnCiDA3aUZn
	IEO6tK7FOfyWh30IdIyl1ZaL0m8/dSSPyCsNmbvKy2SgPVJcGkq/8H8q
X-Gm-Gg: AYBFou3wMkpOm311MubEx1pSEHY2hg6WTGgEDcUaSnfLD9Daf8nZXJXtiRFZvVdHc7d
	UbS4j+18AN1oUKSI5ebmpND5hcORj1SvksUKDnLyxFQWmjeikBLwY/uTCPPFTtzoMMtntGkiEtJ
	SkdvqpKT+MV1FhVrchE4/W9aNbKQLfQ0iTikzVrRtzBkvi/f0CTZvudJ6tVdXOlS7MOJ0Oh44bE
	xQSYZNmsIxXVdLJDWFmNSjRJi/4QbFeUxI05sCqJTg/UkJtLX6I6PtbxXNdrVAFF0Sd7KL8yVjo
	fB6VsYB5K8Iqo0IprAJf6SBMvA/EOKmgq5Bbzpzp43F5wUgiVBcf/EI1g9W3XQJpeCFkzsW0/KG
	SSgVwlgxOKDlQWUflmni8QrnmlrZkx5hoDqQddtwEV8NN10f7Adnp3gWE6wUgs5+8f0EnaiG4O3
	fSUusPczlLBc0psrNVGoKvVMm85xgERFQ1kHpviidPP2W0AIrKDUifYsRFTx4Vv51+GvwPxAWun
	9lSkvE2xiV5F01lu4hhXhgW1X1XcXNDE1cOj8TSQ4nctblM56s9R69T9E97Bl2xgUHmcRNPTfRk
	FtbDZkt+8OXx4kO59Ixqs4h2KT9KOSoWD2VtuQG1sqwpcdDvnUD4AnGNVSmFzqxhr1dkwoYWs3Z
	dgIRiM4srskrGcY5HxXoLSUUavqw25nZp2j1opDMJD9vkzn9JtGxFSjSErZH5BmFY0F+tMMoFwv
	XabseDuW20QvjPYGP6oLTlSSIe41HjK7WrANS/b7bQuD0pZeGX/bbYGePcbWm4qOqFp1tMbDNtl
	Q==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

