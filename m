Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48839 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727155AbeJQAjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 20:39:44 -0400
Date: Tue, 16 Oct 2018 18:48:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Renesas RZ/A and RZ/N files to Renesas
 pinctrl section
Message-ID: <20181016164824.egtuqa3mcylviknf@verge.net.au>
References: <20181016115653.12810-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016115653.12810-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 01:56:53PM +0200, Geert Uytterhoeven wrote:
> Add paths for the Renesas RZ/A and RZ/N series pin controller drivers,
> as they are not under sh-pfc/, but still maintained with the other
> Renesas pin controller drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> To be queued in sh-pfc-for-v4.21.
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 809600de0b7293c8..77ff83bc09464c1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11672,6 +11672,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
>  S:	Maintained
> +F:	drivers/pinctrl/pinctrl-rz*
>  F:	drivers/pinctrl/sh-pfc/
>  
>  PIN CONTROLLER - SAMSUNG
> -- 
> 2.17.1
> 
