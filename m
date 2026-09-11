Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F617457E4C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125494; cv=none; b=t/26ejU8biAx6xWtINWu0t+pEQ0Es2cg+5M9y5yYzL22+KKntw9VfS8U7dKExMR625U/ELHv6jskR6xIUkC724ltQzeeP6d+JOF27IMk61C68bpYJfwqe9M9ASKEWQSwQhfi+7W/piqD+KLGSvwDRzROs9E6CUiHLYA90HcOVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125494; c=relaxed/simple;
	bh=4mxpI2/893Z5UG8GLLl14OQMNMqg1usOfIurJ8Ot5xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9B997CTKon8VYWT5T7j8pua0xJKNQ6z/i0rC63r9OHSzhbBkVGTb3fPoa8QqenGfR/HAuyfzRk35RK37B+i2bvcgx/n1v4FQAsI/2DcZEI6nfFB9dM4W1KY4ilArBi3k5SIS4+fQptCLHdIisP0SUAlEsKGu6K6aatJZUO8ZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj/J9un6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj/J9un6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so404126f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125470; x=1789730270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=Hj/J9un6I6+pKzjcLr8Ag+M3oBqa0r+mVSlQ/bxrTdt8KTJa4TF70FhTz0JYP/WuZz
         TL/w0nR7i+Ei7D6l5vAX0CoUJ9N0CN/2hzOH+dNJR5GjCghsxbCNA3T/S5W2rEn7qmmu
         bHzc50aCvnA7XhkLH9z58YfOsHZBAG41xvqqxLWJN2o3q30CpYgfUm8BLtKewzF5iedv
         2KPs+W/r8o6R3f6U+BoxJPgOK1DQbEZUbjHPtIk61SF0X9t2tgfbO2oc1URojnFPfDqO
         LJC8JOKJUGQhHveE601z/jOUFsw9O9iT4zGcLODCGs7fDH3HzfcPsXDR01m/e/SpmSJi
         WPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125470; x=1789730270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JeO3ig0BGAoWhhaLOpxWQIYCf0wbWpDn5BIfkqhUQfE=;
        b=XUm39UP8EEKNAwhPw4KvKvIutM/UvjubGTV5Bb9CCfyET05KQuvgIzkfKT6btdGy6U
         vFHaffKgc0WTHpjz9AeYQ7jXZdcLGl71xDIbkvR2D9+0utG5fz0WFm1Rs3yOHhdfMB9J
         xqbowPC/8EgGtpIHP7tteOmD59n8q5A6XutHR302XE7epZv7AA0ScJvbbElMofPCK3DZ
         ++TBK84LegFTkzLunPbwQ4AcoQQZJUSRViRDbGpe1Serl+7sRZMZsORXsX2EU7Nv1VmX
         BFnpWyG8yLw6hIEvFFo2eTlmQj8+C8pQkrndxFv2TVGjDGulsP+6OpLDaWlAeIPXGCYl
         wPCg==
X-Gm-Message-State: AFuF++ljnycq3GKcGPvpPreKoYueTkUhcCzIDTojiz6ctHOlRJcKTPZW
	mFskRjQ//6hh5IFTp02oCJKSatJo6K5neCBB8h5/Pj84j1oZdgx7n47Ns9Bt4FXsGgM=
X-Gm-Gg: AYBFou0tkLA/CQRJhz/aIMO4o9cct2o3fV3yIlFt/m/jC6nV157lS1PKPcITz8wL7//
	d2hkMJ7fIdyfs0fBpLFlGD2H8ydH4dJ83apRXCy9QlF8mzKcpeo0dpv4dxb9I48ez6yWbNb6qRP
	YpuCQIAUVVhabOHko9i2RUFd9/4HsqkEI2uaO7u3n+u/RcAWqWhGpSDVMukTtdZU3ry2LbaOM8T
	/96RQPeL7TGhUcWFy120WyOfn9l+pZjnX9C/xjPCt+0eBfh4cZ+6QErc49bmkns/f0VXB03ImTC
	f4/GoBWvTEzeDeERqY54XvsZnziDWzdzm08YAQO3zHFYnCwMu3QccpdfkG4BgsoDaqOtpWNjd5S
	DHMjk8pX70R+bK/j3VrJz3iUuMNgswPNnRM0KhsiP6aE+5ie92ocSbHMH11n3QXsPcTubeKfc6Q
	/c+8/8MzrcjrpSipkGf4gAr6p2Yp7//vaR5uiqGkTmIs10QAfRTl8rHpetks96lxTAjKLdlewvs
	XyNLAuYFuIcqutsOa4GbemH/fskrGWA4Dpt38QQIV2nacTW/J8oxany/9AFJ3WsMdNlKFn+VSCS
	26QQRRyyDG2tqM6k80U=
X-Received: by 2002:a5d:5f49:0:b0:485:b169:54fd with SMTP id ffacd0b85a97d-486eb1d388cmr7915145f8f.4.1789125470232;
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
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
Subject: [PATCH v5 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:30 +0100
Message-ID: <20260911111731.3404308-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index de20bed2797b..80910e0bd977 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

