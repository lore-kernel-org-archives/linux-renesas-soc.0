Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604748;
	b=P9yJu7BQM9R1cL1pOITxMpY3CqAUBX6EG9hIKC4QGePoGHdxAXsggxcqhyOKEFQdcUYj
	 dKrC2xoPNypI3UKDqOaSdLm1hljT8mmX75qMdfbX9p+XGnR+bGHSNF8fuhuPLbZGflmoY
	 gvBsVfLdbOm1KNdGM5+BCJggkyRIj7Aqckhf76z1oem3BT3u+Ly9R5CdhW5drFTaRRhCk
	 ojeVhWwSTVfT/fgu2XBbkxtpwtoi3NaQsoUgoxB8L88OAH4grEY3US3Z+0OA37NV+K+Vm
	 fj6uvFoVZ2N6R0NtOSkdgf+vlxbEt3qIsarQwUIwdE854AxKSzoeHp/Hm45jKA5g1Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
	b=mxlyIWMKcCbT5/bUfbHyHHBxM1BK9Zj+abTCV5LS3k9ZUKDEdiGmTxY+kakQmmLBOfJQ
	 KajbTABzcEMmKgODP9TAmHJFxDFZ/vNbvrTlzG9N6d8c/c40+0Fo2D6tSYsSh/4VIc0P6
	 dgCU9dW8WFTlU7W2JcQf8WK35FWO2ycIbCDDsDiIheU+nXkjeI5iYhJFuxNbh24G0bjKy
	 +r24B1BY9OTtDKBKPG8vkAR5BWHYpOMi3TbmjKAk5exf3GEppyN9pUzSojhjQonZ3XXa8
	 15tvuNT6u4vyOBeKu4tFZSFApGRc9pjLiXygRPKEMhunlL0chwagc+gpo8bTD6ZaQ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF89606A331
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF89606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLkjE+TZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so48655065e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604746; x=1796209546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=lLkjE+TZG0FMymlcIM6k3QhwL9ItWQW4XWpCQqIs9aKXPsKB+sJBtaIU3V15LINH/M
         uEKwRvo8v3JVOWr8mejNoAKHkUZPRtwVjjH5gJw3wIFL2DEVRGynF3LuWfuBRGvnSXR3
         bP05YbTmsVkFqHVFF4vqarI1kwEFDrQFJn+sLrrkZS4hUd2A0nB6Cg/HbpsU4qpIOkt6
         6cQcF5rSMCTPlEDrErd8CU/9Vd/v0Bvwwt5KtMcZY6A741n8zPJWvoS94nEuBMIMo9XC
         Uui7l8bTSSe98eEyBl5qZuj8jie5IjQKrC22yuxXdw+HDOPZ6tsGQBCx6RLDZUV3U0nK
         Ts6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604746; x=1796209546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f842aynd9qkF+2ihndmibeVzOIh5KPshrWMEfFSYc0M=;
        b=ktRXuqBg9r3uehbLj3/9m5VR1NUyPMCNdWbYgSfj4N6yB/7keekh7Pw1829ke2Y4eO
         vUUUYlIx1XlMtMAjpFaT+9f8JLsL+JCJ14SqFYz2G2Tm+A7Hzr8c0PHDXEpcUnQBpg4L
         ikCsHypcNb+guni2gWqUs5TkadGE7cNZsRwsOT/Slle/fUi3DSc7tDbLFE+cKcAC5xcg
         vWA4J0U+Hsz7NTUl7WP1Yv8Sy9BaAZHi1+0V7BaUFzoqgEHnkKZxVYUTsTNR9qI2+2L1
         uV3JjPg82Zap9m8xf0gPUTi2A2zAIY6YtSAjiKdFGWKxkqxkbmGq7Zl3WUTQ8Iy8JIiV
         W34A==
X-Gm-Message-State: APuU4Z8/VDoBeC6zJLbUMcL9RFxGyRXetMdHzpBaIYEa6YUTqd/GD2Re
	lcGuRkOx9qRu1XOm85Yu8tX1VuywKMLSV+75ud4moOzKTmR47yogY4cw
X-Gm-Gg: AZFdTZc8FdyM9SsfEUldOSb4dlcs87/TT9OQ+KvrbR+lGsVxQpaXRiSR/ssI4MVp+Jt
	SplOBKJePEaIUCXiF/wJoF6WQbJH1ixxXPWDQoOK6EgI9sBqsoeJnS2LVqRac6C5OhMirsf8aKx
	jUlheM7DdDDhxHy1SsQVkooTFc5oi9NnpTN9kGeYnuwtbd+i5t77cZoNHp6yv/219sOyD66PTkJ
	AQCslaDVr64Qz0NlwpVqr+AnSoz6Pzt8Y0nUrLMfgdY+qbwLqgYal+UWRk+ku0Xsgeltoc9W2g6
	K55lxCvIABo1K1yQO2LzKM1wfplCGGFY2oo64AYXprdtJ+qmdLNOVizOFaIHLCVkfHWJt7RC0Fz
	WTfN50kFrRSO4RXks2B0FmybCyUlWhXSAzHUbd6yzH4IyenvfZU/PgD73SNKDbfOeVSLzWxRJ9o
	ANV087AVVwxjIT9Be+YQ4QtiqywtfYJ4+4jrU8jKfpeQg2LxqcTAyOLNGjj4mWWCyLB2zl0kgec
	c4u/h4WYmZkWBCD8gHVyxhjmJozLKRJDtxmadGVPsZd0/2/yBre2lzLIOEkaZRc7EvEABTERkDa
	TftmSqRXTU/OiscSlT/7JA3hjEIZxiQEqn/OydHaNGMMCzYpAdPhJv+qAd5UCU/z
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr360275975e9.3.1795604746080;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:45 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:43 +0000
Subject: [PATCH v9 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy
 device nodes
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
Message-Id: <20261125-usb_rzg3l-v9-2-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=4199;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Y4aH+161y3MIy6RJ8G27J8Wexgq8ykbImur/Ccjduhw=;
 b=5mSlwxytSbQnH3wCUEBOoi7ca0IlcXwuQb7jvpYENWoaVJaecZmX6hhjg8VrimnvMJU8PXVSU
 bq50RRDT6ODCYydDEIm2lMwzutXIXm51CnrIBtr+7+RUkkrErKvh/wG
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Replaced place holders.
v6->v7:
 * Updated commit header
v5->v6:
 * No change
v4->v5:
 * Dropped renesas,sysc-pwrrdy property.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 92 ++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 241ba7b5da74..b41a813b01b8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1413,24 +1413,108 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
 		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e10000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e90000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e10100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e90100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		hsusb0: usb@11e30000 {

-- 
2.43.0

