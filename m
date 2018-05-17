Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39633 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752083AbeEQHop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 03:44:45 -0400
Date: Thu, 17 May 2018 09:44:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: sh-msiof: Document R-Car D3 support
Message-ID: <20180517074426.67rrc5wa4jagbg6v@verge.net.au>
References: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526475916-13705-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526475916-13705-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 03:05:16PM +0200, Ulrich Hecht wrote:
> Document support for the MSIOF module in the Renesas D3 (r8a77995) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> index 3980632..914036d 100644
> --- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
> +++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> @@ -11,6 +11,7 @@ Required properties:
>  			 "renesas,msiof-r8a7795" (R-Car H3)
>  			 "renesas,msiof-r8a7796" (R-Car M3-W)
>  			 "renesas,msiof-r8a77965" (R-Car M3-N)
> +			 "renesas,msiof-r8a77995" (R-Car D3)
>  			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
>  			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
>  			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
> -- 
> 2.7.4
> 
