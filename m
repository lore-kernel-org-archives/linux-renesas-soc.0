Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9624582E6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544392; cv=none; b=sb0Xucz5yqj1AodmtalpjfYO2w9xx1EbThsm6Pzg5vj9Nu6Alp9kATbkDQNio207j+aid+OM8/TSitWG/VQq06KN1YBi2LOqKRb/hGuoGanCk5itRYFUg3F6wLXwRMO4ZWg9e5MO64RA/fDLDd2xvwvMXvC9+GgLeFYTub+fFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544392; c=relaxed/simple;
	bh=PAuqx3Oo6pCx7LhNYgdtHK1gvcUEQLqIqDi7HAo/eAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNnIP1nRFsmxZFk7CoWLluRUeDaBuS2lGh+7CTS8JFJDiOz5hTbP1ROpfK+Ao1p3kFk7lH9QcjjngFfR6PdoSMnqmwxmkHYmaYHkGulpkKnaRIj5jbQkXXHvDpahPWTMz/rrB8EFka9IJMtf5i6r8FdfkN3jfKlHzn2nOVnH2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLJlxmPV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLJlxmPV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49800c6a846so10393485e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544388; x=1787149188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVKo3Q7nPdTFxJ7F70e1vvr0CNMhGLLGRCE1tbx1uMA=;
        b=OLJlxmPV39SKnJJOzJZcwGlCDoD0ADvS3Rgi5dDOppwyBr2KUdA0ucjo3EyvrTZgHu
         wWlUtQ9Zz+Czc043P5vmw25c0RsWZTz8bXQPyCQ7C+wkL9IOXrkRqdH4x4Snhz1ibVT7
         JZ38jECxcHciu9VPbT9iOnXSeC2kSphZ45bZ4bD0xe5SPd/vsCTloIYkEm3SKu1/ztIq
         eegZZDd7sXB/sRkFfzqfgqpwE9O2Z2tjJdQ9pgkWGJLiLlF3oyyu6yJYlDTVpnSIhYnj
         fHXoORFnsVW0URMuu33zyEKniNCuNf1u8dJek4/h7gr3djHnIbnhS8Lh6zdNWSyEwjwS
         vZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544388; x=1787149188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVKo3Q7nPdTFxJ7F70e1vvr0CNMhGLLGRCE1tbx1uMA=;
        b=e6Nxul3kD1rlpTHXMiMqdWkINbD630DbzgW+tmjRT1eadwDX93u85y9q+QI59Xw3wQ
         3vgPfrLQHxCxygnLdwKzWPRPAZZwwwEe0QMabFk1CIcppdNf8rnK4ISDlRYaEAhIorsW
         x92Mkl+e3wdHbecVmgSQ40B8udfl+h0eWUeNXO0KLxi+ecQhiBc2R54C6Ot4vR0oEAGq
         m+4elbF4lkFYzBGmxXUTnquJV63ZAXO+CkkHYPc3H8T7Fzp9aNZIzU/xI4bUTvalGxKh
         HZlt2RvzaCrZ32IgUPRzWme0y3R4ZDqfyM707H3IEckMnSt/cd1Wg8oV5lCo99Da0Hx0
         ebzw==
X-Forwarded-Encrypted: i=1; AHgh+RpvVpbWUlSr+q/aJm3ozowE52IMnypbpz3lN3JUBxNyL20nGLpjfFR70/rOREe4cQM6WHrG30mDBo/sfOyvBYKMCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgb2/AWAFS1jVyUihBi65zT120Yp/W+VGGG7JT7ueW1jM4YHyz
	nDkVyqjED6yd+peokKhfy+uK+BwP5GYMojDneOWb8x84UJFkZ6DRr4SL
X-Gm-Gg: AR+sD10CoMELEyr9lES5ws0s+3HMMtpTpfZJd3JC5p/rWhTWeyZAGz8sZqLazRt5Sg/
	xt14DEET83d/ezRKAPBEVlzr6a/4qliSVnPk592cC4ZAInEcxgrn+q/SgHBJb/TCcQy9YWXN7MP
	LIUp3GA4EDHV5ZvkRNNN12RMjzmMP19F6Q2mh6MhIOhSQWX7KIZ/2YrFV+u4HtAjQjdllCmGS6Y
	khQa0HhbllrBIgAiTmEEvIvxyG4YsJqybsja40QRPbqI/hsgScRB2ssQDJZ5su9wfk5RxYFKHIf
	ZhPv+CcgTO5qrIn9L67wTVEsSQ8W/QEXtKgWAGy4wWxRgBgkvID6qRFBgxNVvx007BgcNvL3Nqy
	LxLwpRoNnBnYnbGUXfBCD1a/oEVKAHw5xxdE8uSh8e0cptRKj71hT7DuQMl/qEaTGctpDbOVuLy
	IsHgYIg75lzyEs3R8i94VtsYUGp0dsIKByd5XIuI3EG+QRE7JdbVYSvyCJxPI/hTWgpzX8kYW/U
	BcrGdJlu4Dk/g==
X-Received: by 2002:a05:600c:2104:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4997c111b2cmr56120515e9.8.1786544387414;
        Wed, 12 Aug 2026 07:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:46 -0700 (PDT)
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
Subject: [PATCH v7 2/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Wed, 12 Aug 2026 15:19:20 +0100
Message-ID: <20260812141940.246223-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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

