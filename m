Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54586 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751952AbeB0IZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:25:34 -0500
Date: Tue, 27 Feb 2018 09:25:15 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] dt-bindings: arm: Document Renesas R-Car M3-N-based
 Salvator-XS board
Message-ID: <20180227082514.h2pfc7a5qpceb2mb@verge.net.au>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
 <1519668225-12548-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519668225-12548-5-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 26, 2018 at 07:03:45PM +0100, Geert Uytterhoeven wrote:
> The Renesas Salvator-XS development board can be equipped with an R-Car
> H3, M3-W, or M3-N SiP, which are pin-compatible.
> 
> Document board part number and compatible values for the version with
> R-Car M3-N.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 51e4428856be4557..303f04e639431837 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -114,6 +114,8 @@ Boards:
>      compatible = "renesas,salvator-xs", "renesas,r8a7795"
>    - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
>      compatible = "renesas,salvator-xs", "renesas,r8a7796"
> +  - Salvator-XS (Salvator-X 2nd version, RTP0RC77965SIPB012S)
> +    compatible = "renesas,salvator-xs", "renesas,r8a77965"

I am unsure how to verify this part number, can anyone help?
Also, the syntax seems inconsistent with that of patch 3/4.

>    - SILK (RTP0RC7794LCB00011S)
>      compatible = "renesas,silk", "renesas,r8a7794"
>    - SK-RZG1E (YR8A77450S000BE)
> -- 
> 2.7.4
> 
