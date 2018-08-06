Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:36362 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbeHFNWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 09:22:01 -0400
Received: by mail-ua0-f196.google.com with SMTP id c12-v6so11653452uan.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 04:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <20180804231114.21420-3-erosca@de.adit-jv.com>
 <2169355.Q07bnbUiBE@avalon>
In-Reply-To: <2169355.Q07bnbUiBE@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 13:13:14 +0200
Message-ID: <CAMuHMdX7EJ-UiB6N+BaJS9Lkudt9s9kSUJ6C_E4+jkGcnG9zow@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the
 ULCB boards' compatible
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>, rosca.eugeniu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Aug 6, 2018 at 12:38 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sunday, 5 August 2018 02:11:02 EEST Eugeniu Rosca wrote:
> > In the context of M3N-ULCB (RTP0RC77965SKBX010SA00) board bring-up, it's
> > rather pointless to add a new "renesas,m3nulcb" compatible string. Any
> > SoC-level differences between the two variants of ULCB (M3 and M3-N)
> > should be successfully covered by making use of existing
> > "renesas,r8a7796" and "renesas,r8a77965" compatibles.
> >
> > Prior to adding M3-N Starter Kit to the list, rename:
> >  - "renesas,h3ulcb" => "renesas,ulcb"
> >  - "renesas,m3ulcb" => "renesas,ulcb"
>
> This bothers me more than the naming convention in patch 01/14, as this change
> would completely hide differences between the H3 and M3-N versions of the
> ULCB. Compatible strings are listed in a decreasing order of specificity, and
> having "renesas,ulcb" as the most-specific compatible string means that the
> two boards are supposed to be identical, while they are not.

AFAIK the boards are identical (cfr. ), except for the SiP mounted.
Cfr. e.g. the combined R-Car_StarterKit_Gen3_H3_M3_DEV_Rev.053.pdf
("Renesas R-Car H3/M3 Device Manual", incl. schematics).

Hence to me the patch makes sense (modulo out-of-tree dependencies on the
old compatible values).

> > Relevant DTS changes come in separate per-DTS commits.
> >
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt
> > b/Documentation/devicetree/bindings/arm/shmobile.txt index
> > d8cf740132c6..f391dba10574 100644
> > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -81,7 +81,7 @@ Boards:
> >      compatible = "renesas,gose", "renesas,r8a7793"
> >    - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
> >      H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
> > -    compatible = "renesas,h3ulcb", "renesas,r8a7795"
> > +    compatible = "renesas,ulcb", "renesas,r8a7795"
> >    - Henninger
> >      compatible = "renesas,henninger", "renesas,r8a7791"
> >    - iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
> > @@ -105,7 +105,7 @@ Boards:
> >    - Lager (RTP0RC7790SEB00010S)
> >      compatible = "renesas,lager", "renesas,r8a7790"
> >    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
> > -    compatible = "renesas,m3ulcb", "renesas,r8a7796"
> > +    compatible = "renesas,ulcb", "renesas,r8a7796"
> >    - Marzen (R0P7779A00010S)
> >      compatible = "renesas,marzen", "renesas,r8a7779"
> >    - Porter (M2-LCDP)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
