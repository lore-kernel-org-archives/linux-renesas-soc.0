Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59559 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756468AbeDXI01 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 04:26:27 -0400
Date: Tue, 24 Apr 2018 10:26:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: arm: consistently name r8a77965 as M3-N
Message-ID: <20180424082623.y6d2unyo45wktkx2@verge.net.au>
References: <20180424055442.19710-1-horms+renesas@verge.net.au>
 <CAMuHMdWZoXSJnuEiD4e9SpP+ASFgDCcwy16UFOeSEq5sNnsMSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZoXSJnuEiD4e9SpP+ASFgDCcwy16UFOeSEq5sNnsMSA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 09:16:17AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Apr 24, 2018 at 7:54 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > There is an inconsistency between the use of M3N and M3-N.
> > This patch resolves this by consistently using the latter.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Note that this is for a custom Salvator-X board where the M3-W SiP was
> replaced by an M3-N SiP.  So I have no idea what's on the sticker, if it was
> replaced at all, and thus kept the text from the BSP.

Understood. But I think we should make the naming consistent regardless.

> 
> > --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -116,7 +116,7 @@ Boards:
> >      compatible = "renesas,salvator-x", "renesas,r8a7795"
> >    - Salvator-X (RTP0RC7796SIPB0011S)
> >      compatible = "renesas,salvator-x", "renesas,r8a7796"
> > -  - Salvator-X (RTP0RC7796SIPB0011S (M3N))
> > +  - Salvator-X (RTP0RC7796SIPB0011S (M3-N))
> >      compatible = "renesas,salvator-x", "renesas,r8a77965"
> >    - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
> >      compatible = "renesas,salvator-xs", "renesas,r8a7795"
> \
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
