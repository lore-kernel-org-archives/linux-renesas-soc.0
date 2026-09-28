Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6C381E86;
	Mon, 28 Sep 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598129; cv=none; b=MbuHQjdEFb+vWGYexaz2hpeSlUvxkM2cC5M4w06jz/x9K5iFKPCtQCdUcAJWBPcrrgbPSDpQJOGVoxuTm33T40MApkMYnVUxvoKNUxhzbc5j5pAQhw8LnBkYl5qLkwaFzCZ2tKalB+t2/yE95MGnEjDXDheE3DAduif4FX8pcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598129; c=relaxed/simple;
	bh=yZNUzEpS2/DrGC97np4vQ0HD+EYSTrHWjWVQZph3feM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onr4Lv5i9g4Tus4krnbPOneyDKhlJ8vc2jC21udY8oxigRzQVo7rtHDomOk0pPhiSFVEAMkRYMHjbN7zl64Nv2uEa0NpGS+Oq07fX9i28MdtkU2urfNrRNPlrnw9rE0cOk/pcqeWpIBmlVT0FAZ4sF6dUDJIGiuSVupXBHYoBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Og8IeBQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Og8IeBQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552381F00898;
	Mon, 28 Sep 2026 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598128;
	bh=oU3/g5xBkfnAGcyW4LrGMFqtPn0VmmmtZoP29ows5HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Og8IeBQtInjyw/E1bRI76/6nNTNAtaWvhxpuWZ07Pm2wjwA/Xil1ppu/rqcnBgY6G
	 jMYtsA7N89hmA4iZz97CuWUCtAsREq76x+JpOf/eQzPp5MJsmDju8RkULB+/jnadmY
	 uXxUuJljCcvHbmBqObCzaYt17nzDiaEbSqYGK0C8u/PCp2UM1vFK1XsUVSKe0KggSR
	 vYeNBse0YXZVw3A5CUePdTaS/ntNj4MdL6jZJv8Kje6oRpOSK8M+hkPFZGcOx737sX
	 0p1ErB9l3a7Jc2zq+ypVK5/abE2Kt6CgBK/qmfojXgKQ303ROWsQixYYXWun26MVPN
	 YzSOGOSsB4G+A==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 14:21:50 +0200
Subject: [PATCH v3 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-mali-c55-renesas-dts-v3-4-2cf7eb746ebb@kernel.org>
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

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1, place the nodes in address order, add the
 missing interrupt and sort them. - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..219ba058c9f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1839,6 +1839,48 @@ queue3 {
 			};
 		};
 
+		ivc: isp-input@16040000 {
+			compatible = "renesas,r9a09g057-ivc";
+			reg = <0 0x16040000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "reg", "axi", "isp";
+			interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
+			reset-names = "reg", "axi", "isp";
+			status = "disabled";
+
+			port {
+				ivc_out: endpoint {
+					remote-endpoint = <&isp_in>;
+				};
+			};
+		};
+
+		isp: isp@16080000 {
+			compatible = "arm,mali-c55";
+			reg = <0 0x16080000 0 0x80000>;
+			clocks = <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe2>;
+			clock-names = "vclk", "aclk", "hclk";
+			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
+			reset-names = "vresetn", "aresetn", "hresetn";
+			status = "disabled";
+
+			port {
+				isp_in: endpoint {
+					remote-endpoint = <&ivc_out>;
+				};
+			};
+		};
+
 		dsi: dsi@16430000 {
 			compatible = "renesas,r9a09g057-mipi-dsi";
 			reg = <0 0x16430000 0 0x20000>;

-- 
2.55.0

