Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200747ACC9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325838; cv=none; b=kj6MHRvhXDYnM0gd8WOtWaqwepeNhrqpK+HNF2MNT7zlEyYptnzVWIF25KMgQNdkoeaGeKcUkZTwAw6+SIx023moZbtiLEJoj641td5HeIvI6odu3wPJX3m30QGM0ArdNl0cY3HGXMmyYtlVXmMH11rqIyxk0s090BPem6hJzdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325838; c=relaxed/simple;
	bh=rJp+IHRhwtCUDMpP+CeRO1ZawrpamrrkxlM7KrkyIgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOlLJh6SFCpGUa49cmuHW1UqhB+1e1fbjqZAjexYnsiNCAVm3+7TbzRI2/+pgim8hrI8cgVdOMYaNvhWMepfR4mU0Xfhwbipfi8PeOz55Bz1F8uFvoZKYgVz93IamH5mV6/p6cGbvQLQvqruyrgoe3iMEUfSh6S9Mhf3HHAP4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvcuVYr9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvcuVYr9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso11005865e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325832; x=1785930632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baS9I2YLswpUz5OkPJnMmEZArGv7qLITUDfySWIO39c=;
        b=OvcuVYr9HGTilM3QaknGqXu7BZTjdyOvGmOOQl1+6o44fuMmtchTdWvPyNdVjuA30E
         i2EQvgKU31M2vkD75H7MMGi9Xus/NkyCpTdoZoKsd/5GDSX6FyJkZcNMDTloSrco4jBd
         YqIk/k0BTvcUr4h+qSBXDEOhvTjmAYvWhn2dBkt7PhbgcMQb5jFSEgiJ2PEM9Pq6gt4k
         EIpRuDzoHvGoJqwj8Ja5pzTMcE21eZAxsV7HWP1TrMOdV7XI+usYgZlp9RLtr4Hb6oks
         8wlKknmOsgr6Rvv/FsnOrvSwkdHMuoTdl+Ob6YsXbJ94tTLNB31xmPDYruHC12HFj3ds
         EQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325832; x=1785930632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baS9I2YLswpUz5OkPJnMmEZArGv7qLITUDfySWIO39c=;
        b=J5ljNBTjiO5X1s9Q5QdnRaJlHFmTKWgzppR9rALpVRDHBk6aMEs75iqpdpTO0dRR1b
         eoyaiFaIdRimY1xPk97jd4CfP+XHq2iidrprbnSgrnGdlurDnSfbssD68qxdJ6bxMlBJ
         olzx4KP6ATAA/P6GnVV499LXuUC6/r/Snmft21EDtiXKqOIRHn6HBREjxMKcrEJypZHi
         OdDrP2LvxoAbZPN5FygZcNleyO9gWgd9HWpoRp5WtO3PZlpgNkUO72S2ITqdfUkRAXKI
         II3oUF+SVrUZs4lTtAFRncr/et27YwXUBYJ0UxQEiScnqp0PkpaFhPalPi1hiyXyV7sz
         U+zA==
X-Forwarded-Encrypted: i=1; AHgh+RrDAjcfIUj6dPeXvNTjYEudHcS6zdriUpKVE6ZN7RrUD1UsA1ddiuJC5ppK7u2oCaYQKwhqSFAdxZ/9GumUX6qNbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEiqTczP1fy7ApS2a+9UetFdk0sQM/18IPfvBm5zvLdW49xmdk
	hSq29ibePQxfVg4uvMIgMRSPeEvd8SUHZofYehSj/4Hulsae0p1oDsxE
X-Gm-Gg: AR+sD13TyKQI870Li+ErPYtOZaJ446txVOm0HYToTdxzzofNbUZrWTSLSbpBQZmTLDo
	JDRbF0otILqmcB+UR4/3HRFnA636uPkFiYzn1AOCy6mdagZ1tswdKB439feXSMi6U/bjuwnhmwJ
	HW/04bkserMo4B7OpmX6NhWTTVmhxXlgN6dv6K/fbtMkew/AKlPJlMl42BLAS+nC3CxHiBQAMYu
	gE+t3E3rXpuRjPEuPlBW6iTGK8DtUhRtSrKjE6Cw/Yu2Avem83+cQeA1PotV13k8ylPIqCKoJCR
	d+K5OfMJh7ybKCrEbpO1iQqc6d31ed9t2BZY/DDK0PQ7Z8LDt64Ouq5PdwNgUj881DjnvtOpY7R
	C44OQ4jqmh755cZNbcRDgly3+ncL3bKdaoofPKNwwqeiGHIJTxNo+YpoRRNRsYTTSO2AKiGmRRJ
	YQWv2FZ0ac7cKUgXyExty1lB7i3Kdx8LKK0oPFX/3HXzH/slCXUP1PYB/Qn8dyRQv9WqB/JRuzP
	lxw1qRbu9+RFm3EHal8LURMkw==
X-Received: by 2002:a05:600c:4593:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-496c6571d38mr67732745e9.18.1785325832157;
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:31 -0700 (PDT)
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
Subject: [PATCH v5 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Wed, 29 Jul 2026 12:50:16 +0100
Message-ID: <20260729115022.222340-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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

