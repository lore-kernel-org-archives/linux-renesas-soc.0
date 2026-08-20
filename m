Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52847F778
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246224; cv=none; b=GCiV1mgztdQijP68VQQA8q1JirMwqrOE1kyYCGafxCIpHDeuXeicTCFMjWZFD7pPMtjxrt3/r+bAZ8ue94uQHtG7QCv06TOf3/vEi/og+MdoJFiLrAVYbUFj3az1O5gckSOWMV2xffxPSa0FQvOQlZDT146jgvsHPBGy3TewYl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246224; c=relaxed/simple;
	bh=LeJpvsmE8/8oIBqIo77XO1N7ZMpxYFIy1g4h/XeP6k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8MDpVC1J562sTln+mqQjRFraRvkwlGJaLF3M2va7YmLz91Dx+lImc8RtW0Q+ruHc0jYV+xj+H8sA+3XkYiQ+Sj4Vw1V6GxdUMkqC04aRJJT6MNjrTxKw1QV54YHwAy31g2s5TtBdSgFDU6NMxA+tOq74eHoijZUqcLfo0CbMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqtgzFvC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqtgzFvC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so502945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787246221; x=1787851021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LF21JGxH17vVW7bu66t9RUZbiTMUiqLzjDtcuysGx8g=;
        b=EqtgzFvC/8tZwSIQeZ3NNUYmSPpWX99V0e/Gt71iqqI9VMA7aCbgxRy/oRwXfOE1+G
         Ja7rlwRkm5LHoKpNvubzzdPXjEi31BwHDK5wWGIPTGgc9HqKKlAVuR6va6uMQspv/Er7
         9t7D+a9vAIOpS+JS/CLZvIz4ePEcyLHxAmYA0dwiqxq1W9pjXvHfzuEw3FLNadKXL/5p
         PeyvNuSVYeqw4s76vxMgE7rl0etGisRS6QO9qFgUqGYxV2uPZKWVwPykEczXtEfsStH3
         lB4goOmmK8Sm/6blHFyQXaFOhMfRbmej1m4RC1dX77vDSpS9oEJOc07xWF+LM6duG8gd
         Q0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246221; x=1787851021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LF21JGxH17vVW7bu66t9RUZbiTMUiqLzjDtcuysGx8g=;
        b=gUMACCHpxO6wD5jBDpxazZBG/6awnHt8kQxKh1sGFGwTxGCTe4oA1xQ94gA3J1yk5J
         4fZFmH7hT2z//uWAT6ijYSLC5Nmki+0uwsfunOVry5ueXTKbYgbTiGcuIeJkm/+QEkdp
         CClwVoGH61J6aTfqGMN/G5NP9BJ4xwg+APRZ5RQLVC4VK7WE79v5AsEMQbL8SvsCxJka
         ab//JZU7RNDWFdxi7ElfeKDOvEZjOTk7vNACuXBooWkzoKWuezDtquwSxbfDYMz9JrF7
         ftcIhexy4p74FburFM6ahLc8/6YVoZn7GTVZMYZ5Auls4qLyodpt5YX+Lg570pjLa1St
         cOoQ==
X-Forwarded-Encrypted: i=1; AHgh+RolyP5DsCql2pmMGXtmHKxI7fjHUpBantl0A3ECdiVb/KFX0lCHd44rIgJcE28Yw1jhximdj4E8Kd1E+0yQx7o+Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWZUdxGW7PMFBn1y8JePp2irAKVPs9vvOOvv3I/LAerLfPr7f
	0nDxaVmcmTKjqCgjOh26PRbOauaCLp/hvIUglwpW8brspFaYVZi+X6n7
X-Gm-Gg: AR+sD11sYaEUs+DnuDjoqRtSe/Ya2kFlAAYDyuyPeKw6LM5MC+4/Z49XaEhPF8CV+q7
	hJsM70q9tjFqfM++FQLowsErevaP+ojolDB/V4ZRFqFl2m4UzSB5c7Fnt1/ta0HZyttgTjdolLG
	U3AHezBpGe+hQBLIqE5K0gIBWpKT5QuiD388fse73j5B+rBLa95D2abA4z0rDXAkwRotBtVePcm
	Lo7SAHzEQgQMJsPhKxFoUyqvHAzHTqiObn1KEsQUc1eVksa009mtx6ifHsdG8vzSdd0y0ILJkW/
	Grm6knWUE9aw5VBlYBIfvkdrH+puM+j+nXfWFGQfJZ0fXu/bnzRNSyXXzBVHFiAYs9EZRMXZAsz
	x43QBCIsYR2+o88Y0FYyyYkxHvgEnItPvOHXJ0kr5Ag8ftfZ/N1Fta21hDCLLgI6FPqi59WOXXD
	DXGOFGK/FETpEP+FGNCqHJB4PZN1F7lepj0+a7joXQ8rkvesyUcBWAOVdoEsyNZkDK56A5JQ==
