Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C391E2603;
	Wed,  1 Jan 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735749569; cv=none; b=UtFK4YwiTq7FVxenMgICb0bfi/89wjqxB4IPmcUMtudKdezVHwZCacpg8fub5pM8jP10T3eTqfQfWj093eHV0Vu//emup9pDKQmGqFzC9y6M7Rz3W/5fLh5AMrPbQnaYcICcw1N3QRTurqE+i4NmBL+XrFi6ieo33H/5IS0lIiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735749569; c=relaxed/simple;
	bh=gG9XneZdmjRsx8/ONF7lfJ3JGEIRv7GSaIB6aw2awh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEsS5HOmW0wANvlGEYc7vAISGmyBO6gVShSThkkIrewtD2qntheQ7xukT5dEeiEiNQlWxZmxOGNhug2AwG8OUZWGxpoEsCPz2p1uChEtVtFgsDIQY2gHE90jmWoUqoQmTtGmFO6lFGvFoLMb+M35OQeD1e/XH3fgbDC0kIYRgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: tlWTTPPgTvKyEufc76xZBg==
X-CSE-MsgGUID: KsYQNf/ESXmaDAvRsOf5Jw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jan 2025 01:34:22 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 05A664026B1E;
	Thu,  2 Jan 2025 01:34:06 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Subject: [PATCH v2 1/4] dt-bindings: soc: renesas: Add RZ/G3E variant SYS bindings
Date: Wed,  1 Jan 2025 17:33:41 +0100
Message-ID: <20250101163344.128139-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System
Controller (SYS) binding as both IPs are compatible.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes:
 - v1 -> v2: Do not rely on syscon compatible string anymore

Notes:
    v1: Acked-by: Rob Herring (Arm) <robh@kernel.org>
    v1: Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    v2: Tags dropped due to small changes in compatible property structure.

 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index ebbf0c9109ce..e0f7503a9f35 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -22,7 +22,10 @@ description: |
 
 properties:
   compatible:
-    const: renesas,r9a09g057-sys
+    items:
+      - enum:
+          - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
     maxItems: 1
-- 
2.25.1

