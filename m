Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917183BB9F3;
	Tue, 21 Jul 2026 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622613; cv=none; b=SY4f7LAG+AfthckfwGYNhgdTWcHaNeLxhAtPrlHsdIo+0Zab0LKctekCUR9hYKG9ywFnelm1GhcnUEBgd4JA+4qPw6KesBgM9EFA5ELcpDdQ1Sy38afHapNQO12SFFZ/L37/4aDCFjZHuaIvOK+AZcsPL9Lq6kP7Co7fHzBvn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622613; c=relaxed/simple;
	bh=ONBGJZifkZfXtPV90cegqCkmHy/uHZ5pp8nMBX1oGEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwTBaPy9FqQNIGELGOyxmKXYdZck9+5CkFPaZt14GyNHYwAUb2qeq45JdDEDrRAJeg6TmH7ZO2J8+w9uj/6uezvH8CUan1ojcae3GRqo7URSsW11MmmMI3rvD/AQB8D+4qWMDwohyfoSB442igZlxl0aB70uOzSPKdREke60p30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GbFdWXRF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GbFdWXRF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 158AB4E40E99;
	Tue, 21 Jul 2026 08:30:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D717C60368;
	Tue, 21 Jul 2026 08:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5CF211BD0D07;
	Tue, 21 Jul 2026 10:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784622607; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IFgJQi8MuNjeZluVZ229O7LKeTgM6ORkynTZgqDFdHA=;
	b=GbFdWXRFTGyRGe0K6uEqP81WMIjbsGjZQAOYLMGhzS1UEUXi3iAWAmQOpOelkKQE6SnHuk
	ojuWRO5pOHJBZm4Lr1I+oSAW7ZUKIT5ZOOB+Evfr8O0gfQC7c5dEamn+pkbk36sy5f3ZBR
	i8LHGoDBGoKag21Y21FWnS3ypk1J4C+ksQ8pZD3FlHlQsuuj1TCT8hzToRbqor9mAlkJpa
	j1dSkwrL5l5YHHUdnSMXaLmUhouiaCxKJKr098Xywn2di242JowF1KuzkrgDddL2anLZml
	uskOV7zkuEsmYbJ185+LW3eyUku8xMVHLXf6HrmVhBYzR7J4MUOmjJUyYZNS3A==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
Date: Tue, 21 Jul 2026 10:29:47 +0200
Message-ID: <20260721082952.215691-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721082952.215691-1-herve.codina@bootlin.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family.

This controller handles 8 timers:
 - 6 16-bit timers
 - 2 32-bit timers

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/timer/renesas,rzn1-timer.yaml    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
new file mode 100644
index 000000000000..f00ad941f8cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,rzn1-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 timers
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  The Renesas RZ/N1 SoCs timers block controller is composed of 8 independent
+  timers.
+    - 6 are 16-bit timers
+    - 2 are 32-bit timers
+
+  Each timer has its own interrupt line and can work in either one-shot or
+  periodic mode.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-timer   # RZ/N1D
+      - const: renesas,rzn1-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB internal bus clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    timer@51001000 {
+        compatible = "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+        reg = <0x51001000 0x400>;
+        clocks = <&sysctrl R9A06G032_HCLK_TIMER0>;
+        clock-names = "pclk";
+        power-domains = <&sysctrl>;
+        interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.55.0

