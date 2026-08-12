Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A445FFAB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544395; cv=none; b=CzpwTiCmonL0wYFDxEGcieJSSm+pZs8sieAd4WmTe7kfRb83lm4dKTn76g+FRMI7kY7GZFsnEe2k18aLXrIpIhBnyv+Joif3TKeeR7aRxtNe4sa0oWlx3SJXCq4e6AE4zjXk1v5lKOvsRF2I7Sm24gMjkhnENxw/27GHSGjGBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544395; c=relaxed/simple;
	bh=sY7bE7EJxCFLPt/FFDL//Y/g0b2d9Hy5wNG8j/WBZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnEHHk6OrPpGaRsuB/+HuyC90KbAlMZAIbwRTNbyU8uc02Gn3h9gf1+9ddqAWEFtVkoUhXFkD816af3aWPwKFY67DhVSJ9p/qW8ZmlU3rA6ujDhRzaLkxCyx7fB/5iDDqIcrEtciiPJtNr3I90RnkIJliTpmQVzgLB1KD76FwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNyvWcXe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNyvWcXe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6723215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544392; x=1787149192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1Bmj5ZZaimND1aKa4lg/F3Uu6RM17i4yCaGTVGWWA8=;
        b=lNyvWcXeYMUWYH6HgdKVKz2HvCMpWl/Ew6A4HCJTFIqQFym0fdyPfPytKyJxvZNjNE
         +94ShDH5an3/b0uShs+tNK1di6xPMMpIuBKQ1fm6WN8EV1bouGhAShfcCLxdQ9Q1Pfb+
         B70byc09i6pexchDmfoWGootRE2r/7t2cWQ7Zt64HVXjC8emBOL1Job9OF04K84+nR09
         X61JpnGUNcqqGDDQ+jy5AfuH+Vrp0xGcwjsJgZXq+vDwgbblcwW84LDH1iqsJLnce7MA
         Td2p+LC/ICdJewhs028Jy6Hp1YvnbzVHWs4hQ5T+igUsErVyVLFNtbfRpyV5jXaiddxJ
         odKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544392; x=1787149192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1Bmj5ZZaimND1aKa4lg/F3Uu6RM17i4yCaGTVGWWA8=;
        b=AUK4k76VUpE7Bm3p4QsE45T6PHkp8tNKLvhrJPUAd/m+z9oGNC+CrKOzaJYRsbhE4J
         KQ2oXRYxStoCN63lfAMUhIkyxcP6nD8uOm3QNIpbb+sF+rLr/lpv3yRSo+qQb0MEpclP
         7M+hJY3FYAT+pVP53ra80KHRZVjUvFS0TjGUWPyRCv5DfW6EVnivmS+4Lfu7HiD3qRUR
         QS89s9RQ7FuuKLooc6YzcwEjk5TwnqQkWOKDfyzVIuS6aOALIHVhESSaKdDzsbD7MllT
         Ko4pm73iApAEVW7v92YhoymbW8YWxxcBw4Rr1dMov/KBvHg3SP+1c2xQPtpS6WaUboWF
         vbQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr69yeaLMbeDnCuU68fpAIjGJwXCbBTcWNdf3cwSP4AskHzEXWVRq6wr3b19WMBzaVYqysMQwzfGkPWd0msSZHI8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuRznKzzlkH3v5Is3U9vzNXI5nGcX+D2jQlV4wu547F1KnKIY
	EzEEu33VmuaJmOn7Yu7PeDdG4ZiLojc9YokRA8Jd9gWMoeufWG292Eex
X-Gm-Gg: AR+sD13QD13+6ZAAO09l/0HAV1mRncAmtOgximQweYcRzhLtxWOtBbj/MshkKPK/RND
	SOuEE7/iUCHeUGhps26cWg1ppuRRGbcG3sv0X02fQhB75tptRyNYLYKwQBeXmANqLoNmiHncx0b
	0iZnwoyzYs1eVrVjvjNVbGXXr8XJmUYXGBgs3kjzcn3iWi2XYjqRpPMXx9wlB3kCRCH6UniwtN5
	c5ALpuJxsPIW8r6/4T2P7x3IGtYyrx0ls5DBUzWpTOdJUHwvX93CfmEuSIxZH6f6o0GxMFSUbIZ
	r6KGnlfP7msAUYRl2S1kA3QU1c4TRMk+CntQ88XD6MLU9CHST2ZoJKV5rDSlN/OVvX6qDHZzIl+
	+YBTmE/pi/WEkzFAgwIRf2K2nwtIhvImsjYYujaVdBloo9t6QhgY89g7HmN9CAsYaHidsxxpotp
	OZO5w/Cp2M2o0Go7JozNkOb+l7+nv5Gq8oyYMgsQnyYy633CmtI8fHrvB2qYuvi3GmLbzzKu/9w
	LuLSIqZyO0Q3A==
X-Received: by 2002:a05:600c:3baa:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-4997c10710bmr88140485e9.9.1786544392175;
        Wed, 12 Aug 2026 07:19:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:51 -0700 (PDT)
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
Subject: [PATCH v7 6/9] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
Date: Wed, 12 Aug 2026 15:19:24 +0100
Message-ID: <20260812141940.246223-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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

