Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D63D16EF;
	Mon, 28 Sep 2026 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598124; cv=none; b=P5S33B1VtWEed8hmOEqY6+LWjwWI6jEo+uDrAQ4dnRbqn1ym7/7cgnUfjfMkgcjqXCJuTUSA+IcigYc9YGtLYmMNxFgDPOj+oZo+WUdWimdNTs/rgYhj2Pd8V3mXHSozV7fDI7iAyDoYP0RB9SXP6I6h1JNCpECI305yMoSWSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598124; c=relaxed/simple;
	bh=nPGEcDojst4aIVIAMLODzoLJUyuU9W/S+7KzR2HcTrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTTf/+3CuD0CsSwkzqJyR5evVXV7/puKs8PxolFL7m+WuhPtiBXYRMUcjUr/j1dB2+ceEzhFLLxHcHTmwt9XjQ2Uhri/dKs81ev5iIBk/d9Y4/8FrySMJaxm6X8xXTxx940puiOYUof5p/nHe+xpneBu2upRUcKgdJLpzgH0N3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn0acfAM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn0acfAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C81D1F00898;
	Mon, 28 Sep 2026 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598118;
	bh=RenKNerweptYruEDB2fEsyRo6TZbttJcBnpcMXlpdqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dn0acfAMsUE5RW7VFei/bSrvkU1f5p5JUSs3mc9VH0sn/agtxBGNFaaBFkhTbEo26
	 KJjXNZL4Ix+QGOw+OCUbQqysiIEAiA0HDI+STnnFr9XzZiQqNJIA8ktPQUu5CLQXK/
	 MPSVJCsIOgEVj1+LZ2bEb6ywhb7KdoFVgsAFj6l+J/CNMisU260BaYzN4EJdH59Id4
	 ychnuanvdXAGVaYIW0To38rOV7R8cQvs02siwGZ5rbEPvFNVb0oOawv8620UCQ6FFz
	 yIOCcu00OjyfuRsUQn43u7hSD+caSheHycfsdIE1mkt+jQfwkjdVA96jtEshWp9dHC
	 0+yA6J08D689g==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 14:21:47 +0200
Subject: [PATCH v3 1/5] dt-bindings: media: renesas,r9a09g057-ivc: Describe
 additional interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The RZ/V2H IVC provides input frame-start and frame-stop completion
interrupts alongside its input frame-end interrupt.

Describe these optional interrupts, keeping frame end first and requiring
only that entry to preserve support for existing device trees. Extend the
example to show all three interrupts using mock interrupt numbers.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
index c09cbd8c9e35..3eeb1a92c9cf 100644
--- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -21,7 +21,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Image input frame-end interrupt
+      - description: Image input frame-start interrupt
+      - description: Frame-stop processing completion interrupt
 
   clocks:
     items:
@@ -92,7 +96,10 @@ examples:
                <&cpg 0xd3>;
       reset-names = "reg", "axi", "isp";
 
-      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+      /* Example interrupt numbers. */
+      interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 
       port {
         ivc_out: endpoint {

-- 
2.55.0

