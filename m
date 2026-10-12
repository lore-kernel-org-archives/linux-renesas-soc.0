Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CA62D5408;
	Mon, 12 Oct 2026 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806206; cv=none; b=JrVbwmXyWv5C1yCjmNuzY5OKHzDBF/WoE09+EhsHFwdr3cuV1UDjGVtmZ8mIHAPkj1QuWvcOBdKZQP9KvNaOU+qLhVwConJNJIZb9oMZtpzkXc3obH/PXClF5emaY6qJnRHHyKAeIwTFkgJ5I7ITb/BleUERd68og7I90ql+NSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806206; c=relaxed/simple;
	bh=+DF1T2DEm/d9TtPUtly+jIdobEtqyYKzSFXcDXXxvqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfyLhbtmyDuhv/mJFmZalKzL1wytryFByVffNJcB7L7fu4K/kUqfvFSQmb8XqBaw2LwHSyXhuP8rNCpiBYc5PDHLu0k/ObjEHayjos2c4n2zV8phIASXxslKGoutkASipUceplHjqtf7SDU6kHfF4WdxCjvOSeiePVDt/1cItec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0W4nNrT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0W4nNrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EE41F0089B;
	Mon, 12 Oct 2026 11:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806204;
	bh=De7Tu6FxOS7xi2jGB8c/C9aLw4KNGGWoIqC/0XrX7VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P0W4nNrTJuQMdMuVjOD9A6ceJ+Wc5a3nw1birJsfwVOuUjahDoe96JuQKUdhIUv6v
	 JjakC1jYqgZa1g9UYcLEwPzZW6Eyy4DzhC69SWx6NWLjkiZrsGSbZe3wBc4HiB6v+y
	 sHpG5MEcvbYeqGmvl4w00hkIsqSXQWh+51vCiTYd3djihDXPCQLauTkdhXchmdpHCv
	 2PBVKRvJfQCX6NvnTN+cfukRhGWbopXERealwTQVzfW9Qn3l6P86g2myKMfTFlCffD
	 +ZpUil/rOwglAOiIqkJa5B3W5uSiMy7hTtUNetqFcrSj601dLhe8NNJQ58JYKuxQfX
	 YfbYn9KZ927uA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 13:56:26 +0200
Subject: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
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

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1, place the nodes in address order, add the missing
 interrupts in binding order and name them. - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..228155fa3c76 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1839,6 +1839,53 @@ queue3 {
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

