Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:54219 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbeHIAE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 20:04:28 -0400
Received: by mail-wm0-f67.google.com with SMTP id s9-v6so4230879wmh.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Aug 2018 14:42:53 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Wed, 8 Aug 2018 23:42:41 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the
 ULCB boards' compatible
Message-ID: <20180808214241.GA22682@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <87effbvw77.wl-kuninori.morimoto.gx@renesas.com>
 <87a7pywq7b.wl-kuninori.morimoto.gx@renesas.com>
 <1657886.YgBlprSStX@avalon>
 <CAMuHMdU4sRQJxWH43r-R2+3aAObOuSDTtQAHuL-_1X77b4+zvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4sRQJxWH43r-R2+3aAObOuSDTtQAHuL-_1X77b4+zvg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert, Laurent, Morimoto-san,

On Tue, Aug 07, 2018 at 10:30:14AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, Aug 7, 2018 at 10:21 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tuesday, 7 August 2018 11:18:11 EEST Kuninori Morimoto wrote:
> > > > Yeah, it is true "so far". I think there is no problem on current kernel.
> > > > But, unfortunately we need to keep compatibility for old/new DT
> > > > (= actually, I don't like this DT rule. It is 100% "shackles for the
> > > > legs")
> > > > Thus, my big concern is that, in the future,
> > > > "if" we added "renesas,ulcb" compatible driver/soc,
> > > > both h3/m3 ulcb will use it.
> > > > Then, if "h3" can work/boot by using same "m3" settings, it is no problem
> > > > for me (= "works but limited" is also OK, of course.
> > > >
> > > >  This means "matched to more generic compatible")
> > >
> > > "renesas,ulcb" is very generic naming.
> > > Not only h3/m3, if we had v3/e3/d3 etc ulcb,
> >
> > Furthermore, "ulcb" is an unofficial term, the boards are named "starter kit"
> > (SK). Using internal names in code or device tree sources is a normal practice
> > and is fine with me, but I'm a bit bothered by the fact that the H3/M3 boards
> > are called ULCB in DT, while the V3 board are called SK. I wonder if we should
> > unify that or if it's too late.
> 
> Perhaps we should.
> 
> Renesas has a long history of boards named <foo>SK or RSK<foo>.
> The inconsistency started when suddenly SK was spelled out in full, with
> "Premier" or "Pro" added to differentiate, and the need arose for a shorter
> nickname, which became "ULCB"....

I really appreciate your comments, but it looks like at least the
following open questions prevent this series to advance into v2 (feel
free to point out flaws in my understanding):
 - [A] it is not clear if H3ULCB, M3ULCB and M3NULCB boards should use
       a common compatible string or dedicated ones.
 - [B] In case a common string is used for all *ULCB boards, should it
       drop the unofficial "ulcb" (Ultra Low Cost Board, thanks Laurent)
       in exchange to "sk", "starter-kit" or similar?
 - [C] Same as [A] and [B], but applied to ULCB DTS filenames, which are
       currently formed based on the same "ulcb" stem.

IMHO these questions go somewhat beyond the scope of M3-N ULCB bring-up.
In spite of this, I would be happy to implement your proposals. I am
also fine to wait a couple more days to collect more feedback, as well
as let the ideas/thoughts to settle. However, if you expect the latter
to take longer, maybe we can find some "acceptable" solution and defer
the naming issues to a later point?

Thanks,
Eugeniu.
