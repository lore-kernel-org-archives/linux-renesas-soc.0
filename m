Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751909AbdFPMic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 08:38:32 -0400
Date: Fri, 16 Jun 2017 14:38:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: Add support for the DU
Message-ID: <20170616123809.GC23030@verge.net.au>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170615073716.12395-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdX=ufC1=tSodCDzy_THK1HjdJ9fXnu9W3P8CBso6uyZNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX=ufC1=tSodCDzy_THK1HjdJ9fXnu9W3P8CBso6uyZNA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 09:34:02AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Thu, Jun 15, 2017 at 9:37 AM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > Add a compatible string and VSP links to the DU node. The H3 ES1.x and
> > H3 ES2.0 are compatible save for the links to the VSPs that are
> > described explicitly in DT, so there's no need for a new ES2-specific
> > compatible string.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -1743,6 +1743,7 @@
> >                 };
> >
> >                 du: display@feb00000 {
> > +                       compatible = "renesas,du-r8a7795";
> 
> Hence the "override" in r8a7795-es1.dtsi can be removed.

Laurent do you want me to queue this up with the expectation of
you providing a follow-up patch?

> 
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
