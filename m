Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33004 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbeHGKnl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:43:41 -0400
Received: by mail-ua0-f193.google.com with SMTP id i4-v6so15236514uak.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Aug 2018 01:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <87effbvw77.wl-kuninori.morimoto.gx@renesas.com>
 <87a7pywq7b.wl-kuninori.morimoto.gx@renesas.com> <1657886.YgBlprSStX@avalon>
In-Reply-To: <1657886.YgBlprSStX@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 10:30:14 +0200
Message-ID: <CAMuHMdU4sRQJxWH43r-R2+3aAObOuSDTtQAHuL-_1X77b4+zvg@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the
 ULCB boards' compatible
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
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
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Aug 7, 2018 at 10:21 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 7 August 2018 11:18:11 EEST Kuninori Morimoto wrote:
> > > Yeah, it is true "so far". I think there is no problem on current kernel.
> > > But, unfortunately we need to keep compatibility for old/new DT
> > > (= actually, I don't like this DT rule. It is 100% "shackles for the
> > > legs")
> > > Thus, my big concern is that, in the future,
> > > "if" we added "renesas,ulcb" compatible driver/soc,
> > > both h3/m3 ulcb will use it.
> > > Then, if "h3" can work/boot by using same "m3" settings, it is no problem
> > > for me (= "works but limited" is also OK, of course.
> > >
> > >  This means "matched to more generic compatible")
> >
> > "renesas,ulcb" is very generic naming.
> > Not only h3/m3, if we had v3/e3/d3 etc ulcb,
>
> Furthermore, "ulcb" is an unofficial term, the boards are named "starter kit"
> (SK). Using internal names in code or device tree sources is a normal practice
> and is fine with me, but I'm a bit bothered by the fact that the H3/M3 boards
> are called ULCB in DT, while the V3 board are called SK. I wonder if we should
> unify that or if it's too late.

Perhaps we should.

Renesas has a long history of boards named <foo>SK or RSK<foo>.
The inconsistency started when suddenly SK was spelled out in full, with
"Premier" or "Pro" added to differentiate, and the need arose for a shorter
nickname, which became "ULCB"....

> > and if we had such compatible driver/soc, it needs to match to all ulcb.
> > In reality, maybe we don't create such compatible driver, though.
> > But, I don't know, I can follow to maintainer opinion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
