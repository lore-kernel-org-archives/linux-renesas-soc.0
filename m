Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42268 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbeHQQr5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:47:57 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 2/7] dt-bindings: can: rcar_can: document r8a77965 can
 support
To: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-2-erosca@de.adit-jv.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <7f6c5c87-bcee-51dd-66a4-a47798397e7f@ideasonboard.com>
Date: Fri, 17 Aug 2018 14:44:25 +0100
MIME-Version: 1.0
In-Reply-To: <20180812133149.7710-2-erosca@de.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu

Thank you for the patch.

On 12/08/18 14:31, Eugeniu Rosca wrote:
> Document the support for rcar_can on R8A77965 SoC devices.
> Add R8A77965 to the list of SoCs which require the "assigned-clocks" and
> "assigned-clock-rates" properties (thanks, Sergei). Rewrap text.

I don't think you needed to say you rewrapped the text in the commit log
- but it's fine :)


> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes in v2:
>  - [Kieran Bingham] Simplified commit description. Rewrapped text.
>  - [Sergei Shtylyov] Replaced footnotes with inline text.
>  - Pushed all dt-bindings patches to the beginning of the series.
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> index 94a7f33ac5e9..60daa878c9a2 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -13,6 +13,7 @@ Required properties:
>  	      "renesas,can-r8a7794" if CAN controller is a part of R8A7794 SoC.
>  	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>  	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
> +	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
>  	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device.
>  	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
>  	      compatible device.
> @@ -28,11 +29,10 @@ Required properties:
>  - pinctrl-0: pin control group to be used for this controller.
>  - pinctrl-names: must be "default".
>  
> -Required properties for "renesas,can-r8a7795" and "renesas,can-r8a7796"
> -compatible:
> -In R8A7795 and R8A7796 SoCs, "clkp2" can be CANFD clock. This is a div6 clock
> -and can be used by both CAN and CAN FD controller at the same time. It needs to
> -be scaled to maximum frequency if any of these controllers use it. This is done
> +Required properties for R8A7795, R8A7796 and R8A77965:
> +For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock and can
> +be used by both CAN and CAN FD controller at the same time. It needs to be
> +scaled to maximum frequency if any of these controllers use it. This is done
>  using the below properties:
>  
>  - assigned-clocks: phandle of clkp2(CANFD) clock.
> 
