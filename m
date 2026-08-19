Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EBB3CF046
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164737; cv=none; b=a7qCFxn+G2XkMdLpgFr78vsLlusXdD/jieHWTtd6/cXyecEgcTi/8UiLI+EmeS2nsXCH/6F3DQiyRZnqoFCsrjTWTrQ5RvLnMZr+fOiFnhquUKG3e8Fu7MHAcY4Y+gqwAfcoYSlfyxW/E8I6XL6OsbEUj5wv1BG4YV00wYjSb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164737; c=relaxed/simple;
	bh=iED9Ka0q3u4N57Mjkn91kZ57Did45EzDLxGyMsmAIi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Em6sSImwVbRhx6D/A7Ka0kyFtEi1oDfg9yx7YmHkFNO2lpW/ofryZtw1/RugvXe/A/eLLDF41qgh3fRkbSOerZ5li38+/tzlYEt/SiblYO8TWtxMF+uYQ8Y5vVIBchUVaPtH7wGLFh16KKMfCU7WXKGqKXcxCrSZhwD/NC50tWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwOKaqAc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwOKaqAc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc61541f8cso2276495ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787164735; x=1787769535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zal5FIj7KYb4C2CN0dup4xuER9DJ965auDsqGLuu9dQ=;
        b=kwOKaqAc4CDCHqjDtT1TUnq88TRdiz94fdnV4dTOVpe3A4W31iBAGcdFP0jst0T+Bu
         RSHhZupFux5i9fSf+VsHfTvlBOBvFYoHYXDTmyEbpb8L7HgCjfeH1ElVM6ZlEKQeEfxV
         7CrcEWCo93zD/q4wiGm5WVVhvt/B1qU50GzYUXeEXn1eckUZ82JznnVR/ucJTkhN2o8K
         PbMP+db/rPxmCkK4ToKFhmB5eiKdCOUNQqjwMYcmaBkM7p0j7NaaDwpSJ4e12EUDglU5
         zwY7Ob31/gxHOOmiupEVqzmZc3y8ypDgRgMtH7RaiEFDceDbEzZzr0CmacqOaahTDHp0
         79uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787164735; x=1787769535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zal5FIj7KYb4C2CN0dup4xuER9DJ965auDsqGLuu9dQ=;
        b=HvLkvGJPGQNr9nQdUJftUMqtfrLgFahgj+9CYgKVm19sbzeFcqjrE9Dw/KDz5hujF3
         d5ImQbNbV9XMGaltjTU8nvngEwdiw5YkGrwddTySXZOkpEGK36znT6lnEYoIM8x9ceKL
         6dR6vQ9GslgTfsPCWr2lzcnrQ9pIPyu9h0i+34kAuBeI+UUPvgqSAnhGX6q0PL2gMEiu
         Zj5Bf8M4vbqJ0NUotuYSgRNtTPGm/7G0ynwIaEe4Df6S/Rl+mq5d9WmuoIk9ZbLszt9a
         OEB/1zd2Ms/Dk794AqRmFqm/Ox9MnPdOQYMAujvJAgFXI4WMwLCosBoiqhuc8//YEmSn
         yDOQ==
X-Gm-Message-State: AFuF++mvZ21yNi9SvbxT3A5l2e/223yRVSnygBlw/6l0pn58PrRGAHIC
	VgHklmFrfKGBx3/PIzpDzfC3ys7PSyMXya4enkquT3zbILNZw9ha642H
X-Gm-Gg: AR+sD11lbJ5i/U0ljXjrIFbAQpxyS9Uk6Oj/T5U6XqYhi2nOJCxwkkzK/jIrkTwvaA3
	echWPy2CKFujJz60w6+upteVIntxM07u8VMCQbEldRJ/xgitk2T640FmX5WPG0Y1YL+gtcKd1SV
	K8R7ionAUq6Jg5/OBNnAiXdWq0m1h2qbjtVYHpIq8ZBRACMsFcEvSnXP5LUprbFMrPGnrJMhiw6
	F2qzrQWN+S2VPlpKzG1VVMQvKrVHvgHgCC8vbiUaapxT7Fdvd+G3aT+upYYRUoeI0ue7hz2lrd8
	tFUEgvK3bvpj4as0OUpTywhfjOou11IgunzRygnCaJDJRXZ75i65Ovzoz3u5+/djU5VZ/T5DNGz
	pvDscxhHXCrBK42vD62tS26qmu9VAvzaNf0bmfId4Qf2UcagVr7wPRD46ZF4oep4Ae6imiX3og3
	r+oJwPaWMfOqw9pq0p1AFQKoECZI4mYHHIxkjOYT/0qFmooGR2i0Z8uC/uRN2tcCw/jQvsiwUMs
	Qs1wUnVUGfAyIMqa5ij5rn00JfB0CLYIl9W77l/tjdm8kdiDB+GBlPLqem6X5gtwAQCNruvgTLn
	OoFXwDw9Ag==
X-Received: by 2002:a17:903:19cf:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d61a15e3e6mr12315805ad.9.1787164735124;
        Wed, 19 Aug 2026 11:38:55 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm1759393eec.21.2026.08.19.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:38:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] arm64: dts: renesas: rzt2h-n2h-evk: Use consistent switch notation
