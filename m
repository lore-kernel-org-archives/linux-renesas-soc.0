Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117492;
	b=v4ZIf3ZIBhgc4WjI282u1GNPkuqWuW4Fbetqb3hb9LYajpjdRVAGz5humebVgYpjKtxs
	 NTiBsnP8Mzug9npQVMpLDXmh8Ar0jkXbSSYvkcgeDaM6K0VEe9LSEqG5WdyKmMtfcwNk7
	 /1ss8DHu+UNzt4YnymKg7RyusBDm8okWEJj1Z6X2oYNXeOC3hvyzWJQAAz36cM+SgY10G
	 glkUS1UfrdqtLitGbk13cQNeROyK3y8WkuAyvigloO+kdT89KGiTKgmLiYVpRgC22mWyC
	 BHWk4NbL5Qlg78W6/v7c1rOzL+pMTf5vqoSsu9HjHfW1sjwXRksSpYirOmdnTtBBOgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117492;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=x3HPh7lqZwfzrlQDbDfUTcuR+GTgGBnDDtped+TC/SA=;
	b=3MAC04i7Z0KH8EI8AF/SIESJndloDb3+/mcYpcuWh3tfBl64jFIqHlAAkuD1UJI5yh2e
	 U7Av1GGeO9vQnCCUgrRqqxVBSlwJJ8xicPiJnkYFwCi0xpg/Adrw/+fw+NO1qUQBl0aqV
	 A2jRXiOk5kfftgeUxVZmesFVS5JEC+YL6ZoKrsE8R/1wMiZt/GpJauUg41TW649DN8lYh
	 HnajQsEMuKTdykxiRg9U2CPj32VX00EvxXtp6Bgz9D7G3Mhr7Mb7l3YvExbiytqui5/XM
	 ALmICMBgvMNOPQ0A+bdKpsTAxq1Y/mnKD7IqqD4vv8HPywZh9KzafVNJqkZvaoLjeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fNAta/Mb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426B606A31A;
	Tue, 27 Oct 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNAta/Mb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E330D1F01825;
	Tue, 27 Oct 2026 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117492;
	bh=x3HPh7lqZwfzrlQDbDfUTcuR+GTgGBnDDtped+TC/SA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fNAta/MbP7FwHrqFoCDN0fTpTDWipTlOQKnZcTNtg3i6v1+km2tjAJcg1kpopgVxC
	 s2pL8M+1ccMqTs+ynQhLNiP0rzqwZLyCtbz3qlT7xvUw5nqqok/kPMjDJ389Qfu6GO
	 eD4QmfsTrkE/QVxmjemTNeDf7dorPx10B4mEmoaf13qm7KP91o39mRSe3JNOVUZI1Q
	 aUc3tYs9tTmBJDZxVe2m+5Gr+DRzObCasZCHG8wHBMiv8fzUsQOUwT8GonBN+S97jD
	 u9bFPtAvu+hTHGyxMImEg2ZBM1H/PlBrGwK2q1EjTQJ1YQLhrWAY98XgtXdpDx5KDu
	 oRwELeTg6fyuQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:23 +0100
Subject: [PATCH v5 1/7] dt-bindings: media: renesas,r9a09g057-ivc: Describe
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-1-51bbb43969c1@kernel.org>
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

