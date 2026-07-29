Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4182486642
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329768; cv=none; b=UV3otpC2nrQbhgdM5py4D6DtnJCbd3zvGLizoXgeAKhPVqK8RK1E3MnrMLqqysEl5WC9IygzQryRFQAzgOo7EErGHU8F6B9Vp5ropQfRbwAsgIc78Lag0b9+JIxJLHZxysEmEyP3hut2rIrneMb1efAjeJwvgIaRLJ+jFsK5+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329768; c=relaxed/simple;
	bh=bKz32u+YWLUry80LjwIoPwPao7w4t58HMrLjPY1RktM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVuvkTYUsQZrpxR9SxZHkqcGIs+6t9XDnEq/AJTHDNJQ7eBR8+hzV+clhRNUZR7YdblS5IZGhHh0JXRNJTyumSSQ7J/uAnUEWfaN1p2AXe6T+YCwSjqm3c2viVHLM80uzvJO9beJkXgDPDRZwPf6QbzmY8Qie3qgAxok1l5Bha8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlDQctQ7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlDQctQ7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47db714766aso1230391f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329749; x=1785934549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnWzdGYJU4akkgeW94Uw4J7Vuwt1Z+oPdqO1diFcrX0=;
        b=MlDQctQ7tA1+urbYriOAZGGntE/D2iWhMqMnpa1p3HPexwhJdG5gokDJ9N7b7TVHev
         uRnJkQNXtkBwoUTl7mIaebnyLCoA35EfsDUMYYSSOvCCISl4GgIqe4WbQ6TWGeB5OUgm
         85IBZd70cuCw1rymbTyJ9lVFkRuYc9uA1y+YpuhexqARdlIuLLEHdvzKxqE7fe6hgGKL
         PEo0e0s+Aiykt3bH4Nu1fCrRIqLKdbYQpWo9SNi9h7/U1TuARgr+vEjlzsafnMgsbgki
         XrlV25j7evAqANDBj8F79TejmJCLxyqYN27Qaf9u9ctAqOzOXKSJ21KuTFG9pgedywQM
         1HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329749; x=1785934549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnWzdGYJU4akkgeW94Uw4J7Vuwt1Z+oPdqO1diFcrX0=;
        b=PNVdlDkAaqX7j0+YrKAEYalE7YGpwI7eLEW8nSRu1M+cgRTFWvXIsIBWeC0EOcdteW
         L3blu3zbjKhODFusLWuMzdqswY+bGRUoTXyj9H2/1MolvqVbt9d695vadisOs5Ku0VTb
         +fCGNWi9cR6VGFU9IcizpyWGje3oeVD8Gu2ye0fMIHLAQn/WJ4FkCo7uaWxF529S5J1B
         NrF7xNIuTY0P17oLyJKGb5GW2AoXwgsDGuZjFvTiQw2o+InPn8IdrQATVdmwEuwJ/2pi
         Cux6TqjSEgww/WRoHOHIwHHSsI+zqnQ5GvfLLH+7FOpBMtpisGBZDap09qDwsRgrE+Fm
         NOdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+fQtM19qCS1FywWX1m8ZgGXyCuUcuFWz+GBDnH0DCDZ0TnzL9XIYOdwpi0S7h6peRDSHf0Yce3FHv2YQvTPD+1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnhqx/OeO00HYYsDaO/6lOuQMazw9Vy4i71dIw0Mx8AxU6lB5O
	/kAFODCKIJC2ncOpWUWb9rZh36lY6kfzHQb7DarYvOJMjXBjjtAFnLbo
X-Gm-Gg: AR+sD11cIhLAzW335RNHwVhBLYwWgkmDiOy0+zAKSxnIzIf+1unNpq+TJZzUlJ6ajiB
	3QlRus1KCFKD7CrUiT9/iL7LXk4obzukHAEbpnpiWt1nDX7ORhmzIWJa3tNesztofXP/JfD9Nob
	+UVBHvgVUDvhLLsUmcrlgyfEKJ+qYouvAOPrSG7xYoxN4qwTwpBnrlNya4CG5PNUqHt69hkVRjr
	F8lt6a6gpJqmz2og2IWbP5IHe5CyR820BrNNB2sqr+Cj6E+yq8TkLb0nMvkDjQ3Pmt9f9Ora4D1
	zH4ClgXHJq3ADkQPL28s363HHUHRio3LLi8sWsPxAsFCPMnWfpv+iudezJlYt1PqDPqYasNIPud
	qZe5BUJ2C4w7vI87S3NYDQYsdvyGrtbArKB7Ogun352gkkNv6uyAP0qsAz4qNtNJlWVtEaqPyy9
	2Y92u+oC0IQOhQrwJ2K13WhEALV/p52rgTVyO6a6CRMPUSbV7dZGvd6wUZz5SczVk9X91opXdh/
	4ADRqA5rlZk1A==
X-Received: by 2002:a05:600c:b99:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-497fd315023mr26656405e9.16.1785329748820;
        Wed, 29 Jul 2026 05:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:47 -0700 (PDT)
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
Subject: [PATCH v2 15/16] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 29 Jul 2026 13:55:07 +0100
Message-ID: <20260729125516.230757-16-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
References: <20260729125516.230757-1-biju.das.jz@bp.renesas.com>
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

