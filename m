Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535E48F857;
	Mon, 12 Oct 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819575; cv=none; b=ibjidHxBvUjWxkFMwFw9NuPOS8ypviNSaQgRE1MM8XkIswLVgCMHjUcJZTJQhB5KFUjBaKFPbCEGhcMOWXr2nbpkOuC/EogmoNXVgvoTh6gsJ94OtwOqESaQAI6O/dE+LjvAeIuNBi8NM09ijkzwQ3Ozzj0DPKpfVUHdJqJmmCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819575; c=relaxed/simple;
	bh=JB6P37htQAxp0o5VRKwZO9e3oaBRNqfl++kkibGmllg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyhzDxq2wPtfmICNb+E2bgGWgHRRnBbZt/JZjywEaH9Cfx3vEQ5iOxXJR6UseTPsIRXpNagtY+eGLQkIhzLJJPl7Yygf0xhEGc+apEwc4KxxAYNl+neGXee7CIZWVkBfEhv3936L7FICHoKpxKg/kzMhZyE+movp56a3EmI1+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N2ZrvTzY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2ZrvTzY"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6F53230;
	Mon, 12 Oct 2026 17:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791819449;
	bh=JB6P37htQAxp0o5VRKwZO9e3oaBRNqfl++kkibGmllg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2ZrvTzY+XGMnjeKucIP/8PahFbg7Ji24FbOk0pwzAxyrmfVmSKrCF9xdG8Zy55A+
	 6hxNHdZJx7RGzrCDQGt34AAMm1wjDp3JBpWxLBTGcuKj7G7Je2KfErIxLPHmx+cEsG
	 4SNk7yw0zJ+UdkniBrgdOMmmvjerUqfArOAOLLF0=
Date: Mon, 12 Oct 2026 17:39:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Message-ID: <asz8oEtow_lrUU7K@zed>
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>

Hi Linus

On Mon, Oct 12, 2026 at 01:56:26PM +0200, Linus Walleij wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1, place the nodes in address order, add the missing
>  interrupts in binding order and name them. - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

How was this patch tested ?

I am rebasing my rz/v2h tree on v7.2 and I've backported this patch.

Unfortunately I don't get any frame from the camera, but rather the
system hangs in unrecoverable state

> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> index 639693d464a7..228155fa3c76 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1839,6 +1839,53 @@ queue3 {
>  			};
>  		};
>
> +		ivc: isp-input@16040000 {
> +			compatible = "renesas,r9a09g057-ivc";
> +			reg = <0 0x16040000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe4>,
> +				 <&cpg CPG_MOD 0xe5>;

Compared to Dan's original patch I was carrying my tree the first and
third ids of clock and reset properties in the ivc and isp nodes respectivelty
are swapped

This patch

--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1709,8 +1709,8 @@ ivc_out: endpoint {
                isp: isp@16080000 {
                        compatible = "arm,mali-c55";
                        reg = <0 0x16080000 0 0x80000>;
-                       clocks = <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe4>,
-                                <&cpg CPG_MOD 0xe2>;
+                       clocks = <&cpg CPG_MOD 0xe2>, <&cpg CPG_MOD 0xe4>,
+                                <&cpg CPG_MOD 0xe5>;
                        clock-names = "vclk", "aclk", "hclk";
                        interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
@@ -1719,7 +1719,7 @@ isp: isp@16080000 {
                                          "fr_dma_writer_linetick_out",
                                          "fr_uv_dma_writer_linetick_out";
                        power-domains = <&cpg>;
-                       resets = <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
+                       resets = <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
                        reset-names = "vresetn", "aresetn", "hresetn";
                        status = "disabled";

Fixes the issue for me

Why is this an issue it's not 100% clear to me.

The driver handles both reset and regulators with the bulk API which
does not guarantee ordering (and no ordering is specified in the
datasheet as far as I can tell). All clocks and resets names are used,
so the ordering shouldn't make much difference as far as I can tell.

I can't access the "additional documentation" from the Renesas website
where the clock/reset ids are reported. Could you please check ?


> +			clock-names = "reg", "axi", "isp";
> +			interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "isp_vvalid_ifp", "isp_vvalid_irp",
> +					  "isp_int_fstop";
> +			power-domains = <&cpg>;
> +			resets = <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
> +			reset-names = "reg", "axi", "isp";
> +			status = "disabled";
> +
> +			port {
> +				ivc_out: endpoint {
> +					remote-endpoint = <&isp_in>;
> +				};
> +			};
> +		};
> +
> +		isp: isp@16080000 {
> +			compatible = "arm,mali-c55";
> +			reg = <0 0x16080000 0 0x80000>;
> +			clocks = <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe4>,
> +				 <&cpg CPG_MOD 0xe2>;
> +			clock-names = "vclk", "aclk", "hclk";
> +			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "combined_interrupt",
> +					  "fr_dma_writer_linetick_out",
> +					  "fr_uv_dma_writer_linetick_out";
> +			power-domains = <&cpg>;
> +			resets = <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +			reset-names = "vresetn", "aresetn", "hresetn";
> +			status = "disabled";
> +
> +			port {
> +				isp_in: endpoint {
> +					remote-endpoint = <&ivc_out>;
> +				};
> +			};
> +		};
> +
>  		dsi: dsi@16430000 {
>  			compatible = "renesas,r9a09g057-mipi-dsi";
>  			reg = <0 0x16430000 0 0x20000>;
>
> --
> 2.56.0
>
