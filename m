Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929ED3A0E8D;
	Mon, 28 Sep 2026 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598132; cv=none; b=R8bKEiJA+Cr5jAdU41C0fYTTz1Xy7hYWspItw+rxhjqYFXq1F7y0W6j2YhiP2hvcD5jsBkbnbUQloXbP+qHa3sQghxzYT3gGIH2hjY4X/OIkgJ6UQcioDjQ4OwJt4MI6dDT5l/xOWD54G0lNxUWXU4F2LAqo9M2kEZavfYi3uxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598132; c=relaxed/simple;
	bh=3DwmRUhQQr/YbBDHh+GPFmvRHh98tafvnmYVV1Q0TRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uADgr0B/VPlZ6FZQwHYIHiy3Vluh81m75fs4Zo32eqChuTbFnf88j+Jizmo2/mUHbm+NF5m5R/KJpi990fPulINu8RpEBe25dD0IlWKgC+Xyknpvq66onzdUOseKF7DCjUqoXJfbtECLT6V7FAbwUK/EbLhNeL62wsT3Ud4AVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l07ZCjGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l07ZCjGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811E81F000FF;
	Mon, 28 Sep 2026 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598131;
	bh=Gc0d3VqawgZPrscF7k4XqvdsBtB80H6rkMLTm676Zoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l07ZCjGaGEKZ92Cw3Fsl+NRHriG8qyzRksgDQpJO1ek3BUu2E9qeaWemsxXGFJ32L
	 RVzbOBdNoWafD9dO6n+FBrXveAej6KV7aNLmlC5bgICF5lZzYrzGuxfqDlSTEkZvA5
	 j/+440xXoQ+1IX7/dTrJ9gUGHUZBJ3gYlgEZJQeakP6gp1cUrZJIO47IhpnPPufyw6
	 G30+Fr/dPTF/pgSmzRCnRJtT9vDUiJ/YZsohSWriw8QbFHoKIeWwFLkAWu94qImJe8
	 TD7Mpa9Q3gcmgGu+Jp0tA2M0XyOtlttn6bq19+I1RKN/Pqcka6tDXbe8RGLN7wO0Vl
	 iCGmL3G93XMBQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 14:21:51 +0200
Subject: [PATCH v3 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
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
2.55.0

