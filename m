Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509337;
	b=twJS1K6x3XSO4hjPWAWPsbGMMX9A1d5iDQDP+qzTLMiuLTd84PHHrjWExzvgfweSZffh
	 FPXKXOwoOwfZ93xu3iUQBZa1dJ/aej5h2434y3a68cvUFm+DnYqtSmoB0rCGaJOe88CaF
	 d8+giw7pO/leQNtoLrf1xkdm2nuiHbj8PAFKQImEBQe6FlAMn4KYQF6dk1n/xntKR4RZe
	 UOlpDkxC7lswPpxWtswxhMzSx2dw/+3xfHKspBTtzLmdQlPM72lz4CnntNTQtf0D6q3qU
	 G4qwW9RnWkXlv7ERTR2L9jpa3q/xcKDaGaRo4a1qHIowbctOkZxdM/Xm9Sy14VHVPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pEEH+x9fbALRSQMs0SNuS40mqXx8/gVcldqqb/eLEJY=;
	b=yNvGrkOWV4Oh6uIJIqhBC6cT0ciDNSXJYCnGFxKKkpQjP6ckjaSKj8swS1uGnzdS7mu/
	 RYLW84N+Wgr8vQmfsX2yBJAQ5Xc/Elpo5GOfvNs+cxSp8ryoeIl+OY9Awc+6+gwEs+CsS
	 RKyoa4qSUV4eArC2GZEvc/vv6nEQCq5x+cfcFzmHSkOAqTXhH3Dnl50sjIlpp6afGGMyJ
	 EILrbsbCd+nkNBjgIVSrPsvJUdi0Lu57+FTNRtbcOP1sw7IHM8RBrbBmU143L5nifRH3V
	 U0uneP4ipHo9fkiJl+OoxCxeD41lwJILVOXACf83MJak0lX5uzsoi0yw2++fG51OSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvG6dCZQ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADC606A89A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 18:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CADC606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvG6dCZQ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so93161f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Nov 2026 10:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509335; x=1795114135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEEH+x9fbALRSQMs0SNuS40mqXx8/gVcldqqb/eLEJY=;
        b=OvG6dCZQ2/mfgvqJihnSbu/vz5D6WOWBwaXqrPfruM0ub0ebAC7i9c8ee+2bo2ajuF
         6hzOFCGHE4juQHXLMeJR9uENl179Cq1CUPDGFv6xdIuQTw7hdBzDpl7F4u+ZxaFMTDRX
         0hKyV9TpgD516289ST45hErHxNlTx8p40mEY7oX3ROMFUuOg3y+pD8smmgIfPuLbaHEk
         X2qoUOVpFu/r2P0Dg3wgGViwOsIBot+Eh1A9ayWZcgReyMQk/R6VjqHwzpwWZminntLh
         vPYZlEx8QS73Fy/UyG3+MDvzIvRrQ98TYheqacuZ3fZ0zyX6w2RJJlKcVgc4kUi1LpCL
         4mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509335; x=1795114135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEEH+x9fbALRSQMs0SNuS40mqXx8/gVcldqqb/eLEJY=;
        b=LKJXhEg0DOZ6mYSl0PJAreY9SQ3bumy/rS9ZlPGliYyldSgS221xWiyKjpefyVnKAg
         iTiFyE5kEMpYDyVTWcGu6WJ1vycLchxwDcugpYsftHrhmd0S3egqv7tEwRlVLS42RSQj
         1H/Z922tHchLRzTs6wMmhsmWHMRS+5eqb1nmHyQtoIZuu8Pr/cVV23oNDZ5cme2beuDg
         JU5lphTv6E917IpNZFn4jtZcMgqEahvX04WvB3MdJWQkGbgEQ2kMFjzUEWar6dG5pJJ6
         m2piQXuytjyb13nU80yAhPRE4CqqO4iri0oSeWmV5N/KdqrJCpOG9NwwPNP+Vb0QeyY/
         zkrQ==
X-Gm-Message-State: APuU4Z8pwn548Xb9VeVL7woS1dfwNezFoN4FpqYkMpxfAlJQgMNKvkty
	Uw4dnF3dZvSsSC0qrQNAQn+0NgUk/rNBm1zi9jF7d7sVgqZgQSCYD0hs
X-Gm-Gg: AYBFou33cihh9scr8DGF/1VFcZCubBnswgDOfwPxSy5iFnqLsnj9XAW7at95uO1pgmg
	F9mLLj10ZuDycGl1XlJ7u6OiPGDMxAebF8x+HbgiP3sVYes6lEhWxVY/Lm/lnMN1zK60KW+AiKV
	HN0NtBoINiiYHeGXuh97gs/DkzvNdysRkxJ35puxsVoWcuCwRN2HDArPlOm/2q0jwe8zHauMDiX
	3ZoxWc5sh5jqnOq1dXv4efG8rCNrjhmkHYstmoAiKKLMEPYO1HjUiI/bhndP4+39iYj7/S7lkwZ
	auSOorsGrNSTrF7y3pK3dgqK8tphcVPOabJ77DTnBXn+Tpwn+7lrJOb+ylUqAnWopokugFhqFwO
	NKi6Els2vZj9X44iikjfv2LjWQD0XeHNZTrdKJ5vJrq62tUbD1LVOvrD8Nd//ITISfZnT8yUHZL
	MZbV5jXaKAxx1tYkCMZ3k70+KAnJZWrwYblYRtdB+qsrgjUiQ7HIQgFtBgIioeElJxRDHmfR9dw
	N/h+YJydO+SCMmK6IwpRG4HX9weIy6aTtakZLC6J+tvMNjqWwY5EXNv5cOPcu0scOvY0A8bO4PW
	/r3UH6CQB1rqG6PDhjpju9McY2IOg8QpErzUyFJnLcYPp1fVz9m2XStapHrmOvoSVA==
X-Received: by 2002:a5d:59c3:0:b0:491:8286:5f0e with SMTP id ffacd0b85a97d-49c73a054a8mr562376f8f.55.1794509334596;
        Thu, 12 Nov 2026 10:48:54 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:54 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 12 Nov 2026 18:48:52 +0000
Subject: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
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
Message-Id: <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509331; l=3055;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=QV0ZxPN2CceCRkM+ahbUinIs/usIGkkpk/vIPGReLtc=;
 b=e8X2izxY7EfUdonBbqkAvJkfsXwr2tjzLusonYMjh9DQQe/bhKDAsOdnPryrR2RKhPyVuJoVu
 tpsRQc+6i+hA2IRcPI2VGxi37nCWDyWgVeWKdWW7MXBsKvIa+KRVo1u
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index e84840fa5086..a5aec82c0250 100644
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

