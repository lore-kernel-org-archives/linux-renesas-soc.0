Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1542616F288;
	Mon, 28 Sep 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598125; cv=none; b=fcWGI+2M8akRYHmoDuL9YQb7P6FtprzgvGPQEbQrrfKXXWS6Zxh0kxPzn2U6Rzma0nL7+XgAFoQjoF7ZxrRZreRADd7Pclg5m52MRkCDFVR6sVCJwAlybmBoaLwkX8Vq4IlAQvWgtitH3kzhzHhKy2M93NDEWJDvIIbcL65d4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598125; c=relaxed/simple;
	bh=maJTp2XupqyLIDHgk1bqmBkGFato2cTQRVCOBE5oZvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cE32tfMy1SL0clHl4i7XN8877AQxajQ61vIHTJxPyaplO1aLhGIH4gtuLsI9+DaPg6nsQm3+sMgak3dg0QMwji3vQLOPK0xSFznHSSWj9uKtVh4xTMt9juyZUcUkli1C5XRUKW7/commhE6SZSYcfQH3Bba61C2zN28sBY52uR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rizue/FQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rizue/FQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96CD1F000FF;
	Mon, 28 Sep 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598121;
	bh=r55cZNgFYqkmnkBSGTUUn/sgD/oIQhk94rReWqBrJAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Rizue/FQlAqEcmp+pbJ5yG/qnfC+++Lo8NaNEvw3RKecR6CEH9mcVj9uGaMvclVqE
	 /RtvbqLkn6tyLnIZQo/Z/rJMYzVXRaMEouwrihKX36U1quc68wGJLH3SWUP2+SMF6S
	 Kay2WxNoVtckSL5Iyz6I3DrZup30QxJHe3wJ36gI5l3Mo4ut4WRrZxg5xdSamdLra8
	 63sONY8uaW/2plsqOuYnY46u52olKZcLWPFzagM9Y5jyqfvZ/feHPRQIhO3avULZGp
	 3Eat9iRHU49aKnM5MsJRz1FGBnIyu228fpJFjDOCpGoO6uW0nsYXuo7p6wM+Pse+hr
	 M7GVqjbOlAAMw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 14:21:48 +0200
Subject: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
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
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
interrupts in addition to its combined core interrupt.

Describe these optional interrupts, keeping the core interrupt first and
requiring only that entry to preserve support for existing device trees.
Extend the example to show all three interrupts using mock interrupt
numbers.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index fc4fcd19922a..8fcc46660b75 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -18,7 +18,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Combined ISP core interrupt
+      - description: Full-resolution DMA writer line-tick interrupt
+      - description: Full-resolution UV DMA writer line-tick interrupt
 
   clocks:
     items:
@@ -75,7 +79,10 @@ examples:
       clock-names = "vclk", "aclk", "hclk";
       resets = <&resets 0>, <&resets 1>, <&resets 2>;
       reset-names = "vresetn", "aresetn", "hresetn";
-      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+      /* Example interrupt numbers. */
+      interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
 
       port {
         isp_in: endpoint {

-- 
2.55.0

