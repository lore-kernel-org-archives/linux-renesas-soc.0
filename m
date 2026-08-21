Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE71314A98
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346655; cv=none; b=egBeUsdtpyKJ8oPREMdsJPcEvW6D88jtaQDH/BY2MAZ3GLj1vFYkQ05FfL/rTHkkq/YM4K2DqbGsTo3cmJJT39ybfhqciwrYASsnQG6D8gGvP1wdDqNbVCHmopcvuiDh2RS1vxHUtNWUYlH3lTzVFUoTNmo0r3jzC1BQVG5DjwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346655; c=relaxed/simple;
	bh=yCAVOIE++bw4Ie0FV54LDXmsp6naqMKl9wiNs7eJ4Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+ggl45EvNOFkMRf2/oYAthqpwakRY6Zje5a53eeneJas+Via1vuml/B7V3W+T9WwRb9gR5rndBukF90s/yz7iapkPmqk2bSIABxtKN85x0JaZsfyX7s+hVwNudyYkcBtgfy8T1nnwQcUTi3uEMi8J8qp86pcl0jrq6OQVG4HAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJFZtTAD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJFZtTAD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf52d15d88so12636215ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346653; x=1787951453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnRzPupI/2uu/oLvh9jVLVDDJ3EE4OAdAA4PYQ0nS8U=;
        b=GJFZtTADDVfDzAC7QXPleU/IrdeHoefBg/xEZ7As8zCsT/xnwj5Hzni81lRVHgbqpy
         grRmJAExEz9bt2WjBQluC0olHNo7bzQ0gdRf6IicSkQNkyyhZX3kN9wSpZhpPPooHsUr
         2sw5eBgS2dDfDz9JMOJxnAxS1mkY1djabtgQjLULMVozQmDXIPTjkvWVAnymICX/zBm6
         iavZ2SHhf9qILre4Fc7LFfl6Gx3vCP87WSVPwKBinA7I2BJT7Gog/3tUKVjTPabGpLqy
         MZ2qWxemeseljwwchzBshWdHR8JB3ksEi7toqf2KlNO6XMCi295tc9I9UbT5P5iG7w87
         0Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346653; x=1787951453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnRzPupI/2uu/oLvh9jVLVDDJ3EE4OAdAA4PYQ0nS8U=;
        b=SfP1JNdCn5PyyvbCIWQm3YOSwHP4bLbL91ew5b4j//g2tczP/s8dKnfUVUV0mZ9QG8
         w0fdZASUaATaskv7nq9kpXi/m8EzMp2xTxbQaajhqMiVbHJfoM4piyeIVHQ73RZLQqSR
         wlzLKyQOezEddElqiNhaTcs0nKmbOLq98dIdMG5321bUBqMU8RjV/dheRTvsNgsOBrDT
         14PBWQXVVsNJpnnl1K9erVrvo8DhUxPwkw4cDrueQTxtecDVCmNHHPE8QE4GdOImia21
         WcJn9dNqd4oYv+hVXKTkI7jHzeDKVrj67NcCtE9yHsq7IORNsJKngTDdQyG6uas09ds0
         jfSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrJk/pwxB7jocQE+k7kBSFen38GrMVW/GW0toj9UDbjinRKT6glQ1iop+E+KLXcrKIPCzuNHtW/z6FDYtKGFfesA==@vger.kernel.org
X-Gm-Message-State: AFuF++lJEZAiaQOvq9Mkifx9dVKO88B2ENIkqoIV/PYDQzNxpYhxJTwd
	T+DFbLYElN1kRAIi+sL+H0lxz9vP3em/2I+skr7lMce/TBk73tETFIBn
X-Gm-Gg: AR+sD13ql8S+19CoCmhUXbEintz01ESoY4aMwKQ5h3whYtde0QqWEMp8D9YTfilAmnt
	fTNMIoB5IDQqbxctiZZ1kgsJf1+knmrkNcKTk6Pt9EN8XFj4Rgg8tnB4qy+2bXi8uAKb5SjHcGV
	doI6KYRU0Oyqc0TTOeUtvPXA6K60NmPJjUUmASA6rr01pLCij7h+Y6dqbmeb9vx2Rx+w129aNbZ
	MedS1imsB+W/e8vqhr9mriLRlTNyrPE+lFk5eM1aoVh1RtUy2q50+0j5d1hlcaw5+t0ZVsMoNfm
	S8j9tSf6z/lMiN3SiW9MBxdaLfPpgefSD+CK0DiZbFMUKhe++WweVb1toQKTa7vyScMoM+5CvAq
	OK5LeWlmXV0okumtZ/1pokcGcrvgbfK8yCM5nj7xeeBezR0WQvblREhPvmfvLPUdkTw5ddN9DyE
	6vQWfkIbzXimvTGPWh+ej0nZlugSEhkJ7bVL9kAt3Hf3V+nW8MD5kJz85oejdi+KEfUHS18XrDx
	uSO5YHKH6AIyfzVKDszxufGFJioI8bQg8Qi8rc2vsC7pqvh7MxIHdHqXgbwrqh2/vz6QfDw
X-Received: by 2002:a17:903:b4b:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d64a9a1b03mr185088355ad.0.1787346653386;
        Fri, 21 Aug 2026 14:10:53 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:10:52 -0700 (PDT)
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
Subject: [PATCH v6 01/17] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Fri, 21 Aug 2026 22:10:16 +0100
Message-ID: <20260821211032.13554-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v5->v6:
- No changes.

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

