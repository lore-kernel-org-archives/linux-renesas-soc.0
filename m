Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6837569947;
	Wed, 31 Jan 2024 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696838; cv=none; b=KrKkRL8zjHEc30aZLCWdV2SsUBTHQ27WS1UW7NLFaBq2gUqp+I9pSIiqJzhNczQ0gyl09eLBwaKEJP6ctb/2b1UJsTMNbR7FsgN8ZkxPL9GJMjC/Gp/eiOLSHx/AE0sBFskxQe/iygw/rnSoP4SqB2kyHHSaM+rSysDx3D0YkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696838; c=relaxed/simple;
	bh=PF93twsmTyJZhoa7OEVuj+JBm84zS+eywAuEpH6Wxqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D/MmL9miZCG6VI9eqoevUV1nQqnBsOPjvgBWMTpTny5Pi4rVuRBSCNFH0Qrt74Ji3Yh/6YT5aNFXFTGshHgbKVwsbgCZJbrXEQTCAQva91CJanxgvMZGPRu/91J71gzA+Uo3vqK3cEHnfqrhi8jR5pEfBqRvljvOnrAc4r308mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="192377777"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 19:27:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8643941DF0DA;
	Wed, 31 Jan 2024 19:27:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 RESEND 2/6] dt-bindings: mfd: dlg,da9063: Update watchdog child node
Date: Wed, 31 Jan 2024 10:26:52 +0000
Message-Id: <20240131102656.3379-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
References: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog child node by referring to dlg,da9062-watchdog binding
file and drop its definition from this file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Lee Jones <lee@kernel.org>
---
v6->v6 resend:
 * Added Ack from Lee Jones.
v5->v6:
 * No change.
v4->v5:
 * Updated commit header and description by replacing
   'watchdog property'->'watchdog child node'
 * Added Rb tag from Geert.
v3->v4:
 * Added Ack from Conor
 * Dropped link to product information.
v2->v3:
 * No change
v2:
 * New patch
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml    | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index c5a7e10d7d80..ce81e0b029cc 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -35,21 +35,6 @@ properties:
   "#interrupt-cells":
     const: 2
 
-  dlg,use-sw-pm:
-    type: boolean
-    description:
-      Disable the watchdog during suspend.
-      Only use this option if you can't use the watchdog automatic suspend
-      function during a suspend (see register CONTROL_B).
-
-  watchdog:
-    type: object
-    $ref: /schemas/watchdog/watchdog.yaml#
-    unevaluatedProperties: false
-    properties:
-      compatible:
-        const: dlg,da9063-watchdog
-
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
@@ -82,6 +67,9 @@ properties:
         $ref: /schemas/regulator/regulator.yaml
         unevaluatedProperties: false
 
+  watchdog:
+    $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
+
 required:
   - compatible
   - reg
-- 
2.39.2

