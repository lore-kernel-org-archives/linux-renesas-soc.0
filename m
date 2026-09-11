Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72DC44C64E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125492; cv=none; b=E8fHG/5Q0XwEhvWdrcC0bfukSZf8sWWfFv9w0RNIKdjzB+3gHTdod4P+IiT20+TeCyDZ+ZfN5Vdd9bmhRFqSaPK1X66o6inuIthuwkt1kLw3d7hN/ggFS8KA8KUDutt+q5yPQQVyhcodUfg/gAXSWAamMMVYO7Cu485K2+nZC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125492; c=relaxed/simple;
	bh=mhbdJjLcWcQrWxoxCQqlUnOAIweP+fW4TKcbmVB9Eig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/DLeXXf1xIac2T76LwxhNDPc4ctZlL2PoltuE8ejUz8pPhepvfW/2Xixn8SQuZHuxNL1h6zE7Vw2+QR//VdaZ44mb6sURFm2arAs+idctE2SGw8A41j4vAUHAMKpCez+lFFVAhuRtJMon6fxqyHt6KweWv7fKzX0ZtAcbUeV0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErXaCt+k; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErXaCt+k"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486f282cad5so199962f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125471; x=1789730271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=ErXaCt+kNp1vI8oYkkLEyUfI99AKypmjL7CftTqJl7kG1PXLRQ3C153MzSFyipEzdL
         AbcNz163gszA8czf8VqJp8zcWgDGQTrX3X3Yuej2xNQdwoS+T4HZl3PdLLhvEDHgw61H
         DxENJd51k7d616osbajPG51hlKDqfSoFzqAB7+/Vqqx1ouJJMYDA76WbcMPJwzQkxN9h
         48ZUKNiMRu/NyGzZEw2mIMnqBWtSHSezI607NrGLQSA05JUnUWgWhyDGCCpYm2SPZ6O+
         zaLak4tfq1KCgCGHRCRIIrt/eGhA+DVzhoVnmi8H47lx4Es5IGoAQ30FfH1fEanaS6GR
         NR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125471; x=1789730271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=S4OSQBoY8a7m8Vac838+kHBeaK2aFZ6fO4cX5lDeKwnkNOu0+4kSEY0QJLI1EYQPkx
         m6JMATPJXzg8z3zjBc3lJ1kTf17I4OG9OsUFCTWZ3YEC+AsYe6DK8zQKFYbRMaUw5WF/
         Ys9zivH3Xj5CUOSL+0eW1eFNlzAofVJ23EfaBus7t2UK1vKSsLMD6agflhFUv+0MLvqP
         bIRBVHZ3gdF1+3ckAfTNpW0cz/Ajp8KQecGWnSyn1rpATu2Fa2I8xEnC9ykDP5duppjf
         m+em9GZto73T4kK5QEvAQ6C+kBicjsUGpDc5FtVAQOF4oarl037Xcj7EAi8cfiOFBY/s
         6UoQ==
X-Gm-Message-State: AFuF++nDlYHbVnJfH0u/Nl+aYTd+FkuTZKVuywxvGcI1g1gm4fc9kJ3g
	EZX9+k/zvJRWPk3OddxY84X8vEJ5mYkKzKuneYk+727Xhmyi2jXB1mko
X-Gm-Gg: AYBFou35hnecghXG9ECX9dWb4vedGK2H1p9IsXgtcGg7X0kncaW4c4rg1EeI14f8V3D
	Lqjr8NpcDBXbQZjdrsELN4GWZyOfne3NHSOESb7l9+GYhP97JPIaklL+a58w2a48VWSdtV/X5Ce
	2U3k/72jQRxRP0nphzKwHCstI3d+UIgU8rIbTsNBHScxqJqat8ZToT0xHy7TqJBtB78YoCufGqQ
	MGIte4HvW1IK1qS84B9W6aCKGYGPh6YP1hddMD/8Wbk1eWoEBDPnx142DFuFdtF03ODwrsaaYDt
	ShKnprfbyVq7Xygo3kf8sTakevYoeBLSwLdu6NdwLrJW8JIdMhey+753I4qsOIWHDdncl0sBfLQ
	EYM7JqV3HChimT/XRMx/MpuWSwOI+JG4J5i+5RKfbYF+9WLojb0zxf0RUeai7XZExZ+bIGZjChW
	R7hbjAwKUGKMP6NxnZOS+Dx7QvRPwopxXP0irpaiggSMPEfnl1a5NiwWG4zgTkVAG3YvrkD/gVQ
	1dndCG9QjY5EhDUv2UbhLmTCDhOvwB8XifIHPgtinsBmUrO7tbEbui6v58UJU+Y8R0W1DRiaLbI
	AXPaQtyhT+PHCX2A5CU=
X-Received: by 2002:a5d:4083:0:b0:486:e9b7:4868 with SMTP id ffacd0b85a97d-486eb2ee556mr3524487f8f.20.1789125471098;
        Fri, 11 Sep 2026 04:17:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:31 +0100
Message-ID: <20260911111731.3404308-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 813bb0cb021c..3ede2e89cf67 100644
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

