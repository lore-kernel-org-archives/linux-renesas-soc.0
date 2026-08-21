Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FFC320A04
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320596; cv=none; b=kDoOD4/h0hRyH9BZ7axCLU+bulWd6x8crOWS62ZH3goE8fAWQQ0VMC8iu/VwMUwu/FEJPSiBn/4yiu4V913amJUAO48IY0Tx2925yewrLHH6jzjkgWvFXKFIGKn2JfVdwWgKNgirTgLboVO0V5vhPxxZ2Hf3we84eR3oSnpyuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320596; c=relaxed/simple;
	bh=cYr1RAs3gvAuqJZWfuQo+taemyMfp1Anvin255uabiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4ZGZ3GcvOSQmqgtRhoh0kbaOuVuDkBt90DjMptIQmMMtE4AftC92QMzXNs83UnklFSHH7N1UngftQGns+AzYUfub2GR9mjSDryE2Y+iHXxbgmLGrN3OzFbEDntXh405HhuTBMR6A77RIr6E5KOhnWqHPvjrteuZEpum7JEgpJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZRrbRb8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZRrbRb8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso10009535ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320595; x=1787925395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3IQsf8wvtCdNJq/Wm/ZZ1xAHtNzc7iLcDZ8zTr7S5c=;
        b=fZRrbRb8oJa5DZr73vvVRTwm9fpcMu74uGSlTIINOIgp6OtvGpuxIwGZnscMOlT5wa
         VBjqE7lNgKU51TIjpnVNhVBKv7tMJ0rXYdON5uwNADjNAHs48B4H/WLH96TsqGgM1uSu
         EqdHHRr7quaHPlU/4JlkvPXjVRC4XUtUOCT2GbZQ/xMfc+kWvkqno0l0caHQmvdYODpK
         LYP7e5REYzR7vIfNtOwduKfwS0xUiMf0igCpUAz+cuW6PxMsB0vFMLozit+PH8Pvea6U
         d1DY+YtdU1+WeP5oQ+HOQUeCqei2sF8EFcJa2v45SOXjndCkb7O6jYAzwyXD0jhmgWfm
         Szmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320595; x=1787925395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3IQsf8wvtCdNJq/Wm/ZZ1xAHtNzc7iLcDZ8zTr7S5c=;
        b=U1yMZWwvMJLGx09Njf1FJHiInEC+6ruNcZDg3aiE5V/+997nwcAOOQBQCddEgaqmrM
         jASIK9J5IeAulbMUiQEeFFpiCxnBR8/LuW7Ik0/s5p5MSpjSB82dr6WJqEOqFmD/cKU5
         0btRjCLYwLHVtY64vqThDBO3H/QeXKNQ2gf8QpB43RpTc2PEa2hjQNZsPbDXo1NSwMav
         9h4ooKZwTEHFhiYl0Djy1UR+bYOMsOYqERYqEatDherUJO7uY72lI24h9N/Un5mbjcJ9
         vrw0znqglwA3rz82XHLhiTJxbWyySvt5WY8AL8DLIkFmdd9mNAe+iOggpM92jFSLJjAJ
         9Z0g==
X-Forwarded-Encrypted: i=1; AHgh+RrAlfWTS+g19+OshQACvQfRmTFvi6qO2rDPL27wieUrZ5wMgN1H3sXvui2+QmrPxZjUai/vjBuOFErgkb3wepbZjw==@vger.kernel.org
X-Gm-Message-State: AFuF++nZw/lo4ETdSmPeugW4XuA8i8CYlb2hBGR9wTp2uovdv96UID8P
	fhXue2IQyvuAZfTiscSM/jkECbwGlixIoRRzL8cyCulW/xjx30bGrYG0
X-Gm-Gg: AR+sD13wpsc7+wXokherM+5tqjXQIFlxouRf0AFm59ODdTdCv1Yb28D7YIzySw0q2cj
	1Jau/GIb9h9IaHNe1rtjaCD3HEzpAv+tj4h7EnAxjBu0qLQOu5CWgEfjVeRXAiXILpNAx0s3V/C
	KMxBiZpMjDh1B60+TKFC3flPgX4iqeJbn1BIOw3MIrlz0XSBiBPzuO5Ehi0z2goBUPCGagGGhTS
	yhEyJGzbrJNLyyLjOVwpS2Fckk00DbBq1RgFvDPUTSXzDee62cu7g/eoSeUcWNc/eL2Icn7nQ3T
	57VfH/iIq1Bn+5RlM2CXCH2QNWyK10cws7Jyaa3juGFm03d2XsTxzMKa105AUKJ6eykC4biHfpM
	3KOxb7I28kfwPLWb9npLW2gC/ZRDrIcoHgEJ/Z/6ZTA/RgmbuPLmbunbdBdN9VjC9dQU8jOyTIj
	o754t+d3vmk7tN+YmDy2fkBQJxo74ZVxs1aHCNsFQKXCp1kyuVKRE1dhVVdEybbhmKWZto0KjMS
	DVxeZbcJFkBGWDbXClDTIktelp2pPjft80bBQKEx8FvAlocqck+Z/oPqBXBEYu7oY9+VhpFyGK2
	XcmsXDZToA==
X-Received: by 2002:a17:903:94c:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d61a0c9415mr190790765ad.7.1787320594915;
        Fri, 21 Aug 2026 06:56:34 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:56:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: [PATCH v5 01/17] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Fri, 21 Aug 2026 14:55:52 +0100
Message-ID: <20260821135608.275233-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- No changes.

v3->v4:
- No changes.

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
2.43.0

