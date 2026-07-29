Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0E486646
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329760; cv=none; b=X1GdkMP9aKR1CrSk5vtjPgWFqZOxZlxS++qCVHOMqC9Cr4QWuKm/4SR2zMhzy2i8Pl6u/wnmLiEq/1WvzZOCR3zHLnkHA2GAmgYxMeTwdd+lIbWCFNHGTeK5vOHy/2hz8YRSDFwr0NxTA3Y6yxgjrfLSdMFL1tkwj9qjbA6D32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329760; c=relaxed/simple;
	bh=6s4x9/iYJXYX0zHTiQrcGq54M4eLmLYzY1R611/qq2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFrmPaparzBgYjZITySeDhZZOVlZv8jlNDZALCEUUAOrtit6LrzGx2Vaf4/jXvwrDbcmqiAUrpzIf1XCXKy31VwVRU1tm8yU4z6dKW6TLKNLH8+/AC3PNehEJDzuMkCnkLPvI2Y0PD/HYfeJIFL0V8tDaLn6P+l9vzUqwa/76eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmAI9uV4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmAI9uV4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954afac04bso10311425e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329738; x=1785934538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCw3ZoTpTvwXL1Q/JdFXSpFnxqVRykvwjEQzV4GY3so=;
        b=MmAI9uV4QqEdnfdHG6EilX2DH9DfXK4AQO+jLV6zl9jEUhWqU/9XN2DO2qRypBvCTs
         t0whyu5ZpywHIJPTSviEtdm7JCncn3XuyBsv414cZmNYDgCVVYYNILpP02TWOOTH7Bp3
         m9SNVbZ3W1/xdvJN34fvNgBbQhLmST9psLcXeeJYv8InNekWJsEaDPgOaq0XSjDdS0KF
         pdoZI6mumPsRLKwqaneUQH+Inugw9w1GWlpFglRuWSGlqM0Ygcwa9tD0/xSi9zLgnPcJ
         5MT+wp9nMYuowQysF1aryHRMeQkXxJhmqjwj8CPcFlsucBK7661Yr863Fc1nytw9yakZ
         rTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329738; x=1785934538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCw3ZoTpTvwXL1Q/JdFXSpFnxqVRykvwjEQzV4GY3so=;
        b=dqphtr+sSHMsYQ0wskIRUnLZ2cHejKNAZQvNbdxnPkHCodopcW4zFztJGFyNogW/e9
         Bc8Tz/KLgOZFKNnvbmDBX2QqKy03Ok/wnx0dVf/1sZcrU0O7pVKx9n8aQKJsT1qYf1/q
         z9jJ48cRBjRB0BVTHfWa1eRdBlQygv6E/7PlXDkTDoBzC/rN1hr+RyD5VA9gz4B0fbqW
         ZnorSZ76rRV/ui256JeUjNUoAwwEua+sgRSi1qPUBbYtf7A3TJpoYEbHC1HBtQotZIPk
         yMuU97e4JyctcFn5wBfIlZfhWzkP9miSjzClvWjo9rSOOu+l18ijPXb2CWlZtB6J8jA7
         xF5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bDdd78sEn1S3YBya3HKvN8x67WQKvnyJlqXKgxH0iaCewzjt/UJH5D1R9CDJvTzuRNMKSbgCSizgX6U10ZZiOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6X/4Vb1oA7+3LFf+x3zdaAslgDaIFatQ4al0w567bOKL609D/
	kCxLXXi6mfrO2hIYMODlHmCJMMvqlvbYAaQgWijfj81tEclJCgIZud1F
X-Gm-Gg: AR+sD13bZICCMrjRzeYB6xKEiXrnZmrYOuFO1sg/c/kGNsSRR+fqKe5PIvLk4EQPIMT
	+L/vWkX2mLZZmm+UiW8VbWO/PNYpYibKjUHA8kaI8+M/7mYNHMFAS+9wFI2bzQoktoCnu9eYwwD
	1Q0ZaM5gKY8IRsKsVy3+TrMj0kt7PGaNJYeZqFBogvpGRI+HJ7gVmUzp3//ath63sxBr7dDFz3p
	S+HDaSOC6EJ5HLOX7ycI+nsmt9u3qNfQEIiTx0oMpFkr+WCHLkG0aP6UKkYiidzfAwPN+A284Bj
	pumouvHrn+YrRNUMsxMmzvp0opsrZzCdX/jHfWdw1llg5a+GPhxCbOpJD5yWKT6QGQyt92ydzJf
	e+dqHjMZGngayslXPdHT/vSOi1iTtkiOB7AId77xC7Hk4Ks5l5Ya2WGyHvwU9rVFJeWPDsmMOOa
	sclwFSXiGlLsIxNI2L2Ja11r8cmEEglw12RNBm5YnE3pq5AEA5m/TG4g/SS7ql+p6LSpfKMND6b
	EvOJHVWo9Vjvg==
X-Received: by 2002:a05:600c:3e06:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-496c65906c8mr73830425e9.19.1785329737590;
        Wed, 29 Jul 2026 05:55:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm9264645f8f.27.2026.07.29.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:55:36 -0700 (PDT)
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
Subject: [PATCH v2 09/16] dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
Date: Wed, 29 Jul 2026 13:55:01 +0100
Message-ID: <20260729125516.230757-10-biju.das.jz@bp.renesas.com>
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

Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
single-link mode. LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
used at the same time as MIPI-DSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
v5[1]->v1:
 * No change.
v5 [1] https://lore.kernel.org/all/20260625172359.292631-2-biju.das.jz@bp.renesas.com/#t
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

