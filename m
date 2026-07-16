Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704D41F373
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205295; cv=none; b=MH3Fvjdganw59xJO9XgcZ8PwoCPWRbN+rcvO+NuE4fK13Ho95KTaO4Yedq8mHtM1G/H9qqGuNann0uQ9/LSICQvmNa175YHI6TF4P+OAcWp5fhtVHeTpltKpVbUUiSmyvBjofcAaRX4RPOjb90xEUlynF/SjnJV8XYc5WtyIbV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205295; c=relaxed/simple;
	bh=HHq4zZXJ31PucgbPcI9vveGvRcm9kJwMFQOFH7Zu84M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhgIgV3KiR/VzjcNBx2ZI0Fyo9VHGU5Ow0mmXcClfgK2K8h9H5xO3K40DLpKTj2CtQoz7B66a3CSaWjJIiyma9KALU16nLPQpDCdNG1YTL5P4mxH3SN0NdydEOlQGyLtIDk56jn3qv5C1KA2ZMnP7QQkR6/xqFg7NeK6JMM2hGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOKhDd7C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOKhDd7C"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so36279905e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205289; x=1784810089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYZoYOU2wxBr2JA/EFs2Nu40Y+X1sCL5bFMYyH0wjd4=;
        b=kOKhDd7Cgp0Fr9q/6GT9L3llrATZl69Xmqrqr3kajA/efu/XlFSUluQOO+6eGFYxoQ
         tbfYTLXQRh3ar6vJYWcEcs8L+VaEoR51YSmaL94YTGicgjgmguBcsYZAR5yNsFS9VeG9
         DMKTPxkSwRyOL0+ReBO5/D4blEi/H+VH8bjiUoUQIlxjE/lN+1SKhXZ3hH4VUFGJ4vzV
         G9dnsV0QIO23G4aJ5x+us68HeBoqaqvByBgbAoVNXExac2Y7IL9JStIHhEuWVUebQSXH
         ef2tE0uRZtFxlVPRVxf50pnMvTqiMC2MQsydMhE2Szt/ardEv1aFl8WrvGgVfmnXQo+N
         u9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205289; x=1784810089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYZoYOU2wxBr2JA/EFs2Nu40Y+X1sCL5bFMYyH0wjd4=;
        b=S2o3txHLyhCZZbfJzfwtmbmj0cMLlifS2JltUX19D5JnR034b0eGgGHqj+nV+4+y0o
         Ki+nVCTCmXF9mshomZ/1NcsD1Tm1CR0mYBMNorOXotZylNOVzxhcIk77r1QDu5HeEJFA
         UgrVOM8tCenQWfAw1fEpuotSbZu2Ko7cjBlpIEJBauUYBy1UPHaXTA5UQ8+vKxwPC+t/
         pY2Ee2aHZUpE0mfWtbVexDR6LQmk7xAJ54/IGYkDDI3z9r0zZG0ptuA7RryWiGbPhnZG
         8AbHmmY2mN9zwbv3BB9pOeSATPUVASQ7zKYnZ4bkSfnTfR0J1O5wOrVZoiRo5OIoCdq8
         vH3g==
X-Gm-Message-State: AOJu0YyvaqVnT8sxn43dB1YQu73mlVtUCiqb+PFYwOrjOAM7X0yFnk2A
	AdscuoKXOpK+sh9zGPbjzJIGVSkTEyygvdUgyDhEa6f8+Ipc0Codj0Nd
X-Gm-Gg: AfdE7cmfb9ShfflHx59xKcVptCRRvH9FYuNPixLedC+Ux1JJgv4twGe2f2vh+NhDkjx
	bkMp3yRjx08OtZtYcWj1uAPCktlT19+ir7arB476cdlQT8Klu2etg//9kpcQoHB54Urp3/lHFfl
	r2yFKID/rc96PzWaUXRp8PlD7SH17IfbjVR9XtOUzQZkMpy/9rweUz+AXtDMkipZs/wQIHd0yoM
	962ZTJdsRff7vVJIXYWZA9hemzFhFSF0bsDVqoIaR+duXN8AkKK5i6UDfmzip0Ueq5MfPdSFrak
	4+AjxN2/FLFoBHuL5ABCMLb7I3eP1HNdFLsdNQ9TNy6ftzoHUr0SnBPciK+kRFWu3Ma9chFJ0DB
	oKwo4ZrwVMIgS2rEDlbg++Ffmqh3M8DzDAnWlYjFnbkd61RNdFJUByG8zko5saowzXVQmw1ZGAN
	6qLbzXoJ+4LNDywp1yp3jsdbG8sRQ1+6pbkqS5u1+iyG4gQH00GDLETC6IFLeOv9GPxNPh7G7kW
	Sw1aQQw1ZW5IYoJBiMG8dcP/+s=
X-Received: by 2002:a05:600c:4fc4:b0:495:4505:daca with SMTP id 5b1f17b1804b1-4954505dc97mr15870485e9.9.1784205288361;
        Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Thu, 16 Jul 2026 13:34:34 +0100
Message-ID: <20260716123434.2576253-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 718e6c06b9ba..2a87059dd494 100644
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
2.54.0