Date: Wed, 19 Aug 2026 19:38:28 +0100
Message-ID: <20260819183829.3953529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The switch comments in the board DT files use inconsistent notation, with
some references written as "SWx-y" and others as "SWx[y]" (and "DSWx-y"/
DSWx[y] for the DIP switches on the RZ/N2H EVK).

Standardise on the "SWx[y]" / "DSWx[y]" form throughout both files so
switch references use a consistent notation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- New patch
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 18 ++++++++---------
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 20 +++++++++----------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 572be8aa6d7e..d21367cef534 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -69,7 +69,7 @@ keys {
 		compatible = "gpio-keys";
 
 #if (!SD1_MICRO_SD)
-		/* SW2-3: OFF */
+		/* SW2[3]: OFF */
 		key-1 {
 			interrupts-extended = <&pinctrl RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;
 			linux,code = <KEY_1>;
@@ -100,7 +100,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			/* SW8-9: ON, SW8-10: OFF */
+			/* SW8[9]: ON, SW8[10]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -108,7 +108,7 @@ led-0 {
 		};
 
 		led-1 {
-			/* SW5-1: OFF, SW5-2: ON */
+			/* SW5[1]: OFF, SW5[2]: ON */
 			gpios = <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -124,7 +124,7 @@ led-2 {
 
 #if (!SD1_MICRO_SD)
 		led-3 {
-			/* SW2-3: OFF */
+			/* SW2[3]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_DEBUG;
@@ -133,7 +133,7 @@ led-3 {
 #endif
 
 		led-4 {
-			/* SW8-3: ON, SW8-4: OFF */
+			/* SW8[3]: ON, SW8[4]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -141,7 +141,7 @@ led-4 {
 		};
 
 		led-5 {
-			/* SW8-1: ON, SW8-2: OFF */
+			/* SW8[1]: ON, SW8[2]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_DEBUG;
@@ -149,7 +149,7 @@ led-5 {
 		};
 
 		led-6 {
-			/* SW5-9: OFF, SW5-10: ON */
+			/* SW5[9]: OFF, SW5[10]: ON */
 			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -157,7 +157,7 @@ led-6 {
 		};
 
 		led-7 {
-			/* SW5-7: OFF, SW5-8: ON */
+			/* SW5[7]: OFF, SW5[8]: ON */
 			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -165,7 +165,7 @@ led-7 {
 		};
 
 		led-8 {
-			/* SW7-5: OFF, SW7-6: ON */
+			/* SW7[5]: OFF, SW7[6]: ON */
 			gpios = <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index 4e57d4fe195c..76e30a6ecb8b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -120,7 +120,7 @@ leds {
 		compatible = "gpio-leds";
 
 		led-3 {
-			/* DSW18-7: ON, DSW18-8: OFF */
+			/* DSW18[7]: ON, DSW18[8]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(31, 6) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -128,7 +128,7 @@ led-3 {
 		};
 
 		led-4 {
-			/* DSW18-9: ON, DSW18-10: OFF */
+			/* DSW18[9]: ON, DSW18[10]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_DEBUG;
@@ -136,7 +136,7 @@ led-4 {
 		};
 
 		led-5 {
-			/* DSW18-1: ON, DSW18-2: OFF */
+			/* DSW18[1]: ON, DSW18[2]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -144,7 +144,7 @@ led-5 {
 		};
 
 		led-6 {
-			/* DSW18-3: ON, DSW18-4: OFF */
+			/* DSW18[3]: ON, DSW18[4]: OFF */
 			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DEBUG;
@@ -153,8 +153,8 @@ led-6 {
 
 		led-7 {
 			/*
-			 * DSW18-5: ON, DSW18-6: OFF
-			 * DSW19-3: OFF, DSW19-4: ON
+			 * DSW18[5]: ON, DSW18[6]: OFF
+			 * DSW19[3]: OFF, DSW19[4]: ON
 			 */
 			gpios = <&pinctrl RZT2H_GPIO(14, 3) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
@@ -166,7 +166,7 @@ led-7 {
 		led-8 {
 			/*
 			 * USER_LED0
-			 * DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON
+			 * DSW15[8]: OFF, DSW15[9]: OFF, DSW15[10]: ON
 			 */
 			gpios = <&pinctrl RZT2H_GPIO(14, 6) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
@@ -179,7 +179,7 @@ led-8 {
 		led-9 {
 			/*
 			 * USER_LED1
-			 * DSW15-5: OFF, DSW15-6: ON
+			 * DSW15[5]: OFF, DSW15[6]: ON
 			 */
 			gpios = <&pinctrl RZT2H_GPIO(14, 7) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_GREEN>;
@@ -191,7 +191,7 @@ led-9 {
 		led-10 {
 			/*
 			 * USER_LED2
-			 * DSW17-3: OFF, DSW17-4: ON
+			 * DSW17[3]: OFF, DSW17[4]: ON
 			 */
 			gpios = <&pinctrl RZT2H_GPIO(2, 7) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_YELLOW>;
@@ -202,7 +202,7 @@ led-10 {
 		led-11 {
 			/*
 			 * USER_LED3
-			 * DSW17-1: OFF, DSW17-2: ON
+			 * DSW17[1]: OFF, DSW17[2]: ON
 			 */
 			gpios = <&pinctrl RZT2H_GPIO(3, 0) GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_RED>;
-- 
2.43.0

