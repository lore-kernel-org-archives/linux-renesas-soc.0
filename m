Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55759 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751022AbeEMIOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 04:14:45 -0400
Date: Sun, 13 May 2018 10:14:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a77990: Add PFC device node
Message-ID: <20180513081424.tuqsc3wesnsd6n4m@verge.net.au>
References: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526013081-28005-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526013081-28005-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 01:31:18PM +0900, Yoshihiro Shimoda wrote:
> This patch adds PFC device node for r8a77990 (R-Car E3).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 4658029..efc3c0b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -60,6 +60,11 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		pfc: pin-controller@e6060000 {
> +			compatible = "renesas,pfc-r8a77990";
> +			reg = <0 0xe6060000 0 0x508>;
> +		};

Here the register size is 0x508 which matches r8a77995.dtsi in mainline.
Other variants there are:
* 0x50c: r8a7795.dtsi, r8a77965.dtsi, r8a7796.dtsi
* 0x504: r8a77970.dtsi

My reading of the documentation is that the size of the register range is
0x50c. So I suggest we either use that value consistently or move to a
larger value after some rounding-up. Geert?

> +
>  		cpg: clock-controller@e6150000 {
>  			compatible = "renesas,r8a77990-cpg-mssr";
>  			reg = <0 0xe6150000 0 0x1000>;
> -- 
> 1.9.1
> 
