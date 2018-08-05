Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:54498 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbeHFAqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 20:46:33 -0400
Received: by mail-wm0-f66.google.com with SMTP id c14-v6so11913615wmb.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Aug 2018 15:40:20 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Mon, 6 Aug 2018 00:40:02 +0200
To: jacopo mondi <jacopo@jmondi.org>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
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
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 09/14] dt-bindings: arm: Document Renesas R-Car
 M3-N-based ULCB board
Message-ID: <20180805224002.GA15682@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-10-erosca@de.adit-jv.com>
 <20180805081543.GH4528@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180805081543.GH4528@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your comments. Please, find my replies below.

On Sun, Aug 05, 2018 at 10:15:43AM +0200, jacopo mondi wrote:
> Helle Eugeniu,
> 
> On Sun, Aug 05, 2018 at 01:11:09AM +0200, Eugeniu Rosca wrote:
> > In harmony with ATF and U-Boot outputs [1] and [2], the new board is
> > based on M3-N revision ES1.1 and the amount of memory present on SiP
> > is 2GiB, contiguously addressed.
> 
> Not sure why the amount of installed system memory is relevant for
> this commit..

To be honest, I don't know precisely what's encoded in the board string
(particularly the one documented in this commit RTP0RC77965SKBX010SA00).

The only thing unmistakenly present there is the SoC model 77965 (i.e.
M3-N), but I am quite clueless about the rest.

What I can say for sure is that the end-user experience of a R-Car Gen3
reference board clearly depends on below parameters:
 - [A] SoC (model, revision) including SRAM and on-chip peripherals
 - [B] DRAM (amount, linear/2ch/4ch split) 
 - [C] Hyperflash (amount)
 - [D] board's PCB (revision)
 - [E] board's off-chip peripherals (model, revision)

I don't know how many of these parameters are embedded in the board
string, but since you are suggesting that RAM amount is not (IOW
Renesas will potentially release several RTP0RC77965SKBX010SA00
boards with different amounts of memory), I will happily update
the commit description.

> 
> >
> > [1] BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21
> >     BL2: PRR is R-Car M3N Ver.1.1
> >
> > [2] U-Boot 2015.04-00295-*
> >     CPU: Renesas Electronics R8A77965 rev 1.1
> >     ---8<----
> >     DRAM:  1.9 GiB
> >     Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
> >     ---8<----
> >
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> > index f391dba10574..2f3494a0107c 100644
> > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -106,6 +106,8 @@ Boards:
> >      compatible = "renesas,lager", "renesas,r8a7790"
> >    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
> >      compatible = "renesas,ulcb", "renesas,r8a7796"
> > +  - M3-N ULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))
> 
> Other documented ULCB description entries in this file are
> H3ULCB and M3ULCB, so for consistency you should add M3NULCB, which
> isn't that nice.

This was my initial intent, but then I noticed commits like
519df0e05d27 ("dt-bindings: arm: consistently name r8a77965 as M3-N"),
which try to use "M3-N" notation consistently and avoid "M3N". So, I
tried to avoid "M3N" too.

> 
> Imo, or you either replace "[H|M]3ULCB" with "[H|M]3 ULCB" in other
> entries and you keep your "M3-N ULCB" here, which is nicer (you could
> do that in patch 2).
> 
> Or maybe could you consider doing what has been done for
> Salvator-x(s), which do not have the SoC model name in the entry description
> at all (but please wait for others to comment before doing something
> like that):

I prefer this second variant, but I will wait for others to comment.

> 
>         - Salvator-X (RTP0RC7795SIPB0010S)
>           compatible = "renesas,salvator-x", "renesas,r8a7795"
>         - Salvator-X (RTP0RC7796SIPB0011S)
>           compatible = "renesas,salvator-x", "renesas,r8a7796"
>         - Salvator-X (RTP0RC7796SIPB0011S (M3-N))
>           compatible = "renesas,salvator-x", "renesas,r8a77965"
>         - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
>           compatible = "renesas,salvator-xs", "renesas,r8a7795"
>         - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
>           compatible = "renesas,salvator-xs", "renesas,r8a7796"
>         - Salvator-XS (Salvator-X 2nd version, RTP0RC77965SIPB012S)
>           compatible = "renesas,salvator-xs", "renesas,r8a77965"
> 
> This would then be
>         - ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
>           ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
>           compatible = "renesas,ulcb", "renesas,r8a7795
>         - ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0)
>           compatible = "renesas,ulcb", "renesas,r8a7796"
>         - ULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))
>           compatible = "renesas,ulcb", "renesas,r8a77965"
> 
> Thanks
>    j
> 
> PS: why the r8a7795-es1 version of Salvator-X is not listed? I assume
> it has a different part number than the ES2.0 one, as ULCB with es1
> does.

That's a good question, but I think the concern is not too big since
r8a7795-es1 is EOL. 

> 
> > +    compatible = "renesas,ulcb", "renesas,r8a77965"
> >    - Marzen (R0P7779A00010S)
> >      compatible = "renesas,marzen", "renesas,r8a7779"
> >    - Porter (M2-LCDP)
> > --
> > 2.18.0
> >

Thanks!

Best regards,
Eugeniu.
