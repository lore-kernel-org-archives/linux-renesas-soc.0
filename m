Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807F51B164
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679063; cv=none; b=ocin2J04Pbz5XMko7qNhmamDd1mqIiil62LdVwsvaFJcMmCKcH1heGN6sWMB9e3vB1kft7quMxfkn3oy2hX+Qql/xccA3KuTb/US0KmJ3T0XywZt5hi034OWq1ZSrc/Fkob4rcv7ksqbolnQEwSVia6BobAEpDmQ6ZrJ2RDMXiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679063; c=relaxed/simple;
	bh=TOovBp7AJBZftG0dksjLHjN9+gQXUXQNB4O63AGk+ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdT8TN0VDX+Gvv5fwObgBTGLujJUZ2wU85Ce6bx8B+B8rBdkeEE4wb3M7HQVHDKx0gRZOOoK1v0Ue/wUi2DsipQwyVf+yGerSJ5OtiwPtzr1qm0NORzuvHkvS46Iu7zra1rHF7/n3VDeb0byAs27+s+AWcQPYHks+RSv7sZvyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy5Z9o1+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy5Z9o1+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so23650045e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679046; x=1791283846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=Fy5Z9o1+6rFj/DLN5HPvef30XCjxQw8YdkdmsVgTljsFa8YSVTW4s8OaIyKKA/LCCU
         K217Q4NoQglY4O4T+DbJA+BZAs1Sa3+nta761vifETRk7P40b7tZOSyVlzecwlIdRU+j
         xHFetuSDWUJ3JVi5gOlfcBZtt7tPoA2qHbt8sax1a7CWiv0v0b+1paUawzmjvWtuvQnG
         FModt5W7Imw7nzlKa50hQ5QVexPTxmENbkw85PGc7ZuNR0iBgKcODwOSZzcHyeQXp2QM
         Qofa+MWsuNJh7vwStLC4QkK31YcY51PaGXGD5wvgJbpbmgBp0Htv81ilKHTBC8/iAOlt
         mGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679046; x=1791283846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=LbBLbnPWLiTbfaw/8r6Ldr8K8DIaZlokaYeDr5IVGobURvernuSN+9Op/HTkDqtBRx
         JLdtuWuke2z9S/nJ6/JCPvU4Ovr37C8R7QSI9GQrG2UcKR9aZHkx93VRRuI4ZfvVFcai
         ePDPVTvwDvRJUwIKkmOFzL9TctM8q4V3DCg3CLm47G3UJp0ZEDGMOl5skxX/JQ0imFey
         oeKHC6S/PpVb2BHerYNpXeYH98u1ro/BNrEyOzCIGfjqgpvWwEKUFvzNHKq7Or9CmERN
         FoaMMcM9m3eX8pJq1B5vMQtFt55gG8XzMXf/MRwY/8WpVV4jlXCGePpv7mb9Q8GSsOyH
         ssxw==
X-Gm-Message-State: AFuF++nnabobI8bmGMsMnlKsWYxDc1tklsz8c624Clui69yxdE+IFY0F
	/BuEAoRNSygwk07ZMMbcX1ZYwLMQVOOTp8dSzfPdlONscS4G60ltYLVh
X-Gm-Gg: AYBFou3utOOAAwD4CvfiZq03cPVcmfGkVefsG+haSEEZ2TKHMWHy2YSnaJ22YphCojn
	CDldvvStgMpKITJ5sEnkyNhKQxi2ECegz0uoLKg8QuKLFBrl6pBmF4BuBFonyvAP/zHq/xhxlBG
	r43Q2n0Mx2CUq2e6geNBjYbW3ulCsA2BdJsx9D7LrYEbtIoDHyQVIJTpXczkCVd7/d/O0gAGuDz
	4QgJcrC2lkZ1MYqg1cxg2qyj6rrRd2MGHUKC+XKMtwL1/SluqVHei1h+J2GbUp+XyOhd/oNLLk9
	o/hNsyNNuO+46o9Nvu06iR/VkFgigJkB32P2g+RXjLk9xlB61ja264hrXq1n6nLc4jnHCW1HKkf
	DuCuE9XNMonNh9WZ8eFJ7D2Ic8X9r+qpCT2Az6WHK6jPv28uXk2k0KfAsT/h79jB6k/LJz6i+Y7
	AqInhsZY2iHEzG3jbLLEtZGbiDgrKnLUlWi45PJmRgxupe2UUWrhuphce68LuZgnl+3y+64GBca
	q9Afv7wEgiDb0+pp/0UlERZh9a+UrKFcoRQeaj6Hpgb47Jkg6B3F4qdmMTzkepp4d46UWhl/mBV
	ot2454A8UW08R1XzcdwO8e1lSjnQ
X-Received: by 2002:a05:600c:c48f:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fe66bdfdbmr282392825e9.2.1790679046003;
        Tue, 29 Sep 2026 03:50:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Tue, 29 Sep 2026 11:50:21 +0100
Message-ID: <20260929105021.542730-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

