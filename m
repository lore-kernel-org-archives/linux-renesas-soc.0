Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349D4756CA;
	Fri, 25 Sep 2026 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341005; cv=none; b=IPVdVHN/r1DTPiHQyp/LN/quJl3ttGvZngwP6MQdXjdvWDTkbm02GsVcIU6/Nd8688k9FWdwsH1A4M8Z0p/BNR4lIrdybE8UODqOMQSStn2i0rbJiiGkwGsvbI0R4VeQGj6YjZShEIiXIJjaJEoSSWqq42oWuvCjO3rQsYNXALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341005; c=relaxed/simple;
	bh=maJTp2XupqyLIDHgk1bqmBkGFato2cTQRVCOBE5oZvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9TPcuAePR193SZh+rIeHdrtxDQfozM+hU/3n4R7F6mEBUV+AwrNeP4NjxPuoae/a2CbdhOX+GQaygsK2cbcrCSiIU4IFuPf+lc0cF4mtz1PBYeSBrzSV74nXbWb/Fr2ghLenTGdiS6KK02hox6CRgiwfEzQriYQ4Q/usVgKdGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHEUETwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHEUETwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8841F000FF;
	Fri, 25 Sep 2026 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341004;
	bh=r55cZNgFYqkmnkBSGTUUn/sgD/oIQhk94rReWqBrJAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NHEUETwZgQDwMUzvdgtHSBMhurWiNF3VLQgKveQQFWaF4I2z4BHH1bIPjJydioGsa
	 nxwgyVDh+j94V+t1MT3DdY93jo2SqgECYTEeTaaYTNCL0fydvAIDyPwy3RF5XnT6Lo
	 eArNupN3I53+B3mJR6+mEllcRhdy/p3D3+DD7TXYaESb/0RuCLE3iiB9yDdHQ1Lyl2
	 CPGV0+0r/GtIxyRaUCcXjnlayMayIlF76Yci/R+W3gWDgm3zLMdD6U4CRThHktXaYA
	 mzRVvio6vkEDC8GJHeW9cyJoT8woZLBms9/WBSD2G2wtGBzft83niHQcteKlOOjFx2
	 HFuJJ0+Od8ciQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:56:33 +0200
Subject: [PATCH v2 2/4] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mali-c55-renesas-dts-v2-2-69f728a474a2@kernel.org>
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
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

