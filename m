Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80553F23B5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651456; cv=none; b=GiN20O4X4Qb0J1tLPDdPVRx8Jg3T7Gw/7YBzHA+RyX2PjCqimkT0AZTeRDuMy5Y7jAGXBGVk13fnfKEq20nluAHlCMaBOv4RaKtUZAXjRaJA7CXngntmf3kLt7pIteyUsSKP+Jfn4ZbMSXDHup+1ViCE6wrHlo8bS+sHbcewoqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651456; c=relaxed/simple;
	bh=fPsx0SfrTfSAP/j85Sl/Gt76Eker8kHxBzMkDcoroC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+W3Oe4vkFkr+XUvPK7/OwF/yt/YJe6yshSQCio5kTPWZkehgr6rN3Lek0k+8A5hEo8VwA/4uE/yJMKQN/Dm1TGEl+fo5hHi0eiRwTPlNIXFWTLWwT5pCV6bA6JJWT+hTFIbtPdhv209G3aPw+rxaLyYgA9KPYAyGibad+S+Ldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFR6OJvR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFR6OJvR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1671ec8692so646299666b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787651453; x=1788256253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ3p+mVClRMlOVJV/bCuCffvTLJfprkh1BUh6AmAvCI=;
        b=fFR6OJvRBXHeSNwcShnAJ4RViD2s6e4VvSMYYiPf7Wp4our1TbDt4TrNu21Jplj4G1
         tzVPb4yn7KIqd3ztna1Esadke+SxGurXjVJD6JdoieeXeAFr1lj9dkNSWeQyNsT3nGej
         Atsefymdb8qp1esploynJwGdB5+NXcbCsa6hxVj6qxGQ83DTm5+R2kxdUMNVYy0yrp7+
         zaV9yEqXs5ORc1JyuhsnFquVf59lrwUWOFcUiLeQMfRPydB/Hd2GKBRIQoREWObz9igz
         7mRWZuW/2BLTjSTDs0pfOoC6SBZy/ogLRoQKw/4neJnfV6JnbGfbqMfV6h/RmYbG59yE
         BNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651453; x=1788256253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJ3p+mVClRMlOVJV/bCuCffvTLJfprkh1BUh6AmAvCI=;
        b=BDybMDoWLrdsK/ifZBbeoUCcpIJS3TMGoDKEvwWGkatFIhFGVM0cTu3RNDnQ0ixu92
         2/AIG2p60tTlduBiwZD3zjOIWJQWPyTyRDNuUARrYo5bjRrLwtfjNOVGZI7VDn/m5vza
         EfefiGxi4WlU7BJNRMhiF3ZfUGonfEa/GHnnjBBpBgWBmbB8v5uih+qMi4fbYssjpej/
         1kj4amtnbTsAqJ5MuJqyWrg4+hcNsaXYl9p3ovODaCd7yvodGCGlMPRX973sAEQjeYh6
         Nq/1E7Y4Qp4phBXoXi2pwScfAjtzcj6AasmSmz52KlDbWmx/inX7m1ygBVT2UgV0EQB3
         +bRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAazNX5k+XXQBmtLSqR25JkYz4HUTJXydaAovnuFU+MlWdfChczVas6W5uhqScTFb7DHHBfWfHe7nrNE/0qbt1GA==@vger.kernel.org
X-Gm-Message-State: AFuF++ngGclpfGfE9pVnuTgIS92TVN6Wz6NopMgnkGai5Kvmt9o8aVpZ
	aceCZnXtjlPELyLCUbCpq2NSD30GmujtsfxFShHa+zB94FV6v4odVjWq
X-Gm-Gg: AR+sD11EWzUt4USBXcTwcefy+ldn1cfk4v+4nUBQ+9xrmp1WN1gsp0XixY6lQDgVYl2
	ps6YDUJ3wTD+RBhX4gsYKHA50QbwXi2RhxFQ0qjAEqosh7OZpwz+ABRjBHgcZ1Q1y2+JFoyPw9/
	7b6TMD9I6Rg1o7Z7jSnaAIL6t8moNEBHOKRuN0NVY3+ej/3QQOtP9jNWqgbTB3D/JnkAboaqObS
	kZlet1/wwL1pGqis2NcHzfTmLhGED62IP7fjwdh0/Uxoekwc0Kq+zmlzrJBIkrqp99EI7/titnw
	UZ0aNABhqhYSI4lQw/SUZA8Ii6jke5Na0rmc5chEhxOmAiF/rNaPr6DkNjQkaReL6mT4YoORs5A
	LWFI35lP544h8iJ3I80GnydJxCYLdWZYx7j7Vcu3pQf/zokHx198BVR42Eu/R5DPJsb4rm3iBdN
	8rkJW3Hp1uHjR/JZUnWckzPFgotSKOL0Bf94Avjro9jWfMEKnqoL0TBZ0PNDhC6FeJfuXs4+HvK
	TR9COsDZF3D
X-Received: by 2002:a17:907:c008:b0:c24:6505:8f66 with SMTP id a640c23a62f3a-c2491e83843mr2908890966b.13.1787651452698;
        Tue, 25 Aug 2026 02:50:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1749320666b.23.2026.08.25.02.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:50:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3L SoC
Date: Tue, 25 Aug 2026 10:50:40 +0100
Message-ID: <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Extend the existing device tree bindings for Renesas RZ/G3S PCIe
controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
some key differences:
     - Has 3 clocks compared to 2 on other SoCs.
     - Has a different set of reset signals

Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 09d78bd1a577..911b1976bf53 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -13,7 +13,7 @@ description: |
   PCIe host controller found in Renesas RZ/G3S and similar SoCs complies
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
-    - Gen2 (5 GT/s): RZ/G3S
+    - Gen2 (5 GT/s): RZ/G3{L,S}
     - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
@@ -21,6 +21,7 @@ properties:
     oneOf:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
+          - renesas,r9a08g046-pcie # RZ/G3L
           - renesas,r9a09g047-pcie # RZ/G3E
           - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
@@ -87,14 +88,18 @@ properties:
   interrupt-controller: true
 
   clocks:
+    minItems: 2
     items:
       - description: System clock
       - description: PM control clock or clock for L1 substate handling
+      - description: PM control clock or clock for L1 substate handling
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - enum: [pm, pmu]
+      - enum: [pm, pmu]
 
   resets:
     minItems: 1
@@ -215,6 +220,8 @@ allOf:
           maxItems: 16
         interrupt-names:
           maxItems: 16
+        clocks:
+          maxItems: 2
         clock-names:
           items:
             - const: aclk
@@ -223,6 +230,28 @@ allOf:
           minItems: 7
         reset-names:
           minItems: 7
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-pcie
+    then:
+      properties:
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: aclk
+            - const: pm
+            - const: pmu
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
   - if:
       properties:
         compatible:
@@ -236,6 +265,8 @@ allOf:
           minItems: 23
         interrupt-names:
           minItems: 23
+        clocks:
+          maxItems: 2
         clock-names:
           items:
             - const: aclk
-- 
2.43.0

