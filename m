Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FE416115
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411129; cv=none; b=W7e5ebzAdy8TdaDmDjmhpG5iACmaXxHz9Ut775VhT4Ldi/t+hxUEMRSbTc1xAauXH7bCiEk9VBH171BaxBKmaqZS+hOMIeDJAHGQS6wWfAUVdTVUL7d6pN5w0pKL3v3BNWCCt4rocpUiARIWPl6ax+rLBV1amrD9ZT978cyV9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411129; c=relaxed/simple;
	bh=bTPNo1SR+nhOnCnJHbNOjSLy+khNwaBbBdJIzIBawf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlVRptI2MpVWGvX3i1EYy1eFqzrg/PaJA9yZCIawSM25OfoqN3YyDsv7MvO1ZwKy5pa1cCp3yHK6gCthLzXIg7xcWm2jX7lu5EkQA7tDxEuqOEYoTj04qDB+Ya6bpt820Nc9Gs9YUQHpSWmLj60dKIKJa9k1ByToTiRRVEIqRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbMF4LNN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbMF4LNN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1759893f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411125; x=1786015925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IeXk6omACrDle7Hcp2lL0AruC9LDPwvUKRrtnE5fVc=;
        b=ZbMF4LNNVzFDWBDLuiZom00ajEStF8UTnr8xgfZ+0ubf+gxNViXVIJoP+vMO8oJd3/
         /JIgVdv8FqFWCwrlx0QYKNmKrzxgDd6VHzVqKelbE3JsayiRwPquOPsc0fSC4kgp8qOh
         dZnZ72siRQ6UA0ftyihHCH5HI8iT3WBFXT2yeri4AIQ742yF4Kck8u7yymPXcKuZk9w7
         bcQehwAv3wVnCh/XVQ3nLmS9dBz1YxQnlwMabI68d/jdbtkuOXVn0WWemNYZKjUNr37Q
         4yhLIb4MjaqYS2YD6pCakzrJb3A4kR3fc7u7XdxKDPe31jT4DQE11sWw5hfc5DHBPPRF
         +Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411125; x=1786015925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IeXk6omACrDle7Hcp2lL0AruC9LDPwvUKRrtnE5fVc=;
        b=sZ7Nep9gRSeFMcZdJKH2tD9ZMZdIJlxaecTzlj2SfuqJm2C2n/X8F/+cz2bX57vwmF
         FNeDT58RrkEjYYny1O2ePfcmbR7elnh2PUPumc/4ElzWuCgHyM2UFO9aYrZRbHPN0WIe
         ikoIrYimvRt1XatO1ZWU07RpEF03drK3R7mhV1BbfSAc2pRqhRZJ+m/jrdKq9aaOpnW9
         AIV1r/g9JOYTTxDAKvuac6MfaImWaMPxOu+fo26KipZv6786X45JiZzVgq20uteva4fc
         4n8416tkZ0T7UeBLmqWsLpP2hca4W1cxzTobyjW3HfCsGDm9Y5EPorcH5/at+NnBSJy6
         QsdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAKvXtgkeefFTMDaSiWIxUldfRfIhubzta5e+gJsdffk2duq1JZa/HtJMkjq9uGpr7qGXOULdJgMt6sqHDZTgfNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0W4odP9IOln9DZwVjOGUKdIrkDqYnFq0+NyAtr2cug7I4rCR
	5O8Xs8N/1VQJHAtT2bYeg/RD5M8iV+1CCsxADbm4cqJ/NojZSOUlDF2W
X-Gm-Gg: AR+sD11oGaOJ2+6OdwOZLu+JCOouseHIKY7RHvbS0nqBZGQyLGLyg/Hj6KRCLhujTts
	6Ftn9m18mYeWQZcAEJe0Di9oGHj2SsWxpAL9NaJ/3GXUDLeCSpdIbcNZQN9MweRFfGSdUmHhVka
	oE9FsjGXMzCpFRK49WlwL1Zj90BLAN0RMIp/KkyxOoLrTPtMpbiQ3fNWU8EBrzVb0AcztLCvyfY
	YjSbzYPhXgOc4ihPw7s/Ae8GYc22rd2eZlIEo/J/whWJ3zzix382PoWKZJj6gX5ubz0nz9AQUoG
	PVQfZ5wYehlIqeoAYIUZiT2PsOKL7/cAnEL34IERNRD8u0U2ri/pt/83wQb8p9LT32mBW3MV+Yn
	JgLXI5fwuXQ0aENhxtv1sL4lFeLqngliQyiUoGQe0V5JAjdw/GUDyJW0YB+xrq1bZg4sVpRDK+5
	EBR40mN7Z0FjKdGqysHLLwIir5CpPhiO0KTt2OquN3oCzrLkjXEiju2OXMGUNVSEvkT3KoOQtLt
	ghqLaw4gK6h+DFngizNtW20
X-Received: by 2002:a05:6000:1a8c:b0:47f:c3ea:83c0 with SMTP id ffacd0b85a97d-47fc8330142mr3160438f8f.48.1785411125107;
        Thu, 30 Jul 2026 04:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:eabf:a623:1e7d:c359])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc89351e3sm5737947f8f.29.2026.07.30.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:32:04 -0700 (PDT)
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
Subject: [PATCH v23 01/14] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu, 30 Jul 2026 12:31:39 +0100
Message-ID: <20260730113200.36456-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
References: <20260730113200.36456-1-biju.das.jz@bp.renesas.com>
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

