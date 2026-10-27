Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117499;
	b=EAJLxOXR8d6wb6VUhOFbduzi1fWn4aFku9SnFV399hkABw7V9e4YS0QKkXpr3PxnQxgP
	 nUSxcDqR1gKGTcI+eVc9+V1dV+5btcdHzVQNlmLAOJ2AJu6LP0buca300MM+yjxZ3QYpw
	 p13ZQ0QWUjZSyw2h2QuhZZ2uhotqlcSgW4TSVV94sarddMtsG+kcCkOt+GqZjmPXBubRy
	 syuDaAcXZinzy8W6+7u8Tg7/mrpgmk/O9GgKQTP83Vv3Oy+UvufaOMu700/awyJmdF+9P
	 5dNLNFM6g5r50/1ZgdP3LzEAV2LTFzUS6lqIWClELqnR4Jz7KBeJC03sGSJmkaNVxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117499;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=KYl9/JqaDmytdfZMhITo0WTSRmxf4AyH33viMeBwxRs=;
	b=JRH2sgPnmSuP3M+WViZm31BoXr1hb6iikUE7clfV9xxhu6U2xmg3+qU1dldZpWyy5m1F
	 RD6eTwY2zh47jd5461vkwuhwZQ+5/69u+HPqllWvdVNmhLnCZ3dwnKlr2OxbQ7C7CndCV
	 ZZ6fFvCQ/abjUnwg4BK0cn/fm0bv7gWCbQnLZpzuLREPgszriHldgtWttajfevElX8szA
	 WrKbEhWzVYsVpgV90Vj8/9dT68KQx2CgZlRDN/VkAzCF9v7bEQWsYQ9mh0182zYWMSeZu
	 4kwT1UZVmiHJiQ751Nfcm+OCSzZxNeinvwOhBdqyNqFjPsqOXubmT3/pC/QTKLP1c8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJf45TiM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634F606A321;
	Tue, 27 Oct 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJf45TiM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E051F01825;
	Tue, 27 Oct 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117498;
	bh=KYl9/JqaDmytdfZMhITo0WTSRmxf4AyH33viMeBwxRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aJf45TiME1jVeDPmJep+lZE7ypTqPNLjXZGBopCJ1aYc3jtee0ox3V2zeuso1IAX3
	 Zd4S62wIX74RaWrss9KYNblpsDA79aUOUMdl2D+K3nMRBg7PVrtDkGy3AHOKXsCE/o
	 q5KCKy0223WPsdM/IitUrBEcHsKgBB/8LHXXlwO1lelg19T3uQX0LEZ1HSih+5BuLB
	 1Z6XOyiNeIso1vjSJUB4g2eFAi30CfhsZJVYHOzg4b1uRPRLKGbpI6Fl1SIDuF3GgR
	 Szg+BR3RdMwpRGSeF0OoFpvurYasDNVVBDsoOtXkEEb1fwaY2H4tmAEHYcDzp7lZdl
	 Yh68xDZxnZsEQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:25 +0100
Subject: [PATCH v5 3/7] dt-bindings: media: arm,mali-c55: Add power domain
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-3-51bbb43969c1@kernel.org>
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

