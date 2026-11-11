Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=Wpa5VhQmbCS4lohibJQ7B2q0L3eQuI2ABLr8S2F8h0vCMVQ7pIJmBX24oAZnEcJdYnUs
	 LVwFdXlwDZNSksUym3k1cjvc72nhcYB7W9+quMunSkgHJpzS+uZ/D6hOnePweC1c6Nh+1
	 RpuecP7EEh2lJvnHMJ48LruKeK6iv6C9oTKFo7y+a54zXQjEf+atPUEZriscrjpLaFZmD
	 kpqu1CV1oXnOH3ZHcEreyvv4YxQzQFodU1GEIyRolIi0NpFgEYALlv7U8HTYu0DF68yIe
	 jtXn4TUAst3n4woXchSarWHLyj8aocXGc/FLnjmtwvfF89JGNAAbekNfAXgIURXeDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
	b=tzjt9N9BHFXUFvwzzai0kWaDxT3ygU4YVz/aMAnXF/Y6CEUjwaSrLNzpD2l5MT8Tm8Mn
	 kSMYuTVGOJdLSr4B3yDBFKYO/G4aXAlZKX+yteAxOPazbvFAgzwoT6BWKqByXR00x3Ynr
	 4x3UmdorPYriZUb/fUHOtXnKr2MBwfvqIeaVHBAC7RaDGeC/5IQ5v8Ck1wG4JONDCRWKh
	 R94D9D4joSjHizbCNdY7wgwjsHHyoZ2o5m6W5iBU1B1cbWwXeDi1YlvUj+U2aXp9WMIIj
	 jMJLiRCJmKgipL7DpKAtjfAmPt9mfwJtzvLbL2P3Sb0S0cz1QQ2aygiJzW/5ERV5rkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE02606A8AB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE02606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30661995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395245; x=1795000045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=KV5BJQEaU4htQDaRkbnxr7DuDzj4kgGeEfhToTDv1CrTxoIOjCIvWU3RBgL9h7DIgL
         O6wMLLwkNiBHGmNNJu7Tyy8SwnIl62SQ+7IKS6P6JBf6PoR9tWJptCpon2bwWsWqshKD
         y7JxqYFHyvdoC85pKBsbHEIVXnvHa7S8iQVQ4G6ofsFRtRgVYmQ1jLkhd7XmzWlgVq18
         LFznO4HsikwwUcUedN+JvAlG1eU++1ioINed2uxEzcVV1uQcsWLBDemePUSTN3ecXts2
         cIQfkjI28RD63/5CulQjxKYwgHxd6gcIoULHhGSq7T/TOvB5okJernHgXYLtXyfl9yHd
         YCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395245; x=1795000045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=cwwMFyOd3Z7NaVh1mhYPA1LtV4cRcW8mT23n3xYESYp+AGvKdZsVb40R5wSLI4fTKm
         hP+JTS5eEDVPNR3v06Y/Koc5cwTTlU2KDvzWqUVuqC3xaeGRoD0x/1t7yWLELbqYQyLf
         xnXZ+fl3KAS7RNDDArZH5jErrMGl5rF+o69FGOHxwJi2M61OvRshnVhvw/mC/Ut+UTMf
         kQpuP3+rtnsJfh2M+NO9Cw53EQyHy/AuTEgqPg1BIglE4dN1eT6sS0KqatUilOTEnWrx
         kj9sIceo54e9HLcKMiJUeOkHDdYDx1maSkImxva5QTbV+XLECX4v9DAleXZXIX27sypI
         9GlA==
X-Gm-Message-State: APuU4Z+Mbi+6icEQc0CVrEo3wiU6VDbOyjZes9RmgcnI4YCw9NZK4CUz
	cdKxMPQC5CYEZcyBnIoeTHB3RoPLM2O2fZBeJx9Nvjxazpt3XwsxNJDV
X-Gm-Gg: AYBFou0CxaoFspzT23toEkPniHMtDiQmiZPTAABQ7rwo9nJ750x/e4/PY34ALJcNZkV
	OQ2d8AaUSGi7UKjQNzXzGcsjLlPqvotdZdbIyl6XoY8ZVHsOENsIxFGqSQVJchJY73UQRybbwfS
	/MwCdgkybu/YSu2JXnxMqxDjQjHW77Rt9mIL048z8z2YMdXxfj80kxvEhNvsQikOmMAQ9aji7e7
	P+1l7cMBXsoLTpqo508HtVyWnKnWZazD8SnaOsMq0XVaPoGTDBiHdQyIxJzgjGMunWJDKLGafdm
	OQxmptlqB7EwBe+IT9g6bWrALXJRZ53OhfvparBEqajJW/zb9TAQNJv/UIX1MQABHDGOBIoUi+/
	gXF56vkBMaRoBiYGajU8dU4633LqB/zT24Gf4SNzrTcEHYuSmeYrEzk+4XqH/y1xUJBFnC/MpCU
	QghJqn14BzYVWVnkI8pnqYZ8nYEfL8hxotlMOJ57LZUjg2AcDHEtaxD4oYAFvwWkO8v2oiNGd4c
	xeAdjT0S/BUfu2At7OXvo6ukRfsEhJjSoq0UtdH9qiXXfUQu0IarJYVP8dediermIPQwTs2IaG+
	2N8LC9pgsL0ARtLHaXmrpeHu2+8ggoQWNGC19/ZozhMbrYocetvxrTlFsZYwW8qi+YNpWeBe6Ag
	uZm6UwgdBuyGJArbTfIdx32aIDpt6J+upXsJeAq8mzTHOVr63bA3fkFxrGDCuNFtFa6zrqndjuF
	bJcbAWCrzy
X-Received: by 2002:a05:600c:4f10:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4ba093c53e1mr41140325e9.28.1794395244647;
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 4/4] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:07:00 +0000
Message-ID: <20261111110700.3331225-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
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
v8->v9:
- No change

v7->v8:
- No change

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
index 243b851cc0f1..9056df917a2e 100644
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
2.56.1

