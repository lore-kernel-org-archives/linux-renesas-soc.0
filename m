Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CE238C2A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381926; cv=none; b=sRzy2gZp0f5ZnHWiSoTWYhjMryzk+5/gPKmZA0IwwdyJlXBds1h2kakkvnESvB7pvD2U6MS2gTJsq1J9TwtRU+JWocBfD0F+wkI1z1dt19CyeGSCsuI0F4Ze9Ph2pdzBuuzLuC4O4AzqNbhQWzwHOqHH7gQlzDNrlf1sytdgo7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381926; c=relaxed/simple;
	bh=dH0EtEQbcw9lwaG6JbyHv5PcNhJi+Ra0PqO4aPAFLFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXAfm/Ay9OhW5f3THQ/vNUcTZgfeddBb7B5OobTEFWCpWa+kF19bH8s2bL1mxYD1qRrGTXGHhXS3EPbVUze735UFkius9AvfUzf5Uh2SlM7eVcLGVgFPT5W0GxvveVCkWZ/dOEUXbESctpQUondB4GUXLJqpnqQ6swRxPxEuaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrwHRN1X; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrwHRN1X"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so8205555e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 06:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381923; x=1784986723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nmwlxy3EMklqPJNW5lqxF6m7cobxgRyLM42tEeN/MM=;
        b=MrwHRN1X5rQVz0SnODnVEz3mEaLVCEg9QkzQ4s2AB4Ttdr3krDXgCwvI4VISWUs7xD
         65IeT2fel/nhe0bt51GYGkKaZXLIZUnED3ENjAm+gYeXNPvnC06J4g3GLqF8RkM4il4m
         iW6sCf3hI1/2YN22PDQt86iIBRfPJnG1prpYQX3akQM3v6p9bvqH0SR96Jx82Lm/JEzK
         LZPdsaxw0NfdnpDTZR+XZRW3TbIIF3ccEDz58nsLOjfK6RmaRM76OvBWl7yxiv4+c4pW
         M5HV08eKOGdxCPxRer0BpJCPG7VkbONcGcnljUAmUmmGTbDWoX4rtWLRDLYTg0uRuafB
         fpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381923; x=1784986723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nmwlxy3EMklqPJNW5lqxF6m7cobxgRyLM42tEeN/MM=;
        b=QSauCT+T8mepTeBY21oTSkSSJ9ZAJQamXcJk3TdbPAYsorbz7VqyO4fPdna1cVPIhu
         4N5EA0J33AppSUEF4HRi1z1EUY6pyg6TwhjS5OIVHHmpahcyrsTsK7Vhd3cNtWaWGyWe
         l+zEQyZOCFfum4lLiSGIYB1ig1Iu8+upDBnkEXM+Eg+2kJMn+SUU1a0WvqDBGZ3rb1TP
         J9rsKjc+UegDw6rQHOuZaOh9PO7Ny7oFTNkvBE4h6pDgGGoUQPESIsI0wkOA2mNtfZoO
         YFCoFBObGLwEjh43nVIWPBCX86LO3E+SfLtYEVgMgiG/4kyeRXys8dF3zpEWq3UUuJKQ
         2CfQ==
X-Forwarded-Encrypted: i=1; AHgh+RonCdWWUWWEOyTGmut+k9SU5DbNTob+SqOYv70MJb2LhHK9RbW5t9QEYd2ahf+O86BE8FZTgS7BS0Bi7QUMrogQww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpYfs9cXEpuFBtve4uiujxsKNNqBYEf1hGF3PyEt5h7gLWVVsb
	3AMWIx45eCCzgzjwvdO1Ianzg3aoUz6b/KNWyN3BbljwUjPRwTRbVcMZ
X-Gm-Gg: AfdE7cluFAPAshtW77MHzEGssMRkidvWZU7Tr/doprclgIXlN8RL+pjzvyhFJmt78eF
	WRWfGzsbNsF8G/3cbgfgYrJ9mBTYmkA/L8oXW1Hnt88/BMNnkxFR/hDUXybCzy1PsmMaAhLRaAf
	m59ahMrMF17Fp1vCvo/v9LpokJV91CgNuuuUDvJr5ckWOgoUTXbdmCeGB77Xz1bnA3vWvDBnx9H
	qTgbCYkZXShGP4J8MknUXnujDSBtRlpbTjzuGZ73NyTzJveF5cbVB3DKBmPN25je/2rASBS4vhj
	7oTNwCIRrxR7l4xeGh065bNQMDwjS/ohSyCyyVlfqQwRWZ0XzWe+IJEZ98ArsL8j9zlguby0vXo
	v9ezARAYgBPCnAjS2S4dPWSyt9e/RqmLUsoC2z1EXflYF6lRdCRcpmxqNN4uZy/6SoNChCMfne2
	5oRPUuBvpW9YmpShq3yXmSs/paiPE=
X-Received: by 2002:a05:600c:46ca:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4954a396371mr74968085e9.0.1784381922953;
        Sat, 18 Jul 2026 06:38:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c53f:e1cf:6009:4c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96ff7sm121717845e9.10.2026.07.18.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:38:42 -0700 (PDT)
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
Subject: [PATCH v21 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Sat, 18 Jul 2026 14:38:21 +0100
Message-ID: <20260718133838.152905-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
References: <20260718133838.152905-1-biju.das.jz@bp.renesas.com>
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

