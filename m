Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D493D34A2;
	Mon, 12 Oct 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806198; cv=none; b=Udf/XNctxk5+36tFqUscs8z1JpBdjE4nIsVfO+whnm9VulT+qEcOEZ8Wom1xgwXCeXBpiziuWsdY8jF6Dgo6X/jjn/1CFuB/ZipBHNLep8YMlzDUFCYRKQGgpcIZuJ+1FuXHkikFoIO/XT6i1VvWGy7gaozmj3PusMGksWg7r9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806198; c=relaxed/simple;
	bh=KIiNZ6TurDFOcR3RaLbeBW95w/EAcNTlcQyiuYaPLI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ce2iEBXWajNuYKfM8bTRLUgrLDciZfhMR18Z6DpiPtOB72m+qUi87eW7ICxV9A5Y4i22PcjpAHHdetO6WBx+VefL0NALPouQuTko8UVaCBhlE0w7e8/YB7vp+tu3I3qIFJjhzgW+aZ3QsE6rcyo9IfKu9CdfYYC8VOLJp29sKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwwyqPva; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwwyqPva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFC11F0089B;
	Mon, 12 Oct 2026 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806197;
	bh=XK7vC9NfBsuaFsDDnvgHSdpxd9hGGvXSb4HFhVilu30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XwwyqPvaa79hzYltwj/bOm92bLQcg0bYCbvSfyeV/GQVIjXKMuX/ageGdaPLdKqjJ
	 X/CuOxfGvHljgQT4DvH91ZNvd9AS9CD6BUkO8jW61NFwGPDoGW+5DXi1MzXAIfxZs3
	 h5U+6r+P3kAzn7dHY+Fh3whftVw9eRgKFKhPdWq9WOFPYOT+sFqj7xyy/tLubRhDeV
	 /7BBxq2mdCVRkwWb7kAphjbXJ3rIOncWjyYBTmb0qY3FWoeYYAt11ynAIuUgcZ2LQF
	 8kf5AnKS/E1Rs40bu4kz/1WnmS2ByFEyzF3PVObYWE30HdjyO0M6mrOt+M5nOn1o+e
	 M+ColPT1s5h5w==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 13:56:24 +0200
Subject: [PATCH v4 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mali-c55-renesas-dts-v4-2-c410e280bf2d@kernel.org>
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
In-Reply-To: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.16.0

Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
interrupts in addition to its combined core interrupt.

Describe these optional interrupts from Tables 6-14 and 6-24 of the
Mali-C55 Configuration and Integration Manual. Use combined_interrupt
for the combined core interrupt and the signal names for the line-tick
interrupts.

Require the core interrupt first for compatibility with drivers using
index-based IRQ lookup. Keep interrupt-names optional and require only
the first interrupt to preserve support for existing device trees.
Extend the example to show all three interrupts with their names and
RZ/V2H interrupt numbers.

Assisted-by: LLM
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index fc4fcd19922a..d04105cd1ecc 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -18,7 +18,21 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description:
+      The combined ISP core interrupt must be specified first to remain
+      compatible with drivers that retrieve it by index.
+    minItems: 1
+    items:
+      - description: Combined ISP core interrupt
+      - description: Full-resolution DMA writer line-tick interrupt
+      - description: Full-resolution UV DMA writer line-tick interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: combined_interrupt
+      - const: fr_dma_writer_linetick_out
+      - const: fr_uv_dma_writer_linetick_out
 
   clocks:
     items:
@@ -75,7 +89,12 @@ examples:
       clock-names = "vclk", "aclk", "hclk";
       resets = <&resets 0>, <&resets 1>, <&resets 2>;
       reset-names = "vresetn", "aresetn", "hresetn";
-      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+      /* RZ/V2H interrupt numbers. */
+      interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "combined_interrupt", "fr_dma_writer_linetick_out",
+                        "fr_uv_dma_writer_linetick_out";
 
       port {
         isp_in: endpoint {

-- 
2.56.0

