Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2663BAD95
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360311; cv=none; b=cg3gP5DdKypO0gNBb8Ckl4g+1VwJRw+iTuL+vJQEjzVJJSYjEPJCK2eAldjwCwTpoJ0B+GFBzZTSkU5dH6CoFiFKM1g6HEUZu8ZNyNrppCcn+P7vdnNqAA34fR/ojDg8mUAeKcA5c8wmKg82tY9+zjjAys2YYQvk8cum2C55PDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360311; c=relaxed/simple;
	bh=HpoKLu3V9es7opMjR7pFLLCqJR5zFl25bej0vBDOdBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQdhlBrFR+k+QC8w+oqNFjTyRjJjlr+ddi9bXkvWjZHRBH8wXbNrz3K0+xguA1expZf65wuzrA79x8oSP0mJlvhXIXNi6/fTz3G3NVIbL5C5jdYanAuhjXMPYTCbYOm8MkkwoqQGgvFTZ4Qa0ukiANUQmMiRgQdCFYKC5hojlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUGNDx/7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUGNDx/7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b691cb44so23924985e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360308; x=1783965108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPWiZQln08GcBf8WEujKuispVEeODLsYsfgQWbMre4M=;
        b=FUGNDx/7ylTJ2QP6gqcQgch9db8FBkH+5VNR06bW3VDxGj5k93UWpsuEm6AQO03lFE
         6PpUz4JfHVNBUm+oQhLmh9/7qGuWgbczs5nFKYZZ+VgemA2mozh+6tt0SWjptaESAaB0
         BPEKpNxg0oPz4uJTEddpXDMjXFUzHEtMcGBJLT3t6N463k9Jr/3JxS9K+DlTqcc2HchI
         5v/VXHALSgHNaL4m/aJaSCGm+4BSGSK29VwQbTtbG14u9k1b3SKZf21kiydkU3+oxXVt
         ZBBAsLLcN/SoTz4wGTc5XBfBPunwkqi78ZQ4vH2Z5QH/jeNKL8RdR7qkTzegytHG7Gas
         FPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360308; x=1783965108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPWiZQln08GcBf8WEujKuispVEeODLsYsfgQWbMre4M=;
        b=MMfPm3K+9KoXxJ+L9mUhxTmFAs73jcuJ+JEEjbI4NN6El/IF4cTw5eQYGEaroPy3wA
         mJhDhgJTMkMx5n5qqF3aqD/ukOUCnBmEHPH3jgP6BuzzC1y32Ai25OE0mCMJuxTC5xJI
         CNGWCVtul+SJ34P3USjExeZPEprZnFA+qEEWGWi3F/oUdpL5HWN28CTm8CUoIDYc6fge
         zDPQESdEpdM9gtdriZsJHprSO4/Nxlr3sps7Cf2nEl2mSRmkmRFF5WHFSXoDFjULYH3L
         QoFpm1+orZK0VBxR4BNh8aQZ8Pzzfgow0huRvHjjzwg7dJYeVsNNC4l03iJ7F8X/Z0Cq
         zNrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMtOLkXc6yRCekNSAxY3usP91dTBpfh7iP1gJG9cOGmgci2mO8eKZbbc+gc0nLvOxCvIMOoyu/KmEKV/+U9VYvaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRkRzU8QII9pzZN9QSqvBZuIqa6OrbTTmVzymnn/8BIKH8Ovg2
	M2mGr4Tlld7fc/Gwq/6xeKr652+CHivFcvl6zfYiPiOQcY4DiliX3Arq
X-Gm-Gg: AfdE7ckLi7umICCRWakwx8kaQ+ILpSG8HUODhPmk6B8ltRguc+1dTsawI2eogTsc3yt
	gO6YLOLX60UkE4fNGqB53967IjojWbUQOEwimiZuo8fW3v/qapY+5wyyiVNT1omKyrcxVSpUBWC
	DWtazFB/KSA6m7aj8OH7pBm1yADV3eOU5hxHflEQuvhOdCdHTcmkwfOQF6iSpZmY0dhIqrRmVht
	TFX+Q45O2q4kkbr7TL6e3Osvh0i9JxZPRdwbCCMqIR4YkLFvQCs3Rk/SM19BkxNE8wrdnellUHt
	AdwE7mU5sFjFd1CRrOlkzKzEpT9o65aNFg0Uq7AOpyanPq4RcAnxTKei2g5Lo2korOhyW9Tk3bb
	5C3fCug/s9xrDrNZpzWiNihFPwEk2qWqjBrAD1HYlbtSvX9dO5oV6dgs5vP551wtLYjhJFqrpM0
	Hi9lwjTxl2y7oLogRraii9M+ugg7fnjPa5yvKRLEr4RXjY7Q415U4O+9tY2VxYnabhwORHoEBBZ
	sy0swdE3iSZuipZTV+YHxDuaHiiNWDImRBb7A==
X-Received: by 2002:a05:600c:c167:b0:493:c98f:12e3 with SMTP id 5b1f17b1804b1-493df08f73cmr17773565e9.20.1783360307931;
        Mon, 06 Jul 2026 10:51:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Mon,  6 Jul 2026 18:51:27 +0100
Message-ID: <20260706175138.12587-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add compatible strings for the RTC block found on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike RZ/N1, they do not implement the RTCA0SUBU register. This is
not a limitation for Linux support, as these registers are not used
when the RTC operates in "scmp" clock mode, which is required on
RZ/T2H and RZ/N2H due to their 195.3 kHz input clock.

The RZ/T2H RTC variant also supports a 1Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual.

Update the binding schema to require the additional clock inputs used by
these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Acked-by and Reviewed-by tags.
---
 .../bindings/rtc/renesas,rzn1-rtc.yaml        | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index 1860f0e4c31a..ea7b039a91e7 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -9,15 +9,19 @@ title: Renesas RZ/N1 SoCs Real-Time Clock
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-rtc
-      - const: renesas,rzn1-rtc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-rtc
+          - const: renesas,rzn1-rtc
+
+      - const: renesas,r9a09g077-rtc
+
+      - items:
+          - const: renesas,r9a09g087-rtc
+          - const: renesas,r9a09g077-rtc
 
   reg:
     maxItems: 1
@@ -54,6 +58,23 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-rtc
+              - renesas,r9a09g087-rtc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0

