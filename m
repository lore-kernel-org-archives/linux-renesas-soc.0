Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41123 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbeJ2Xo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 19:44:29 -0400
Date: Mon, 29 Oct 2018 15:55:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add companion
 property in usb3_peri0
Message-ID: <20181029145525.leurznhqtsveyp4u@verge.net.au>
References: <1540190849-23573-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540190849-23573-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 03:47:29PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a property "companion" with xhci0 phandle to
> the usb3_peri0 node in salvator-common.dtsi.
> 
> About the detail of this property for renesas_usb3 udc driver, please
> refer to the commit 39facfa01c9f ("usb: gadget: udc: renesas_usb3:
> Add register of usb role switch").
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Shimoda-san,

applied for v4.21.

> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 054a7ee..a3e8950 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -817,6 +817,8 @@
>  	phys = <&usb3_phy0>;
>  	phy-names = "usb";
>  
> +	companion = <&xhci0>;
> +
>  	status = "okay";
>  };
>  
> -- 
> 1.9.1
> 
