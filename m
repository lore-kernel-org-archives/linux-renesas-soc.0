Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC90427F84;
	Mon, 12 Oct 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806194; cv=none; b=MMcYq0fOkVFMEYYxZG4LWgvQPPQ4zPlmT5P5rw8yf0kcV05zIoc/M6lZTsLGfXgEGCIfAaH3RHHqKEVx6mJ/fbjG3zHc/RYiX7Iyb2W6OeZ4bJEqFq7tSbXlCK/B6qJm9Wib8/Cw2pcx0EFXY4cl1aVO4nOtQPkC1IkAJ4XUitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806194; c=relaxed/simple;
	bh=kp9w9v2ErW4cXAND7B/u5nBau5xmLu87ogx95lCuXVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qh5gXXWcTWobHipKfEee28hJIsGBITXGdFg1pipoHC7q9vOnRr2HfPXxBvOBLLpmx73RD/qkF15pbln6Y3LwTWwnWVkD/girCi6xHbY9NffZUyt5dYE1mDfX92ws3DufaK9OmkAtugyPik3PdsXGLW9d8mbi8mga8ujp5eWFyHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/YbpYMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/YbpYMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7312D1F0089D;
	Mon, 12 Oct 2026 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806193;
	bh=x3HPh7lqZwfzrlQDbDfUTcuR+GTgGBnDDtped+TC/SA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y/YbpYMPJltHlmSdZOiyIZ1bQ7I/2AF29w6RkqIqGotMkS/GoiSzj44QHAuGUkahJ
	 wD8513sJ1X9h7/yKuWpGPZrSzvj0cGKT8GsRJTR63AI4w2qzrv8epA50yTXXQ2xfHS
	 Z7I4g1HQ/HofafOlJCvcV4Ez2v4JVd2xcZdn12gVKcHq4/LgaADpMkA2wENLzR2Rq9
	 tCa76FNuDP2tV75kBhqbEO604qV5f8d1g8+q7jX+KST7/leQm9x6bVLYN79Gz2pp/8
	 PW6CkKR/rGSNbDTKGqXQqeAEf/whBUG5n8EPFdXd7abJF9pwAoUnGLkapZgAkC8NIh
	 yjyeiSK67IsrA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 13:56:23 +0200
Subject: [PATCH v4 1/5] dt-bindings: media: renesas,r9a09g057-ivc: Describe
 additional interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mali-c55-renesas-dts-v4-1-c410e280bf2d@kernel.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.16.0

The RZ/V2H IVC provides input frame-start and frame-stop completion
interrupts alongside its input frame-end interrupt.

Describe these optional interrupts and their signal names from Table 3.1
of the RZ/V2H(P) hardware manual's ISP additional document. Require frame
end first for compatibility with drivers using index-based IRQ lookup.
Keep interrupt-names optional and require only the first interrupt to
preserve support for existing device trees. Extend the example to show
all three interrupts with their names and RZ/V2H interrupt numbers.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
index c09cbd8c9e35..75ecb47422b2 100644
--- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -21,7 +21,21 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description:
+      The image input frame-end interrupt must be specified first to remain
+      compatible with drivers that retrieve it by index.
+    minItems: 1
+    items:
+      - description: Image input frame-end interrupt
+      - description: Image input frame-start interrupt
+      - description: Frame-stop processing completion interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: isp_vvalid_ifp
+      - const: isp_vvalid_irp
+      - const: isp_int_fstop
 
   clocks:
     items:
@@ -92,7 +106,11 @@ examples:
                <&cpg 0xd3>;
       reset-names = "reg", "axi", "isp";
 
-      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+      /* RZ/V2H interrupt numbers. */
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "isp_vvalid_ifp", "isp_vvalid_irp", "isp_int_fstop";
 
       port {
         ivc_out: endpoint {

-- 
2.56.0

