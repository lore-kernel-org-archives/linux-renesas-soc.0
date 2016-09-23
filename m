Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 23 Sep 2016 14:15:19 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mmc: sh_mmcif: Document r7s72100 DT bindings
Message-ID: <20160923191519.GA28901@rob-hp-laptop>
References: <20160920154620.18653-1-chris.brandt@renesas.com>
 <20160920154620.18653-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160920154620.18653-3-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 20, 2016 at 11:46:19AM -0400, Chris Brandt wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * added interrupt description
> ---
>  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> index ff611fa..1443edb 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> @@ -8,12 +8,16 @@ Required properties:
>  
>  - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
>    fallback. Examples with <soctype> are:
> +	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
>  	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
>  	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
>  	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
>  	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
>  	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
>  
> +- interrupts: either 1 shared interrupt, 2 separate interrupts (error and int),
> +  or 3 separate interrupts (error, int, card detect)

This should be based on the compatible strings. Surely, 1, 2, or 3 is 
not valid for all compatibles.

Rob
