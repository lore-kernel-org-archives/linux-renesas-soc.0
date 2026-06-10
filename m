Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B32BE05F;
	Wed, 10 Jun 2026 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105094; cv=none; b=tEIo+xhRoKM/CbE/a3Bfi51M+XrfSJR9iZZzmS5axKIp+q+2v5bxOCHalVcOYvMCg3vkeUUc/kVzfK/wI6hAMp/fo5E1jjdLgtc75hrcS95rfRW7V7Dc7ZgUEDIHXp9hkEosMYsa2tCA99riKmSx4O+v7cyaPa09367KyrajDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105094; c=relaxed/simple;
	bh=8IzCxAQXih+Sb8cJNqqX04/FqubEw8GSFBCCrdW1htE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahBLbF8j95GAMzsD/py1Gxlp4RVal7BcdSXIiEu8AQjnlH6TwsvnRctcxOkiPlPdQRqafjdioJkckAf8pbFgxD54n9oxGd+NOvEOVWFTnBV3DhZjZb0b+ctMjgQi8ldfEDEKvurNqN6r1hO88sUiO4Aw3N6NEa3nKAjvDUtwnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3CE1F00898;
	Wed, 10 Jun 2026 15:24:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: interrupt-controller: renesas,r9a09g077-icu: Fix reg size in example
Date: Wed, 10 Jun 2026 17:24:45 +0200
Message-ID: <364ff570c8a1845fab24bd89557f06c9e406f8de.1781105007.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Figure 5.1 ("Unified memory map"), the safety register
block is 64 KiB large, just like the non-safety register block.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
  - Drop Fixes tag,
  - Add Acked-by.
---
 .../bindings/interrupt-controller/renesas,r9a09g077-icu.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
index 78c01d14e765721b..a809bc4f75159c60 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
@@ -165,7 +165,7 @@ examples:
     icu: interrupt-controller@802a0000 {
       compatible = "renesas,r9a09g077-icu";
       reg = <0x802a0000 0x10000>,
-            <0x812a0000 0x50>;
+            <0x812a0000 0x10000>;
       #interrupt-cells = <2>;
       #address-cells = <0>;
       interrupt-controller;
-- 
2.43.0

