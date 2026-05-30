Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81651340415
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157460; cv=none; b=fE2CRq8V24UlfVf4GNL/uQlUM+kEQEKCUnxANxUBy3/XStRGBczZAA2NtUKFHurEirMpLKfKw8LAYKiVdhlDikZNYg9O33jYbYkc2i9FzX79Xjeab0g4ZFEmt6dVmkeAV7x8jlpF/QVFhuRbYvXHcNaph7fzUdo3wsUh7ASkodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157460; c=relaxed/simple;
	bh=Zq4HDqdq/amEjEwpDojI3gBZJRNxhTtuW/kuu9W4J94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAY6CD3xnse8XmF6OkI9oBMqkCOTBgldiXksSkMRfn1WA1DEOyC+VXq4dLhBSz5MRO4bm/b0yvw1J3DZzi8JdFiz2Wq2PWF/gZ2kZ8IXcRfq/4etR/uAViSuayVaJ1XdFwKF+oew/meFNlq3UOC89u0ILdzAUMNwMGAZVZIyATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrEFCMyX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrEFCMyX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490426d72f7so77818315e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157456; x=1780762256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5GVrSM9pPs0a54glN8EjZh9p64imDHQ+yOD9WsC384=;
        b=rrEFCMyXDaH8wl9AVNVlUsdMXRp8Zc1u7DHz2v9oOFOfNmfbWuwXw5Pu5qw+TA9aJf
         IW0RoXn6oqgqLu5stWCZYMUfXDDrMM3tmmWdl3+fbAxC7D7Z8RvtACPmor8wrzhe3krM
         owTCcPug4Yuaeb2fAzEmN4Y34ULj3SczG+h6Cyx89nx9NNfziUjBMznJlpVOCgmYLpij
         ciLAA1802sj9aplVrYFkkhDaSaPOVSMb63kyqk++Z6zZQ4R33v5XRA4ATUgTHxS7+YuK
         Ki+wRqEbObjDxAGSz+OW2I/WjmGbF/ZDx5PfVkh1/AlNsrkC4k2yM6b1p3B72LyFILqF
         Sshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157456; x=1780762256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5GVrSM9pPs0a54glN8EjZh9p64imDHQ+yOD9WsC384=;
        b=iObOTuTJI8n+eXrv/Xh6zNOcHVxIMvfY0fAVsc5YyJPA4dVSylJOoeY7nDmDzPEaVs
         N3eGIp8HWaFTiu3z9pRKO4qRrRZz83vvjZLM57f1Q1NpR/tbaawGlTPmYUGANvoSwL+b
         uPHY8Kl6rRtITQoq21yTRmoX171gBRjy/8WFB8po0L55iZfa79KvD9gKXBBKnJEEImfK
         jqa6xScdM04NYzqmU1cuampsMMN/6ZdCb00a1JVtPngDeKzgYWFUsUgHdc1CgNoJYahb
         tHVzT5FTDX6TNz0Z2xzcC0F+Kqdu92hjIdcM7UTfBhPVSVMGkTO0cvUzSkngyW7Ja2WQ
         lfjw==
X-Forwarded-Encrypted: i=1; AFNElJ+ShtqmaQDk9b5rWAbpMABEpjpk/RMb8BYOowe9ulf989cpxyvO7N7GupVSR/eU//3alWnzBXQxmjIIXM02K+4skQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8glG6qxHIC+OtNQKEOU3RBrQx5RI+AOjhVzzQTnsZA4U5mMfz
	rvIcvCE13F/qflsfiq3KVYTongaUrf+ZdEkkq/y5wIYDt+FhxCPj13i2
X-Gm-Gg: Acq92OG4tSRhQVLZfAjkejFhqYfSQM37MwfoGmuXhJ9RWBYSLkzkmoiocWJHtFglVKz
	3PGXJTw4sZf8SFAxV35V3BbpYLk9rdvDiynbK4I3ZpMbLGd+ruPSs37OB1R7FxX+630w3mmwzFN
	EjeMqxdVRkEFqcmPdnWWD2zTpdC7pQ3ODwnxX5bjprmv8CfDO+J116VW2rryTBMsKyRGKEP+J+e
	ad0jl89HnE8IqOUMqW35RM3sGjyPSzrU9fSKdgBNiMoPz0zWwvQM2GBI3DNxoZ4GtOJMcBXtUSW
	ZB+TYU+NbF1+Y8xRBXldxRAf41tODEIxp5VqRKUIMCDWNozfiEw+bQPpf3Yjh7AMD/z553XNQp7
	ebbfT11ym8Fo3P4tWzfe43q71dEEDXzg/yUUPtzf7nqwGjHhI/UT0viHDwOHH2CYQg0u1dL8mlz
	tiPmzmCz5IFREqb1atS3+K1eGR0dIzJNMGC6DpDXMdD24nVEcGXrsKs52QiQ0=
X-Received: by 2002:a05:600c:8582:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490a2933360mr53158135e9.22.1780157455386;
        Sat, 30 May 2026 09:10:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f35f8sm105350435e9.13.2026.05.30.09.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:10:55 -0700 (PDT)
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
Subject: [PATCH 17/17] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Sat, 30 May 2026 17:10:44 +0100
Message-ID: <20260530161050.131041-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
References: <20260530161050.131041-1-biju.das.jz@bp.renesas.com>
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

