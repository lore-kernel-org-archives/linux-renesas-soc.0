Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33510 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbeHFMrC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:47:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the ULCB boards' compatible
Date: Mon, 06 Aug 2018 13:39:16 +0300
Message-ID: <2169355.Q07bnbUiBE@avalon>
In-Reply-To: <20180804231114.21420-3-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <20180804231114.21420-3-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

Thank you for the patch.

On Sunday, 5 August 2018 02:11:02 EEST Eugeniu Rosca wrote:
> In the context of M3N-ULCB (RTP0RC77965SKBX010SA00) board bring-up, it's
> rather pointless to add a new "renesas,m3nulcb" compatible string. Any
> SoC-level differences between the two variants of ULCB (M3 and M3-N)
> should be successfully covered by making use of existing
> "renesas,r8a7796" and "renesas,r8a77965" compatibles.
> 
> Prior to adding M3-N Starter Kit to the list, rename:
>  - "renesas,h3ulcb" => "renesas,ulcb"
>  - "renesas,m3ulcb" => "renesas,ulcb"

This bothers me more than the naming convention in patch 01/14, as this change 
would completely hide differences between the H3 and M3-N versions of the 
ULCB. Compatible strings are listed in a decreasing order of specificity, and 
having "renesas,ulcb" as the most-specific compatible string means that the 
two boards are supposed to be identical, while they are not.

> Relevant DTS changes come in separate per-DTS commits.
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt
> b/Documentation/devicetree/bindings/arm/shmobile.txt index
> d8cf740132c6..f391dba10574 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -81,7 +81,7 @@ Boards:
>      compatible = "renesas,gose", "renesas,r8a7793"
>    - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
>      H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
> -    compatible = "renesas,h3ulcb", "renesas,r8a7795"
> +    compatible = "renesas,ulcb", "renesas,r8a7795"
>    - Henninger
>      compatible = "renesas,henninger", "renesas,r8a7791"
>    - iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
> @@ -105,7 +105,7 @@ Boards:
>    - Lager (RTP0RC7790SEB00010S)
>      compatible = "renesas,lager", "renesas,r8a7790"
>    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
> -    compatible = "renesas,m3ulcb", "renesas,r8a7796"
> +    compatible = "renesas,ulcb", "renesas,r8a7796"
>    - Marzen (R0P7779A00010S)
>      compatible = "renesas,marzen", "renesas,r8a7779"
>    - Porter (M2-LCDP)

-- 
Regards,

Laurent Pinchart
