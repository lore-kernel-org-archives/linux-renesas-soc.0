Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778369;
	b=VPU2TsHXyN+DNev0TyEbSTrJIFGeFOV0UepIFr612Nlo2ecUJGLjW/6I5w10kiqxR8Vy
	 XxoGFGfcM53nJ5vH+szHfN3ukudYt4b6Ixv0bxpBeniV0iEMYscn0XLuY5UGFTfoWC3ui
	 qB9Gp2KYOmrE8bOLdLPBbapSk1T0aUdndRB5km10+bQ912S70IGj11AoYNmFqOiKUDduN
	 Tdl53mdNn+ku37hKK7gd7cT9Fam4beDQnJ1z8F5o9NrS/LSePjowGrs1rF3uWUtkxXN7C
	 LEGYSVIUOzcvvhfFjp/QMNU7ieXZaMtVkHkmr7t5/H2wOVtJ6jcq013H5yWQlgq69rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
	b=royB30xOyG0l11Jq0SN/ea/c09bqIABtarC7onl7dwMqtz0VzqIU301sV9eDEG4tL2JO
	 IFH3+bticfQ7Ec2OSyZuP7MMQ4b6J9NgPQg7iHJGEZLn6mO0mB5Zc8b0p9COoAH7o5Vt2
	 j3CXgJnx+sCgRyI8GSKTOfr/922WKgwn+aDJuN1yozDDJgWC4EtErHzrthqpFqrJum62z
	 13czmDKFYbGS2MBef/R/A0OPP8wArZTNu55bTe9XeQZz8izlFpNXCIm97tU+IXw1z4t0S
	 hEen7HNudL0O12J5XRVeMUr55B20+53f4gyHDhkVPo9sJ7cPPyIdGnQHcT9/8VoPHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A27606A324
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UW1CsQmW
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso8819475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778367; x=1793383167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=UW1CsQmWp71H8y3Ya8dgqs5sxJZmBbYOORQQ+AMwjIQDQVb76BLAGEYcIl17q9xPIZ
         uvXybPge4G98nc2n4WLPIgSppaD5S+7FH/X6dK19ZdDJpl+zWQ9S6Whyg8dzczUbgzQT
         4gg+GQVFGZyv40vw2UQibUrse/b6E0gBoCxrdFt2YRhZ52MZQJTzTvoraZiOE80wRlW9
         hl703X4LUXodi+Q+1wiQIuiIIZBXLbi2nvoYuZHoz70a4dlqQz8GTdf9yGYMeTEWmdcz
         EaSYOIfG8JRL5OwUbajKVaCsrFJcfj1WrGAHLxouW0MbyWlbHDMMc6ckTIBVUeKjs+1W
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778367; x=1793383167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RC9B4AsYtSl9NgZ1G5jNJR/NzNwSkJidFyB5V6bR/5o=;
        b=zMdRvVymJYgpvuRIu3Gv1Nx9AKPiVMnExuFOeORrm43Z3/vvZPnvZt2r8Puw6j8K0I
         xOAWvCd5KHCt+vIRroe9V8ZAD/Y9/WI77qTik4eH+vULysAtJRgyfoTX5OOH6/gn6ZPY
         mtmLqHmnb2jcUSy1+AgLRevM0L4wupiWAejdPIeuRuhItBF7y8ce1oU6nDCeTcNGiL5A
         LMMGzSXwwyUoY7ZdjZkcDme8ktpE4kQhKGwzg2/o0lNRurRB2W4mhH5Q11qvQoM8X5iz
         H7/4DnSEuYcrcJfRxcQw6qHN37LMcY1ZgykyckQgK8cmwvMGJu8qlrU9habIS/PoyB0/
         r1xg==
X-Forwarded-Encrypted: i=1; AKwUvByI1h3iW7/SXA3+d6RuEoly4f6Ls2gempd8b4sJUS8qe1fKZIlA3XxEpfGij/3WdbU/9SONfrJLtwz/oA6tt7z+RQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ0kQivlhtOv1fqs1FMuExZdZDCFapkJqATX1bWC5AaA/+wCe+
	FdtraSyxmlIz1SAQLab7c4NuNnI4QDuXpplfvkfGkHIJkMnwjLYMKPxa
X-Gm-Gg: AYBFou1Dtu+p+tk28nS+V3Iwf9nZVSYJG7/dDcpNKW9NY/YtxrKC1N6tdBwQZETajll
	E+zz0xAXw7fAz6eMFZdfhGy9T8Av0UPXyyGiKElgJYDZuc6mzuc/OQTcqQPRXeiS3tZa4YgnOka
	wFLPvIHO0k4gDla498FZVFjvkQ9w6oZnHlT2UGvuhng7Us04m2SIHMf/lnw88/SIfEtCa5kyJUV
	CbpBM/+gJGp047EXMDnTbFEkOp8ASfbLnwCn9kxRd6KeG90NFsCIWq5JpbmOHsedHkomjnYnl6U
	inXZmX0vUOd6jivOZKCq5xYg8Z9fp7AbIcNek2VVtzOkM1PVcWXP2rwPa934AN7GwazP5cOC6cA
	o7d7ITesH76CEwfw0ZygvimfzejUogRkfQhsXzGDShR+EghOXmm2PLHXCBEVRHZgVVuEX9jymBx
	xWRdB+UC4nq/QSV8N3Pwut+Ov4YdxOtqVGKd2U1s8Fj1MqzmngB0j9/Crd1YsoyeUjFtnLtxfhj
	iLuNgXyYhtb3vMUQvFRPWg06IoQhxMaoXvBdgurPOV1vO0z2svHaSBqLsL+XBZi0ca2lNkqRKvl
	5NVrqWbHv+QNQcZblKtcSUcI8N5KHdKNwjKbnoQmQt/c4ZwJfG4vKUZLRIdttdtdm9MMylFDIpC
	ZSO0vwWzb/+me0kSBpLVNyLFthI8T8f6z8qRcHmrsLugVhAxgEm9JJ2WZ56RjohKBE+M=
X-Received: by 2002:a05:600c:2196:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a211ee51famr34379215e9.25.1792778366577;
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N support
Date: Fri, 23 Oct 2026 18:59:12 +0100
Message-ID: <20261023175919.160103-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Ack from Conor

v1->v2:
- No change
---
 .../iio/adc/renesas,r9a09g077-adc.yaml        | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 5b496729022e..a0fed2f31370 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -18,11 +18,15 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,r9a09g057-adc # RZ/V2H(P)
+          - renesas,r9a09g077-adc # RZ/T2H
+      - items:
+          - const: renesas,r9a09g056-adc # RZ/V2N
+          - const: renesas,r9a09g057-adc # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g087-adc # RZ/N2H
           - const: renesas,r9a09g077-adc # RZ/T2H
-      - items:
-          - const: renesas,r9a09g077-adc # RZ/T2H
 
   reg:
     maxItems: 1
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

