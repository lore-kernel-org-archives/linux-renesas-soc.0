Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24614052CD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135994; cv=none; b=c8qkObzrav1AtsM/XZQ4dDwIlpvs71DBFUHBPC9dRtmjuZ/gGLiZAzIesivZYwDupcRnkR4zCf5B2HJxv3g3AkUShbdzdrqhzzYzJU6WpgF9Mwes9a9MrOZ+H+/eEbbI2f/c3BeabEPBZ80X24LLrgSVCYnEkfFvGPjSqJzHoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135994; c=relaxed/simple;
	bh=9hfEGYW5YgRL4YzWycO5l87g466MjXZ3blJAK2XRTMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItLkKYl7By899DaTMTLeskaO+nCu880MD/sFt8iZiTc94pxg+uGUH4VHV9/Chi4TJG2dgA1gcTHUakcyUnqmyzGD7UUY1Vmwz0bly4qpVNRKuVkV5/pInxz/L3VCl/38pfUcSqXcDoqqH0sAN1tkdicXtlGdlFShdxDTNH9yMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFMd7gny; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFMd7gny"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf452def93so17226205ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787135992; x=1787740792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heP0mE3qyhx9OeaojnGQkHIk8X/axZX4MpRVNDZWMuk=;
        b=mFMd7gnyrhRXzdvzfRUOxV3zslXIYOZzwxaUI48U+PaB1WWb2gt6yjxhL1o0t/Phnr
         CFwIXV0eQZokFtMdYd+JL3xitQSjF6R+A2h5GcZsU4KFy+PiTOidWqPs6wUptn6hAyqI
         inJqhCa0BcWAvV7zxYK/HrDc55/K1il1O6HbQ7llUJmSlhfErKoq7v6qhC6pMPnO3LBE
         t1qAbrG4p3WSc9EHoybKFm9Hq+Dl7NUVprXXkkEoC4I2EPeY0WxpgAhM/65NSuxT5Dh+
         yUTlUmaCYYW1ieQ55a5i+oYwktexJbo5LKhb2Zk6PmCz6FtYqzFyRMFb4BGfxNEoipsl
         ubOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135992; x=1787740792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=heP0mE3qyhx9OeaojnGQkHIk8X/axZX4MpRVNDZWMuk=;
        b=hLaPu1lJRnpDMvILAAl+1RdAPYRukdfT7yKJTzA8Y29IN/vYQXaE6bwIH+vt5ixy7L
         Ik2oChTcpOpA2rMAGJwTzNO6tNlbndDpu6O7YMdyh4H/3RX3xWP7cZUKvhfv7mP4xmxX
         njoXQ8vPjBRoeScUoVxkZOiJBTjSKyJsy8Z3SpRgc+lWo5WhHHxVUAaXN7tfrrEvch2c
         F6ntdVsGNW3uVpixG5p+8RwAY6sZRMBshwpwQQ7IYaSxH81wAZkY3qV5E4o7/9sTVqgO
         p1h2pkl0atHqCAiUP2CFuHZY7lHQRCalSjkrzPRWlv5kjHqy+jEhAdpdhvRVH69/h0cJ
         ELfg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+oQkgt4hDqNcm3a1HD4c/zAOjW0YYmTQ9pEurlkWlN9SsaI9mMj5M8JtmMDCgsjhUjYS9fVVtZcd20YYqnV5Zmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrk9nmzIJOy9W8ldwePrkEXLnKna0WpbFus2GOohrUVAjjvje
	S9K8XyDxCAqCtJ3Lv3La05FlirwLkdnF0yiaxKZtnbrrTPtYh1Fstccg
X-Gm-Gg: AR+sD10pALbZteEOW9c3NEfo4GGdsnYCQIHYkj1S5u+i913cWnL09ouR8mDGqkYMA1b
	7ZpilYaWCbMKb6hVbMbmqky6f2g/m1PWJFaAmT4/2Is/MlKgElA/H+hGsMVVzfdA8oZ4AH683FO
	x+FKnRZo8nU6pSz64He131WUpHCaXlSoGZeSgJZNh+q5iz5u63CMPdU5d+emm3VBPR5f+E3Vnjp
	oE6NkhQE4tyy0mD10si6VcbiRrpJZVpMqiahICG935n+89lkYAbuSZa96tqG5aGnKbslp/rDNKm
	Rcu3E0Ongnm6mQLPaT5fUHSttaO+dUs2CgMJ1RhyFXj2G/F5+wA9tiKuOUxaPG6XcsrroC7GzM3
	JG0qnFlVLN6BPKDyiX2o9/oqyZ0jKDaZDRzGHPNkkliMt1muMd1TeCQsUY8jPxVJVyRh54+2t8S
	RiGh9PapuJeSs75MijXdYTncVneTiiAPHXtH5YrucK1ItWgeSwH8Bs9KuFkv+gziv5y8xTGA7Jh
	5KK/IEcO1G8IuorKVyKBapsMYE5z418mtw6OdAHv1a0uZ2Lfbc+Z332BTEMXsv/SGQ+2ZsvheCv
	xQLxBWBx8A==
X-Received: by 2002:a17:903:350c:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d5fc9bf1c7mr48441305ad.10.1787135991951;
        Wed, 19 Aug 2026 03:39:51 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:39:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 01/15] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Wed, 19 Aug 2026 11:39:12 +0100
Message-ID: <20260819103926.2136712-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

