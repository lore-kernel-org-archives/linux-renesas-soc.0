Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6F2110E;
	Wed, 10 Jun 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105367; cv=none; b=PSnz6BI1Acnj2+YZE3dS09p3ZviX/yxJ4djp4b/sdw3Z34nmzveib+ePc+ZLNJqbSKTRkx7sNGNeriqC6Ay1WK4W3wHr3OAmO2KCmLxVmd0Q3vXJHx4/FpQvzxfCCXlZW2kWd9DNx8RnI4joI97SujBTm+RVtdwXAwNaPh/1qf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105367; c=relaxed/simple;
	bh=LR+z/1z26lv1FHeuZFOizhY+18yV6SEkpsY/4OMdUk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+UWpOZJT5K+yd2W8Oi5QvTrhiiwDWhkdELZtLEMulUbOhOcArcuy+H7fwYP2IwUYa8vKljMSp/hvbQ2tq6RF3zFlcs99/CsqEm3+atv+n8faas4PJ03H9TzRr/JxTIQqQgh8iermUvvhmJHWCN0JbTLRtarzHqqYQzh8+heBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C215E1F00893;
	Wed, 10 Jun 2026 15:29:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
Date: Wed, 10 Jun 2026 17:29:20 +0200
Message-ID: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
Controller is located in a controllable power area.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This fixes "make dtbs_check":

    arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
    arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
	    from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index 10c1a900202fc2ed..ee604117ffb3fe74 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -66,6 +66,9 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   arm,data-latency:
     description: Cycles of latency for Data RAM accesses. Specifies 3 cells of
       read, write and setup latencies. Minimum valid values are 1. Controllers
-- 
2.43.0

