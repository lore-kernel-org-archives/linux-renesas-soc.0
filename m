Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA53E49F5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685777; cv=none; b=azU4+F15xAJh0729EvCzGA5XluS1gLfz4CjuNWci6MbYRLIlEsqvhRQTWq6YvDSsdjOGU3OKBHKhIBTKXBL78se7vkqQhruXQbFsND5Pzzr7c79vQQN+4F0bA0Zt8aj+vr2XLM/RP7YVcx8PrDgyOCGRT8gnpat4+HkBTso15yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685777; c=relaxed/simple;
	bh=6Sy6vgSYukgx1flhb82E53r8hjS6KeohuIzJbCR1Vj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiegvZvzuC/E2/CDZKX4s5Ib+qit+hOizBJXvGwauTLYta42FQEnglpUE8jR7pAQ/VF6owoMvTm+huexYS6HfunqIzmlpbvNtXYUyjRBTPKPD/efRU9xGR1DdKPu8ekJ1Rx7JhVlsG1zM5ir2v6WCd5R2R90Bp+7g/d6MMBy9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM7nQ0Ky; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM7nQ0Ky"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso44154465e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685773; x=1791290573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J1veNvmysC8QT8osypByF4KUi97wR8R1soWK43MPcE=;
        b=RM7nQ0Kyd/I8SjIqCOnMNn+bgE2V+19fWDEl1TZSO87meezXkSFYLMXb6IWucAX/XB
         y9mS6G2sjZ0oK/JJNsNr1httHAZjCRB4/nwvAmVlNI3frS0daLpMuCvf+dQgCDFCXtRk
         9O3NBLdZ3xABQSRfehSFdc3rf/Ha5HJayHWSTDb8YqmrX1UDlxVqsgiiOKT66Ne8kkO2
         oN4OfjAK0uuFGcFABnt55O77bKbZFGv7xjj8kpZvuxjAQZyXGVY4cOAYBDCrmAIjeZ+4
         jgFnzrQTa4RyxhvGKL7Lppn5mYktO8hcy1AHX+IRMbG6cqC2VVWa/52LhrMUkUeKp38N
         PGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685773; x=1791290573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4J1veNvmysC8QT8osypByF4KUi97wR8R1soWK43MPcE=;
        b=vAbRT7FUhPHIUTz1nDREDP209dpLO0fAk+r23f3hvOuW1ALd+DtaNhYEyGrpDXi7hn
         T67skNCvCDRnfgDCQTTQVj2916b9cY4gaJ2ovLpEKurSmK46UqLMMByTklcDvHAeE8Fa
         o+hyW2KSaUDxCYytQu3BCwcEm9BfrtdqNYTOJk2d8GhTRIQZvA43wD1IeIhcqjL1ods7
         67J9G9miCJKWgA7Gi5lxiO+6NaLQ+F6Ggw1oR/sDM+oH1keELs2IQp0Zpd27czzk8UHj
         0QX/ZgqlP5sWso47ehseTQvl8mfdirlmcJYFT8j6kfBPiMLAEglJROFaTO29aFlr1lub
         Yk0A==
X-Gm-Message-State: AFuF++nBSGimHwk1nas5SrOdfrSIvy7lB/BronNhX/cXJ9rAhnIG2Fea
	TiIlxwQ8aUILUfFgpD4eqz4U0WSUToR6kzb2VpKJ1eEZ2EUn5xVScsAc
X-Gm-Gg: AYBFou1OwFmcv9wYvpIPugMZ6m1ybMa5fgR5MzR0drjRIbSnOTdP5CHmACxVSejB7Pq
	L+0f2JaDOqmcJAICvHh5Hky9NvpRpWyKhN+xpMcFU5NXWxSoTl059eo8zwXeHYsNpbPdVZ+xfoI
	8T+zXiDkCvWiMZcPUnd9XUAAbZ3AwEDE9ryxiUIJRin/Krgh1PSi3jN7/f3rJ/UD4m7sSwiIW5U
	clvS7pMM9floVE4waxmyQws8BZJoGiFSITNypd2Ywd48Sn5t3IN6sigmog883eg/0VeCajvjShq
	ciDr8AfO5fu9Jjp9ontOlo/W7I/unHHZ6+9g+AiQu5ImWM9xw4su/Jr+fYN9le7RExsCOkQtwFQ
	pabrLCxnSJhh+XGXLInwIW/EG3Ol4rlEALtyADuRiEfJOsP6B8SJTLTbq2rT/giPdyBhv4lKW/L
	B830Q7HMdPv/hv1KZD5QBWICGqk/BZHsQQxEhKXGdMVkBdGFWJq7C3ND0CjI3lHNo5pvwUFa01T
	y6Bo7+sdLBDgoKtYnW3sE+kOH6tLbhoYYXhT2vXbKfxVaWajDLIrRUFV6jqyddc9m/as3iEk6py
	jFr3/lZKIfuRF1PEpg==
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr277276605e9.11.1790685773162;
        Tue, 29 Sep 2026 05:42:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Tue, 29 Sep 2026 13:42:41 +0100
Message-ID: <20260929124248.237032-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the ADC binding for the RZ/V2H(P) and RZ/V2N SoCs to describe the
ADC variant used by these SoCs and its differences from RZ/T2H.

The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
20 ADCLK cycles, does not support calibration, and supports selectable
12-bit and 8-bit conversion resolution.

Add RZ/V2N with RZ/V2H(P) as its fallback compatible, as the ADC IP is
identical between the two SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../iio/adc/renesas,r9a09g077-adc.yaml        | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 5b496729022e..a0fed2f31370 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -18,10 +18,14 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g057-adc # RZ/V2H(P)
+          - renesas,r9a09g077-adc # RZ/T2H
       - items:
-          - const: renesas,r9a09g087-adc # RZ/N2H
-          - const: renesas,r9a09g077-adc # RZ/T2H
+          - const: renesas,r9a09g056-adc # RZ/V2N
+          - const: renesas,r9a09g057-adc # RZ/V2H(P)
       - items:
+          - const: renesas,r9a09g087-adc # RZ/N2H
           - const: renesas,r9a09g077-adc # RZ/T2H
 
   reg:
@@ -55,19 +59,22 @@ properties:
 
   dmas:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     description:
       Must contain a list of references to DMA RX specifiers.
 
   dma-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
     items:
       const: rx
 
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   '#address-cells':
     const: 1
 
@@ -101,6 +108,29 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-adc
+    then:
+      required:
+        - resets
+      patternProperties:
+        "^channel@[8-f]$": false
+        "^channel@[0-7]$":
+          properties:
+            reg:
+              maximum: 7
+    else:
+      properties:
+        dmas:
+          maxItems: 3
+        dma-names:
+          maxItems: 3
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.55.0

