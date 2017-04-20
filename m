Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57228 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751238AbdDTLpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 07:45:24 -0400
Date: Thu, 20 Apr 2017 20:45:18 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: r8a7796: salvator-x: Enable NFS root
Message-ID: <20170420114513.GO3760@verge.net.au>
References: <1492681604-19860-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492681604-19860-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 20, 2017 at 11:46:44AM +0200, Geert Uytterhoeven wrote:
> Cfr. commit b2407c566ba29215 ("arm64: dts: r8a7795: enable nfs root on
> Salvator-X board").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up.

It looks like we should also do something like this for [hm]3ulcb.

> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index 7f0ac6a9d49b8da6..18b478be484cfd83 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -23,7 +23,7 @@
>  	};
>  
>  	chosen {
> -		bootargs = "ignore_loglevel";
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -- 
> 2.7.4
> 
