Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46865 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbeIQPPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 11:15:02 -0400
Received: by mail-vs1-f66.google.com with SMTP id h23-v6so2563364vsk.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 02:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <1591566.tkYZ6URfXP@avalon> <20180917085105.uejmjkwxsvsna75p@verge.net.au> <3481349.HLygXACKyS@avalon>
In-Reply-To: <3481349.HLygXACKyS@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 11:48:12 +0200
Message-ID: <CAMuHMdW+K8A+xcfqt9KQ6nDzL9j_-XLi5Td3FPP6VMPNK0ni4A@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] arm64: dts: renesas: r8a77990: Add display
 output support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>, uli@fpond.eu,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Sep 17, 2018 at 11:09 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday, 17 September 2018 11:51:06 EEST Simon Horman wrote:
> > On Mon, Sep 17, 2018 at 11:38:43AM +0300, Laurent Pinchart wrote:
> > > On Monday, 17 September 2018 10:50:55 EEST Simon Horman wrote:
> > > > On Fri, Sep 14, 2018 at 12:10:43PM +0300, Laurent Pinchart wrote:
> > > > > The R8A77990 (E3) platform has one RGB output and two LVDS outputs
> > > > > connected to the DU. Add the DT nodes for the DU, LVDS encoders and
> > > > > supporting VSP and FCP.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart
> > > > > <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >
> > > > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 167 +++++++++++++++++++++
> > > > >  1 file changed, 167 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index
> > > > > abb14af76c0e..600074ca3ee5 100644
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > > @@ -537,6 +537,173 @@
> > > > >                         resets = <&cpg 408>;
> > > > >                 };
> > > >
> > > > These nodes should be placed after the gic to preserve the sorting
> > > > of nodes by bus address and then IP block.
> > >
> > > Aren't they already ? :-)
> >
> > Git didn't seem to think so. But its not a big deal,
> > I can fix this up locally.
>
> Did it apply the below hunk to a different location ? 408 is the gic, isn't it
> ?

The "-U <n>" option (with <n> sufficiently large) of "git diff" and "git show"
is a great help for inspecting DT changes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
