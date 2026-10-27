Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117496;
	b=KqS7A72ml1NeImb5RQAfOcQkYROaBSuzJ3XPo3yR1iGEYEvQsDv4odK/XmUsm+7PleJo
	 iTjTV0u70DOkR/brIZQyP7GJUSamIkTtSV3k1BgqNxoSrLjA7HbAVLTEKb+3J/Gjqi50S
	 Cd1wnKovQ0IbETw8gPL4P0aUMxS0JwRh8CauJO7+u6V3kJ7qdo7x+hrmqUrm/R4OxjN2s
	 qDPNbF2Fn3l8eIc1g76YcDxbRCAobuBSCQL3COXDEvbfOSWf/sH0BHp/8RYSBqjpQ/A+T
	 WusgZRnRrT3HN11PT528/5mQ3WIJQzTAknwu6v8L0pXjxEOCe4GYQQ/gIbjDKfTqmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117496;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=XK7vC9NfBsuaFsDDnvgHSdpxd9hGGvXSb4HFhVilu30=;
	b=eAwqdt7rRo4ExqGXdBIbh4VOyzxInCCNy0i7TEFnn3vGvBnTrnHHXCp19EF3sL6Bm+XN
	 PGZmPMIBYyvM831Qym0spUyRL12QPOBp7M2g8DI0l1S9DmtL/3Ads9hmCK7B2qD8uSAPF
	 m2eF+HUnR583h5iww59txCJFBB9KeGvhJL7/BQ1n/gib1+5VyqiKVzOnjogw+hO9BAla/
	 bYnnLPRb0eYEOxz8iacCMIZdE74k0gBXCMqtFEbCBqh537XlShhnEo69jqGTU7shhl5N4
	 kFfzAbxtHzy+THa/t3OYUyZJjR1ItYNIYuhFKEbT1W9cYZM1VdYge7FePs927BQXAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUWBCGWP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB230606A31D;
	Tue, 27 Oct 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUWBCGWP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640DF1F031E4;
	Tue, 27 Oct 2026 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117495;
	bh=XK7vC9NfBsuaFsDDnvgHSdpxd9hGGvXSb4HFhVilu30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gUWBCGWPWNonWuJDpqLpWOXKIt65OXNF7U64fxTNYiiBuBS2lth78dJDiXWF93o9N
	 tuOQDy9LSiDbYyIio5YvtrS9/nz+nDSW+RKpwdsUSbLcA3GZ8at239kpMTxokDiqQD
	 jTvzRSEEEAwoL2QTfqCSHqGZAEQEPRmeSDmjrk4dEdL55GDEiSbn29lFTTIG3Awk9V
	 74Y8C0otQ+cyizGh3d0Vijfc1p9fHPCe7KeayrET2IZtjBxj2I2c1HpPxJQKYi62rG
	 tjvN8N4T/kU7nNKbVZsn2Mv55BLUeZmos4oWrpqnGNyplNvwUtET+FVRt6EeHLeWHm
	 ePS/TCvY4ohDg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:24 +0100
Subject: [PATCH v5 2/7] dt-bindings: media: arm,mali-c55: Describe DMA
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-2-51bbb43969c1@kernel.org>
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
In-Reply-To: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
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

