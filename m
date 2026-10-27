Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117502;
	b=MKpEmeKLv354VDzhXdanlEFAkzxRSozQvpQxuSkS7R9PCHFOs77e/qWt5lk2VHev8/1u
	 f4OW2O4k3tttkVKRw4W7rcoxfUu5yCKVggK6+0hmArTq/lr5LVlh4TfgIpnby97BvDxje
	 GtHxWIHa0EDcTil7kZigbc5JZQDIrh+J0KgXwmBzb6nSRtn9VD3puWDx7VH3swZQHrooD
	 rj4LiyhsTZ/C8zKYM/cpUg9vuwXDHsjPuPiqtZdp8UHycqRsD7J2YJsrCHfW5mDZP+jPa
	 s7cdPEFJ7ax1wiALCKQSTZw3G9gaMBG8ogtOulLlZC4e/nBO5Eh4eAO+rzocKIjd3hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117502;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=De7Tu6FxOS7xi2jGB8c/C9aLw4KNGGWoIqC/0XrX7VA=;
	b=DgG6WRNA6sV86YCb0i8zTXGs8vMuOsM62TkvrJWfEFR/dLKVw+FXOzclSEQwdDxqGIS/
	 uZ39nfPfd1kMBelSIUG47mY+1bj3jjf9CTpAJbnVMYzXJN9/J0JO6+fh+SVORKZtGCUj8
	 woYbwiSAv+839npavXfFitDIReF0F3965abzbypeQw5CivWjNSibzhNWkvz4QavAbyVla
	 EJEQIWE/fk/AP7JIdvsdFj/eFbbGj0AfNElhS7qcaCBp3QAEQx1Wy1AjwyVuEgPJaH9xL
	 VH34XQXey+gTqJRwyGb8SXXCDLyZGMSdf5NIqpAcGW5yLUfBemj0Bq9YIwZ2SK0omug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1P7r7TR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5088606A325;
	Tue, 27 Oct 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G1P7r7TR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7031F031E5;
	Tue, 27 Oct 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117501;
	bh=De7Tu6FxOS7xi2jGB8c/C9aLw4KNGGWoIqC/0XrX7VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G1P7r7TRtGrkdknTomFdeVVPRRG2xDQ9WxRh5vkGS4KeXakI6DVwDLadnbsfr1sNH
	 iqalKRkCyKZKyJiH/qP+IZU6K2cC55t2zRb2iLnopnhDCX6XSx/m2RzVrbNL8Ply8C
	 MkgNOXxwyQ/m9D9ag32zkn+eYw3JYVfmxQqTl+Zez+iqsBtxsf7ZK2FNmVpTp04zYm
	 QHfZr5PVioZUsrCQgmaThNJyLdQJE4fcb+z+IcZzoS5yVDug4ItnW4gnIyEZDX7KW5
	 6QzRrBhYNFhxPwVYDHme7ZcOnM1XTf4xP4Q7jcK6X2m+3dwSQNS4VE8tehRW9Hby/U
	 ncXzMIY4GQ2JQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 17:11:26 +0100
Subject: [PATCH v5 4/7] arm64: dts: renesas: r9a09g057: Add IVC and ISP
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
Message-Id: <20261027-mali-c55-renesas-dts-v5-4-51bbb43969c1@kernel.org>
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

