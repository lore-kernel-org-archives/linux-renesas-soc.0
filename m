Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:50269 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733213AbeHGRQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 13:16:44 -0400
Date: Tue, 7 Aug 2018 17:01:46 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
CC: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the
 ULCB boards' compatible
Message-ID: <20180807150146.GA28888@vmlxhi-102.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-3-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180804231114.21420-3-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 05, 2018 at 01:11:02AM +0200, Eugeniu Rosca wrote:
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index d8cf740132c6..f391dba10574 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -81,7 +81,7 @@ Boards:
>      compatible = "renesas,gose", "renesas,r8a7793"
>    - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
>      H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))

FWIW/FTR, I have found the schematics of RTP0RC7795SKB00010S
(looks like a H3-ES1x Starter-Kit) and this specific board doesn't
have an entry in Documentation/devicetree/bindings/arm/shmobile.txt.

Also, there is RTP0RC77951SKBX010SA03 (8GB version H3-ES20 Starter-Kit).
This is also not documented.

Interestingly, there is one digit difference between:
 - 4GiB H3-ES2.0 Starter-Kit: RTP0RC77951SKBX010SA00
 - 8GiB H3-ES2.0 Starter-Kit: RTP0RC77951SKBX010SA03

which means Renesas encodes the amount of RAM in the board id/string.

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
> -- 
> 2.18.0

Best regards,
Eugeniu.
