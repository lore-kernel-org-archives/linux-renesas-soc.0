Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079355;
	b=owTnpxGoM0tih0Q9SlIW9CmyjV9O+Oxygp8+ThmJElLjUPOMXlRLZFChhsf/tF7WYxNH
	 cKkT3KfoH/YakGvjtCfWyzKjfwFtH2E4/rXGQXRypPk7sUei9mYoX9nGmScKr+4xIN5g+
	 H64O3ft6K+9iQ6YbvQ3SCBmHKVAEk8zm8+fmMjiuhblAmeMo/AeWS09xoj3/Cpyyqnm//
	 y7JJE+pzyXOOxibMzOEbVqgTLWojYWQyBVAEbbTS2klmMSOtdVn+AD6lsqRYg7Q7xkYxS
	 oK8yFd1x1ZOR1CoYNyJjDpSzMnqKPNIHvaE/z/eorNR+LwCw0dER0dDWBuUtfswjlgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=sReOkM6tZpAl19c07q58tm4MjAlPyFiIddsxSLpJhsrEoF3IJk9fAYRFkes7mLzTK2nX
	 PtI9wOS7l/f6CRPyZIubxp1RMW/ZgukL+TAVmy2qWoMoefG0nUu4rYaoueJOG98uTK6+S
	 2REme4ffUQZAOJTmn7wEkYDZZ1hDnmgJeuwZGh91XUshKjk568VvKxxYQ3rtADU74XgS7
	 vexpwmBdBxGFIQuuP4dZp187IdrWU9fIOJiGVoasgVQkgSxNpqL7zpnDXum6T921X3r4h
	 URn+FwXN/zFe/+E2QBvNHo/5+0TueCPnyHL0DLa19o5L2oouUS683RQKtH6gz8QzThA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdF0nwO3;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387F9606A32E
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 19:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdF0nwO3
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2800fac.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079354; x=1794684154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=mdF0nwO3y7oNPZ7zBn4Fn3kwYBHgxQIQwK8zVuKkEwuYQHGGsfxHLOli5wpZ9mL9Qg
         OmAfl8QpEU0Z382zIaaS7EiE0pcQV4IkfSf2cO2568UgRAUamivkF7yBLAzX1oLqF9nK
         1NhiXIfHo4HQ9cheT6rM/GTul1qqucLf3HC4Vsp7+NVXvVZQTHqeE+KdBHQ+M7JWVFaq
         s2WmOgNdtpk5vAdUMuisKqlxi2uX/qb8HeMjPzF3T83Y6uZeV6pDEzZJ3wJ9VwBoH0ew
         jByvNVus/fIVfVAEqfOIqTNS7yECH9iSb2HkvCu//5Ss+tRcfTeQnP8iTFvQPKWfD2IM
         2UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079354; x=1794684154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=rLs5trMgoBgqQDjMywGcQ5ENkfZNiUjJyAajhO8baqWryfhTCsxQ71WUGvACeIaGoj
         3/D+1MR8d7HgAupWtCh093iJR2RCgqTKpYG/cHUtaYqk1h4gZvdsDbXBt8odXc2gzvuq
         cxCATJgy2PCbyQ8WFNLGGhlbEm0Gde+Gb3AeXFyQD5gX42+GwerCoQAYyWGsBwqRLysR
         OvQN90bNkt8Du7Yf/uaGTOjMROGl+FzhmFbHNhu3TKjQ58bBVkICEv9YUOgt6ekaYcrh
         bIHjhWadpA975roPWhdtAUcKk+djLMcXjd5QlHeYYolcI28Qo1XxLvm5o1BVpZSbsUSZ
         DHJg==
X-Forwarded-Encrypted: i=1; AL+hErFLWIknX7F58bEhfMEL1BcDKUtkITVzLRtAd4EhIJOxbLo7Y3i+b/lPs9Z4b/MKfWR9JLtAwyeae4FEAxrBbzYOTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/zLjYtPFdXD+SWem8bSqR5rArTtDC26uwj7jCT4vSnKeoMzs
	EENsfAAKyK4Bp6Vy5XaJ318350AOz+uQstqHfV5OAyQKcEgflbbgDZSl
X-Gm-Gg: AYBFou33mT0UGQaBVKPNOck4Ph0IzdZhl6CXxlP47sQQ1gGnKcr+DZv+Pdmrf3xzYQe
	mFvdm2SBqxueuvfaK9XoIEJymJxsCAB973/iVW6Z2J1GybMKhlZGMUP43CzZgJfgqtRv6lgKpot
	6HpfYHJvHndkOMtGJxwuXhaUqsyOmqTtKuaJFoCczhVI5+9nQBxhGxbVQs5+5PT3a6KOofYQPCH
	nvqcQi0JaQT+mHnm/aYLWMhf7pcRuzkEODabs/HnO3adNNRXTq5WNngWqhhQzs3Sygf6IDHFQsE
	Ep1pCHqUuyNUFEsNwjDKrOOjhS5+kwO2k9gs26HJBrEU0BoHgBb92GsZPsykrWNaz0iZ0xPRdZs
	VgwvZnuP17ezgJLlbbegLHhp/3tv2ns0SDGufORq9jMcoodKbrPpRA84A93Xq4mHSb/JfK+xGpt
	JvsOT8YFDP/TeKn+ETZ6GhO57kjhXC+MoV6BeS5SF+j0qsatyL0GdPVpDh2PLzMn8NtZCtqTzKv
	rRzkjg84l+icRZw1H2Jwz4qTtt9rXb9sq/dYI/wx3l8uKbSQmFCwt0Zgm7ig61YWVrrLiwYcnBH
	9cPO4ZVW2qnf4M3tMq8rlj+rx/auvdO8D5DhCsy1HSO04Z6JokeK0mhxs+2BDSYEy9+hlrJT2gN
	i8cD0oIuUfma0kLe+jLI2RX/9Y92XlehuZNiX1rPkHohOS/koBnaPvSE/qyO2UkiUMZdPfIfpL+
	VnX7rfuE7/Vys/Cqt+ZcxATA3QVjLYQP4pdYjbzPDa1hUpmUpZi568
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id 586e51a60fabf-4adc0db6cc1mr1204864fac.28.1794079354066;
        Sat, 07 Nov 2026 11:22:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:22 -0700
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

