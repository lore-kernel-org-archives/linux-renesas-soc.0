Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EF44064F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199143; cv=none; b=smIXnodetxT/HybWvAM+w+5NrHOgpUJU2r8KnNSB/4cLpuP/+WjWqWCUhp4Ymr+B0dxadrX0SI+f7niCf8JqhRGsKtQaUHjXlZ1a9t0TpE9l174sV8ofMt7WcG4VFzWDl+75ngi8CkG3lzr0KB8DOZFvaOp6tMF/voToLqz1S+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199143; c=relaxed/simple;
	bh=MXj6Apc/LdWXDh2qGPNbMm6OMatVdF6m4z+3uYAeADk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cchpeuw3DOrJhMkWupMBqs3G2+6gs2kq2aj5oUxqtJaAQ7MDoSjiNlZpNHbYjZAwCB569xUl3qi2yBNqBoCT6hqEqv4AFkMrRM6tYrSR/bafxi9SFDArUEl7ryAvnNd8wnbky7XoRuQsg0FIagkY8jVsJx4JTmhiMbSR6taVVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfK0BP6Q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfK0BP6Q"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1453205f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Oct 2026 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199140; x=1791803940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7pRonANv4/Ol5SKaY+fmS4hBQvh5qLZ5CKpih15RA4=;
        b=TfK0BP6QeclhlBBZ5nqcLloMNjPa2umn803zfHeUZ1sJoBopBZ6DL+MKyibOunPFie
         i2WnECEV6do1FCYEQCt633OSf+jVl8nch/dO06LdtDa/W9cnylpX4xiqc5X91bg0LFwY
         cRKkpdkD5D5utww619EwtDT8qoaKMGOKf3GECv68F6zDNvnZWA0ZNWZCRAgWWJufm9i7
         0JqWVPkuc8PhQN2gjmCe/8ctc/qa7fP/HqtE/sx5r6JqdQnbxyfmgrNyyTrAxEidOU1v
         apZF8JgTesORoPkNMjdY8MJek7ED9YuLWI5IHe1YAWJQfj6MWvjxlwjpf62sxb6X3+jE
         18Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199140; x=1791803940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7pRonANv4/Ol5SKaY+fmS4hBQvh5qLZ5CKpih15RA4=;
        b=nAQVAGo4zYEY5dCh1o0i1Z/rshMqE+9t3bdQoPXrdd8WWaoMw9bPlMCkrloPSXpe/6
         sa3yr3gmqqLTjV/uDOueei/ootG6aKp1/jbi6ZXaSUtb/TFTMw3OWIrImJqdYQheK7j/
         O2MkBq5HE79Zt3BjLDCoH+mfi8fSqQHrAGWtpTilOcZ80pNlvYMdvnnKvShgOsGi6nXR
         uE0meO0K6lchi04E15R22ZmXKI/eGrPsQYGP82s1YOQsJod7rrpTmlPr8W2E7NXMD6VN
         iMMiQnv1JtBbyqU6wjJVxqF/KDthbFfP16kyhvMiHc+JKy816U79vcMKRECDzMX9j5Bz
         FkHg==
X-Forwarded-Encrypted: i=1; AKwUvBxrxDhlML2EtEVy8TRSyQP35C8MAAbsjTyJuGJB6lZ1FR97gXaO74pyE4M0O54zoicxfB1dWs+kaIQLSuGPU9VmKA==@vger.kernel.org
X-Gm-Message-State: AFuF++l0wh/hJJrvEYmAfkVxvJNLBVWe3D10TAE63nu4m+6w4YYi5AlG
	nm0Br4HDIAPnTNGwrF57PTyiDnegDCdgCayFyX10Oa0VHEqTDuccx4yu
X-Gm-Gg: AYBFou036kRnEvubq6Sbyug3vz4PJNEob10rL+xYa7zRgoS6YLSnjr9F1iFhoxLWj/0
	xEFIPN2SQTrih2BpmliTYQ9PDUsAto/399K6jJDLrSuToxSGUR1S8EZP3SBegbIHpdfBZWKVxUe
	Xgy1FRdjvqTz09Ikd6AfM9V6T7d9nqRzoihmQsYmBoW+cQdFDoldmvC7azFOobnpT5jQDoBDroq
	POGRxX6h1ESGvYR5J8LSaiIMZQdjZZFkqNAAUZlOuv4nGqD8Tjq+zAgwfvDy8jGGKcddWi9Xcvq
	0V0wEqtjNEYTj/Ut2fS+Xy0Nf7ieYsaEvmY76/UWRdHJSHNGrpN8Y0sOi3sIC3QaXhffpJW130L
	0fyx9RXq5DxVfIK4Eq3GRuKFlYpCpvf7jdGi+yld2fNOI7dXU1dSXvVlY9Cer7r9aZiLHKTVhW1
	N5yjr67clnYBBk18d4vxzSuiIGXcvai6pOjhK9C4uPmS5Ex08xPmATLRN1yd3138DYJNzGoxNUW
	tKb21AO5fe4NUmTdr7uGGM=
X-Received: by 2002:a05:600c:3556:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a1680f7447mr123180355e9.20.1791199139691;
        Mon, 05 Oct 2026 04:18:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ddf5:4eec:313c:43f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm355884865e9.8.2026.10.05.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:59 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Mon,  5 Oct 2026 12:18:28 +0100
Message-ID: <20261005111854.275120-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
port has its own OTG controller, whereas RZ/G3S only has one on port 1.
To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * No change.
v7->v8:
 * Collected tag.
v6->v7:
 * Added additionalProperties: false in regulators node.
v5->v6:
 * No change.
v4->v5:
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
v3->v4:
 * No change.
v2->v3:
 * Replaced items->enum
 * Collected tag.
v1->v2:
 * Updated commit description.
 * Added enum instead of const in the compatible section.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated schema check.
---
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..75e034fa7ce7 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,29 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of vbus regulators provided by this controller.
+
+    properties:
+      vbus0:
+        type: object
+        description: Port 1 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+      vbus1:
+        type: object
+        description: Port 2 USB VBUS regulator
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - vbus0
+      - vbus1
+
   renesas,sysc-pwrrdy:
     description:
       The system controller PWRRDY indicates to the USB PHY if the power supply
@@ -71,7 +95,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +109,22 @@ allOf:
       properties:
         renesas,sysc-pwrrdy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-usbphy-ctrl
+    then:
+      properties:
+        regulator-vbus: false
+      required:
+        - regulators
+    else:
+      properties:
+        regulators: false
+      required:
+        - regulator-vbus
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

