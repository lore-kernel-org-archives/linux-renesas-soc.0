Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A233F580
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146911; cv=none; b=fkb6oFAgbgAHTZxcFeoECFvXnmNUSFzYFSPXAhtapCLgq0hDwm+dDdoaN96FeEuVb2TwCirfIHJzE8CnYsPar2EN+KscDWUhnuW7a2DYFcq0qWJEyRR+GWiWknF0kKRjq5ApxMN7MOD2FlnjBif07HdZ3Rm9QUHeEr69FmFVGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146911; c=relaxed/simple;
	bh=tEzkyeq2CxaE+rDQ5OZ6mvROU+0M61o/GFfr374yK2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQQtBXFBS7JQPogvjxx6w8zbjxD9n114r9sb7JStt6BAoV3k1iEgqDOtkn48VarJwnlSXHdrA73BW37jG7svhuZKyLVk3+GUg2+N8qirY+HkBCEAF2YK2VNuuuz7EJYYPMoF2IndWrdxpFLkNcUqtPAnl3fnGgIdGL1i90ezSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI/RLvSn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI/RLvSn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4923139e940so27171535e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146908; x=1782751708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWemi1JQP1onVuqSA7PX4iDLmsF0kujfUg9hfw45kLA=;
        b=kI/RLvSnRvZKbWHN8DKKyZHD+K9cYXq4KvqT6BtE8Q83QjzPzpvDKPbnuFtO/ocy5x
         6moiDHnXvL7XKYcsvbJXNmggxgsReLhJRNn2ZfQ48+ee3N3YrwL1G3ZRDYryCBi/n4BH
         kfRxw8oKTYK/K0bXz3R1U+7dKNKl6Oewku2KulhbLZ1XqtwTiFJR6hevqMS576dASHLe
         s1dgCA3d0ejp6gB4rcLqy6wY2ErCOoW2eqOUS67B475L2XZjtWK+0XiCrnsQ/oM0Uzsb
         U9gNiz9EvZ7bmI/FbSbnZVoHn+XDybdJfloz35VDwi2M19579mlbFm+Tb17nBDEEQ9cp
         sryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146908; x=1782751708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWemi1JQP1onVuqSA7PX4iDLmsF0kujfUg9hfw45kLA=;
        b=hWDVRZevL8cSTyHJc5fv+41MpQrIYTBGm9PF3wFKNmWtkDFqzy/RQJ+Ab4HJ30vIsu
         5CUPfXo/ctJMKtWGgViSB/H2cY1Gam1KOhu2Ob13w0q4pL9kNfUFpZhIugH1eHT4cheJ
         zI4Or2Rr8eQ0tO3ndHJyx74h713uE8YnxTJpCrtqHYGpupQiJ4OyRh1HqBKHnHvUHAjd
         a9tv3wvC7VoQW+ji8krFXvcPZq5mtj5DDtLtJXtlT77orm3i/BCZQVlIXlAVZHBegRbV
         BL9bPvpbi/VVSrylzBQFfwhtfIZ1DXH3VHNgTyUZZncu+0nBbEhQH+kVjg+D7vIlZ+Ao
         DbjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LAExizZyzSgWGeJKDGL312m2pL+Kq4zn5s3esYtWNPubKLzGeFq+w53yGWWu8FI2bWb9Ly1SHKM0HtufgdtSQng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBUiUQ1JG/H0E5bKAmocvi1bdXy05gLmTiT+t812j3Ob19sbD
	32mg/9fdrPptSAQKNafaEnLmcNUD9SGGkh2ipHYEuZ5BNVMtp76uVsq6
X-Gm-Gg: AfdE7ck7iW9cfKNZG/FPkSTIIRhpI/xp40Ei9BDZzvTaw3Brw+xmXDyjjCYFizgGLjI
	P8EMX1i116OD5+AXMpgqijFJFmGnNvAbzn9hXDJwo033knjf3e49tFeKtUD2ry2A9Csluj33+I2
	y2WvFNb4Dnw7rxsPPKLMRBm5t0w+CSTU7FhUhKCf8IcBn7XSVRyPOAaLBmZ/KXInl1bxCdCH0x/
	yeJe689rlmJMwefB9bxEelN5m3Yp8luEBhdXQGIYSkUURh364ywFp1RKYMwTKavqvUYYnHqgY7u
	8ZVa9NTUnnHYgize2KusZ+1zIA/So74DJJY447Hr84YB8ZviizcEdni2xR1T3FguMMs6cp8CfhP
	kG/RD+oFJt5Db7iyDWmo3nCIz1l16gKFKw67xPIu5mQiTMC+DvFPP01B9ZYvinSWpZ9evt697+Z
	2KxRQFS7ewmYpZb1oOto9S
X-Received: by 2002:a05:600c:314f:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-492425706b9mr212689045e9.24.1782146908209;
        Mon, 22 Jun 2026 09:48:28 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm27433872f8f.6.2026.06.22.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:48:27 -0700 (PDT)
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
Subject: [PATCH v18 4/4] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Mon, 22 Jun 2026 17:48:14 +0100
Message-ID: <20260622164819.184674-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
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
v17->v18:
 * No change.
v1->v17:
 * No change.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 446c7780cb30..3d5e6b8489a9 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -296,6 +297,74 @@ sd0-data {
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
@@ -329,6 +398,25 @@ &sdhi0 {
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