X-Received: by 2002:a05:600c:6211:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-499b82e8e9dmr9581305e9.3.1787246220686;
        Thu, 20 Aug 2026 10:17:00 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm219313495e9.3.2026.08.20.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:17:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v24 01/15] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu, 20 Aug 2026 18:16:31 +0100
Message-ID: <20260820171657.62815-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclkm, aclks) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag as the changes are trivial.
v17->v18:
 * No change.
v1->v17:
 * Collected tag.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 108 +++++++++++++-----
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..6d229a41a4b5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a08g046 # RZ/G3L
           - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
@@ -86,11 +87,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   dmas:
     minItems: 4
@@ -116,7 +117,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
 
   pinctrl-0:
     minItems: 1
@@ -155,60 +161,106 @@ allOf:
         properties:
           compatible:
             contains:
-              enum:
-                - renesas,sdhi-r9a09g057
-                - renesas,rzg2l-sdhi
+              const: renesas,sdhi-r9a08g046
       then:
         properties:
           clocks:
             items:
               - description: IMCLK, SDHI channel main clock1.
               - description: CLK_HS, SDHI channel High speed clock which operates
-                             4 times that of SDHI channel main clock1.
+                             2 times that of SDHI channel main clock1.
               - description: IMCLK2, SDHI channel main clock2. When this clock is
                              turned off, external SD card detection cannot be
                              detected.
-              - description: ACLK, SDHI channel bus clock.
+              - description: IACLKM, SDHI channel AXI master bus clock.
+              - description: IACLKS, SDHI channel AXI slave bus clock.
           clock-names:
             items:
               - const: core
               - const: clkh
               - const: cd
-              - const: aclk
+              - const: aclkm
+              - const: aclks
+          resets:
+            items:
+              - description: rst, Core reset.
+              - description: axim, SDHI channel AXI master bus reset.
+              - description: axis, SDHI channel AXI slave bus reset.
+          reset-names:
+            items:
+              - const: rst
+              - const: axim
+              - const: axis
         required:
           - clock-names
           - resets
+          - reset-names
       else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
         if:
           properties:
             compatible:
               contains:
                 enum:
-                  - renesas,rcar-gen2-sdhi
-                  - renesas,rcar-gen3-sdhi
-                  - renesas,rcar-gen4-sdhi
+                  - renesas,sdhi-r9a09g057
+                  - renesas,rzg2l-sdhi
         then:
           properties:
             clocks:
-              minItems: 1
-              maxItems: 3
-            clock-names:
-              minItems: 1
-              uniqueItems: true
               items:
-                - const: core
-                - enum: [ clkh, cd ]
-                - const: cd
-        else:
-          properties:
-            clocks:
-              minItems: 1
-              maxItems: 2
+                - description: IMCLK, SDHI channel main clock1.
+                - description: CLK_HS, SDHI channel High speed clock which operates
+                               4 times that of SDHI channel main clock1.
+                - description: IMCLK2, SDHI channel main clock2. When this clock is
+                               turned off, external SD card detection cannot be
+                               detected.
+                - description: ACLK, SDHI channel bus clock.
             clock-names:
-              minItems: 1
               items:
                 - const: core
+                - const: clkh
                 - const: cd
+                - const: aclk
+            resets:
+              maxItems: 1
+          required:
+            - clock-names
+            - resets
+        else:
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    - renesas,rcar-gen2-sdhi
+                    - renesas,rcar-gen3-sdhi
+                    - renesas,rcar-gen4-sdhi
+          then:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 3
+              clock-names:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - const: core
+                  - enum: [ clkh, cd ]
+                  - const: cd
+          else:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 2
+              clock-names:
+                minItems: 1
+                items:
+                  - const: core
+                  - const: cd
 
   - if:
       properties:
@@ -247,7 +299,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,sdhi-r9a09g057
+            enum:
+              - renesas,sdhi-r9a08g046
+              - renesas,sdhi-r9a09g057
     then:
       properties:
         vqmmc-regulator:
-- 
2.43.0

