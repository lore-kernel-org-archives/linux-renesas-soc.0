Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0107.outbound.protection.outlook.com ([104.47.93.107]:23800
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725935AbeKBVML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:12:11 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Dave Airlie <airlied@linux.ie>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: RE: [RFC] drm/bridge/sii902x: Fix EDID readback
Date: Fri, 2 Nov 2018 12:05:05 +0000
Message-ID: <OSBPR01MB1766BE0BE66B3CE2644F059DC0CF0@OSBPR01MB1766.jpnprd01.prod.outlook.com>
References: <1540990667-14109-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdarsCKrb4OepC+7LNi9epRks48b4F_5eXJ_on1OJ+h1Mg@mail.gmail.com>
 <TY1PR01MB177051AC6C2B556E32AC08AEC0CD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181101112117.GA6425@sirena.org.uk>
In-Reply-To: <20181101112117.GA6425@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Mark,

Thank you for your feedback!

> Subject: Re: [RFC] drm/bridge/sii902x: Fix EDID readback
>
> On Wed, Oct 31, 2018 at 04:55:53PM +0000, Fabrizio Castro wrote:
>
> > Having the option of using "unlocked" flavours of reads and writes
> > is what we need here, but looking at drivers/base/regmap/regmap-i2c.c
> > I couldn't find anything suitable for my case, maybe Mark could advise
> > on this one? I am sure I overlooked something here, is there a better
> > way to address this?
>
> As Linus said you can go as far as writing your own read and write
> functions if you want to.  That seems to be the easiest thing, though I
> am suspicous that you're having to use the I2C framework in this way -
> it doesn't sound terribly clever.  You could I guess also just have a
> custom function for whatever register is doing all this stuff that just
> ignores regmap and bodge things that way while using regmap as normal
> for everything else.

I agree, I have prototyped it and it seems to be working just fine.
Will send a patch addressing all of the comments, including this one.

Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
