Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:55009 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754913AbdJRLln (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 07:41:43 -0400
Subject: Re: [PATCH RESEND] phy: rcar-gen2: Add r8a7743/5 support
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <bcfa1e90-c497-ee29-687d-9f9a04ce2d4b@ti.com>
Date: Wed, 18 Oct 2017 17:10:58 +0530
MIME-Version: 1.0
In-Reply-To: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Monday 09 October 2017 03:52 PM, Biju Das wrote:
> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
> USB PHY is identical to the R-Car Gen2 family.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

merged, thanks!

-Kishon
> ---
> This patch is tested against Linux next tag next-20170929.
> 
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> index 91da947..eeb9e18 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -4,10 +4,13 @@ This file provides information on what the device node for the R-Car generation
>  2 USB PHY contains.
>  
>  Required properties:
> -- compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
> +- compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
> +	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
> +	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>  	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>  	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> -	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible device.
> +	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
> +					  RZ/G1 compatible device.
>  
>  	      When compatible with the generic version, nodes must list the
>  	      SoC-specific version corresponding to the platform first
> 
