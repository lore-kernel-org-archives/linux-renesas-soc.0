Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883207;
	b=IgBpbVhtoQbSXFtSgZWPuChIW5EzNbg0MBpSuRy57zOuKAY4+ASiKsddnh93ak8oyqiO
	 J/x/SOLr9DmKdltynRVFZ4tVLsXdChb6E0HgngpBjigBSClBGuG0XL7vQnnio7/9y4Tzu
	 MhIw+rMV9paHZuPIgDc/UkqRlQFiBz42DS2xSvEL5oPZR6xpa07uXuMv8ZFFoTFYPUAVy
	 +AJ9mvNSEthNjKvdi8wTHGRu+Qn9D7k0zv5QvMNJsLg/fwecmLWkBlZG/xCizk2Hw/dPI
	 vOJut3exXeIaEVOTlp3y1OmqgeKtcz/CxSn57GV837Gz3HoSs4w9CDpQK4JezAd/b+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883207;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=GrrhEOTqjzFynmNxhUq1Fc8GMTrz8a5fOx2b9KVkQTw=;
	b=Cfvtx2mOWP0E0lopwPsShUKs1u/wKKFyb8c6UZj/1k6V/udNi1+sjVU9KlaMIr82NWbD
	 SS8R9erjN4CVsZ2AVJjs5ohzdvE9HO2K9UTnVUzEbF/ljc8GDPsB3OdCVQJEmuopZ6Ssm
	 Ewxr6Qlhwzxq1EqK63H3Zp2MeVwETtBQ6NdIowjNg43O8bfbZtR5H/M+bhZMcLPaVBa2K
	 pS1rfe61B1SDwh6pwF0r/4Gzag8gKNXppQKN0LQCAxzP+RN8vI1p0VMR+YJQm79VAzJMJ
	 0ez6HuQ03bsFtgLcVhRElAn3EkAA5qc3v0fOAOypkwy1Vt3Zc+nXwI5L9jMlcnhxExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7abNjR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F5606D836;
	Thu,  5 Nov 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7abNjR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88121F000C1;
	Thu,  5 Nov 2026 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883206;
	bh=GrrhEOTqjzFynmNxhUq1Fc8GMTrz8a5fOx2b9KVkQTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e7abNjR7939P5d5TgM3xcATJVnaqNUy7jv1p/q2EOBVQx+cRKmAeelINP+KuIn66D
	 /Os/4Nkqcp/TQE7aIfgQwvUcU2h5GLCr/mo7dOX8/zoTLP1mrNTG7OmDE0bM7Wu1KK
	 gsmyLApcQMlScYuGHoZNJkerpnB5RsOE47os+D8WGOtdBBopcKdmWxfiAGL3UQVt8p
	 zyYV7++VX69W2TEdsnBsgfJ8+0U8dNkXgKwGNI8/f9UUTW5Iu38U4LlZqB2Za0ohW2
	 TZTIB0tMnvoO9BF3O7zsvb4UYNz3E/jeRTdWImEuiskH2QM87JbkFXKllFXRxJWiub
	 Q9+HyLUzkApOw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:15 +0100
Subject: [PATCH v6 2/6] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-mali-c55-renesas-dts-v6-2-7dff41bf7107@kernel.org>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index 39af7ffc70b4..0a2a7720ef94 100644
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

