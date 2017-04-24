Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38036 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758555AbdDXGBe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 02:01:34 -0400
Date: Mon, 24 Apr 2017 08:01:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be
Subject: Re: [PATCH] ARM: dts: blanche: Add support for HSCIF0 on CN5
Message-ID: <20170424060127.GB14843@verge.net.au>
References: <149269961740.23335.7950127209713140684.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <149269961740.23335.7950127209713140684.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 20, 2017 at 11:46:57PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> r8a7792 Blanche has depending on dip switch and jumper settings
> either HSCIF0 or CAN0 exposed on the on-board CN5 connector.
> 
> This patch adds HSCIF0 to the Blanche dts as serial2.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Currently the r8a7792 PFC is lacking support for HSCIF devices
>  so the PFC driver needs to be updated to avoid error messages
>  on the boot console.

I would rather hold off on applying this patch until the PFC driver
has been enhanced. Does that sound reasonable?

>  arch/arm/boot/dts/r8a7792-blanche.dts |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> --- 0001/arch/arm/boot/dts/r8a7792-blanche.dts
> +++ work/arch/arm/boot/dts/r8a7792-blanche.dts	2017-04-20 23:35:50.440607110 +0900
> @@ -21,6 +21,7 @@
>  	aliases {
>  		serial0 = &scif0;
>  		serial1 = &scif3;
> +		serial2 = &hscif0;
>  	};
>  
>  	chosen {
> @@ -207,6 +208,11 @@
>  		function = "scif3";
>  	};
>  
> +	hscif0_pins: hscif0 {
> +		groups = "hscif0_data", "hscif0_ctrl";
> +		function = "hscif0";
> +	};
> +
>  	lan89218_pins: lan89218 {
>  		intc {
>  			groups = "intc_irq0";
> @@ -253,6 +259,14 @@
>  	status = "okay";
>  };
>  
> +&hscif0 {
> +	pinctrl-0 = <&hscif0_pins>;
> +	pinctrl-names = "default";
> +
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
>  &can0 {
>  	pinctrl-0 = <&can0_pins>;
>  	pinctrl-names = "default";
> 
