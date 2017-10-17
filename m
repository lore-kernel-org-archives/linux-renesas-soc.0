Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42025 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759168AbdJQH5x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 03:57:53 -0400
Date: Tue, 17 Oct 2017 09:57:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 2/4] ARM: dts: iwg22d: Add /dev/ttySC5 support
Message-ID: <20171017075747.hftrfirrzu3ihesp@verge.net.au>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507899796-7941-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Please include some text in the changelog, ideally describing the
motivation (why not what) for this patch.


On Fri, Oct 13, 2017 at 02:03:14PM +0100, Fabrizio Castro wrote:
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> index edda4f1..5d5bb2f 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -17,6 +17,7 @@
>  
>  	aliases {
>  		serial3 = &scif4;
> +		serial5 = &hscif1;
>  		ethernet0 = &avb;
>  	};
>  
> @@ -39,7 +40,20 @@
>  	};
>  };
>  
> +&hscif1 {
> +	pinctrl-0 = <&hscif1_pins>;
> +	pinctrl-names = "default";
> +
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
>  &pfc {
> +	hscif1_pins: hscif1 {
> +		groups = "hscif1_data", "hscif1_ctrl";
> +		function = "hscif1";
> +	};
> +
>  	scif4_pins: scif4 {
>  		groups = "scif4_data_b";
>  		function = "scif4";
> -- 
> 2.7.4
> 
