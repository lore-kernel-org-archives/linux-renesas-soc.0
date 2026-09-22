Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3275655C1C2;
	Tue, 22 Sep 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084051; cv=none; b=F5KauRzftTocSSJ64pZViE3MsGEyzTl48mjelbZfMWiX1Uwshk4rwo5GKo6RVqOH9IjWTI0iUtkSyhWCJVH+T7JzOWQ+PVGIVxBDL0m1TyYQ0ODjUcAWcxK9f65oFA/i8W6+88qHisqnEUlvYFONexmizxcMDo8xnj20g7imnRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084051; c=relaxed/simple;
	bh=9PASmedYE30VNgrBowwT4Yu9YyaFRLuOcYf71lILzYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0Mm5M/XT/rrkEuIyuz1KHCC7rf7kFCfDNqjWAP4a093FJ5O6Q5i0r6l2iIfxVfC72z1AWkFankf0+RDx7K8Ugs1JNtWn3A262pUXJrqo7IgrEr0iGYrkhjQJokvrZTgCMDMaysDdUG225BHGTlPe0K4J4UuKRjqY0uOejn4u9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSr3+o9C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSr3+o9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC491F00899;
	Tue, 22 Sep 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084048;
	bh=rbhnIX0LPgAXdQzxD3mczZeY/HFs3iKi7JECXxezbkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KSr3+o9CspX4V96LrzeFak2AXcrzj4Pu6unetSfSxwNP2EgsI3PUCuli4cF8KA+5E
	 k7CzRR9FLQ46foTWcduGz2O6VxyZHaU0LyWgTfrJIDQk9smjqMysXRAMtmp/s31pBx
	 o6olwU16qK/y+v+tM3+IyuzZN+q2S7DTjyITRMVVXoygwpX5tnLe6vptHQmaz5ZUDW
	 zFqWJRYkvhfyC7Q26v2b+wRb/6QIhyBZAPL1ukLTwJJFF7qzXBwdHbrTDOS6rXb5wO
	 /1O3Hz8bvPd9jw2Q3LOXeQnSlc2bFS/v4fuCIFwn0GJEvlAgbyiOg/BLvE45D0tDuI
	 Gg94boNpqEGgg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 15:34:00 +0200
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

From: Daniel Scally <dan.scally@ideasonboard.com>

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1, place the nodes in address order, and sort
 the interrupt properties. - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..beba6c053a40 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1839,6 +1839,58 @@ queue3 {
 			};
 		};
 
+		ivc: isp-input@16040000 {
+			compatible = "renesas,r9a09g057-ivc";
+			reg = <0 0x16040000 0 0x230>;
+
+			clocks = <&cpg CPG_MOD 0xe3>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "reg", "axi", "isp";
+
+			interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&cpg>;
+
+			resets = <&cpg 0xd4>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "reg", "axi", "isp";
+
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
+			reg = <0 0x16080000 0 0x200000>;
+
+			clocks = <&cpg CPG_MOD 0xe2>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "vclk", "aclk", "hclk";
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&cpg 0xd2>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "vresetn", "aresetn", "hresetn";
+
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

