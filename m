Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5934D5963
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847657; cv=none; b=FnAk7B2kYf3SyzW2IcdOgVWKAyOnZFG0Inm7vf9gutG5NvvhMQGpbVyMSvh7UDME0ZuE4wFWzAJa65PGJe0vm7mZJoQT3z4oBLI78yr5ahA7nwrENuM74IDXZoCRJ9C219/XwpeYiji+XeHkJ14MxtsNc1fOVYX/hRq6P/j/j3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847657; c=relaxed/simple;
	bh=TRz2DwylTI9EkOx4yFanIR6wvF1GNRS/VXxzoubwEO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxc4n/vnnY2cwA6neB/twRZS1GPmlPZW9IqA7rJ5agQGyEAPZ4r3Hg8ARyOyqni+ZT+1PZhnlz8VeLm249PIiffTiphIsXcws78k7InRwidVwqdtgNpgBcF5EUGgV+lZ8mINxI50s2bxhlyRfGq5Z5047E/hB5s0ZZNb0f/slrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4caqy03; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4caqy03"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so40876325e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847652; x=1791452452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pDb1ODAn/l81iwN3Qc6cy4OcyCcwlhUk7coh/2BDko=;
        b=I4caqy03+e+ZgEFZfl9XS5MvXiqTTbdhxgrrnfz3mbgNY+50GuJmEeK22wboP9/z7W
         hDGCaO2kZT92PloOnq6dYf2c05wVRRuA9yL950bwfP9paLbLY743MDHzCGzqxuABBCpu
         KxtC94hiw+svqJ3epNvKhm2/vwzpgeS6Ux8u3CkszOJKGreqnMwcaH6EYqU14Q9A9fjC
         upmsWwCG9LCX48s0MMnW6CLo1+lSwRFqG25WJTChS+53D94ZviyqRZf0mves8OPXpuU+
         Uj+c2xdold8ilXFmy9BeHJgZ6prIbcNvVBEJKgPfXJH7+rQTOpkzGIVxags1uxV/hrQr
         xsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847652; x=1791452452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pDb1ODAn/l81iwN3Qc6cy4OcyCcwlhUk7coh/2BDko=;
        b=hLOcBSG7F8M+bXaBo6bI0xaKWWIcjCIyWafxthpn4N3nA4DCbvFS1qjrZm4M/nXTVc
         P+kx2hs0L3OwN3i4wroySiONopBycBiyZc+zmXvb2DFcvtTV463RX6g/m1YpWgq2UDMW
         grmiTMfcDHHQsluJAdrfPSY+fLyUl4peofWqHI2u15P5FF3vDy2mDKkJaImH2IPkteT3
         NwIPAak7aUzFbc7L8Bw4+leEnGm/0PkQFsX9Om2M/I+30hFTBZcuCpIn8OK1NictD1UC
         dM6gz2kT3vd0SoTzaFVLSR96JYHpSVqCjMeeJ7hMtqBvmUIUiqXOxiXhZx19knMgCNza
         1KmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1jcwSInnc4max7diYkasjusvvZXV76Bg30f/qQZK5hLbFJLrs9xqWkgV0/aJ2BDclRtEaDVsGdHq6A34l6HfT+A==@vger.kernel.org
X-Gm-Message-State: AFuF++nIdjqoUYgC59tcXhkqkiXbdDmIbKCoIAjMOMoCWEcD5LponxTV
	uxul6C1KMc5BJMWHwD9kKv/XFvClTVZl4HFvyxWwkownL8xD5EpixebN
X-Gm-Gg: AYBFou3+PCpPOEkLA5J6yosZ6+rUTUdZhfKscIHBEv65+W94FDUShJGP+4gX9LwIt4u
	miFTRFy8xO5MDmo5aGT/p9BnXbjrnlD59o+fPFZSiGNXWwxR46hp4wjtt/zZArfYyLVE+PVGjX1
	7tISSpsD3LEF4CR8BxIz8/+2tVE5PHDmC9V9G7tbypNkhariQedr+ImiVMaxib52yuio6W3+LHP
	7mZH7N8jAojYsoc/P9CTJFJ0FFvkAqu3Wf4i0MHzLAbOV9rcUoBuPi4bNdncvwx4rAi96DPUgcz
	reV6uRqaERvdrHQnq5ZxnmjJjIiJkG/18n8vHDdDYSADAac9znXr2SEMwtRU4+VihvbH7/Gh/l/
	EQHSiMZW17lLfrgvYmiaTqnCU4ZEa8azVv+81ewt3Zyjkk5kjiH4bKBO60lY+9KanpxZosQ2wr3
	IwRkk6KXEpbuU/9VONRD3Wqi0Z9jXIH3f5HajZ2IN50Rz/RiO7rDzzRn/Uq78sLis79pMxNJnF1
	xhG
X-Received: by 2002:a05:600d:82d1:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-4a01b004e50mr77364385e9.18.1790847651525;
        Thu, 01 Oct 2026 02:40:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:51 -0700 (PDT)
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
Subject: [PATCH v5 8/9] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Thu,  1 Oct 2026 10:40:23 +0100
Message-ID: <20261001094041.135697-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path, the
display unit (DU/LCDC), HDMI audio and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated commit description.
 * Updated license header.
 * Added HDMI audio support.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 138 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c6f3718cd19f..b9dad3f44ac0 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -264,6 +264,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..1e1ebafe2439
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
+ * connected to DSI and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	sound-card {
+		compatible = "audio-graph-card";
+		label = "HDMI-Audio";
+		dais = <&i2s2_port>;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_con_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				codec_endpoint: endpoint {
+					remote-endpoint = <&i2s2_cpu_endpoint>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	ssi2_pins: ssi2 {
+		pinmux = <RZG3L_PORT_PINMUX(7, 0, 9)>, /* SSIF2_RXD */
+			 <RZG3L_PORT_PINMUX(7, 1, 9)>, /* SSIF2_BCK */
+			 <RZG3L_PORT_PINMUX(7, 2, 9)>, /* SSIF2_RCK */
+			 <RZG3L_PORT_PINMUX(7, 3, 9)>; /* SSIF2_TXD */
+	};
+};
+
+&ssi2 {
+	clocks = <&cpg CPG_MOD R9A08G046_SSI2_PCLK2>,
+		 <&cpg CPG_MOD R9A08G046_SSI2_PCLK_SFR>,
+		 <&versa3 2>, <&versa3 3>;
+	pinctrl-0 = <&ssi2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_cpu_endpoint: endpoint {
+			remote-endpoint = <&codec_endpoint>;
+			dai-format = "i2s";
+
+			bitclock-master = <&i2s2_cpu_endpoint>;
+			frame-master = <&i2s2_cpu_endpoint>;
+		};
+	};
+};
-- 
2.43.0

