Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C944C65C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011772; cv=none; b=qSQiq+gCKdUb42A79XCkuSpnBVMA6uxgLSlXTwEGYJz0vyV7voNBBo6pb5Rkd9M5v/HaDh9TCuT7HO0164ksdgtpbyhXjeNSNdD5zkRL54CtK/6hjcuuDd3/CRgQXyt5+iUFFpi7nFgXCKsO3aprxGel5ZZo+8C/uvPw/nN9tTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011772; c=relaxed/simple;
	bh=otVo7kWN9n4xyv8PYWqeOig3Ui8iLIzoeWuuCxp67vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFwyH9vfWM9aDG+Mviex+M0GRfhbsPngvXkJ2hUttDVQHv2K1d/gfdgNq5SHwAeclwZdf+SchAvBjBjhGhEM8xz5/SIGVZeXsOSuJUiNOngKpADUrjnArA1U4AkMMgQlLydsSqrWk0SfrO1nooaht62XIW6FwVGVM51hENB2CiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C19RR9RV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C19RR9RV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954afac04bso22252965e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011768; x=1786616568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BAniibCBfDGSGa2TaGwKrhWLtY5pGQ+5hCLK6RkG6w=;
        b=C19RR9RVl22pC+7KdLMYOIzl5Nl4F+R7hG7gcuYDuIKKFJ98RxLUEFC0g4gON6h+vL
         C/kLIfOStoivW9xEaYs26TMxtYn+u/fUa/LgyGsNPMK+udxzZIytvJhrQCe0g9cEXOcG
         1tsEY0oQlX0hX9nn7/L2SZ6ob9uLQos1AuZ/oioyNnGLmCdpKB9NlB2uE0183aF3HKaz
         XNjv2jhTlrKSuZYUeELlOa0Eqw8sbi5UYSGLC++d1xWhKUpQ5f+aai5pj1yjihLbIOs2
         XASudmTacux6n5FS2ilm6qPcbC09/6EyavwAYS0Fk4siRM+ue8XXEzxSduWJxqlxIwTk
         ie1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011768; x=1786616568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BAniibCBfDGSGa2TaGwKrhWLtY5pGQ+5hCLK6RkG6w=;
        b=YglVpOhHeCGsf5gF0io7cLGsxd/3j3M41CHdvRJbz/Df8UMaW2v2sr2UwgDz6uDXG+
         TF6Y/+CccYpKslufS9iSQJPkZjty7e57ExXJbHrGRhwN6654niHX1p2LAIo1EwSp85c1
         h2v2KftnZDdQZd3WLoN3a5Bkiiy2DpZ7cMFnXsdFhsdi/Hll0EbnOGRdsU8Up3e4x0OF
         o+0H2yh6B8jsnCLoHkstRWLzgruWGd6Rr4rxG42JH8keqaRbqnNU8P39XHjTLZeJxxxy
         zz2DU72Knb95nUy5Z1M+3vngvOEcTpAlKG6kLZH8cQqzFM1GyGagisJXTfa//1HOodbj
         xJTw==
X-Forwarded-Encrypted: i=1; AHgh+RolnY34hkSYEdbXZS1BuZKTI3An9McwWadoPOgZndC1GgdcmDdQvZ0lKxhLZ3XtqAbTMolvsxIX680a3DaCzBnmBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgm39o0A1R4FkwMs6GZxEqPi80dL6h8tD/4YVCKxPas3v+ipFU
	QVAOn4Q1SP4Bmuh7YMJJq7RBLqera2Aif1/Vx8E0YDV5H9aYTrlwZFle
X-Gm-Gg: AR+sD12L2CmyG5gXmDmsxW8Jr5bbs9dGN64kEnl83XD0K8a+yxuzUHTigN1QkVrt7qx
	vIbJ47jWX6psIwPZX00KTwsURUfkIvFu8rDm3nZXwGLdIsXsJPZE795VEOZbTOthC05QtpOuMim
	VACWs0iAjqbOrMyih8I95dIRoMm1E2bNIr2hvuhaMA29JXheyIyTGV/EFwsrUgMEQXXy+eAS07N
	d/BxuSbgHOnPix4MGtw8y/EkGToYMof46ukijjv2Q1lAEWqXAj72KmGOxX8b+04PuniFkeu40cz
	vJUEubFgUHAlZ5axbo9QeyUgfK/VAAtPwaIBdeGEyepyRID38Z97dgOCxYwCt6fvMYlwCwWCl4v
	6DGQfxafGmMpPnBE/xjvF1RulUkjjom+X95N/fZD3VftZsmxvv2j10g3KApKpl4taVbD947TY36
	7iMBF2C6WCS+OkmeNPU/o2JVJMNjy+++TM7lpUuwPincI6T1H2vmE8Hm8NNu36ETM6qkSAVm9lr
	RgFGmKuvuT4
X-Received: by 2002:a05:600c:1f86:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-49952aba5b3mr74732155e9.1.1786011767522;
        Thu, 06 Aug 2026 03:22:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
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
Subject: [PATCH v6 09/10] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Thu,  6 Aug 2026 11:22:28 +0100
Message-ID: <20260806102236.149159-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..bf0dbac66d14 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,110 @@ queue3 {
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

