Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39064 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662AbcEWAe3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 22 May 2016 20:34:29 -0400
Date: Mon, 23 May 2016 09:34:26 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: r8a7795: Use SYSC "always-on" PM Domain for
 RWDT node
Message-ID: <20160523003425.GD25562@verge.net.au>
References: <1463730182-15878-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463730182-15878-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 20, 2016 at 09:43:02AM +0200, Geert Uytterhoeven wrote:
> Hook up the RWDT device node to the SYSC "always-on" PM Domain, for a
> more consistent device-power-area description in DT.
> 
> Cfr. commit 38dbb45ee4bc7dda ("arm64: dts: r8a7795: Use SYSC "always-on"
> PM Domain").
> 
> Fixes: f43838a7ae014cba ("arm64: dts: r8a7795: Add RWDT node")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit 38dbb45ee4bc7dda was applied in between review and application of
> commit f43838a7ae014cba.

Sorry about that. I've applied this patch.

>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index ba87e03969ee562e..bf38df355006afde 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -168,7 +168,7 @@
>  			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
>  			reg = <0 0xe6020000 0 0x0c>;
>  			clocks = <&cpg CPG_MOD 402>;
> -			power-domains = <&cpg>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>  			status = "disabled";
>  		};
>  
> -- 
> 1.9.1
> 
