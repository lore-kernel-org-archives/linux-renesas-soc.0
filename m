Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F282D49B219;
	Fri, 25 Sep 2026 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341009; cv=none; b=GSnTbVRVeTRGHuXDYxak9gh3yfT6ilqTPqzxnmEnqOuIJFZN2G9Si4AcMQ7/dYi4crEmz8TkJuA5ITsrBmu3IggjaN/DW9QuNK8dYPphkTub2qahWjz4MD4YOE8bFbX2WzxSCaMU2JbtupQQCGf7ZYrtxOjDgVO6nK2T09Tt+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341009; c=relaxed/simple;
	bh=1LPmTa+QjvOrc3bl54mN1ub1ueKR2RiKq2Fn/Qlx6/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDCYMyxjRDfgcyAO1kWIePJgNH9Mm/dYHF3PqSI3bhSVBo/y0SHG3YIwD8LIGDR4cUOmS3GrvHIjBHGJisxITYKsO6yI2zMvIU3zLU6cLRZw6vnRz+XAjM5AaTzOb2zN60kcNQdXQaavzU9Za2NhjTJwzDhy3a/85OsRKyezz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmEhbqfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmEhbqfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D881F00893;
	Fri, 25 Sep 2026 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341007;
	bh=VJKeF9M30Hw5i2+ptZcJVNHqtSnesvCv9ZmYT7CYUn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lmEhbqfhdAudfU9Uz0X9q84A2d8RkikSCnZ1nqSRHPEzB4reqOGZnGZUiODJfJN2d
	 HdFuzze9xqjP7UkUujAEoGZPTC250oIvOeevqFdu1+azj3PcrQvL3lYxqcdC8j4h3V
	 WH83tjXtnZpezQBpMymyc3k1PkUeJyX1s00RAtCFpVBozY2/ubQsdEFTSKwvn3C0I+
	 uG47smEKOd8qMp+ZUnfi/UMwf2aFaIVbjBam8bk8tGsnpbCsMKEEXU6eeosle1Q+Yn
	 /vTGFdXaBZq74SI/vvySTSfAndxmqwARVm/f+3EBn6+wkW0QWwafa2rLTnqJC6IYar
	 z4zRD2b1Lgc2A==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:56:34 +0200
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mali-c55-renesas-dts-v2-3-69f728a474a2@kernel.org>
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

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1, place the nodes in address order, add the
 missing interrupt and sort them. - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..f04180c35866 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1839,6 +1839,47 @@ queue3 {
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
+			clocks = <&cpg CPG_MOD 0xe2>, <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "vclk", "aclk", "hclk";
+			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
+			resets = <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
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

