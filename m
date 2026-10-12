Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3E3B5303;
	Mon, 12 Oct 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806202; cv=none; b=Swefnm/GUlAMAGxKJvSO7WZtZCJkwFjarE3Gg2k1TQvwwKpL/I0QqlBlYTMu/JQhufOhn1xFcF6BQ00TCGSLgQiY7hKa59TpPtAYGrHKNdmN0SVne9JcikeW1umGblR9OcpGBLNyCoG+mccrGG/98W9wLiLvEWtmb6tiNtk/daE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806202; c=relaxed/simple;
	bh=SaAJQ/j4CMStWxSTTiAQmiWqLEWMlRxSeVHTZ9f9kLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=av8KHn6IY1ZHaAnzxRcMwZiN3B9FJ12BWAyurCeIR2kOG3+T5Qz0yapFDVt3DcSaZpn2w3amqMhcUVYxBCvOAcjgqVCev+9a31T6NCTliM5mIjhU9l4jBxM1hu+2dJkP4Fb9ZEAo/Lao37lil3FE6Un/dhuJYOzzmFe3hOHCTxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZ8Rx5R0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZ8Rx5R0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B987B1F0089C;
	Mon, 12 Oct 2026 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806201;
	bh=KYl9/JqaDmytdfZMhITo0WTSRmxf4AyH33viMeBwxRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mZ8Rx5R05gQ5rFtyNTw86gMvqdK6Zvp6bD+u9kbXzWToPLinPF24L145PNG/9BYLb
	 TaVRldCE4rYVkD5FDSJbPKwz4T0OAbBbFk2QUI8aeQZBxQFOLwAda3liRxybmtjIrO
	 95+/55ummUdm3XTBQD/qo2N7KIQEcBbfisZKhSR25U5uftNrLNeLgWGG+XifmEkqi7
	 kzqxqtseNxmVmL4qfV6lAEG9ThRbjD+wObe+3O/zusA62ez9tXXbpOKR7Icz7cB54r
	 glV0Gffi/gE/Tde1L+zVyhx1b6KgOnzOy4ZwSMNRzwWi23EJBEMjSv5JdeP9n+i+E9
	 DM98uBuqd81bg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 13:56:25 +0200
Subject: [PATCH v4 3/5] dt-bindings: media: arm,mali-c55: Add power domain
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mali-c55-renesas-dts-v4-3-c410e280bf2d@kernel.org>
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

Some Mali-C55 integrations place the ISP in a power domain. In
particular, RZ/V2H uses the CPG domain to manage its module clocks
through runtime PM.

Allow a single power domain and describe it in the example. Keep the
property optional for integrations that do not expose a power domain.

Assisted-by: LLM
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index d04105cd1ecc..23b53faec73d 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -46,6 +46,9 @@ properties:
       - const: aclk
       - const: hclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     items:
       - description: vclk domain reset
@@ -87,6 +90,7 @@ examples:
       reg = <0x400000 0x200000>;
       clocks = <&clk 0>, <&clk 1>, <&clk 2>;
       clock-names = "vclk", "aclk", "hclk";
+      power-domains = <&power>;
       resets = <&resets 0>, <&resets 1>, <&resets 2>;
       reset-names = "vresetn", "aresetn", "hresetn";
       /* RZ/V2H interrupt numbers. */

-- 
2.56.0

