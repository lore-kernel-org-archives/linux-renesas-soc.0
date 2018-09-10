Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32769 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbeIJRjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 13:39:13 -0400
Date: Mon, 10 Sep 2018 14:45:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/8] media: dt-bindings: rcar-csi2: Add R8A77990
Message-ID: <20180910124514.dpshy6bp2toa2kky@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-4-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536161385-25562-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 05:29:40PM +0200, Jacopo Mondi wrote:
> Add compatible string for R-Car E3 R8A77990 to the list of supported SoCs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> index 2d385b6..2824489 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> @@ -12,6 +12,7 @@ Mandatory properties
>     - "renesas,r8a7796-csi2" for the R8A7796 device.
>     - "renesas,r8a77965-csi2" for the R8A77965 device.
>     - "renesas,r8a77970-csi2" for the R8A77970 device.
> +   - "renesas,r8a77990-csi2" for the R8A77990 device.
>  
>   - reg: the register base and size for the device registers
>   - interrupts: the interrupt for the device
> -- 
> 2.7.4
> 
