Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190996;
	b=ozO16SOJNElmNtCrdL/YtdAzksjUtIokPXTRDZVUgUuPd5tPqTEixtdBYxxEjl5OzTVY
	 e79QD7DLp1PsxNW7n6yybFGqBR2AlEEzhZjw/tZQEcZDKx8l1Jj0sog2HuxJK3Y076xdJ
	 ZqOGAKH4qlHz5mY8mujWF2+TLIhHOxT5wAAqO6dofXyTdwro9RRvAlBjMvKtEUd483Hcq
	 FD46zEUWQIk90Fb97ZufQFZlX6eHlFeOtoL1rItJbpT1W6o8tD9pdjzahZH+js+3Ss/4V
	 zKe3TdAGK71oRbCFi3o4zpY2hGuGAx+QobN4p+QfY8vijv2v3XEejLPnQ1+RyJzybhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190996;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=BgBJ6CUVuDyOS0dzt4aPssnaMG79dBUTTr29b/K++3g=;
	b=Zp/h3297rzyZeFP0+B5GdzFvTV3IaxNhRYfjbkWGTcswYMW/qv3/VCMmqbIrxOf08u7K
	 bw64BXxLL/i7lms4GiPYL1gg2TfwgTsxlZW7XtDufsCk/Lo29sYWKA0ijXMEz5UO5/l9f
	 XfDM3ZSnq4UufdMHKNwQQzJMLUGwG11Jg2RVMJqvzTPD7/WkL3ky/ZYuMMDYcJnVZtXM9
	 1g/LGsEm/agIEMAcUz1/Sl0uQ0q021DfWV2tRNF8vJmIKhtxj9VlTFl3VsCOrkM4kYPbU
	 lMP5She5TrtSciEwcs7nOBAWfiVcF5X1OaSoB+zc86R/3ChyiqJtwDt6JLoA685QWsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vxmau5jj;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A2606A335;
	Fri, 20 Nov 2026 16:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657A2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Vxmau5jj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1CC281A174E;
	Fri, 20 Nov 2026 16:09:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD863601B9;
	Fri, 20 Nov 2026 16:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB5F11BC045E;
	Fri, 20 Nov 2026 17:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795190988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BgBJ6CUVuDyOS0dzt4aPssnaMG79dBUTTr29b/K++3g=;
	b=Vxmau5jjRvGKeqTy8s2w5hz2z+I37fwJzdH0/hRls88knpVMaJSyWX6Na1zPSiUGzk8TRV
	lg6x8ghT8iyYx3WCkbNPY1oi6XmAM28VJxpSujZnE296hll7Br1Co0SQLAXyjH5ZLzYVfi
	k/2W4P3lri3qqPggamseSISGiffu5OAIMngmllY4Q+gIPWbuGvRSUPRxxypr8czjIFFwnZ
	KO7etjLMi5m7/t+vN/F0yPDp8adD6cBtnMwsfH7kwqhdxhzydZHJaUo2XxT9/IauvpJHLt
	aRaWuBipNk604qUGj5qn0N7wV9fPLqWUQWjoFxoJr9VbJnIQX0B6m81Zs26+Yg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 17:08:36 +0100
Subject: [PATCH v9 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
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
Message-Id: <20261120-paul-v7-3-rc1-edac-v9-3-470f2e6928cd@bootlin.com>
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795190968; l=1024;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=9SVHV+o8ynYqyNOtWMCOYJym55VEgN4GsfowviWy0uU=;
 b=zD5XVcuDgZoDSt2lLR1pGo4AJw2fMdtjYBglVktVngl+SeZdTvs7aANZeysnOi5e0qFPUN1bw
 ZKHVfQu354yAVmTM/1psedBOtgddOekaWIybqtxeqJN/c3Ez1J8rQiu
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add EDAC node to the SoC base device tree file.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 5455dccfbdd0..225549f068dd 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -163,6 +163,14 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		memory-controller@4000d000 {
+			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
+			reg = <0x4000d000 0x1000>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
+			clock-names = "ddrc", "pclk";
+		};
+
 		udc: usb@4001e000 {
 			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
 			reg = <0x4001e000 0x2000>;

-- 
2.56.1

