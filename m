Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1819DF6A;
	Fri, 20 Mar 2026 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773975226; cv=none; b=MWT/3BulyiRDj4R9bX+FWyFDE/QnYY4i6BbDFyZnxZRByciRhPqQlkaPKydTYWTBk+rLhGriwsr7RgMX2TUFPAVTxpudAvGc+vB6Exhm2If+nSJUnq7YjR9jCb/d5zKZefDpcmpRAM+7f/N5Frg7/QbhZTzC5bweGJ5APrDN8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773975226; c=relaxed/simple;
	bh=FSsNdEyFnwi3BirjJJdMIilHqXdQGnPsdS3Pn2WHrFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQF/qIZemGeixwi3dV2xVQngZrLGURnvnzwgpZuWYu7FBd/WwXf7CbKFArx2NfCmeV+WYmk1KMQX851jbzqIL6U1H3a0zrcknGulgvb52g7lzk59al0GsSsCWFmyLJpKlw7aulp0a6QYR0eaSGVqBQWdLstNVa4cTjH1utUCUnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X3yzj5Ma; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gbaOHn8G; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X3yzj5Ma";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gbaOHn8G"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fcRvz2gbdz9ss3;
	Fri, 20 Mar 2026 03:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773975215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wMCO4+v8DqcOSCfe4vtyKw5oSMUcn+2yn/EtWBir/Ck=;
	b=X3yzj5MaBvsKAI+Oi70dIy4kDjtl8bqtuUvK+LN4Nz4JCK9UAKXltMx29vA00+lUKqX2uV
	9yaDTpbyBSuubNpZFnNNwFzqIOTi8j8B0CvtTDRo5s3xcGo6aHnJPpfMonl+O8C4KlljKg
	A9/F9wXA9fDPTdL8Cx66Swa8v1PdSyG4DHJPbLwpHSm/qzTXlQuIm9a5nOLzfRmMVf8dkp
	T7mc48/e134+Q+23E+wz5q3uVHqU+ccmhpuTkUPa0hUbCgdxqO5+iPzO2SGgYRAZoL39pu
	cS6akPmldZ0McmVDkpR0dq6lafWah9cu+1DgxcMQ4QCPW1+hh2p3JAw5VIlxVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773975213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wMCO4+v8DqcOSCfe4vtyKw5oSMUcn+2yn/EtWBir/Ck=;
	b=gbaOHn8GWHHwl1PFSIqVyIWOF23N+owSDtcnRJWo8X23Rvd1zzT71hnTySXSRC09CUOmr9
	zDkEf0yLXc/H31CuCyEwd8yW5lM5lGoaxWUP+gUmF8YHH4pCzoy+bpMLsLJVR3m0cUN7rZ
	QucSwdmnqGPc0dEyqBNDIpsZGTJ5BTt6Nat1Pot5KznRX4lC5eY3An1ZzHu0ko6R151FtO
	0e0ejv/+nMlrv073bwGXV8EQvU1AkWbZsVdohrwomL46tf4H6lnu8qbxpEnWLNqgCqpAYi
	rErx4uzXshtuaAhQS2lGa27pDyt31734g4C22st5LUpDCzKUVOSWYwCZ5KxFUw==
To: linux-arm-kernel@lists.infradead.org
Cc: Scott Murray <scott.murray@konsulko.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDMI adapter
Date: Fri, 20 Mar 2026 03:52:57 +0100
Message-ID: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 269d16c30b3fa8e3270
X-MBO-RS-META: yrbg1mpq4p78qc6fxzidjxwxaogxj7mj

From: Scott Murray <scott.murray@konsulko.com>

Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Scott Murray <scott.murray@konsulko.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 ...r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso | 94 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index bca532eb67b44..65df431adeb6b 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -114,6 +114,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-argon40.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtbo
+r8a779g3-sparrow-hawk-olimex-dsi-hdmi-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-5in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
new file mode 100644
index 0000000000000..dde4122221133
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
+ * on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI1";
+		type = "a";
+		ddc-i2c-bus = <&i2c0_mux3>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&lt8912b_out>;
+			};
+		};
+	};
+
+	reg_vr1: regulator-vr1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VR1-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_3p3v>;
+	};
+};
+
+&i2c0_mux3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		vcchdmipll-supply = <&reg_vr1>;
+		vcchdmitx-supply = <&reg_vr1>;
+		vcclvdspll-supply = <&reg_vr1>;
+		vcclvdstx-supply = <&reg_vr1>;
+		vccmipirx-supply = <&reg_vr1>;
+		vccsysclk-supply = <&reg_vr1>;
+		vdd-supply = <&reg_vr1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_out_in: endpoint {
+					data-lanes = <1 2>;
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8912b_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&hdmi_out_in>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
-- 
2.51.0

