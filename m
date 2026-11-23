Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442283;
	b=VqrOP2629lWL6bEILk4JBGGA/2Mp8MfMK4jxLQTjjw7QdNQIyDVeQyOdXsqgVPgA6L2a
	 dvCPmP0aoE+JqJtFLXR/RLwZfPO1hOkgK6ogmeUAEy5YeCpHFnjMFiEz0M8POXvPzDa0z
	 WqerzVSUmizKhBXN/TJIs/r5gkb6rhs26RIvWnhCEG/eXYT4Q+DTkZaXwu22AzS2uUQ17
	 eGchXbWpSIMK4gdyUD3zS4A1uESdZVNoKh5BGVPCyJ/e+No7xg6wj6wDGJmy5u5IEE1Ed
	 1t2w0/ty6RWH1K8yCuhlKbkiEAScoLieFt5CiCX3lpA2DlhICwTkrG/OHJNYXU8TXmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
	b=SqRbOgnFdcxOQH6CRisKNMz77aE2NdzlyDbf3jOrvwZaVjON7g0eSmJ79bvG5s/BB2Bp
	 F0d1zrNmR+MdRhaY6NhdxctznbLcwkrINwyfL8KNbr2YQK6CifAiLpIQ4lrbC4qjY65yj
	 vkn/JVhrMhaGV3L7h9x0NKK2VkpDRkrdvVBLAyo8ZhaM1KhoEU8thiWJDd9XAyY9CaIfh
	 8P6kdlhVjLuHDI2DVxo1nj0Xi3nvvHP6bUGGf6ooLjeUUtuvMHL7DeCYbqrD/ppaDct5O
	 ZwLKqYSgWA5l3OChpA9gwdtrcb2EGtFqc3/7v9rTg54ZJGQ0rtNoWdLfgcij+5qYy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9A606A6B6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B9A606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEy3pcRf
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2919667f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442281; x=1796047081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=sEy3pcRfo8cHflY2T7S828p4717fDh7JpH1WhbLZ3kQUrh/oxE4KRMjg8ZhO9ERZD+
         ubfr+eE/zfEmyrgXj7IcdVVJZZHulIs3OGfUHnlaFdRRvWvOtTYhsfkzKmpXJilNcnLZ
         nRxKCChVnFAwAD9Rrxaf0M2kjjOJcHD0ReQDNia6fMazPiqm5V8m3/emj3ezbbIrr8fE
         M0xbRdBEV6q9Zs5cxgNVlyKUBVcjvbleDkf8jyDal0S+jbSnbeNacUaz4LqTTfpu5D/E
         eiXNzDlrLwQW4FsrA8MeV5SwuP2FR9fXtBbsQJkaCGbEk+bKhC225XT8OZMKyMFpLRoH
         twTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442281; x=1796047081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNrAG0FwlseYPe/ZdyatSVBSgZTqm1Xim7o4c6/vvS0=;
        b=sEuR3/NbAYKM/JTVBvZzMH9SbGpJgzskfkJKupY6rqVqwn9qeEvYbH+1lCNoccP+gk
         RNB8KsIX3N2trrtI0CRQGSEdgoQ25wjpcHZ8zk0d/DStjuea+UMD+jl5wekyFwjYht+a
         jN8NXgVFjXmHVHzzZDpreK0BYxgx9wtdWzEkvGansyOxwdd/Qhvm/DtViSIhXoEE2F7L
         TSQY2dNoTtJTsVuqO+o1ZPoqIEcxMHAndaHLrY9TqdZsYiprczBMI0vQqcj+ijbxgjKu
         meB6cW/5mq0oVQ3Ixx9b3+XHzIO669hLriIAvQeHgRglGOJ+bnsT8a9xF2/8WnHau4JR
         R8AQ==
X-Gm-Message-State: APuU4Z/FeUaU8IZybypGwA/SpeaRHLcGWinvQY+M808agGwC58PtzN2t
	v5PhH00FIoQqaM+QTAn28lQ9OgZGyNto4vhvetDYwFPUuj/LwdKWCOClLuTPHg==
X-Gm-Gg: AZFdTZfEbfYQHASNwSqo/z/6KwHIFgQZHZfA+7z/+76c6dEvA7kdJDSR4Ls5TbbiLRp
	n1HMBsMnbrzbYViA3AhL4PJ3TmTPX013HHjkbFL0SxJzi1EH2NX27iIyYHK6yt48l0E3Djggkn+
	cjZWnYdTR3vNigvGaTo9DGTdEgZ/cZpybJr4S+zhQPYmt1i1IIP9OAoqS61VDBb22gvyfxuYtA2
	CW0/JXsRpwUhhJSTPznp+BXOgLsVtSaL/6sPmimK5JA8ReLJxXK3UbmR5Y1IRU/XUmi0b7dl0mq
	NsyO2mHNmmupSbwBmb/F7WcJPDpW2gni6xjh7S5iS2Fn3n4/k0pGNA9FPuBwv6z7zotzZExa12K
	KuqJEggOdbf8yVnFHxa9Alo1FKNHV/cnlzCMQKtsMua+Vl4RqPfzSrcZ4XqTLeOrQ0h1SK9tfOK
	pS04eQv0kPFPFIlpqV9VNN5QCnvJbTt3Ftj9mPCDiydYbZKFTLDNX7Zr8EV1HuVOXvhOASkjyHj
	TIc+E82WZvpBDIrdEDKqnUj51Ih6LsniS2sJZ3IdCAL1okhkKcqHXiC9UZ7PZWMuxzju05cHhcD
	ZzOw7TKOkB6z5O+SK3zI7EW8hn+A53fPS+kUU8Rb1R70iIJLIYNZ5RZX7SpNL29XMA==
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr21665771f8f.0.1795442280851;
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:58:00 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 23 Nov 2026 13:57:55 +0000
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261123-sdhi_rzg3l-v2-3-bad3a6358849@bp.renesas.com>
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
In-Reply-To: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=4238;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SdO9oPTeSId+gQhJbIDdaFXl20G3i+msvzfHkDzH2Mg=;
 b=Oc+V/0XBOdXK9fNQw7BgpL4HoMlMkSLmcZhLE7VBiY4Fks59eEM53bZjGz52HxBOdwgaK8foJ
 O1v7zPBqfHeCrxztvDiJiM5DbCp3np/XDuc1z6q9Y9lW+DqrjaFQWqh
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
v2
- Added a comment about the SD power signal.
- Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 11 +++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 88 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 3699712d8bf1..e59126e7ff9e 100644
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
index e64a611aebec..fc5ed4907a65 100644
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

