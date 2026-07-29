Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00FF47A867
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325830; cv=none; b=AQYrxmywHXaSchXJoSGEFOvwfilUREPoURSrLK/YwjR9IL+snqWo0UgS6dzTKA7Y8sWTCVNZ5hPTDN30cB1c/jYS3o9dxu9X1PJD6zr/e0LTPkpzZpivd9vaYB5BR9FbFmSOqJ7qEF7sEKwS0Cik1v6lnSyMZ3NTR3V48En+ud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325830; c=relaxed/simple;
	bh=SBO8N8w3DRM6UtjYAlG5juEAPFc8YFeFrNEt8eCCPTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pg88uRv93h504+a6J8t7o7Zrv9qCpUEzS7U3ZlHZbKSLa3URslYLoB7y0Fb4fCGKxPQ2hnyaH4VVmiXtERF/fdunyFuhCNCwvTmS8AE8S/H7+QEFDpJZ8jv4m4ptGJSVrnvQafIF/VVKCTJWyA5h4omAwasBmVWOwousxs7s8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYu44dxi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYu44dxi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4150225e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325826; x=1785930626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UQ/MDQaOKz7si4QdkefIr2ebuHiYck8LL+uFKCxX5M=;
        b=GYu44dxiCqp4KrqGI7AC2KtcpTPBX2xGkSYbjiiGNCtYHYuPaD3NmEHFg/bmGmACtc
         5D93uzG0grnL/7dUEy5Ru2XZL1XgmKx/zEpz3oSPBGglO7iJK3++ZNiFdkZVIGzEbeBI
         J2vqAcBE7wpStx70KnxlB/BM/6/ZPHu8yb/qMHq5/ni9De3TjX+wS9mwP7C390rB02Ue
         MN7K3ZDV7seG5Sp+80HHCrKG6Kuwpv9iBt6+Bbi1URT1GtVhbywX6WEP3C9AXxSq6bLz
         jZ57nUfJaoX1Su9SqIA7uUuvRUHcUR5IpFRRAxWlAWPaBnpEaCfn8BwaAOX0iujVz1Aw
         wyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325826; x=1785930626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UQ/MDQaOKz7si4QdkefIr2ebuHiYck8LL+uFKCxX5M=;
        b=CCCBStF1gb7HC3fy/S7M0foRmolGHAQN1b+yKkXX7/Tx6pBomm0uCaTbnX12g9aNhV
         KZIp4UNULhhdiuPZxOmrd1Eg6Ok3FdW9jr/iqJz68/UzqGYxB8703ELVtPY3q5VOIHIE
         d+7bctLQLCkg27zE7rv6kd5qZRzdh/kmdP5/x9kDcgdp0I72p51yxIgCfCJus3YwZ2nU
         AwD+lo4WVS/KmqmwQPnbjkWm6yi7nTN8DZUIG8zzFB8tvhoLHnWGSAjOtb40U6UILol4
         BJnemHujEU+FWsOPe8cwaHIXGwE1vWlg+0GeDB237acdJDH8RZdBnOJB1Yy1ukFGPWpO
         jdOw==
X-Forwarded-Encrypted: i=1; AHgh+RrYeMsWp3x0MMn+Vc9yNGuG0CP3o6WqvTFcLZmck+QjzBvLX0KmRZCYX3f8EGiuQVfsAIDUYoGG3qtr0FgtFc36/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4P1YVfkInpYBOxTTTes5fLkZ274CRkJpckzHaB2XpPIM9EZR
	8dVK9rM2E4H2mJhj7Zn82yt0p0/jEgMr4TPHTTBu5DpS8cxiMSwbwpMP
X-Gm-Gg: AR+sD12Rpwm+F5EpyqAF3aNBSZ3Pqd/ws71KvGSBXRn2f4ZEooWxa21gp6twfQ1ISiN
	Nvh0YyHc/ag/C/OZHx8cZLHJBYY4+pIABs17NytVbCyRS4GUGLb1xlGN4Peq+odiU6a/zqWaiiV
	cPnfUIBUpmAvNW/aNEaKAI8NDFoZRkh2Nb1xbrUrvLRiO66B1WeebtU13gr8OWr0QZKL1q3wR04
	H8bFq5TzuV4dqJGUTjPTmaphEoKyreIyHL9igKvLBxr58TZznSDoNaOtc5XMqnnDR60uverUsYj
	eN4PxQbJQzFnTSF63jWUDZYgJxPmLWdfVttuSTKOkQj8WaW6rAIe7dGRtZB6k+2lokF4Y8UhVBB
	pD9TpU4AMXMXqU7GdSEC+jyRd3XodfDxQrNwJEcP8mD7SZVmAhEcChSNOpz3obrb2vHsS8R4wiP
	4wh6s39lBZkTuhR49Gh7zESi7iFLBBJR0ExjQ0nhLOfaBOslJNmHemr3cAC6/t0YrPQqeRPYCIi
	pZm4tKH1ACl/A==
X-Received: by 2002:a05:600c:e548:20b0:495:6a24:a92d with SMTP id 5b1f17b1804b1-496c658eec6mr45312205e9.22.1785325825860;
        Wed, 29 Jul 2026 04:50:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:25 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Wed, 29 Jul 2026 12:50:09 +0100
Message-ID: <20260729115022.222340-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index c83469a1b379..9e0c45097657 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
           - const: renesas,rzg2l-usbphy-ctrl
       - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
+      - const: renesas,r9a08g046-usbphy-ctrl # RZ/G3L
 
   reg:
     maxItems: 1
@@ -50,6 +51,28 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  regulators:
+    type: object
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
@@ -71,7 +94,6 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
-  - regulator-vbus
 
 allOf:
   - if:
@@ -86,6 +108,22 @@ allOf:
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

