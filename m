Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0065426ECA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606716; cv=none; b=HFeG4FzDLwTrAzcOzNJo8scjEA8w5tf8FwbGKiQM+D+pMuDvR2c6XHxYbX7wllfObQ1MwzrazDjHpT8b8jZZSVM0b4bWAbjCQ1QuQTfZPQcvBQLfEdz0/OAbfrw79eDmZaH6vHGH7CD762pm0Nl5P5GqqMN+CojzWzMJg5FNK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606716; c=relaxed/simple;
	bh=ecBOyRsLkPlIKU46NQfDb9lK1VKigZxgCDvcAtZDjgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfXbL69W4nW6ofZN++iWODstorJG91majKm8HCz3QdDXtFPdTROY4WIVy/GCqkxpYNSIy4ONAmWCFN3iIfWh9tHVyO5x1mfC7iAJBMoDylDXWnC15pW4DtOpKJuJkcMUG6ceh1RMUxa8YvkFM0EzlHqPe/oni3DL5TW9nl4KpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWOqs3TI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWOqs3TI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2298433f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606711; x=1782211511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4zILMBc3HmB22GzD3Z6RYaUw5fjgkNeDZ6KBjDQfWA=;
        b=KWOqs3TIgjvZFdt3ifA0+GFa4IyolHGimKm2MGLn6eDZnOZ6vH1Dl+yqWV3he1Wrk/
         l6GJox0fvI1yJWV2KVODitTizpKFXbPzkKAPsBox26roCADccF8PN8ddb7hSGV9rQ3In
         tWaetJQRQIGe06b4xSSTFG3DgB25Ji/IgsA61JmmePtHJLn53H9QbrzI7y4P9bGF+3Ar
         YQmTVKCv55lipHXfSRFHgl+5IiJ4T4XE85dyic38FCClss64NVtdW454AL4tRqjzPsKA
         kM0Ku2awvsL4TXPi1u0aZdV3kRsheHRkRV/TiynlF4zIgAAM4TnHZEbs4b59MHTZBy0R
         Nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606711; x=1782211511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4zILMBc3HmB22GzD3Z6RYaUw5fjgkNeDZ6KBjDQfWA=;
        b=FroJdshV5s/W+/MFqyT7yPOE766khplei273QfcFDqv9IYSUiHunTJZLSF+Sf2FDff
         fk+S2JldbVpwOPttqSmHnWkENBNQ/g9bwQ7s4kTRyewStTxd+IwH4McExP/qS55K30+X
         yZnXKz/C5SXejcGXB5UzJbF4wfB8H1vQRbKPDjDmn+5OdiRnJyKsB29vs2n/AKZxX1yV
         O2c7oOZb0UEs1aQ+NFqzCLIsC13ODUQiOMtdJZUkLosha0bKC9Nh1KG0V5NKhV10Lgdy
         hYXQt64hP3eVoDpwklU1yK9EzESBlEFxaWfWY3DsZa+CD/c3huZXsGDIJi7tO4W0zpo3
         mYbw==
X-Forwarded-Encrypted: i=1; AFNElJ+RDLws+A3O+PqSPKa1yyIzPgO4PMcPLmaFCcfdpNImnMlF3YV+VhflaaVJW8Dc0WgXGowrbOJq83XaxHUKOTP5Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlULWYLkPCNJ8CmHJ58cjLkl2wjSMcqzkam+95N6+frDYN232d
	GZTKMbkHuaIS4AepBoCWyVDq2kwg2v/oVknFyGW63U0CY+O6Quig4FT3
X-Gm-Gg: Acq92OETsPD6nH71Hq7btJ2Hqvhb5wRbNKBY36HmVn4jeqZEXKTi1UtNrOe6h0OxxTd
	14n2x+MJCKDG1RUL+705dZO+5FzXKGcPRTr4gDkjL8qB/kLd2bGxa8BVbEmMxoZfcokvfvFMV1Z
	XV4e8dbiqTxeeL8YpfLJhVTESLvTEHPqDhqit+faB51yxWASVGu3ZTtQHejTXH62RjpuPEX3h0Z
	/k0ldZhijuGkNx1qOW1xQmOYuG9f3uhWyIZf8OcXZLzIKTnaZMzaY/6d8rRjLTOPCEutX6kHzl7
	JFY9IoAW3q8upT5CSocahszvaLb7Y5wp9V2Rj+U2HslZAKfrAScp1KaGqnzePl0bM8Mw1Jjs3LF
	EqGJOeebIo+3dU758VdpXCuTrxuMF/JY655b8MuXHFfu/HpEyz4+L3HkNDV4i4IQn8ntGcNm+sQ
	5/w+elPwUZCMqTKw850pamGwNJgsMVimzQpN7c81YwV+z/IqUS
X-Received: by 2002:a05:600c:1d06:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-492200c01c2mr210129465e9.21.1781606711040;
        Tue, 16 Jun 2026 03:45:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:10 -0700 (PDT)
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
Subject: [PATCH v2 09/10] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Tue, 16 Jun 2026 11:44:51 +0100
Message-ID: <20260616104459.410743-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..926a81cec37e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,111 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x1>;
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
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
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
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
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
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0

