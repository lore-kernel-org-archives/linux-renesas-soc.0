Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539474;
	b=FpPypFDOusW+KlgjkEERltqodyPjABGUXfr/FE5CsQQ7w3gsDH3fTHEb7ASUT8dqZk02
	 uslhjmn04370vY1JVhmOILYnvNJzW7UT+1YmLDynFzTihShVg6vbFax+epGMbY26E8RqV
	 Mx+hbAx2w6WIhjm0h2roAELX2Rs0Tl/FTuRhO4bw1n4hUvoDf5Oj6LS38FdsoMHFZxig0
	 P/ZVxN92RoRLoAFproMkdA4gDBBBK4KUuWv6ttDSITsw4HTmj3E0dlopJetHO5QE/ROms
	 JwoRPkKh0W3jG0K8H69ATG1mCwKIIsFuFWjucgm5OAp5o1YB6dLImDKFgtXpW4gEMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
	b=LhZSb7hI0o/iC9hyZXAlCWDZEA+shkl0A1N7Kg2KpJ4z7pTcFDzp/UPH6jCr2od2OsnP
	 3betn4AF4h2rbqHeRoDbzB/dfYR65nhSKW8Fx7oKsccgPZiOloFbgztns7z78nET8/N0K
	 kHd2g5dTcmbWZEdCnYHeSOiVYt1BqWJTD+TisIPfwv29c5Aqc5YRAwVX/GktB4CvGgAU3
	 x4JnPj49dVRvBMuvr3N9grx2nGvUA0lHIchZEeJgXQj6gHsecXvpNctgt6JcEU0OqShWt
	 dGxkCEB3+y7ag/5SSn6wd8rBKoh6LIEyBZVwe4gVkD1Qkhjj37sBr7/8qF3ScU0apqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsaHbPqt;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7835606A682
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7835606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsaHbPqt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2743995f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539472; x=1796144272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
        b=SsaHbPqt2wiuZ3wFAb0oXe+C/9aNi3Mm9DyTRzhnZWcHa6c0/ZpSUvR2yMzbDhMdvP
         7hZ1NwNTD2xL4ga1mTU9NMTx1wSGWoUx3mL26v4XgOvTu+GlRk9x/YpcNcZdz6sz3vC7
         7Fwpgz5FfzyGaZhoFIjLBQT9XB8LhrnMJm+WUK9D7KCeqKx92ezp6VT9MkLEx8zkmbUF
         MRKLO4C+tx2YGl6SQPif3yRzt/5ALj/rix1TJ/E04ggcioYPT6SZbuZkblikiScs6dNo
         cpqVU6pHW+7kwLq6Eg1E44pARvoMP49DZXX2l9msZkuQyANQBJJb0QKCHd08NJjO2eLc
         krAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539472; x=1796144272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PdfVkJsthvasH7nPprFqYVw7CJ+aqmYwJG5DCNuqRU=;
        b=fLIqA93mtIaNeXxIxgaDWXp+sv40WJ6/0mGMaM5ch3CseYP+I8Lc3aJYE4JD5UmGuJ
         TL8pW/l4LOctcQ4RhdXsB1/4JphaPU41RQ3ChqOyJxGfms2S7GZeYRdqn07ul0Chm0z6
         DOEroCaUt49O1nFRykTrEIAdMREzl4g7jqR1pB+G5HBELz0XWgQn2ZiPzSQDzePcYagE
         sjVBtlytVu+AyAq6v+p88QDhqsW+nnUhSXfckcCmt31ebGqsff69f6SX6G0u4MUdy3Pe
         X+IplE6DmbTI2yTiTNR1R5Y37Xzm2kKYhZhEF81rsd/QwvvDE7JUD4JjwqkmtCDvLhYd
         yv0g==
X-Gm-Message-State: APuU4Z/7wXT4DRLDdABWWP6gDxu9SXZpCshtrBmlc71eQGkaBjLW2egZ
	kRx/QuUN4ppFU/H7D7RnWSuJNbkjVmXOxYNPIzPDH/YWnBNZRuiC0ja2
X-Gm-Gg: AZFdTZcASAifetldrnE+63vCIVEJIXUBhYWtl9dJ+GYcHTaa/a3GVu+D8ujKMfccVw4
	XNUPUKd1g/Qk0Hsih6nQkxzLVW8eSnnHHpziXGMFXNm1GTDeiw+z3Q7qHnvMwkf3KKvT8DcaUlX
	xgUdkikt8SyVwJv596kUvLK73AO4HjYMdQ+VfT9QaozYXa5WadhFM2EniszTmjxb54DSUZPJ4qE
	RY1Clgtzf7o1IMI5ohAXqor/z9VEtLf9pbl2ZuQZFxepGM4edBs79z95jNt5ihZSV+bExYJR1k7
	09TLciSkQ2Qbk55fxwMz79srYmdQxhuFbSW8aMCqgL/p3hXe1qMfTNr6wnDS9j+9QLoQrIznckT
	UeQiPxRGTTeeA10yd+15m8Q9SE5atuSrlPSj95EmOMiupPS6P1HjeBbJLa+DDNNPdfFHhSGTGEu
	cTMqV42I5Ey9SvEoyNHw/pFxm/dMuNmjsjP58ax09IC4wYj4ajzRAhh0bgb12pK3sNjVkLT6Gvi
	95KrWKjFvW5pHRlBZlGpcAX3imrsXHJUDiWvipne5dfca9vk34XrxR5k7noX7Wxdac28tzTMctE
	r7Zp6IDsl0QlT2Uf/B/PHbH8lnxTj13p3o184v3xwe81FSgbCtlqsadlhlHOl1VZJQ==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr336845335e9.22.1795539472196;
        Tue, 24 Nov 2026 08:57:52 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:51 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:57:49 +0000
Subject: [PATCH v3 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261124-sdhi_rzg3l-v3-3-67cdc83b7e48@bp.renesas.com>
References: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
In-Reply-To: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=4256;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=qbKI0AeyhYw63CPq24tjTlE28iA7J27+4y3ucU2nH1U=;
 b=k1yn0HdNerdQolOR4qFz0o5FQH74pwwLvbfb/m0s1h7x/2E5UYetKERmh85xK3Hb4HcHcct0j
 8gMF5HB1klQAgUJajviE7TsPKWQRGQ0rqM8qfee3tt0lbB9mrlIEtrd
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3
- No change.
v2
- Added a comment about the SD power signal.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 11 +++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 88 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 2429f09f4949..abe0ae7cbc44 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -34,6 +34,17 @@
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * The SDHI power signal can be controlled either by a GPIO hog or an internal
+ * regulator, so a customer design can use whichever matches its hardware:
+ *  - SD0 does not have an internal regulator, but SD1 and SD2 do.
+ *  - SD0 and SD1 use GPIO hogs to control the power signal on the board.
+ *  - SD2 uses the SoC's internal voltage regulator.
+ *
+ * The mixed usage is only meant to demonstrate both options. It is not a
+ * hardware requirement of this board.
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a08g046l48";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3l-smarcm",
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 5e67bb5752fd..7d4d32cd9d33 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -355,6 +356,74 @@ sd0-data {
 			power-source = <1800>;
 		};
 	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <3300>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
+
+	sdhi2_pins_uhs: sd2-uhs {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <1800>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
 };
 
 #if (SW_SD0_DEV_SEL)
@@ -386,6 +455,25 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+#endif
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";

-- 
2.43.0

