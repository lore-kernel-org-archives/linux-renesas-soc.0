Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883213;
	b=Pom9WlfPcU3exMDAdm8FlhAhkxPIEqUSXiRJpd73RdddWkSVEzw8owL6mp/D31oKyhu2
	 H8lXKkD+/itYQ9/wTyAFBHY0crNcHV8GAHxFbdIvphNqJ58h4B86RTX0qdDw2REHAXKY3
	 1vstb+7+8uWDrAoeyuPoZjnXJDmaMotsS58RhTEqBprcYv9dtT5CdzuaSNyhDwIn6OP/n
	 RCluxHflpN5jtyTddxfOba47By7Ah3b2Pujg8LlGmYTabAKJY4TDnIP6FFCw9KL8oolyn
	 RZ9Rxszb9Hd4VsNQrH04OhdiY3KCc2ZNCrfbdLkpY/SpqGlyINbHdDm8cqKp0pdHhbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883213;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=XoYeDm5KBIv0PazNt+/DynQ/CG37f6bGSVGk9hy49+U=;
	b=DHZaPA60fic8Hd0JmwlF8hJyviwa6BzWLL3AO05hBUi/uak7XMDUrV6BfCF7YnDQKNMG
	 PoSbZ6nQM+jxEfaOj+GcQJDv25tpNH+1Pi/fJGmZKaCV0xrVbPLwnWSz05AkZDRE6Bfy9
	 dulYfkW3syMoXqdmeYn5SyalcfdIyJx++Q1kqEnnHhRFWeYndi68jvBPbKSEHtlVKE3ZO
	 1ek3oD+0cnXdHKnflHruGL5EuGDIfzawspDRTcBJCSk889kof0LrrZc4ZPIYQKuTgmUYI
	 QWzmuwZeWAkWC7KFyGDvESN+S0rSHWgzkfzipUQ3BHMxY+0yOlT9kpFUGUUokH1gGkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PytszCYB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13964606D80B;
	Thu,  5 Nov 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PytszCYB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB321F000C1;
	Thu,  5 Nov 2026 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883212;
	bh=XoYeDm5KBIv0PazNt+/DynQ/CG37f6bGSVGk9hy49+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PytszCYB5GPOffNsa8KK91KDGJluSfVJQWtQ59HiZTPY4UTMyCADAfvLqPU4asiNd
	 MdpUUJj5iW7GqfzMf2JHsxuUMEcFy6Z2IlfoeOFmO6rEC3NyQ5zbVGu81km+Nf5ObR
	 +91E7tPbcGV56pP8pJQIrWG8HrsQPavRlauMreiJBVlxO2lepJh6fXhwMXPYk/f5AO
	 rS1OwKeKQqBoFZRwh48Z9bSWRuQqc2da9kK2XkKHTjn6e1AfqQwPhs63KUcaU/LUT5
	 bWMsRtOaAwUbB9o5MYbjTqTQBqX5UXtcqKHHONF1X+62P8Mu5hD1BhiEj/Ceofw2df
	 eo/Cf66W12/7w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:17 +0100
Subject: [PATCH v6 4/6] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
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
Message-Id: <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
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
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

From: Daniel Scally <dan.scally@ideasonboard.com>

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.4-rc1, place the nodes in address order, add the missing
 interrupts in binding order and name them. - Linus Walleij]

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..10e3434d0997 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1849,6 +1849,53 @@ queue3 {
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
+			interrupt-names = "isp_vvalid_ifp", "isp_vvalid_irp",
+					  "isp_int_fstop";
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
+			interrupt-names = "combined_interrupt",
+					  "fr_dma_writer_linetick_out",
+					  "fr_uv_dma_writer_linetick_out";
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
2.56.0

