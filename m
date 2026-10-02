Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B248C3FA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939836; cv=none; b=D5g9RxlHXv8GDPU0sGgvHlD2eVh/M3oy5rW2lwtpemQVouHl929q7JablWw5vodZ9Q/jrPPkkFbRJddCs2wH2J278E4XZ1DRxhIw+ygUCwBVxirHdlHvEMYQMwgqvDhGzXJf59pnQSAIzU8JqqtyxFPy4d4dGjf6U7lIXk5EPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939836; c=relaxed/simple;
	bh=NWBSVhnPkeYAqpGcMaNhwAoq85f8wqfXUBM2buVm3VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWdU/ShjqnRu4FzwajBquf/BwQAkmpSsPcAW2T5/6Z8vx0hhV04a+y3XZ/KDD3QucVWWkFEdB+7IB5GgGnDiOo6RXiHUUUkwcJ5a7PjVT8A16gN+y/4gum5nhtY6a6xBtkFqq6dxLBW7C18ExMO81tzaVlmQbz/rbd4EH4DuefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfxmxON0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfxmxON0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso42428565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939833; x=1791544633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFohxYIdEQi7y0K7kq4vWVYVD9J2IC+d+78vXcwuMIo=;
        b=TfxmxON0ZYy8Sudy+gFb82pEiy46CWwXP/3T1/myP6dYU8kWvlYfzB9TsOo6znUJ0O
         VF3tSx/cZkQ9HNFnyQI8i2etUS0bHVyuYijy8ucOp+5ldgnOPkRbw9BQ/M+vzI5HnRRl
         IvPIoc1O/vbQIrzYRMcqoDJ9eTE928fKmlnNrz43dn4lqvbiydN4T6YybgOEkkvPwI3y
         ftRz/3mUcGeSHGHBRqATonO1WbHSD35kjqvCDKBGibUf9k4EAR3hhmM0oGNUpN+1X9oG
         urKJ/wa1n6lvcq0wYLjsOaODO8SWS55srw16os9/WPXYz9gVp2RU2PsDtC1wij1WRest
         sffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939833; x=1791544633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFohxYIdEQi7y0K7kq4vWVYVD9J2IC+d+78vXcwuMIo=;
        b=muShTd7nfVMJXFJeYxQcMBK1k75QLvgigAk1t8sI8jyYNqm25PYPVWn36nHA0/JfS9
         eJH0zQBiDGZbS4oPlqFBuJ/KJymqAbyNWcMraToPn8/SEfnKK/F+9yN4mBXFF/GZJEws
         yaBVBTVugcp+snwY1IQ9PJkb+nuO1NIlOgcFb6IPzW2og1sQ8ExWevyi/cOQ31KxXhWd
         MIV6u5w8/+wAWojBvRjdg0zaM1uoscgWWFjMIyNuMTuy7HBB5dak/Mel/HP2tCO6NdIg
         N/e7ZXzCuku9sDLv3JYJqd8jZekPEEH9nbADWtRVIG0lMWihTZEGLMOJJjs98YaseJoJ
         HGGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyooaLKMVPiaYLgqgFT328k6PN68RCKzpi0GM25hievcYrq7b2ENtQ6pOZBytfiZoTbxXlekJNp8QFuhP1MLAUQw==@vger.kernel.org
X-Gm-Message-State: AFuF++l6VAucrYdjMnkCkXaswSWI6eRNUQVz+yo2ZaSOQjohQ7aEMSJ+
	+iWVq0BO0+bLuqpYB1TJVxWRV3RGs0ull2HZNcSJIsLh9yeWDuRcQMGl
X-Gm-Gg: AYBFou0QeyTyzRSWYMOlElIqHKVXSR0sKjt1rG2syXaI0AzF8EvmWpEZB/+WNryTE5Q
	SwptYRIFKfmQEdLav5cvQO/r4Bf4GsTax7J9WjkMBjfCHJJ09eVpo90SbMuU4edDyGmOcWiwzMd
	FSITEkIgL2gdFPtTf+Tg6/Ka4J3pb8wfIjlD2XF2oJwtw3RO/+mhX6smQiMzv3ygllVhyrtAb5M
	i33g5SVpVv9n7N5Rj4KQC0OXQneL9pVi65JbXJxYAvuXpQkMEM+2k89+U3T6fOLaN3ar/+LK/jp
	JmAPJ1sNphfxvCM1l8J71ggBn98nIEGw34G3H61nlweq4JA5N/By4jPjHMfqKtorZtBUIce5zkP
	VMedqVNrgHBKpPRxIYZxi1Ens6JiEs4hXFmlp1F9dwF+NM6k04gBlQYmiI5QnVbUYVKhJpCeWAK
	lfvRTlL91U7+Qv/lYbe/GoyrvHlbxvV9WVucHZ1eC4SRE3L3DozllSXprVJ67UKLkeJgCLXXNga
	OXduCs=
X-Received: by 2002:a05:600c:4f88:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a0274f9c06mr45276765e9.4.1790939832704;
        Fri, 02 Oct 2026 04:17:12 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:12 -0700 (PDT)
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
Subject: [PATCH v10 2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
Date: Fri,  2 Oct 2026 12:16:57 +0100
Message-ID: <20261002111708.234957-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
References: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
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

