Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43197 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbeJQQHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 12:07:32 -0400
Date: Wed, 17 Oct 2018 10:12:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] MAINTAINERS: Remove Laurent Pinchart as Renesas pinctrl
 maintainer
Message-ID: <20181017081257.pjpj7r2x6dljpjty@verge.net.au>
References: <20181016103339.4942-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016103339.4942-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 01:33:39PM +0300, Laurent Pinchart wrote:
> Geert Uytterhoeven has long taken over and I'm not involved anymore with
> the Renesas pinctrl driver. Remove myself from the maintainers list.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69373eb328d4..f9d00cc05202 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11515,7 +11515,6 @@ F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
>  F:	drivers/pinctrl/qcom/
>  
>  PIN CONTROLLER - RENESAS
> -M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
> -- 
> Regards,
> 
> Laurent Pinchart
> 
