Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF8843CE5E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994783; cv=none; b=Nqe+sRmgZMVMB4/OI3Svj1z06pm03xQ9TxugvdS6iHB2jYrI1T/tDkDXYOk5yjTuELlfLZopqGRJmAriveGQ0kt732qaVOwCOrq1WP8uWCVhj5gT58uVbmjsW7EFG5VKIIwn8HKVV//JtoTvJyiXaebqNts8AH208zsHlt15HbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994783; c=relaxed/simple;
	bh=DWmvPVkIJY6ptLO3/hrCszDHtdNs2FV+Izbm1KSLWQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNlzJ71G4qoLxv6UFpLTRTeR7bk1ENjrQNDkJnuib1AszATf1QamxwaU4xXKB5i1lgtQBhbiJeT/7pERfk3VD9nNNwjY0mGAFr0udfaTP4YOkU5MFmEg0Uv4WpOrrBWiz9+u4SLSox0UVRqsBkDy/5Bc2cD4cJAmdt1fmnTAo7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOdwBfrS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOdwBfrS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5655cc850so23183645ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994781; x=1787599581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgj2TWG+XmWQLneXONmNV+5Ec6rSceleu5gtE3hIg3M=;
        b=JOdwBfrSVwBxmWN+36TpJoseXe6rOBPq+X+rh0YIVYxNWShob/rPONGvkzQWAxlFHa
         3UL6kiUQZOdXgz4WrW/xNd9BMJW6HHm0I2efH9mDV5EgtjqwBC5l2+1YxD2AYW9zNj6I
         PZ3xnw92vVCvC7qjQrYEPI6m9iekbVIDhQjyOptkLQdL104QQC9hfHOZJSwuqPNtL56o
         eGa55wQuPfWDjRxZCWFzMDxYvg+DxV3txxWHPfRJ7RJyOgUWfoXyAPPEE+z2BswbGjmM
         0v+ZJHsaDwCn6odxsruaV9pgY2fQxGZDb1s7+gvczbHQ/2c9CdzJ+RtSnZ/vMiEFhh8Z
         7IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994781; x=1787599581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgj2TWG+XmWQLneXONmNV+5Ec6rSceleu5gtE3hIg3M=;
        b=XtdMb9MlzSs6UNRTeNDfhR5MqGedJT/rZauiElbW+OF7dMBn+Yq25CluQjg6lLw8mU
         quiDpHL6ltjmrcyCdw2Rbhpypq234CCZXVz04+9faVqwnd6vE5Z/a06bFemXGoiHDRsw
         NU/56lwfG5ABgV/EM8LY27Bb6e13FZQ+XGNznCkWY9uAwS/Im35NvmnsV6dBYu2DTwzG
         SKNgaRUevC/8z86YDXAH5xYAM72EQGkN6Y9BB1Zcysjg0UKv8YizcIzefr3Yl9Uy1h+D
         b+lSvSyVqLxiLHF8DwS+KkgkXSVi0DhoCrWg6qEUSm3BIr5/0Wyz9YPVL/BU99FoHs0C
         B7Ng==
X-Forwarded-Encrypted: i=1; AHgh+RowquwFCpeVHzCxkVXv8b1JTNIc05i8Y+FlOzpSH1tmQz7ojkYfwiQQprvf6d3p+83lNrFHnFsbPUZs8o/XYSdMYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzw6jo/tV7J5hoIO+X4Y9g5NLCTMeQt9TyVUlYOrixTdlPGoof
	s4CWaCkxvBFp/jvcqD6mHWFkUafc89JpYktS0v7f8A3vMnCXbw6S0uLH
X-Gm-Gg: AR+sD11s2LcikAbznEvlsofTdK4TgYOd757aSYIrFGhANaRzQcvmsUl/cXWbOwr9/jo
	PuzWdEwL3lI05rmJ2/0ahPSto0nNXQtcgWF8YfIfkU4aH3CRZg3vq8hEpWAoVZZ0GFw2ecwiPIV
	6P9RQgOL+r4CJ9Az3yoUpY+ZlgDSjIivK2WbwKr2PdgbEV/GM9savsjgdA7GUFfc09+7b7qPJvy
	+d6ukOK5YWtsbUecMDPtDWG4dvCaqArSZYpRdXBSD+/HUsQDBgGkSa/HWUBqytwbg18Z4QS+NeF
	igDmuatoPpaqu/vM+llXQR1n6M6w9hLyWejtZrL+97SJsQSHrwvZ5NGG34xI+JPc1zOD4AhqoC/
	TgO5CSUe7oI/iOC1tfIIoFwKBPgWKq+5e97n1T/r48JyT2PlpOPt1wC1crtaJEZcGQwbqXteI2a
	Q8MYE6RthOwP3hfSFVyQEhAW/p2Xs++ArT6Rdm895kZ/YoR+WAhvicUjIompsxA9I5mL+dY9Mfd
	zLI7xiaMoiB+tcN8kvA7FwnOPJY2sED2Gd5sSz6RvCzA8OnSkzeR2uYSL086l/dD9BFhaonEXNk
	59bu7laUzw==
X-Received: by 2002:a17:903:1ae5:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2d5c547cc04mr26002355ad.23.1786994781034;
        Mon, 17 Aug 2026 12:26:21 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon support
Date: Mon, 17 Aug 2026 20:25:37 +0100
Message-ID: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the CPG/MSSR block rather than the WDT address space
itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the CPG/MSSR
block consists of two distinct regions (0x80280000 and 0x81280000) that
contain registers for multiple peripheral blocks.

Since the CPG/MSSR block is a multi-function block, introduce the
"renesas,sysc" phandle-array property to allow the WDT driver to access
its control register via this shared regmap.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3->v4:
- Added RB tag from Rob.

v2->v3:
- Updated property name to "renesas,sysc"
- Updated description about deprecation and use of the new
  phandle-array property.
- Updated commit message

v1->v2:
- No change.
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 975c5aa4d747..322b6921c147 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sysc:
+    description:
+      System controller registers control the start/stop of the WDT, and halt debug.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: watchdog IP instance index
+            minimum: 0
+            maximum: 5
+
   timeout-sec: true
 
 required:
@@ -73,15 +84,29 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
+        renesas,sysc: false
     else:
       properties:
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
-        reg:
-          minItems: 2
         resets: false
+      allOf:
+        - if:
+            required:
+              - renesas,sysc
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use the renesas,sysc property along with
+                             the watchdog IP instance index instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.43.0

