Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbeIJS6a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 14:58:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/8] media: dt-bindings: rcar-csi2: Add R8A77990
Date: Mon, 10 Sep 2018 17:04:23 +0300
Message-ID: <2931486.Q1hqLavO40@avalon>
In-Reply-To: <1536161385-25562-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org> <1536161385-25562-4-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Wednesday, 5 September 2018 18:29:40 EEST Jacopo Mondi wrote:
> Add compatible string for R-Car E3 R8A77990 to the list of supported SoCs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt index
> 2d385b6..2824489 100644
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


-- 
Regards,

Laurent Pinchart
