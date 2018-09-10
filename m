Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42793 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbeIJXKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 19:10:46 -0400
Received: by mail-lf1-f65.google.com with SMTP id z11-v6so18211291lff.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 11:15:26 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 10 Sep 2018 20:15:23 +0200
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: dt-bindings: rcar-vin: Add R8A77990 support
Message-ID: <20180910181523.GE18450@bigcity.dyn.berto.se>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-2-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1536161385-25562-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2018-09-05 17:29:38 +0200, Jacopo Mondi wrote:
> Add compatible string for R-Car E3 R8A77990 to the list of SoCs supported by
> rcar-vin driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
> index 2f42005..dfd6058 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -23,6 +23,7 @@ on Gen3 platforms to a CSI-2 receiver.
>     - "renesas,vin-r8a7796" for the R8A7796 device
>     - "renesas,vin-r8a77965" for the R8A77965 device
>     - "renesas,vin-r8a77970" for the R8A77970 device
> +   - "renesas,vin-r8a77990" for the R8A77990 device
>     - "renesas,vin-r8a77995" for the R8A77995 device
>     - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
>       device.
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
