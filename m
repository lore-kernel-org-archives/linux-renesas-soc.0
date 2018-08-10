Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728403AbeHJSUw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 14:20:52 -0400
MIME-Version: 1.0
References: <1533221599-52948-1-git-send-email-biju.das@bp.renesas.com>
 <5b6cc303.1c69fb81.26116.320b@mx.google.com> <OSBPR01MB2103F54A22AD3A78011F2446B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20180810111328.5w3nizvuaashxi6h@verge.net.au>
In-Reply-To: <20180810111328.5w3nizvuaashxi6h@verge.net.au>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Aug 2018 09:50:15 -0600
Message-ID: <CAL_JsqJZiypRkwKJPBYUR-FOyMJLiM0qKdt9LK1QEHgQ1Vp6Mw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 10, 2018 at 5:13 AM Simon Horman <horms@verge.net.au> wrote:
>
> On Fri, Aug 10, 2018 at 07:37:18AM +0000, Biju Das wrote:
> > Hi Rob,
> >
> > > Subject: Re: [PATCH v2 2/5] soc: renesas: rcar-sysc: Add r8a774a1 support
> > >
> > > Hi, this is an automated email from Rob's (experimental) review bot. I found
> > > a couple of common problems with your patch. Please see below.
> >
> > Do I need to send another patch? The mail says " Rob's (experimental)
> > review bot".  Previously for RZ/G1C upstreaming I have submitted the
> > patches in similar fashion.  Is anything changed?
>
> Yes, indeed.
>
> At one point I was enforcing such a split but as it did not seem to be a
> universal practice I stopped doing so.  I'd like some clear guidance from
> Rob if he'd like this split to occur going forwards.

I've generally not asked for either of these on 1 (or few) line
changes or if I had no other comments on the patch. But for automated
checking I'm not going to try to make that distinction. So, still up
to whomever applies them.

BTW, I'm adding the splitting patches check to checkpatch.pl too.

Rob
