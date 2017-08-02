Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60772 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbdHBMXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 08:23:55 -0400
Date: Wed, 2 Aug 2017 14:23:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] arm64: renesas: salvator-common: avoid audio_clkout
 naming conflict
Message-ID: <20170802122352.GB20012@verge.net.au>
References: <87ini6p8y6.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ini6p8y6.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 02, 2017 at 10:26:58AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> clock name of "audio_clkout" is used by Renesas sound driver.
> This duplicated naming breaks its clock registering/unregisering.
> Especially, when unbind/bind it can't handle clkout correctly.
> This patch renames "audio_clkout" to "audio-clkout" to avoid
> naming conflict.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> > Simon
> 
> This patch is for v4.13-rcX

Thanks, could I get a "Fixes" tag?

> 
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 78202f5..a6ceda72 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -45,7 +45,7 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	audio_clkout: audio_clkout {
> +	audio_clkout: audio-clkout {
>  		/*
>  		 * This is same as <&rcar_sound 0>
>  		 * but needed to avoid cs2000/rcar_sound probe dead-lock
> -- 
> 1.9.1
> 
