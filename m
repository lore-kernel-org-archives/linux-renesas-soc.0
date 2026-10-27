Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117505;
	b=0yMqq1DjsrG0lTOij0QJhMfXde6dptIu/q5Yfh8bnCvlk4PihFXEZF0u9eNlLgUalmzq
	 UcL9vUTq+5/FxVEPr1bOEk3Av3ovQB3Uc6U6jF28yoY5U8TDaT9UFSryTl+TuQBXZLAnE
	 9/K5AScdcEex3mG6GP74gViMYZfG7L62QF7nII5C5CaSij9bDg9ByLY9OYTKveFV+gJtO
	 lqQFyZ31G0N0i/oo3kcbcfbU7bQt38BKX0y7OMpvfyjdV1kc302X/QSeBh4SaBxL5+oF4
	 K8IsiCwzqzkPTqyX8mTAENc0KN2gejqlxTCf18mTETcwENtsmtPknjMAwPMCStYx1Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117505;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=eCGm1F4SLPqeaXtlZ2bExvdoUVQeXMyO/NnRR8oI5bY=;
	b=BC9ExiqSfLfH7HWVkqg1TV4upRLJ/EbXxIKIYm/mNSgwE2bx7vxidt7obnzdcV/zmzKr
	 1mc+L9wVbroWfg2K7w5a1nHaa/MeBuU19hEUTmManHU6PUFrswpekHrrXfbLP4XObQASt
	 wBsIdKcCjUb//Lb2M9RldJXUiMpNQ3UO5fBlZROc7HrGW90MNDtgZaKQgtRlSff5KG9DV
	 89RjQ12JXrZTA64zTbMIsUSWSXHK5Uda2k777NcneFnIobBCNId0qR7PQAvWwevKCYoS4
	 dDMOihHkqAxHHwUDCgPa6nY4qfEn4jWnAwKQNNB2YDqwRES9WLSaktPeEh9zPK0qDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+Wgat+u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A7606A331;
	Tue, 27 Oct 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+Wgat+u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F4E1F01825;
	Tue, 27 Oct 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117504;
	bh=eCGm1F4SLPqeaXtlZ2bExvdoUVQeXMyO/NnRR8oI5bY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G+Wgat+uQmjuzpA2Sse+5iXkBPhr4u3ptyRqBE2TSYPTAIffDnMs4ffZzn4pZpTVr
	 SNlauc5q+C/ittsXIoZzAjQII2jYj1ejeMsOyTawUPZ9lo5nExcjRbB6lIcbAJVv83
	 m45dl8UBvx3M5OyL+/PdsdSrUvlZ1SOmOhxFVIyObRkMTMWr0HOBMCm+EzIdbsJRMD
	 ZmJZGFwRRVsytEjiIaLVIQzJtJg9WO+EiVdj+YXZevHiXn4A1RvbReGWTWgJk56ijJ
	 oqXGC3ALr4EhPeKK0shaww9we41U3cKnP27lZDz+JE+X/tpBt8l6QIYDRZHpvA0HE3
	 mW2FY/ZIendHA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:27 +0100
Subject: [PATCH v5 5/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-5-51bbb43969c1@kernel.org>
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
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

From: Daniel Scally <dan.scally@ideasonboard.com>

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1 and sort the board overrides by label.
 - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 637fc92dcc26..74b75be599ae 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -305,6 +305,14 @@ versa3: clock-generator@69 {
 	};
 };
 
+&isp {
+	status = "okay";
+};
+
+&ivc {
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640";

-- 
2.56.0

