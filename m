Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72118343D8A;
	Mon, 12 Oct 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806210; cv=none; b=N4g1IT1t6qltEo43fe84NbL5Pf9xjDOnlcTX3UlzqEUUuUsdlOc5AKKUWZU1tS7dJ4pyITt8mVqM1j0Wn3IvYiqq2yglXjmS1WsLrs8SlLd+oAvMlhcOFbk06qIEfvXL8v48Hl1C1DFWGofoGcfWVZE5omStkmLwu5uu7ZmVIIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806210; c=relaxed/simple;
	bh=yb3ZwIvQAG+OUQLTF7/fDhsERkV6Gw8LesyFWW+8a0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQxPWi7hrVra/4BnJsbIDYzmyM5Y2u4XAbla3uGnRAwdrSRJ68NLtbQy4LfRXn4AAsQMhJzLCCDMrSB24vU5Rm5r/ZvemdFNZ29YN6iT77P26S+2DrQao3jFxinc6W+J/NOUgHrbrN04f4Iun4ZS2AhZn0xZgZ55/au6AduoAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAgtRyjZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAgtRyjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB111F0089C;
	Mon, 12 Oct 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806208;
	bh=eCGm1F4SLPqeaXtlZ2bExvdoUVQeXMyO/NnRR8oI5bY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fAgtRyjZ4oXWw0JxXjFmq9RD8yhJmGr7k2b83F3BE/fUVEr1N9gtYhKvi5tKuDNvj
	 TEksnviOl0f6zpaXgVdqmDOU4kW3JEx9ov2Mp/r5VH0hQsGHhvlNxDA93thYsHN64Q
	 E3F+4lZbZtc/2wiYpzma0pAo1Selg/9ygwVTkkjJd0MZeeRAP7WY68lqTgFwJTyqFn
	 eu10zfgagdBEmaR47fxDcz2EfNHhg8a1ID0YCEsUN/8ReCWGzUxZmbE8HdXCGRIYkh
	 ay6JHtUqdFfSATvmiVZht281uF/2aytz2OhDlt/o3lDUOeLDJ0KiYICJa6tEBuXTCt
	 Qyicf3lAa0V0w==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 13:56:27 +0200
Subject: [PATCH v4 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mali-c55-renesas-dts-v4-5-c410e280bf2d@kernel.org>
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

