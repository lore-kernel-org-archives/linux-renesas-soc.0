Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3737C0FC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219695; cv=none; b=UzGYs9qvIRKrmylaXl67Yk1ERD4xay3s70kRNg2621PEASy90ZGOJTfQJPSCxf6UkYtdPIF2G890RqP45TDMc8LjLIrkKeyj+pL8QUuh1bGJrAy/Y6gu1P3O49OLqauhpkdF2RadpQGivGHRDbVSIyw7rF3TI06DUz1xy5kkNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219695; c=relaxed/simple;
	bh=AwEZk7WcowM9wEzT938w9dIDoG3dufLIpfMLw0UeSA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIC6z9aZ5T7JW2KHoNYrFPlHSwKAYcUKOdGVzpuQFz2WGrn8V/wfzwbNaqAs5FAqSC1JFs3MBR5N/cpo8CPl+8WblZaJopRQv65uwS4xlf8WcptTDTIWG1uDXC9+RwfGDUb/L4/X5qe/++QBxNvRBhXoE5jIH+2XqH3gOALuGNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS1dLrY9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS1dLrY9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so21264715e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219692; x=1787824492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zypP7Z6zLZJ8h5wgmipgBcVN/JTnM3AivoXK7hNLeNo=;
        b=ZS1dLrY94aMFDmoeKLQn4scRR/F8nq3moX6NmzNQShDCzFXKPVRmDqDY1NOwpWmI5t
         QnE8eq2Uw+d/x1QpBZAL2LIXzKoc20Ok6vgW/hAOdhOZEaOZGdqUUyKJoFCpy6quSl0/
         aVNmIEU48yNSKfeUuaZV//9mVSyh7+2Q0YWEIvd+IVmgkBi6k0cSRYvZ99csJ8qom+gZ
         a+S3sDvuN5x4MplehHxjBiqs9NfoWTLdgVfnGbi1bYvsVtKdgTctxolp0DT/SxZ8cJd/
         yNXrG0h73vLU5Tnp88KgNCSbI8j3W3b9rlWFBslvPaBDtO5tqf/GYWhwgl/DhBUIn7Vg
         PVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219692; x=1787824492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zypP7Z6zLZJ8h5wgmipgBcVN/JTnM3AivoXK7hNLeNo=;
        b=Fzbq7lGhiQDItzyM8+10et4W9yLBmZE65uTVzDYZqBX7iJxG25vSkLT8C2tYdt46zV
         JiDCHKNH8xT4YdUL9+okPXH8xDbEkn6ElEAeZCBo2BPx9D5g0nuAUo4TV4JuB0K+7V5X
         MaeLraakXnQf6hswbzcF/Ef/UXlhTYR+vzMfBYRM17uFjShyoh/FCy1/HaSLpBYO7wY8
         Cay3wvsDM8sKI1/s8OueqerrZN+0hjfjP3foUGxGAo1mXQdsa7nWdkjwB8nkzjHGUJb7
         /jtVPhM9PyvSUSBk/bMrPOm5Gu5n/jpf5zEGWHaGzNv0N3nmiu1bTrFgG4ABKANzlcW4
         mvbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq28WuivBzHCfZmZU/vjAzaSvTsUPZo7Bzuv6LlvL6nF1i7BJTxxc87DtzGhkGRD9bE8wuIDCj5nNfKFNzjDYwvxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNd2MPU5o7jxDF7DSB8a2TceBWUCcWYUujpBhZEKrac5sbZSo
	hsUEVXbi0CjprqcrxnkWgupO+R/9dsMfotuX7cLpGr8IFGRIAZJyASBX1FHeaw==
X-Gm-Gg: AR+sD12xfCgT0Y7NjxhiunV/KMlwKhgiZQwH1NjYEs9OehnPjIsrlKfDuugWYI+1ZCD
	wZs9mItAlFPM6724P0FmRa+fqzXMrKhkY3HC64GBFC3JuZGxTL+Z2iQax1sd+OxUtcUmDigqj8M
	WNp/AHBBCiKMi+xRhG0Ow7vbTLG9uQNRXVps5i1gFvIm3xcVaP3BI3vd/u8IWVpBKfOENA9arkw
	HvV2yUBB1lNCVEnqym9rKRA3HmILZNOTF/UwGcG9VdNCG6xkvud2XCzmhIAmY0p7Z5FfHb44S0T
	2+gMj2WhtmG069C+XVc2yfw3VysSndzX7cmLN18L36WfBMZlUGoRd3t1jkfnKhNJlwEyOFzy+xe
	6yrj6r2GYDomZC4ASp04p741xTridB37O/A/wqfknGmnGbii4+Mo8MqQffr1LYn80oZvJ/oOEGL
	zDbMcz2W6IcWfja2xS8ukx8RH6/o8sA6vl000tV5vSHNacT1ZhmLuth2q0RX4HTCpKEKuK
X-Received: by 2002:a05:600c:6749:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-499aa1896f1mr209432415e9.2.1787219692369;
        Thu, 20 Aug 2026 02:54:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:52 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Thu, 20 Aug 2026 10:54:40 +0100
Message-ID: <20260820095448.20930-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
References: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

