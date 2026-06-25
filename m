Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79633EB0ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408248; cv=none; b=jTkfBCVhF6a+Cgl90Vb9pe9apryz9Y86NkuSdz0cciaq4V88S5BzvDy5J9ByaHcYP4oC1ZKzo/+PIQKNhrA+1+SYuNoled/YGa4eWFL285fQsHIbFYdoHvk1jCCVXRsEbk5xGm2ZRZkStQyDe4mA9I6adEtS9+7Z5HCVTE+DJsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408248; c=relaxed/simple;
	bh=phr4u2O+7rLgmnapOX38lXs4OuDnyWeoZuCV44YKxV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABNASetxoO+K2fW+And4flr+pLaVPNTzyPBvFApCtOYyiFzZZX37deTalSu12ry/J2L4e2WhEo5FpCcyVS5yhaeEUZ4nFEJxjHMD6qKJjosZNkh7YIgy0c/bdcM4W+ypjKZ+tla38xNeQ1I4KHzNSIejMF+q/+PhFmt7YRj9CmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLQUh3ro; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLQUh3ro"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso773945e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408245; x=1783013045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PidaMhOttb9JyteieWoJIjZN6iGRBadvbwWLav79Hos=;
        b=KLQUh3roUasw/NcBkqpd4JgrJw2EVm7oW764Ofwfwp5G6zsnYkKw6v8jY8PrXpH/O7
         ekvpAUfkdRKaljdLp+uIqddfE2qQUE2939IR8aXO/KaxTYvgMbcUW/N7lJqcLWkPg2DQ
         9DcT2oe2jYotYEZOhxQbZgeXC1ujYkJJ33Dy/ReAUTbdY02El1qyAcDnAPssauo36Xs5
         aGWDUEocfiK66XGM7I/vCXjTQg0oGuy1d3Ql9GKFfL6+qg7fi9vQhDWOnSB3nYEiTNKb
         i5XyASDQs29P6MPA0+McFzDWJVhnyIv06jw7TmAHL8EDiQVlF7BsLRl45Dhagdfns+bV
         uTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408245; x=1783013045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PidaMhOttb9JyteieWoJIjZN6iGRBadvbwWLav79Hos=;
        b=siBsRi7s/PYjqSBe+IWkhYvymeCdV5Dd+NPecs/L+HrB1m844voJwouw6JKcMSYlSI
         vTwE/cZ4JMU1H5tR419Rt+cLDXz3sVRozwsYd1XeKzfAPELRyZXNpf37+CWEnT+7rSeS
         9TpLhgsHeyNL01gNw99Tg9yX/314BWB57YBYo9MA5vrC2Kz8SG9r3frtlWlYPby4IFH2
         sNfvfggLtxvKExwrhaPONDMhLusdfIVU5UHFjTeyYKL+uJCgXsTH2StxKmc7QxODeqC+
         1QyoUuFdA7nbJqgtpqCl4B1dYTvDsDX6pp9kkXtqV7CPlWOo0sIX+I8dJlsgTsuvpY2l
         Kzjg==
X-Forwarded-Encrypted: i=1; AFNElJ8VjFL0mQFOO3MnwDWhHs/OphmBI4l2uirXb7kcAHLZxlxylXZgCKmWd5CFOJ/kaR8ehP1a19F7jABtOBAs8qlAgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8FNIarMIrTHntf18Gy3oSwB/i25WuayN9TUFfQLt3854P+ux
	Lq9wM2/r0+79Bp7OH13Rk0aQPmFbra206mdGK/pjyncBD8mWEuYmWeka
X-Gm-Gg: AfdE7cmHgE1abc0JCiJgBDEM1zwXMPYzt9G3lG2Gjya9+840rVKvztLR1J3xQTs6lXC
	JokU+O7mYs6aXpcrAA+AXS5/EikXSQ5CB04H/AmWT9hyxSnuV5QTcrbR95qNqoj5kn7ASlIGa65
	FD1IwBeb6UenG6sDgBvfx1dYHmmcyXVNOO7bSh8JH1Uhlc7O2hVBDLhGrf4QNXDuD95Yd/83Gj6
	vMY+6o65OMjnLBlIWovqxF/fx2qrzb7MdjE3o1N8h/HHW8fXXXZPnIfM7PsXJkS/795jy6ZVQwx
	6yNKsdCqdcXW+zNU8SGJXNl1sLb4PX5UBUJubPFkh9ng2E88NGERqcu0lPrpYijfxhgmknjxfPv
	WcGFP4itgOOYYondDWludn/aZ94BjL44aChE63C+EuSKy1OxhHj3Z7g8RZIKEc8cNkVKNMsga1/
	a6onMq4u2AmDbRzl21WReemTszZT6bMDH8loTYLVw32DZCbQI=
X-Received: by 2002:a05:600c:810c:b0:492:2ffd:8f8 with SMTP id 5b1f17b1804b1-49266873f6amr45253485e9.15.1782408244999;
        Thu, 25 Jun 2026 10:24:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:6aa7:b2d:3460:b689])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm11167265e9.4.2026.06.25.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 10:24:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Thu, 25 Jun 2026 18:23:48 +0100
Message-ID: <20260625172359.292631-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
References: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Collected tag.
v3->v4:
 * Dropped the tags as it is a rework dropping parent node that contains
   simple-mfd and syscon.
v2->v3:
 * Collected tag.
v2->v2[1]:
 * No change.
[1] https://lore.kernel.org/all/20260524195829.960401F000E9@smtp.kernel.org/
v1->v2:
 * Collected tag.
---
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
new file mode 100644
index 000000000000..4cd7b688fbf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3L LVDS Encoder
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+description: |
+  This binding describes the LVDS encoder embedded in the Renesas RZ/G3L
+  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
+  (Data) + 1 lane (Clock).
+
+properties:
+  compatible:
+    const: renesas,r9a08g046-lvds
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: Dot clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phyclk
+      - const: dotclk
+
+  resets:
+    items:
+      - description: LVDS_RESET_N
+      - description: MIPI_DSI_PRESET_N
+      - description: MIPI_DSI_CMN_RSTB
+      - description: MIPI_DSI_ARESET_N
+
+  reset-names:
+    items:
+      - const: lvdrst
+      - const: prst
+      - const: rst
+      - const: arst
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input channel, directly connected to the Display Unit.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Output channel, directly connected to the LVDS panel or bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+
+    lvds@108a0000 {
+        compatible = "renesas,r9a08g046-lvds";
+        reg = <0x108a0000 0x10000>;
+        clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+                 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+        clock-names = "pclk", "phyclk", "dotclk";
+        resets = <&cpg R9A08G046_LVDS_RESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+                 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+                 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+        reset-names = "lvdrst", "prst", "rst", "arst";
+        power-domains = <&cpg>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds0_in: endpoint {
+                    remote-endpoint = <&du_out_lvds0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

