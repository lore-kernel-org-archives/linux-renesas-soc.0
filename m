Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50639 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbeHVOhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 10:37:19 -0400
Date: Wed, 22 Aug 2018 13:12:47 +0200
From: Simon Horman <horms@verge.net.au>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a77965: Add HSCIF0 device
 node
Message-ID: <20180822111247.qwqypumngefqmwmv@verge.net.au>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-6-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180812133149.7710-6-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 12, 2018 at 03:31:48PM +0200, Eugeniu Rosca wrote:
> Fix below DTC error:
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:36.1-8 Label or path hscif0 not found
> 
> The DTC error occurs *after* the addition of r8a77965-m3nulcb-kf.dts.
> Fix it beforehand.
> 
> Inspired from v4.12-rc1 commits:
>  - commit 68cd16107260 ("arm64: dts: r8a7796 dtsi: Add all HSCIF nodes")
>  - commit 6d50bb893504 ("arm64: dts: r8a7796: Enable HSCIF DMA")
>  - commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> Changes in v2:
>  - Slightly improved the commit description.
>  - Note that this commit could be replaced by
>    https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=b8e3c8e17611

That commit has been accepted for upstream so it should be used.

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 4da479d3c226..d04a8b671cc2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -451,6 +451,24 @@
>  			status = "disabled";
>  		};
>  
> +		hscif0: serial@e6540000 {
> +			compatible = "renesas,hscif-r8a77965",
> +				     "renesas,rcar-gen3-hscif",
> +				     "renesas,hscif";
> +			reg = <0 0xe6540000 0 0x60>;
> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 520>,
> +				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
> +				 <&scif_clk>;
> +			clock-names = "fck", "brg_int", "scif_clk";
> +			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
> +			       <&dmac2 0x31>, <&dmac2 0x30>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 520>;
> +			status = "disabled";
> +		};
> +
>  		hsusb: usb@e6590000 {
>  			compatible = "renesas,usbhs-r8a7796",
>  				     "renesas,rcar-gen3-usbhs";
> -- 
> 2.18.0
> 
