Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33823 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbeILRES (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 13:04:18 -0400
Received: by mail-ua1-f68.google.com with SMTP id r15-v6so1425128uao.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Sep 2018 05:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdW4ium4s97+1iOHkhBGw3LdfPyfxXq4_7ic+VtXzRpE2g@mail.gmail.com>
 <20180906094231.eccvg2asl7kgotu2@verge.net.au> <2032675.nQfVxexfDx@avalon> <20180912102534.vrocfv2mdrjuk2ev@verge.net.au>
In-Reply-To: <20180912102534.vrocfv2mdrjuk2ev@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Sep 2018 13:59:53 +0200
Message-ID: <CAMuHMdU0NqdN7efjDMcabXuWAFJy3eQSFHWxcjYaRMjz=+vKJQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys support
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Sep 12, 2018 at 12:25 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Sep 06, 2018 at 12:59:20PM +0300, Laurent Pinchart wrote:
> > On Thursday, 6 September 2018 12:42:32 EEST Simon Horman wrote:
> > > On Thu, Aug 23, 2018 at 11:58:54AM +0200, Geert Uytterhoeven wrote:
> > > > On Sun, Aug 19, 2018 at 9:44 PM Laurent Pinchart wrote:
> > > >> The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
> > > >> buttons connected to SoC GPIOs, meant to be used as general-purpose test
> > > >> keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
> > > >> switch to keys 1-4 and the push buttons to keys A-C.
> > > >>
> > > >> Signed-off-by: Laurent Pinchart
> > > >> <laurent.pinchart+renesas@ideasonboard.com>
> > > >
> > > > Given GP6_1[123] are not just wired to the 3 push buttons, but also to 3
> > > > LEDs, I wonder if we shouldn't postpone that part until Linux can handle
> > > > GPIOs connected to both?
> > >
> > > Laurent, any thoughts on that?
> >
> > Right now the GPIOs are not wired in DT, and we're thus without a way to
> > interface to both LEDs and push buttons. While I agree that an ideal
> > solution would be to support both, I think that moving from nothing to
> > support for push buttons would be a step forward already.
>
> I tend to agree. Geert, what are your thoughts?

Fine for me.

Just one more bikeshedding question: what's most useful, buttons or LEDs? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
