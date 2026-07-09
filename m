Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A23F39F5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585879; cv=none; b=lMSKE1QDst0WMgGWoBzGBiFKpPWUC2L8UWOPoLVXK7ikENT201mDthyHf1aN1hXDEu7GN+GSL6UdGXNu+Teog2AQjTZPW11duCZSo7rcDEqMU3kLF1Q/y0p5hrt0VPB28WHe+Omn5Oh34vPazM6QNLRlDNZIB2rmXVjtVEnX2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585879; c=relaxed/simple;
	bh=+Hc2NsEv17Xt0Lw/J1TbjwD0LShTHFlc8LsVKagph0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlUCZU1fO4k97Sp52X9rYiDm23NlR5X7tr/RP2U4hxIBxS5KG3bfeKsa1fWx6rdpqjNoud136tGUNxKus0P4lclgNYkMvgHy3RCmysgt7irmKmGrOFiIoWwkI23SRJ92mkQZM/bCfAsJm4uneu4zpYCFJ+szX8aNeGvCgNnwJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r698EmqQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r698EmqQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1356585f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585876; x=1784190676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tADu+nhFxgi4f2bWWyPf0e07RBSgcfre11o082KwIE=;
        b=r698EmqQzIqVernrvPRoYkU1vqLiqzuEK+Z/X0NDGanHbO2rUJgQX8n7CtvM0AbH8o
         ZrTljyUWiefzHXG/tucbPQ2wVGEFXsqtpUL0fqbNRwDueqvBm9WoIjtjliiwzgolbogg
         pYFbC3Q0BCwuIHkSVKgUiD6awS0FINr94/zdaoOqIvVJeyqIEeRt/8poyBf0UF3H/kPL
         cRS/e3/MsI3hNs/esl5nV9u+VEHWH5jQ5V6CPmcoP56WJn1/vwyxMw4A8bFusSf44xUZ
         hNoRPBwtrDMC1+oa/0YOLC39acsg60/fLvUWdVQmS6z4nPpj+f9NKd414/AA13XvnQ0+
         vNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585876; x=1784190676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tADu+nhFxgi4f2bWWyPf0e07RBSgcfre11o082KwIE=;
        b=kTT8n+pl3imGxGbpetEJok86EiSdjONb2YUgwdXLHthUN6y69KOMZRtABN+KzlNU9U
         PXZ+hNLF5AUfHXlbVirebDj/CW97NqmwekVs5+aPXIxCh7C51R4XIxvGkfMKc9+etewK
         ADJnHDghELWQ5xq/CKzqFUaKaljYUlITEJVqjQ3UDnK0NWPywQKD456B/AhFtiyYfgU6
         x53S2j7qZsffQHoR18MjCGEzCOHrJh46qRFxMpLDI1hvWF5u5w+699veYwgyU9ZumFpQ
         V7mEiFfvrw+/ADgqyJoec4pQv2IEE+sicRhuWrls3aecdDNf+L7buTArlrEV2xPgEfis
         YVJA==
X-Forwarded-Encrypted: i=1; AHgh+Ro686ZgqHDq/AB6ogvpIAfPmFnv/Y2JqY7aahrZD4fQPa+wQljEGfoieQHi91A5pt6XbMX90E3GK7ycmW3BA3yRWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzYBk7E2flqwOqfRxNmoHvF5tNlFpsBpk8oEm1Tf08LA79NgK
	99upUKCcZDEdjTTnp6tnJX+c9NtU7ALNmVEMffNzlOm0W37ibpaber3o
X-Gm-Gg: AfdE7cme4ZwsqP5AB9DB++dBwMttHy4OOkPfdyHc4DQ/p5BsfPHgT83BgYlkudp7P/0
	lp0p4qSpu6Mqv8v5vTV2NOwTW3/QoiZdGzifmrVLWvm/Yl1GuHOdBj5P+zzKIwo0jXwyoFf1lmL
	LOwd6nfeUJEofmzb2cO4XtDqW0CU5Zmi4Se535cwFTZ1ZkZEksKkpG0bcCqnKbjCVQUI4RoTYPp
	QSbRST+KvGeOdZDYLdjQBJ73bIaVaEksLw7FxCwGKAcT0yqyyjKyhk4Jfa4lDVaEw2yRLeeKTbi
	PobYtVuHbwIyll2LY1jOf95IZCCW75vz4gHECtLhx84zLAK28RBTAtsITmQI3hLEetfDeDLoJaC
	8z2XrGzuspQLFr/Bxj/FzjuPcUnHVjkWrFaLYeGS25sCaSuNZjfRceJfEyJzmzxGj4bzV4EMFGm
	JazHlUgP+zG1ZptOqQMpzp4FKFM2tGfaM=
X-Received: by 2002:a5d:5d0e:0:b0:475:f100:35f6 with SMTP id ffacd0b85a97d-47df0770d5fmr6323657f8f.51.1783585875948;
        Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
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
Subject: [PATCH v4 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Thu,  9 Jul 2026 09:31:01 +0100
Message-ID: <20260709083108.108370-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * No change
v2->v3:
 * No change
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

