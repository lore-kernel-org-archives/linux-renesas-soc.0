Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B63D0C07;
	Mon, 28 Sep 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598127; cv=none; b=StjuvybNQQJy7BFPJTmUEn4npNkK7BWYFPAVS+5yCoE/+7v/YkSP+qDDZraJv3gYGZRhKKS4+6spdHqUXiwGwMSr4w2Tk0id6FCXR0o3HmPncTZsb/ULv6rpBYT1GeKiwtWmC30/CNOmDb4Ofsz7JuyyYut164+hadKjnDOZPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598127; c=relaxed/simple;
	bh=3UuA6EpYakcwjud16uhyoeqJAnKwBtARKq9fP/W9gAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0goSDWndohbMAlr+vsNEVTYGJyOgbJupxH3+BSnN43E+tl4S/7Uk5iTq7ci6t05qGefrAvHPEnU58mmcMT42tt9a3UqukLUmTq8KYUbxkKk/kqAKURBD+71M3kFHZRAjqyBtWpM4oorFhplfSvAwurzQBruBaO5jxOpoutMjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W56N6hFe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W56N6hFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB481F00893;
	Mon, 28 Sep 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598124;
	bh=AHBgWJEPbRdGhTFQGOm3Zm/n0/pXFVKqYaK0VLgEIZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W56N6hFeFhHVyQ0tuflGqcl9Rgk9+AMciApHAlg+BsqhcZ8fH+z42NbG6CcGtQ+JZ
	 yX34PqNpx8Q5ecY3JZjEjpIIfubW3bMicVc3eWi5p0eGXrAO4uBBxwVFqEaymgxi86
	 GpfveN47bSzv6+RtPGTtPUfs1HdQmh+aEWy1Vt1xVDSeLPQ7m0aSr8DaC0yA6EiSL6
	 NWGvVLZZNUOeXdEBg19/nKYyuY4W0/92cN8jeSveGoBR0F6NqO39eImeIIiY31UJC9
	 HjBsS2twj38e4C2fLn4X1Wnkh2KykXgJCqShCgkBDv3EbnQIUA/nq/Bwmby2LyJ9BB
	 x/xHAj8CxlWTg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 14:21:49 +0200
Subject: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
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

Some Mali-C55 integrations place the ISP in a power domain. In
particular, RZ/V2H uses the CPG domain to manage its module clocks
through runtime PM.

Allow a single power domain and describe it in the example. Keep the
property optional for integrations that do not expose a power domain.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index 8fcc46660b75..3a11d3f8488a 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -36,6 +36,9 @@ properties:
       - const: aclk
       - const: hclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     items:
       - description: vclk domain reset
@@ -77,6 +80,7 @@ examples:
       reg = <0x400000 0x200000>;
       clocks = <&clk 0>, <&clk 1>, <&clk 2>;
       clock-names = "vclk", "aclk", "hclk";
+      power-domains = <&power>;
       resets = <&resets 0>, <&resets 1>, <&resets 2>;
       reset-names = "vresetn", "aresetn", "hresetn";
       /* Example interrupt numbers. */

-- 
2.55.0

