Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77618437840
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112834; cv=none; b=Kipwo/wfOXLg63AtuvLHrjZwkAA0f5ioBj2SyD0Xe6XbLj45+YuGcWCS0IQT2mxFhlfDsP6UoLkfaLs34INF28RnnBezvYqy+SX33+8RAbh8g5xZWbzQBD2PmMHAbCkl/FLTXl7Wqfpv3iL0b9ahgtg64TjtK59rVIiXI3CqkQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112834; c=relaxed/simple;
	bh=F0uQNzmNTXF9rjajK87zaDKmEL2/OE2yJTgrZBuyqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/Iyu/enMxhu0l20dHWw4rsd85BZ4cmQTX+nt0CYO9oI0v85meg2BbOaYI/NK/gzQVTIaMewH9feAUZ3VQiePYjwdkPRmQyrtZrjXh5KcaQeGa4BOEiRXvEnGRDb5engd9IlfVhzD2jxQH6XS1NAz//9QI8Qul8Tw+cTxMS7Z0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gxmwu1RD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gxmwu1RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mfOTn0ePsmB4nLPFoRzXyMuhBLF2DEttVWXrsn8BDPs=; b=Gxmwu1
	RDbxEw9Bv0h3E3JjGiVpFCrTjgDrczP2htap6jjOTdjkEUFpuZUjQ04z5fUWbyf3
	XVDAibkPK3joHRpe7Zcvcbm+3b/9XH+rv34OzxbIVd58pJ0yLm8IozRb9xuVeX3E
	CmIopSAgKeRXCe6vK+laRdlenYnEoLIrMD9JwOrYB8HwEENwJ9413WNZ2dZGoqAG
	xlUfCNYRAo8HyyAxHTVttcuXmGg2asROIvnZDMcvJhCd3en1xC8DLbdfLOJPrGbh
	HUA7kvLfZ4MTn2dICrhfr0WGRCM/D+ct/pcTeMRMMnnS4afgI2wfVLnqhxI04uz7
	N8kMzokYsDIxSUwg==
Received: (qmail 654725 invoked from network); 15 Jul 2026 12:53:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 12:53:41 +0200
X-UD-Smtp-Session: l3s3148p1@z/fvIqRWMrMujntW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: renesas: lager: specify correct connector for i2cexio0 bus
Date: Wed, 15 Jul 2026 12:53:07 +0200
Message-ID: <20260715105306.25147-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is located on EXIO connector C, not A.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I would put a fixes tag here, but I recall docs don't get fixes?

 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8e7665501675..ad12c46eaed0 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -302,7 +302,7 @@ gpioi2c2: i2c-9 {
 	};
 
 	/*
-	 * IIC0/I2C0 is routed to EXIO connector A, pins 114 (SCL) + 116 (SDA) only.
+	 * IIC0/I2C0 is routed to EXIO connector C, pins 114 (SCL) + 116 (SDA) only.
 	 * We use the I2C demuxer, so the desired IP core can be selected at runtime
 	 * depending on the use case (e.g. DMA with IIC0 or slave support with I2C0).
 	 * Note: For testing the I2C slave feature, it is convenient to connect this
-- 
2.47.3

