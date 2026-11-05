Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883210;
	b=4YngOeDRqpWV4wCfVj1UHxScSb7BjpQHefi3QlruznF50ttArrmA508QIDHC5DzBO7FQ
	 nmTkuA2gz8EJdxDH19vJcmvzt52DBDMyeP0MZ/UDfQ5mE2vARvypu5pZQKkSefs+sF1kH
	 l4st+mG5surDNWlJhxkys9PaJzoiwirm7J+bR67siintyAwCEax0XC+bUTzk6TswKYGHl
	 tNYI6YU76QMaXlALg3YmjQd4bZRD2VHN7Y+8AoohUpSV/cd+kj2FpwN5Q0cOeN8YeY2JI
	 9PCO10uOLkUhKvY5kLOmCljd0UzccXjckIXoShkBhcgjTETG3EcMzdPrlORKmekkVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883210;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ZVUCPwHHqquAX4riYI7aUJpMUERzj3gnewG2MouTRJk=;
	b=Dsa8O9kRY2EHjX/pC8zPhnVVX5iSHxYx7IFd9btxVlDR45xSXH3pc2PRPEaGWw9mjfHJ
	 GfT62/X5sB+AdoRauFOMR6epWio02qONuxyb8bzZeKZQFHLuNNX9s9jB9Mjm5QlTM88hm
	 XHv9FPvjoq4SxJuiu0k9hceQntkpHMHZBNyGXSljoQDYlDPuFeGkZobqM546wpUgFSCpW
	 FLbYkhyohSOQZOJgwbDRUc6pc9bVKLZrorgbIUnLA/ZA5ZYMlx9RziZjrCykIQEg5xE0y
	 U0Jk/LqrWMiS70j8j/vwuX6iofkknnBORqkgcA2nl4dnfyfKRcIxCKksnw+Bp7s9Jrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjRcz+P6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6A606EE84;
	Thu,  5 Nov 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjRcz+P6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0789A1F00A02;
	Thu,  5 Nov 2026 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883209;
	bh=ZVUCPwHHqquAX4riYI7aUJpMUERzj3gnewG2MouTRJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZjRcz+P67FdctAB/sQ4WyhSCxt511G1VMyBHf2sUxEUf5ehCeSHHpB23K6TU7CU6D
	 QNxo7TBbU3btX/3PztovK8x/VO3CnnRxUNH77tIGFI915VWsnynB285beWOHhO/7Tj
	 uS9b9vYqcTnoNPbX7mrOECMKuzhFH5EbNnUk+V/FEuAQtRHU6WKdPAjXdbUQzRqQ7j
	 vfBIyX9QJvbqsvr80Td6OmPBvr0iDUQmQt7ikRkzCYq1HVLRYsSpaoFz2fE+Iuyj0r
	 8e0fT6u1bLIFE50A+Efjy90FLTVaKMzRRdDIDu3k2ZDFC7QJlm/wYJWI+vQO3MnREm
	 XgR/yf9IeXkqw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:16 +0100
Subject: [PATCH v6 3/6] dt-bindings: media: arm,mali-c55: Add power domain
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
Message-Id: <20261105-mali-c55-renesas-dts-v6-3-7dff41bf7107@kernel.org>
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

Some Mali-C55 integrations place the ISP in a power domain. In
particular, RZ/V2H uses the CPG domain to manage its module clocks
through runtime PM.

Allow a single power domain and describe it in the example. Keep the
property optional for integrations that do not expose a power domain.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index 0a2a7720ef94..ad1afae93f45 100644
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

