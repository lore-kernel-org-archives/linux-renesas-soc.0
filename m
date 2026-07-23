Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02730C178
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819442; cv=none; b=KfgoYRYclxtwse9zXub91QCz3ypAg1i5jYUAxNtOqG9pW1LPAKTgQLNuwVM0nPCddp4qBqQRe8daDEakwKWy8Ft0t0dXsW7lZ7c5ISZt/Pm8xJqq5uDHCj7YprsA23oG9xUHZOEq0w7sNK7qhjRIkzjkM70Iohdt68IP11Ammrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819442; c=relaxed/simple;
	bh=DmAQa6jVopsSgv8FwjCUVSyo/XOfR9BkMBMnko+gHVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFYeba+1f+OQA8dnX+8A1+ytacTjoVf2df2L6LZjR5U4zFY9ubrAkwFH+JCbwthb5Bak4L14Rh368qoZsqKWwsOs6Tg9lCQMk70498IGDwYCZqdqKzzDqrm4Mfl6SBzFZyta9Fc69VwGZgmIB//TbwTaz4P9QuicvSql7lV7PLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8i7bmlr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8i7bmlr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f878135e0so480834f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784819429; x=1785424229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsGs35imj8ebfj4dF1xnVwR1Agd4gub6i/D54J8Ypdg=;
        b=L8i7bmlrzzwGGOTl3Z1XKu2R3+sSfnR26SGdWszhJTFcY/96dyAEvQ7Z+TRZEN3qzG
         JxJ2VGtk+yoyV4PrRMtu5b76J/xau22Br2ZFPEh0vuvY7ZUkN1C4nxkoON08OF2+nxHU
         teIUZCoFDZmPhzA0MzNuWb3zxhDjC/IWdMTnaeQo2J7AF974Lxh05uG9VcPMZBUoQjSy
         RwYTFaK1PCljuaKQnnOtftWzhIZcIMdJAqP2V2TvhFFQvefuFf4tCGRxz2gAMyTrRB6r
         NTidNerLHmUFfdiHMJ1P1Qt8q7atT678bDUP7qDu5yqeQN6RE6drxW8lS/vQ3K8SUxEN
         CMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819429; x=1785424229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsGs35imj8ebfj4dF1xnVwR1Agd4gub6i/D54J8Ypdg=;
        b=ipXbzeHmCZIsMR4AfinuOBO1D5QujVDFWc5S6xpOrT57qOr566/VZnLyJPCh808DRG
         5OjbILiA7Pycc5NsxY5FNLxzTqyRJnB5j4X8EYWn2RJFxHQjmck0uU5JZuLxhtJa9o61
         BwkpcPjEmcuSYgyuoNL9/wntvRttoLdIsJgdsv6SrvaMfr4OYIkEKROqOulpWz7Cvg+P
         Dta2mlU2JcfdixlXCZWgo/FisO35rJtZlWv9WNOA7PDzyYMS+FoaHMdB9cIgwGKcninf
         mkoWFmpSUGhj8xfa4AKh+C/+phjM52p/H/htQeC32gtllaRZtPoPrsXgjgUS5fEb4vtU
         pZtg==
X-Forwarded-Encrypted: i=1; AHgh+RrygqVHPMnqfpx6kNHRDRaI3HKfnjc3qVMGFFnxf0Sazzl7heVtKHlD3390av4YmO2h4L0HUo11MDBeTdb4g/EBCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3uBLIj9RnUgPbH5b3SxdCjLB/FzW9HD2XYY3WwePJL0jiKd4k
	nBn6Q49kyYKk9ZcKIJCnScxBxMlsT5dXdeU/z6SOlVaVK+4tPvEYfr0P
X-Gm-Gg: AR+sD11By5g+DNNyEGOTR129dY5oUL0tgjvgZjWQraRX0UaDemMa+F1LRN8JEX90+lL
	htcOLsAbjUfXg4YVNK2e/tESx4kq6a2c4pPKF77Dv+ZaLaDmRvHJPBeRZDebQWoE1Go4o+IoFJ2
	aqniuxe+yCtN4EpXFCHNUSoIk8yCtN1VjJfL9KMSY+vHkP5jG6ziXyMdKS06Cs715Dvp53cX5tn
	LsLaMgiXowwhyC9tq2i98EaPJiqw+51RkUDahNFJn6EPe06vaX+MJClLG+Z/UJpCL7s2iDrYRIa
	/OsbpCCW/wfCBbxAiPLR72eGrnWmK5YkUOT9k0sJpUiNvINNfwJNIIC2HxvYAkT2LpFfOmqP7tZ
	6nmiBdP8Lo+Ru7QbRN3UmSJPVA7WAPTRqjBuRvdiPKcbk3ZEMENqYNO19ssHh3p3hq52+8ds3pa
	NKRmchscwRRA1LHcCiZLV54nKycww=
X-Received: by 2002:a05:6000:4609:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47f8dca50cfmr3984489f8f.45.1784819428563;
        Thu, 23 Jul 2026 08:10:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb81dcsm15886823f8f.12.2026.07.23.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:10:28 -0700 (PDT)
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
Subject: [PATCH v22 01/13] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Thu, 23 Jul 2026 16:10:05 +0100
Message-ID: <20260723151024.318918-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
References: <20260723151024.318918-1-biju.das.jz@bp.renesas.com>
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

