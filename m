Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604747;
	b=HH4VOONYlkAHeH83wBGJIejP7YY0vHF4kWucVlwa7PyAJ+4zAW2K6SPmgHrWeqFWDOBX
	 N+gdavHuwYtgreY5KRruSUqEwQA/R+nhf4daIX1XZX1e80q3mqe3NdlsVDvSfqR4g1kBb
	 83C069K5XMXyUG+Qlh2SFHd15xwWOv/Q1IM1uHzm/8psT2BcXkZiappmeVPrXXYJIOKga
	 1HomXcl7xC0AnecqkVHd1P2CJxDxF936wXW1+j+rBEp9G57uNafG+Kyxge1feA5XIP26s
	 WCxuamvGJ5gBVK5CsWzM3t/ddFCMotINgHApn82fZzuoB7qo2Vy0ZWpvbVvqVcuHjGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
	b=zel61WeTATdcruyhg5+HD134hDUTA1Fjvxxr+kW2yZQwZ6Fg+ZGBTBWzuxY9imlnBdc8
	 jRPaFZDipejeDCeGPBgm4peq6svFKMma26nDrIE/i0qDrvvd9APgFpXeMCxmv0lnXq77Y
	 zOIEdGAHqEyjGOGpeOo+eyOxPtUjuU3SuH5AmhHz7CqNKpHAsrBF18J01CqT26qC0Dp7S
	 DFU2PC9or5bEJa06U7dsi1yA8f1QIJ4OFylKAqDPHUrjF5UDtmr+L4Jr7IRXGS7MSB8RY
	 9nvLknBfn6vAJQ0L7TZ3kU5HvW1Q3bl0JorCj1+F4keZkRaDgwbCl5qCBBypkjI1IcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e5/h85mT";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94AB606A32D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94AB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5/h85mT
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40291645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604745; x=1796209545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
        b=e5/h85mTL0ektcUDneo/flB02U+2vifMfzWGA3s8st7g50Mm8rN/O4AEnxJJG/g9If
         BedCJkeMWLRoUQNfq1ge17lofRWXCivUPwdqYerH0aEFJhuniCNoSYETQ8Zxz8WL988V
         j7NvzajNfHlp1w1mvmSLpjHFUHyDqQP0+f9eCO33ixNuqHvDQt3Q2k7GyL+IdPk+tQRv
         hOEeJ+XUOFz+clmcdP5SXEVuyxPMkWtCrnH9LdnBScaid0aKk0NfUbVwlZ47mPbLCaJg
         GnSC1qevtfm+Hc2D1tjPNUiwZpOc5v03LbWA2FnsUc8b0y1HrjD6xjD2lhmkmsOZOUhp
         E0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604745; x=1796209545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
        b=qpEkggXZFge31dysB3CzaOFHfhflYfROt3eDFwzAtMffEwVA5rq+eKEHnDHXwtK6sj
         gX+o+5qKTbDmV5Hst/rKKpfS5g+wky2aJPSn0QwNF/1P2xIDMd72uHnE97SLh1E7GLxb
         0JzgoB+SgzXLjBt45rsS5US1kMC5ISzG7DM1icL/yYjpN5l5jcHMfukzB2CjuGzvjOuO
         NEfswGDj61d2pR3DBFTKBNKziLG4ShC2XOurdMd+nnYgZ3POZktfkIOrz692//JzU/CI
         LfH9WAbcz9nX0/L18licpGmKnecQSuQg/cjlI0tp7isLYbi38wqIcq9yG//QAfN/UKxl
         jz/A==
X-Gm-Message-State: APuU4Z+35GbikA5WcpNvEAw+6fEnPyaTjoNqt2mUeKzTLy/cN7hL/s5f
	Or8vBQXDXACZ2Y1kA65uam/PVCyMvuxGtcmQT59W3PX0NV9VGc80y+u6
X-Gm-Gg: AZFdTZdwi8b2rdU74g9Bwg+bk4lE6AlLMEcJkmz8IBByvNLRLy04/tai6+DuYU+eIxo
	zSRPXRVSAd7vBc5hyMBlloJ6ehQ3oKCAncxd7iF3XBEjtclAvuzeqy1WDSs8KhWWd0dfm4xsMb3
	o9rKEjEOBs5sfvOCGTFNla7+OJ68A143WQX2f+mH9SnkBRbZk7It8OAjAGrx1R4f+mMb6DTEw7Y
	xHCKKN0wTea9jbELMCYFTZU03AZMtuJZJ2o7h68gFx58EOlSJHlE9lMiiYXRPKVtnclvOGv9Tdi
	rM83FeGSqtBr4o6YqExtWr0gHKIEEOSiEtyeuPTCnXjRdaCpAXqVt6vZzjOJXCN2Z2bBnW6qEOI
	MvF5dAzNC5iBKzG94b+EyHDV/BB8qwZCdMFHdsAaO4XkFt2gyu17ZhwElrBLSKWVpciAecjGVIw
	46NjB2oMg6F1MAtc60fH1hxfjRW3kYKLYSj7P+xXLAEmmEZGoNHMLFRw6x+4heLgzA2rqDojnuN
	JFdxsD6bV8XZSwUMlaawEWOMkfoaikQIfnxQyLHhM/3vcTtOlE59gEgiW9W8qpuWy585Or8EE0U
	ODMQ74q/LtGouaDdTOEnMvIxUnLtu/zOZpxGg3SYAk6Nm+XW/KgpJcoyDUANyF9b
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr346466765e9.28.1795604745228;
        Wed, 25 Nov 2026 03:05:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:42 +0000
Subject: [PATCH v9 1/4] arm64: dts: renesas: r9a08g046: Enable TSU
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
Message-Id: <20261125-usb_rzg3l-v9-1-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=3676;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=cvdbZw2plXx057Ta6XF1i01Ee8kz7WWfrS7n0IZYwyE=;
 b=+6i3FEMJrrnD8FfFXno5km4oX8fjz4IoOlZHDrYI1TZ/pKxBCdu0IC92GrUWkwH/L73msh6at
 2/2tkcwl3+bCn9Wop/hQ1NHyAE7jgOkApqytIM6Nv20sLtqJk6HC10x
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add #cooling-cells to the CPU nodes, and describe the ADC1 (used
exclusively by the TSU) and TSU nodes along with a CPU thermal zone
using passive and critical trip points, with CPU frequency cooling
maps for thermal mitigation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v8:
moved from [1]
[1] https://lore.kernel.org/all/20260925061617.127349-8-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index b710f47d3f03..241ba7b5da74 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -186,6 +186,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC0>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -196,6 +197,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC1>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -206,6 +208,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC2>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -216,6 +219,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC3>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -381,6 +385,37 @@ scif5: serial@1004e000 {
 			status = "disabled";
 		};
 
+		adc1: adc@108c0000 {
+			compatible = "renesas,r9a08g046-adc1";
+			reg = <0 0x108c0000 0 0x10000>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
+				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G046_ADC1_PRESETN>,
+				 <&cpg R9A08G046_ADC1_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
+		tsu: thermal@108d0000 {
+			compatible = "renesas,r9a08g046-tsu";
+			reg = <0 0x108d0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
+			resets = <&cpg R9A08G046_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc1 0>;
+			io-channel-names = "tsu";
+		};
+
 		i2c0: i2c@100ae000 {
 			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
@@ -1494,6 +1529,37 @@ stmmac_axi_setup: stmmac-axi-config {
 		snps,blen = <16 8 4 0 0 0 0>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&tsu>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+							 <&cpu2 0 3>, <&cpu3 0 3>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				sensor_crit: sensor-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				target: trip-point {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.43.0

