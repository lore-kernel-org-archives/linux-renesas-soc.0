Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882146982F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766565; cv=none; b=pvD8n83+kJNLnciseeaRtYfmKRASDOKlhOMyqXmG2Hwd2zu8Sq+etoFHVayIFzhaR8ovcBMG/FLDLAMb1wtp+01HSr9Tgr4QTrLVPnMEGc6zLzdJw6iJxFvqep0mUPj5bJ/+gDvzJwCEnsFLU7kcza2Ir8R2GHmCRlVpR/6366o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766565; c=relaxed/simple;
	bh=p9SswxHbEsu8/KF0kHQvhtWGdr/Nf0H6i8JYgP4NQuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RE12QAR5ypuLg5xjChUBBr/5fHm8DjNA2evhBEmq4/bq/ONvgOh1Nkzo/hyiAB3ihUbvVSSF/RNbWDtGroAWm0hWIZo5h1KDSl3TmoQ29GIrsh9bfaupUG3icBlnVgxSET8YJOwjrLo6zJ2QTbcdrR1aS7JSFz++SLQYHGXos+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beI1EfOz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beI1EfOz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2107509a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766550; x=1788371350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=beI1EfOz7lAxQEkhnH9wSEvVNyJXBQXJMXL9FyreZEycHBjd/EELJh7DP5xbC3LkA1
         tOwUNeuYs7rGHgeO9mbU0cc24iYO4cy+QgyqKJ9ZIUmCEZchBqFzSMY5lmSD7paVdj3K
         x1ObyQPPnHrM/mpjY3E54/6evqJZZa/V33eoqFTht0K6blhGTxmPny7H1sV8lvhLeYqp
         zYt9SaaGAlW/mIM6wlqp0+aoQUWp3IcDZtnWIa0K0+M/IuRaQMc+G8HLHHXqqgm/DzzT
         xERplxrAm8yrnYVJ7PQNTg7j+9o+aEomq5gBTYK+/gLM8AfKQRwvBkgWQYcbxY8Yvjbc
         zljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766550; x=1788371350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdIXMd3valIFt9nZNwXgENVj3LUWWJ+9bpSH1pG21+M=;
        b=Epzo2uVq3Dig5qLvUQ/ATEDX+noLDIhYXiK3jz71T2+D1oevdpvlQkzfozlA2NtPLh
         QuLjC37RnnVu3oybvY7nTts8JUDNk+pAAr32VYRHM1rKe1Zs5TUaz5Ed893sDHE4wJ+S
         b5C4qxqc3VftC4M1C7Iv+SlkQf0MKYo6ZBd51gheBgHgI93y7pcDSpCZ8zkYTrh/KDFz
         0kpN6Z+c2em1Tik/alaGubjn3Fd18sxzScfqpFnCGnQmYZ0r9F6bhx4G4gGoYjKlLtod
         FfSslKmeExcxD3RkXMsxLvzdERkHK4ewbQfZqNLrb+BicyeE7V3FR5Y4P/alsniSbtqV
         U5nA==
X-Forwarded-Encrypted: i=1; AHgh+RqDIuMzEJZQYCFa5czaVcnqn2U7cR1+W1Js2NmLVZCis4ehbi7CS4HojA8WGNJZto5JuqNG1DlMXkO1cCQ52UFhFA==@vger.kernel.org
X-Gm-Message-State: AFuF++lGzJEUIDDIOvEBbhnqi95PQGQoeWk/8ZzPgI5gOcCVVIdujRhK
	sIYpO7XdCylPV8lfbu/b7RcqJcYppHDZ/o4l5/TJA5RWvuSzIQLCGN6n
X-Gm-Gg: AR+sD12TDXKX5A7ycgsuYi0p60CSS1FDpr6NFdmAeDpyL9UaPqEnRQSBQ5h6Ip8sje3
	Bol2f8/ixXmqa6o5maAc0eDX+jtyFnj18uK5mjngqvIhLHIbUAkkUu/FHWdqoxZ1gZEs0ulFewY
	VfDTfEvR6wGj0aeL3f2TgugUQ+7zlCcGRZbYLzIdLnxuD8Fh6idyHQ63rYv/OqL00F5hh4CdbF7
	cVCY5u9Zjwgsy9Lf6kWMW7jfaPgGZYmPM3BzFadbrlWHk0AZOH++NdYhWLWNDS601jxe3BuZdKH
	wBFDqUrtgBOjI7o2QHdBrfJhMJ04rXlmpK8BKWAnk3Psd0E9uxPZdF2b+MSchL2jUsiG1iSrUgM
	2zCJxtpAhfPEy1AdNLEoyi4i0slQf6qDNmEsc+qi7+5jGQsIVTbuoS5pxG7vTeUqvFBZb5WGkvY
	dOI/NroZYZz+4pMB2w7LXWtT+HzeZjZ8kKD8vqwBeoHYIQ/TqnghKyLtrloPJ5t9QVYRdj2m2Yq
	ycTiLU16Hw0dg==
X-Received: by 2002:a17:907:728d:b0:c24:87e3:b8b8 with SMTP id a640c23a62f3a-c250c608d0emr1094954566b.17.1787766549920;
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:09 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 26 Aug 2026 18:48:46 +0100
Message-ID: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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

The overlay enables the DSI controller with a 4-lane data path and the
display unit (DU/LCDC), and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 95 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..8c6a44890715 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..cede3b4ba318
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
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
+		};
+	};
+};
-- 
2.43.0

