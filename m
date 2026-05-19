Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F693DB645
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176847; cv=none; b=HhSKjJOhBrM5yunAZortPxxt77iWwD+oqoMwvzN+8kvp2ocGqA6BpEIvLdgrq4NU4C6NpZOmc/ggJI4/lCyAU9Y+eG72AoARSwj/49ftqYsFxsp25kRw/CxFfu1VE7HCMQin3nQI1jhGpCIY7P5iJL3FTuIrLj6kszSl4sAKSu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176847; c=relaxed/simple;
	bh=0tycJNG/wmOlkyXuIL8OdiP5m1vuItODIsnO+XdRIc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZkShOi2er23rscQ1HmjE2v6dPtpP/cq4h7FRXMIL3UFpaVj1JJohTfXQvWOY7KYaFyWzP9Qe2da3EsfqNDg5gcy/sMFgQlVC1ql0TB8eDBTxvnYmBid0pT7z4h+GrGmVXbo0wcrg+S0UmLQzWAzDOtdDC5Dn6i2nJK/aZJGzq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KQJo1Tcf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KQJo1Tcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ERN11/uoTCp6YgiSMoQMMiAPnoJ+wnNVRV01/QwDtOg=; b=KQJo1T
	cfAsUNEteZNsWjog/pBjyKw1MS4/x/+Ipl1b1JiG7R/52oJecTVweF9hnzXe3R+R
	MYNmGvWF0+hW2Pd9ukTFe85ZTAL/bd6Y7NfwSzt9Wv8JhVo2msiIJWXsjAAR///n
	NsebzzRmR+weHWRTQ3kNl5009Yye6olZaJfzzXeK46ih+Y+uM1zqlFibQLp9zbCC
	F4Qk3SucYRAc1dsTZ0RCRk8Utf3lg8a+taWEu0MMXmd2NdQi8ybIkpfWP4c2ozs+
	GfTsn2oDA9fEGfBR/h5H1YWs7uRuS1Cii/E7cbWf2rX4g2APhVphQQWTa6dGe7dN
	MJteGy9JZb9PQNcw==
Received: (qmail 168030 invoked from network); 19 May 2026 09:47:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:47:14 +0200
X-UD-Smtp-Session: l3s3148p1@us804yZS32VUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI
Date: Tue, 19 May 2026 09:47:04 +0200
Message-ID: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Enable SCMI via MFIS-SCP and STCM transport area to manage clocks.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index a721734fbd5d..86bbe5fbb118 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/soc/renesas,r8a78000-mfis.h>
 #include "r8a78000.dtsi"
 
 / {
@@ -20,6 +21,23 @@ chosen {
 		stdout-path = "serial0:1843200n8";
 	};
 
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi";
+			mboxes = <&mfis_scp 2 MFIS_CHANNEL_TX>, <&mfis_scp 2 MFIS_CHANNEL_RX>;
+			mbox-names = "tx", "rx";
+			shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
+			arm,no-completion-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	memory@60600000 {
 		device_type = "memory";
 		/* first 518MiB is reserved for other purposes. */
@@ -80,6 +98,22 @@ &hscif0 {
 	status = "okay";
 };
 
+&mfis_scp {
+	status = "okay";
+};
+
 &scif_clk {
 	clock-frequency = <26000000>;
 };
+
+&stcm_transport {
+	scmi_tx_shmem: sram@1200 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x1200 0x0100>;
+	};
+
+	scmi_rx_shmem: sram@1300 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x1300 0x100>;
+	};
+};
-- 
2.51.0

