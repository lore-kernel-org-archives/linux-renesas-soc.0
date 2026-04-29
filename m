Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093B3F23B2;
	Wed, 29 Apr 2026 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463467; cv=none; b=joXwlYE518JfSYxfmKRbtzQfG8PvUhAtwd6dtlQr33ZwFjosdz6r0PDWAH/eS8NZv9gbEO6lkS98RXkM59pyKPpPtp3V1PDt/cgTwMfCR33JJAxpSQypoYXHSMUk0dWhCKH/60H1BfHFG4+5Tikn34qe63MX+++hAEbaxFzZx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463467; c=relaxed/simple;
	bh=G754Rfbykse9QtKThpKHuYxkMF1za0eRu5ICzuhMxsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDW/DLTM8w/WdsCEqRUmoCdg/Te1jAFL2H/Lmo4fStw2Plf0vAzj1a1SpmUC/JOma7tanOcyuSxcAoG+QDsNQmtHmGM824IEZi6sgnYcQ04D1ACTz9oUYbH7t02sKp/KBqa5XdH+kmHDgc/gRmDR8cuS3vKmvBb7RZ96N0PRMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mKIrY3Qy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mKIrY3Qy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B8EF1A33E7;
	Wed, 29 Apr 2026 11:51:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D61F3601DF;
	Wed, 29 Apr 2026 11:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB9A81072824E;
	Wed, 29 Apr 2026 13:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463463; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IJLd/bKb+ZyJDbV8sgfNPrpyA1J1ZWNGq3+hTeI0zQM=;
	b=mKIrY3QyaUN79SdrgxwphVI2D5jhzxmYQ+jdEAFJ8XKx4dZ/CB+/yG/RcCw84+7comEvNr
	4EKrDiqn+TznCrD6aIj/5ieVRiYAA5HXQwoibuixs0w+dbxPR055OWMcMoC9nYkqhW25ba
	cWwJYknrxvK3DDA9tlfh2dcKkEpu2F/FEmmkCxp+DB98uFajl2W0J1ROR6AnAW0A4AcdX9
	EMhS02yAOUYbdcPG0Bjmw4rq8JoLTvNYAa1DQ1COw5XS7zM6VCa4ts2NVv2CDFBA+i9Zsx
	FpI29mSBqgqt5SVXrUoaHPf1sRJgE1PnQAHwZv7A6BfmPmLhsglYfAvja4EcQQ==
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
Subject: [PATCH v2 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
Date: Wed, 29 Apr 2026 13:50:20 +0200
Message-ID: <20260429115054.158160-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429115054.158160-1-herve.codina@bootlin.com>
References: <20260429115054.158160-1-herve.codina@bootlin.com>
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
2.53.0

