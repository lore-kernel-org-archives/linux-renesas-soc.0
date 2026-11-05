Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883204;
	b=i7FK+iuG1RV6AO5Nl6vjLT+8DXGQShcX6wYdgIPiauxqViBHn4BcgrK3DTmc06c5056P
	 sazg29OzJbNntzV2ZRR/X+7pS4oFTJf3XoxIeCrLW2EJTHi9sOEesiGE4rfIakbRVuqKx
	 0CH+NxpqnEe2hr/HRQIyYa0Vc2ya6Wzgis9ArCVOuHh3++zzkE72zXnXmQAKqXZLtvv7x
	 bXdLGXCjpJOe6Mc33qp5Sh88jl948EC2GCOKBQBLZDa/02K6aMnq9kmlT8xRysxwSdjZG
	 cGWfhAixz5iQd3NuNVdqDVF7+lgSwbCxPllLYJ7iQOLfyngbJDtJ0tv8iN79yHCyZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883204;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=uHkjdz0Qf2ZY360aAcgribqqcDWaVHpUkIKAZNz9wiU=;
	b=l4/QN6w+/GnUvUGGnm0AaCeQn3zlr1/eq74dqD9V+sHv02/So+bhGaljd47I6KKCiBVz
	 EBcbApWhr6Q4Fz57U9IQj6DzT37G4e7Hp5jTNuBlN+zU8X6fQdamovSQ/avz01bW+OqVG
	 YD0S908SDs1CmR1tJyYL+ZdZC2w+fb/6Qdf/zF2xsdUH0ngyoGZzEmbuWsQtpmmYVY1Pl
	 HeodJUhuLTz2kSVzZ6fN94G6wiXoEkNb5b/toSaW5XAG+yMEIImRZ58629nGbutfkCPQY
	 0hkFJxl04G4+uPMRA3pzhoAKe0oKt6+sj6y80dkAEErFaiMOE082EpNODOkfnUX+Fqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvRsbdQI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB6606D813;
	Thu,  5 Nov 2026 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvRsbdQI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425331F00919;
	Thu,  5 Nov 2026 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883203;
	bh=uHkjdz0Qf2ZY360aAcgribqqcDWaVHpUkIKAZNz9wiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GvRsbdQIV+CL6bftlsAIcLLTbxCPvnAdT5zcA7ZdKEdk/FBAch4pdFebOS/LtHMDh
	 My7ApC69IzOKx7AdSzPy6s80dGUQdZ/y+ZTU3o3dm8/MbQsgj9ftgrGEI3v/Aa9L8r
	 iG1ECwLB11GWnWuEbfd0FaTtfSzZDRvzOkloNmVfnR0E0+Ewpjsl1pnU94aP7yiLYe
	 ToFDL92a7+NVraw+vktI4spBHOl4yh0KH6VyzqnCMUuc0yESv9H9ilauntf3X2cQij
	 aDE/vLd/GUXX1U7Ld1m/fPfHN0XrvcmhmRa9H6fan453eHR8YxOtN0OWJwemkKdUkv
	 z/yIHoxg0EAvg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:14 +0100
Subject: [PATCH v6 1/6] dt-bindings: media: renesas,r9a09g057-ivc: Describe
 additional interrupts
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
Message-Id: <20261105-mali-c55-renesas-dts-v6-1-7dff41bf7107@kernel.org>
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

