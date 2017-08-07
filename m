Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47158 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbdHGH7l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 03:59:41 -0400
Date: Mon, 7 Aug 2017 09:59:20 +0200
From: Simon Horman <horms@verge.net.au>
To: "Bui Duc Phuc (Fukuda)" <phucduc.bui@gmail.com>
Cc: geert+renesas@glider.be, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH] ARM:dts:armadillo800eva: Add console parametters
Message-ID: <20170807075920.GD7175@verge.net.au>
References: <1502027702-4366-1-git-send-email-phucduc.bui@gmail.com>
 <1502027702-4366-2-git-send-email-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502027702-4366-2-git-send-email-phucduc.bui@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 06, 2017 at 08:55:02PM +0700, Bui Duc Phuc (Fukuda) wrote:
> From: Bui Duc Phuc <phucduc.bui@gmail.com>
> 
> After the kernel boot, the login prompt doesn't appear.
> This patch will add console parametters to bootargs to fix it.
> 
> Signed-off-by: Bui Duc Phuc <phucduc.bui@gmail.com>
> ---
>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> index 1788e18..d383b37 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> @@ -24,7 +24,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
> +		bootargs = "console=tty0 console=ttySC0,115200 earlyprintk
> +				ignore_loglevel root=/dev/nfs ip=dhcp rw";
>  		stdout-path = "serial0:115200n8";
>  	};

Hi,

this feels wrong. My understanding is that stdout-path should be enough
to get the console.
