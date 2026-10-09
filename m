Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0D51AEE6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571300; cv=none; b=Bjy8yE+CM3JUHITN1sBWV8tHELzAlLN6HSWMPAIGarkPzsmJ6l7BOsjTdLEOQa+ApSIT5bQJ/35yIE5MyfCWVO4bTWMO9wtAFRRKsxmhL9FXCiDJq6Buyp97InXSiQ3aTz2biSkKuKtbGf0fKtrsW6FY/39RSJfivjWieNymzQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571300; c=relaxed/simple;
	bh=j08aYASB6LS+WJ5kaNHUDCP1fFUqnKBgkh7i9u4e6zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIwsnrQfs32GjUhEJlg6FaqKQj9G96EAB78zDSFuiQHSXoheZi9joFszwRSkX6Q6bzfdQooUYEds+IvFaHLSZuxI92ftIUZOhWRalPs2Y/Fv/gjBklE/nsKajjlllOzHWZoFNqc2AoQ70d3/lUoLOUwavFRMnAaYo/9t9F3iHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJUUx5eC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJUUx5eC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so1714815e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571291; x=1792176091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxKQIPxia4ixdYC4lHRZWf9Ikjne1BwduNCNHTIEt2E=;
        b=kJUUx5eC3u4jMydYpBcqIPPrW0DwuOO1uxql/Ci2jjdCBllEw5Xz39YmwBHYFZvCUV
         XM1VLg3RM+GJ/wSm58TrJACBwtBYu487NXaDpqJJUptdL8jJMD4y2/K7oo08nX/qrq0A
         TXCU46enxeVafaEKbyr5fPpq6rNseHpKvQXMcd1rnYTHGH+qZx4CNoHvmmgUwQnoF5jY
         CSeiUTWUY5fWt+jYnkq1LsWsoA83YpJHLxABYSkx335YV3NKsJw3c0eqBhDJi01HQ9FC
         8i2RqK643gDHtYZkQhDbqBP0oyUVV44DjN2LFX5EJ3JApkcGCd0nBO866D66jwxOJrF8
         WAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571291; x=1792176091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxKQIPxia4ixdYC4lHRZWf9Ikjne1BwduNCNHTIEt2E=;
        b=1DkK1C+8/53uI+0LtdkCtlvNe/kjnRcQaH1dqJd9t8RJpzFi1K7ulKFHXMCungv5Hk
         WYSERxL1jxA9NuiqUMZepsPE56/o8YfDwQmVEhzLwEv9+WUsQ1d8stbKeuvZuDHEdDfk
         dRPZuJZtif3eTM57DpkVNaAfeysZ5jI9WEa5rv9t2gTNmLEnUB+8quG+vcVv8Tzg9ale
         LAi8PpW+netSzJQ6XkDt+pJ+KC7MJbO1WWFTluZbj8VbDU+BWDm5hSJQI/DmzSi91OSs
         NWNpYzjs7x8+GnRspNWAJ6r7uAZ7LrCKN9mGf+tVDHDz3nZvuZYJYtAP1SfDzACzwOsC
         /CQg==
X-Forwarded-Encrypted: i=1; AKwUvBxWdATdGfij4Mviiufci3y+PGI4669Dyta8L3hwPOQXLzvyb5EtLHzYoiXHFoCbGCZ6YP7EA+eORGiPhza6KgGTkw==@vger.kernel.org
X-Gm-Message-State: AFuF++nKqATOBOqdV+o4FvhjVy1rGcZPgNAiguCseLhZmWWMR9NWfpcS
	Vd6figviRNmbnKQ1356fNgvXy8UkqiEZbxdL9jnK5Eka/L70wv1N5gZZ
X-Gm-Gg: AYBFou3aYT5ONDAVYD7fOsjDrdceYYwq52kuAz1n0vAJtckA0d2MBNO86EtbxX7hgna
	oe3o1/VrY695tfuQHBNmBND50TfP8j3NqqMjNcIKL1d3MSXf2EIIT6Qrb+zWASOTSLO/PFBaCpU
	NkLql+LvY1xp4NKuIIcNC+KeWE6jiMjtx/7j67p9hBlSM11JkHtSvxI1fOh8YNPtCjkZrcleTVQ
	IpUrxNykFEwzRlOhgvxybN7V/bFmc1sieFr1ThrmRiicr9vcvKfaZAt/hcI4Lj6l6J6EYFipx6n
	T3lHwwlrosTYhi4bFY4afVi4+AzZcq6fLCDpVbj4wSTYV3aO0XyAq1ZMtqeTsf+LumOmCrDkwP9
	fFRV3hoX1RW5kYHi7Nj3cUSdYWd7HKD1FGAYbVkCC1ajznAtmiyw46dOKPC/B/+EXZJwGoLVIpp
	mtFeBnLY+KqZRmwU0DbIg9pBDAieRqpkNjJY5bNraKFLqD132aR4rHZi9eIN6sTGuZ5mwLsLIgM
	9TjRttnJrIUMs9nCfnuaxlNl881aBBmVn4GQ+dF7I3x3CPx1qy288nxDexJsPRHq07WGdZKe9z3
	FTIS5y/RER+ZmpMCfaY=
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr53574345e9.33.1791571290395;
        Fri, 09 Oct 2026 11:41:30 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:29 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Fri,  9 Oct 2026 19:41:15 +0100
Message-ID: <20261009184122.1378797-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No change
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

