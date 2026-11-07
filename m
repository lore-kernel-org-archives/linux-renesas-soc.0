Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082464;
	b=Fne4tAHlTQTt/WXs5qEt52wYcN1IB+bMr+Jxe46+7NY6flIUt+MVuIaJRXfyIAid/9PY
	 HR1gsR8N7fYAIn1uUgg0L+F2QkbQfwNsfOMFEKnnays+Maqra2IVIhDn8acNrPwZVtC1B
	 dDe9K+Cpq7V38mjlB0Sfvo6FCtNsPAJjQbUH3o0HVi1PD7LSJ9KQHP7c1J8AAkygwpe92
	 lMEi3exhxK5wJPBsk6lqHU76RZJ4PuSdl8ho1ohshY8tmyH+Npvap0CwPFAgHxNPY7XGH
	 rw/vWUKRvnPFDjaIP4PP8bwzQutjlIMcvAFN/IXXm2KowKOVo5K9q4cM/SxfVTWWn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
	b=rigG8P/N7u+ZHHJ+dLMRRMe9acezekhRgrzuRa4+z2WiAgwp/kbnmnrwMygLccO38h4V
	 y815NqVjuPXf0msZfdGZXZWUG1Nubg12kFu7aKLiATAaBb4QhVzKiFHqkqIl7RgHyh++y
	 aUPY1Ag+OyBcOjgV1aG4iUYmcOSV4cxAgi2O66FK/ZFqh72A/TH4bTh24V5io8kquzHAs
	 gKSPBQTrap3aSdT0YllbkpNixoHWk6NQ/HZ8vBb+rZVl81+0sGv0sgZe2iaOwPZZUnw2p
	 Ed1tCDoli7LUDIexlfujpO2tfZ4TuxjN9qbTusOMCpAsHN9YWO3Z/gTbaLHNY1q5mww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821C6083607
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 20:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2821C6083607
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so23169eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Nov 2026 12:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082463; x=1794687263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=B0uplpeH1TREsnAVQFHHDDq5TCDAqBZSqfP1u9qNd19oNNqHQ2FPs4oRhxhmIPI0Zk
         YPtU/gdnchORCG5tAD6rKRiikIRkmqHeYuwULMD8/bBmjXyf6+4YIIuT48yE0EzfD+U6
         HbGJbHzrk7QhsxmEN9i0k5+JIOK1PQvZQ7jCPRzY006xB1wq3w0rLUE7GP65yoE4BBOP
         rvHCRONSNNwFbl77qDqfK+/+HKW5lze2ng688oNkmMjkLZJDtiq16jmcaAtVgyjLyoYC
         qRkuKuIoCD9CvLmEnXAWd8LwW1+eTHm4K1/rb7p+qKB5MRJJCPQQG0yzjfPa8YJyTr7H
         Os3g==
X-Forwarded-Encrypted: i=1; AKwUvByWG47H2TK4qqibriQSF5KWbIx9JA1uT6/eIxYOC1BZt7lCi9yGq8j47nvDr0luLs4aJiU3di8+QmOAW4LeVxL95A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8izSqUa9W1qf9Iqpny1sH5B6WJUWjqYabK8FOtmQG3cJbBqgUW
	8Kn/Z3Xqs92eP1n68c/JtX1vJmRV8Blt1kYyV1ZCI/Q34oHtTB22BUuWtOrasROwU8I=
X-Gm-Gg: AYBFou0G5iP9VSA/iqfa3llqbrDC+lL5lCxmpSG2VjTcdV7eh7HucKuqkuFpIQYl0w6
	pXIwlbfEiRDnDTwD7hC0nQeXVCE85N//d8dVutH4Hiiw5aNp91M5OscZKczuJWwZRpUABGY/Hmt
	HEt1doN9NIX8uu0cG4hNdsScrGnPBys0Yzasltur7+g5Nb0Bh+L2VIndXhgSWTMFjzCRS2/Cqgg
	k3Y1BMlwE9oEtTWo/3cqjXZ7Cpb6mwmq/BG6NX9+lYrxtbdo+N2Udw34Nh1NirWFBc5UXmu7THQ
	E2++qSa2AIEDlPiab9/u8iFYrDGa86V5pG60IHhrElaAWamqg4vhlhHmkTp678siRR1QLRTO2Id
	7gOfP/EBofPJURUUoLHdT8u5aszX60I2d7U3u3MiemD4ptnPq5YU2BjpscV8YhcgGRQh1pgmcLW
	uCsKrQy3ymGwYjPnsB+lmVr4i6XO2s+n516AaDJy+HUMF4r9cr3u4dzUpEt6tlLZ65w7iJtjqBR
	L+Nm/ES2qnHV3ffLosb198j/uavr7Mtn8HYD95JKiQjoG4FcCnwwQ1uMhEQmLQAtXkVm1Li7ERN
	dFmOXMUmAhEFjjdlHhtbEBF81q5RTDKO4EiDoCL7V2cToAkUwIxb5vG+E9s8
X-Received: by 2002:a05:6820:4cca:b0:6df:ac2e:85ae with SMTP id 006d021491bc7-71700c8606emr1101384eaf.14.1794082463049;
        Sat, 07 Nov 2026 12:14:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:55 -0700
Subject: [PATCH 58/58] mtd: rawnand: diskonchip: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-58-0181ef0cc4c8@gmail.com>
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

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

