Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805318;
	b=IXnsO6FA20qpXIw+hzE93Hh6NEMOog9F/xH683a0Iu8w0Fop5/PtKusmEdmLeZn6sr/k
	 p5JhEbMwjLcNkYBzLBJunq53CTXXQfeMIENxv/aT+7F4TGzXkITOVDuj+2b2Y7zLLCr5n
	 BQMLKl0Ftmkx2DETnR8vCuNqkzmM50gSZKXc22bDBl1NTJKnQvUNODttR9MYoqzR1IkYd
	 5exv1znBd2zpGy2qYgHZ4dPWkJM5ekmTd3WzTqey35AJpIvGefn+SiDG1bcdclFuaKhCO
	 GFUqj38lFbkBIriPsjXKpXvA3nrp1C9QpvHghTKEGSxSPjOwtEfAbNfNvrm8nGrTR2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
	b=0CoSBOg8cr57mtzZtFUJg7w/kxPS7rp0P+vHQ2e3GBO0Rxa3aV2MZMNTXOJ6mLqx4PpB
	 gyhlnhj126yyOE9LE7+5cN7J4lKIxGW/jzKH72KJ8WDDLHrGTduDNvvF6rpHP2rQdxHX5
	 HBfmwhGJjO6R/O0SBQV6bYVv3wrfg0yvvaxmW9ZzhFNOV2eUBxVnxCCS1DHax20xZhH0z
	 aiZzA/NIlnHyHbJElPUNnRwMEu6sAyh/aLrPOkrL8gL5zfFhwkn0OqOOcI2M0zxbLdS3j
	 86L811uWJaia2Lb9gTANPaiLgr8adIeDV6octWeREsQZ3gQtKkIK5zyWETr2JsrUTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLRU+Tdp;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49370606A33D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 15:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49370606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLRU+Tdp
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso669551f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 07:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805317; x=1794410117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
        b=WLRU+Tdp+3pDCB6CjUfwuPkPY0nJLQgd5Bb1pIzuW8ZPL1XCMQSDT19oGhb5X5yxGo
         0c/EnzWMc1Gjwmy+MSd4z8yHlU6MXCc+KjYNh0PLKXVtP2rjebWnJuKD/tdfkROEDZ+P
         rHPTuZExhJq5GPGUphbtKsh5Y0HrrO9qj57qep4mrNP+j45SsVzJe+5793q1CLeCxnKZ
         jJc+ObI2ypj5hP+gQpKqKhyowbf9uCjDYvNutZBl0gG6GW0afUyVFdMBgBttwQlK/w2V
         A8XjYXUptWGdzYZ4La8iPnom0sJFIjRiofLhM3CM4wSAZ/nsB56WkWOLOrtbO777i5bs
         l0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805317; x=1794410117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
        b=kug92i3N9j1nUONZOdGVGyWNYFPNVeUSt7av3gQqbCGJtQnPWDO+F+1oMih0lb7uhI
         Losm08rWvaZ1NBdF5zM/4dqkdamSHB7mDUxutenD85/AFm4PGi19t7tTFnFERojec5Xw
         UmkeFnhTn0Ysv9xB5RkemKZuciW8SvsvJapGwKu6gv5piCuaAQerzBiU7e1JdkrVsiqO
         k+wFpuNnE2UQqWIq5QSMQNQ4nUd2sL0wwQivpnwq9k1JaMCTm5eMobhbwkL0InT3j7Dm
         hUBfqmKK6gEm6L6wz25A/ZXnCEmyD9MqOHUobNgm515tbhPofxbrcU74yiIaBAT+aJb8
         8jLQ==
X-Gm-Message-State: APuU4Z8Wm3mZH1Uuxzcx0fzqYCoA7wu+xTq7FHSWi5AwxNLnVcLgng7T
	Wb0yC/4dnOtuvlVW840ruJgN0yuNC1ZsgpXjwUNaRXYzSwOEG1VClHNU
X-Gm-Gg: AYBFou2p7T/phsD4B3d4HXEgtHS6mvEz4u7zA0hb9R/886y7u+hTLW4Dqig7hj9GvX+
	VkcOgQGH1QMQIOAeE/xmBFFJHlNkL2N341urIm7pFpkRx39tw4H93BfeXMyVpQCUiVH0TIeMKhn
	KkEAWUJzTe51tOz0ysyZ1X33zQtzE4TD8o8NyGuOrdmJWvOdBFkLpytGEgqvjwiq4sKx4LbDmxk
	/H/E9UWyPh4ePci4aX5WU58kmHclp8zzxJZrm63C7gAWGFsf/leHQPQEwJqcOdRG7D31F8pn2Yp
	AR6FT/sTtA2PDQ56g7uGaFIEJegbJz7FsAgC+ct8dCWi+eWfEqdJDaktiutqHcKHHyAt4l53TOR
	gFvWly0TB7bmJGId3OLp3O4ugHnPw1b0gyZFAV3J+PEr5fkcOmfcwaPZVERRMM21R03VEUWZvdJ
	nZ4zHUyfLJb7ak7NERCNKsBiy5os/X8e1WGod4Cu+WuYkBVw4lfyzHGV5d5iVF8D9HQf/mhE3Z0
	WnQG3w0ipH+Sdi2R+FSXoHRw8iC3ZX80ATOkpKbrB2S1Eb9iGfJXwbUkCwcDp/Phkj05zt3MVeJ
	QXYWXLB2bqFvTmoOxMbdCatvm60tGrcxX6mzryQMoMqyzdl+71dZDdwjnbi7iXaTJg==
X-Received: by 2002:a05:6000:250d:b0:490:76de:c78c with SMTP id ffacd0b85a97d-49076decb07mr2812629f8f.9.1793805316530;
        Wed, 04 Nov 2026 07:15:16 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:16 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:11 +0000
Subject: [PATCH v8 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy
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
Message-Id: <20261104-usb_rzg3l-v8-2-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=4175;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=5VvLyGi/TtYzIa3NV+rO+kElbcXZqOG+hF1Kq89+y6M=;
 b=q9p3GpW5Zxm4R1S2OxNnoguGWnDsbH9q6B/rJUyGaPE1XTHtIj1yQiGj48yyShbafzH+JbKkx
 B5oomTmaMWGAo+eVH6WsgOZuTaDe3wYuMIraHE9P4LCpGTxHSI3leE3
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 35046c7dac54..4df290c9937d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1301,24 +1301,108 @@ queue3 {
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

