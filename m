Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:51988 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731989AbeHGKex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:34:53 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: arm: don't embed SoC name into the ULCB boards' compatible
Date: Tue, 07 Aug 2018 11:22:22 +0300
Message-ID: <1657886.YgBlprSStX@avalon>
In-Reply-To: <87a7pywq7b.wl-kuninori.morimoto.gx@renesas.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <87effbvw77.wl-kuninori.morimoto.gx@renesas.com> <87a7pywq7b.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tuesday, 7 August 2018 11:18:11 EEST Kuninori Morimoto wrote:
> Hi Eugeniu, again
> 
> > Yeah, it is true "so far". I think there is no problem on current kernel.
> > But, unfortunately we need to keep compatibility for old/new DT
> > (= actually, I don't like this DT rule. It is 100% "shackles for the
> > legs")
> > Thus, my big concern is that, in the future,
> > "if" we added "renesas,ulcb" compatible driver/soc,
> > both h3/m3 ulcb will use it.
> > Then, if "h3" can work/boot by using same "m3" settings, it is no problem
> > for me (= "works but limited" is also OK, of course.
> > 
> >  This means "matched to more generic compatible")
> 
> "renesas,ulcb" is very generic naming.
> Not only h3/m3, if we had v3/e3/d3 etc ulcb,

Furthermore, "ulcb" is an unofficial term, the boards are named "starter kit" 
(SK). Using internal names in code or device tree sources is a normal practice 
and is fine with me, but I'm a bit bothered by the fact that the H3/M3 boards 
are called ULCB in DT, while the V3 board are called SK. I wonder if we should 
unify that or if it's too late.

> and if we had such compatible driver/soc, it needs to match to all ulcb.
> In reality, maybe we don't create such compatible driver, though.
> But, I don't know, I can follow to maintainer opinion.

-- 
Regards,

Laurent Pinchart
