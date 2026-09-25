Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F774756CA;
	Fri, 25 Sep 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341012; cv=none; b=nSISq3vZVpYz1qKVR9Yfg2Z3+Iltj4/W9BZ6zZ4+g33bN5uUn/U6ZKZWchsZwlTDywIlbhPthcVXMyFlxtu3JNag/LJfxg2BhNZmYfNm3pEnMH7FCU95sAjltdKl/OS4m08X+0HhvG2894gXg7JWIoXPklyVPOIpczyugcFRMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341012; c=relaxed/simple;
	bh=AHSHaRam3VMD/yNqBolUcp4H09ueLegNu5acPLN9GTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUCgQu/C2AHH32dTtIibPLArX1SGIq7xHYkf2ow9q190UFZ64ot7ssqppW6NDoCDxp9EMiLClG92c93216lgedYJlaJj84sF9gstjeXTjxXqErvMqna8GnBlXY+HMR8oSGydOFoC2Vfo16z4rHVQ/oYzKkDIBxM5UUSO5L+eccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll1D5rD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll1D5rD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB721F000FF;
	Fri, 25 Sep 2026 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341011;
	bh=+GdK6pvcgWilvifm77f5f7Er+eZFy0j70nbF6Poz82E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ll1D5rD6d6nXh+zcDHfaae/Nn9ZH6FS9TuD/WlOqmJRjzTXSjFnNq0Y7Nzl+uenV+
	 VQvtFBChre6JQnUN8NBt7x2xJEN7Vamsam3rW/x78THHRKwtiGqR4BNqGK5bq6nIc3
	 zkWVpJJdzy9Mt6cEbZQ47a/VRNd4samK+rxbf/46gPBKilHxQUSAC3Fe9blEbXG6Q5
	 mxSenZp0xkNpM/T5HzTb0lbB5MVy9e+HXarGY7W2TfTxQoAjj1eZcf5ZQsarXee0Et
	 0m6QSjA0Bz7W0o+QM4c666aoFMUZvj8YXGZIet2BSqKttiXo/v0chAD9WFezB7TzPW
	 AS1DSqjQcpc3Q==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:56:35 +0200
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mali-c55-renesas-dts-v2-4-69f728a474a2@kernel.org>
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
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

