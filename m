Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994094756D4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821328; cv=none; b=UbgGDAslFLMLXyxrcpRstDzktB37QkSkwDMQqMLqCuCzHZzvVfuNlp6/kETCWCsm7d8x6MXMN71saRHB2io96Cqo2TP32LrhK1IkEprOvTRaAd78Iz0h9kULgCab0+xvd9tqL37+lcWDoRaUsRbQnU/2huNaOUN0lRljhMe2Wog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821328; c=relaxed/simple;
	bh=Qf7U+CktOt8qPEB9VZhxQBL7FnArz26dYzJ+RlLXJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKKUHOtA3AxyorzKemJmMlv6su21cSQ8jvmH+YzJYu4HPmawbeXaFJ109ehSkOmwHamVwJ5rRCuCbfQxgjBYFpusdCRMdw5ZafTBtDjbf32dErQkHgHyBbuW4k61v82woNtdlohpy1yE3LCKJrv7RYuB0Ko359VP7vghRkVUgXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4qgnHd0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4qgnHd0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso4656685e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821320; x=1785426120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcUp08KQxUC8fv+hxf9KBsCGFyHuJnxRKTqTBNjKNM0=;
        b=i4qgnHd0Ob29WedPr4HoDlLthxtELrpINiZ54/PtIztMT9gdbrgHqisv2C53QUaBRJ
         alj6fYUe66A7xbbmj9qfG7xkUicCZsITHaT68E4BJdabUI+j5/5KzzljoD0yaPBgjKKI
         Xn3jXl7woiZ+2dkXvLYtYmFJBmOxfm17baAVaz4IyKBQ9sMHExmuHoq9yMmanaisXihR
         xMpArV6SU01s63XdCaveCepob2Fn+Gf5L7aDuT1O7P4lu6kvEAcCuY/08SNJFi52A1yJ
         lsceJVjJvoH69Er87odFCL6U/+CfbwSzt2zmolm5DpjzoarZr3/fbruaoip545/32YE3
         2gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821320; x=1785426120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcUp08KQxUC8fv+hxf9KBsCGFyHuJnxRKTqTBNjKNM0=;
        b=crG+uPdehAhNOL4jiBHoHx+ZKgmy0JQrCPlWBW5yZ1Xo6x6tbcmVSiU/iZppETlwQH
         odsiH2BNR7vXZpetu2A1HOAwaYlsv4hNhz4jKWpKwbuobVCnxhEjZvkrHpXmRijTKFRS
         xW198HKwXv9cIki6WX1mrPSeT5y3OqYq4eu3IpOb+dq+jL3CkY9eJZVX8TwiJ9rKMbma
         qAHUHGZrG8sUj5IYfC4reL530LvOHjzNrV+fvx7jEgyGlTZooJSgwhn3XFb1gb/9oYeO
         LNvuF2In2TdHscOoz0yXCrg66J5stdE3bmj0U4rUJyhcXsGVkj3dT8PGAHSwxCzqJOU5
         DAxA==
X-Forwarded-Encrypted: i=1; AHgh+RrQNlueuW3rEM8JrU9X498qI0IPzkTgsVZNRuOJs27RMpLbT9Fog2S58q4+g9AozEGss6HHE56cfNop+CMK/daglQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bnCiImFTQ5GMW/LfHOfHXQZpiJAEQg0Dkv+ZyfNBIbna2QIn
	aP39ygdXkmxv8P7YgSTE4sq+IlMVsdkXEEXcNTzB4eRo+PcZjOqe5umv6dkd5A==
X-Gm-Gg: AR+sD12DYstRv60NoyMLOoh1ZaUWsyJ1AQ6vrzKrJlXVCPdOWGUhS9hpV0X00oephsx
	4kbQ3DHa0Txf+j9N77exaVbgNkQTLwXWr7wbspvDbBnFU8kDreY2VQ2aaTLiebZWaMVhD6UU87e
	CVCFgh0BQ4aoVF7xK9LY99Fw7krSpAbOxFTdJdcS0y+EWde7Q4WWmdxEB/GPWNS3yA4RciS049k
	t88hbUSt8Atz4itZNDcRKS1xgBbPNpL/ibkSPbqcFGvLu8fAyJNf1XCGM1UVtk+YSiI/1t82VC2
	vYhMCxFkLEL8JUbefQ2N9Wz1BNZPbSDz9QDMe+2PWtbmzflJJlPcsKVi/nGfxaD8k8bpQeYhcAP
	pMxEVETmFCi58cUCdJCOPoSmj28qChipTTQrg4uP9ps/Ask+uGMk+NF2PtJJvinBjSYpW+7hJLx
	j5X09By/G6KwhFykUOa1rfgb4l/Ag=
X-Received: by 2002:a05:600c:6303:b0:495:4730:15b2 with SMTP id 5b1f17b1804b1-49573d088b0mr39590235e9.31.1784821320219;
        Thu, 23 Jul 2026 08:42:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 4/4] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Thu, 23 Jul 2026 16:41:50 +0100
Message-ID: <20260723154154.319674-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * No change.
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index c365b8087520..1b72c310830e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -330,6 +331,74 @@ sd0-data {
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
@@ -363,6 +432,25 @@ &sdhi0 {
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

