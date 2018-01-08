Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53568 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755852AbeAHH53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 02:57:29 -0500
Date: Mon, 8 Jan 2018 08:57:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: renesas_usbhs: Add support for
 RZ/A1
Message-ID: <20180108075709.woqjjkb7eg4de47u@verge.net.au>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <20180105224647.42262-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180105224647.42262-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 05, 2018 at 05:46:46PM -0500, Chris Brandt wrote:
> Document support for RZ/A1 SoCs
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>  * Removed "renesas,usbhs-r7s72100"

Unless I am mistaken you want both renesas,usbhs-r7s72100, for the SoC
and renesas,rza1-usbhs for the family[*] of SoCs (which currently only has one
member upstream).

Similar to the way there are per-SoC compat strings for R-Car Gen2 and Gen3
SoCs, and per-SoC family fallback compat strings to Gen2 and Gen3.

The motivation for this that empirically SoC families seem to be able to
share the implementation on the driver-side, so only the fallback compat
strings need to be implemented in the driver by defining per-SoC compat
strings we have the flexibility to implement them if differences emerge
between SoCs in the same family.

[*] I used the term family here to group SoCs together. I acknowledge that
Renesas may not refer to them in this way.



> v2:
>  * Added Reviewed-by
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 47394ab788e3..fa16d8d33815 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
>  	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
>  	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
> +	- "renesas,rza1-usbhs" for RZ/A1 compatible device
>  
>  	When compatible with the generic version, nodes must list the
>  	SoC-specific version corresponding to the platform first followed
> -- 
> 2.15.1
> 
> 
