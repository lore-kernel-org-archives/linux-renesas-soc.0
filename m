Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733A7C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CFC52084C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 08:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfAVIE3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 03:04:29 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:37381 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbfAVIE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 03:04:28 -0500
Received: by mail-ua1-f65.google.com with SMTP id u19so7765356uae.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 00:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T+qLohvGgMHPST9qVWjVZ09BNtkE+xeVD9jOZ9GRyZI=;
        b=CBmKQe1UBhPLDBAFGF4UuGIvWd2hvkdAWUIHjmaDZBUwYBHOmgv3ZR9Ank0RqjvzU7
         4atvJXpVZRl5fiAnGAF+mOy/IfhpB/ibs/tSPaQUpwGOpuz2zRdMX5PQSZKU3gmTErbA
         WjoRkc2UftgzOCKUyGLiR5fM0S/IRV79xI5XzfovLl+UNT94e+GJVANg2MBNTo3Nbd0X
         3lv9aMph0e5O2l0vDSe3Ab3OLadh41o/togOjRaTcyIfKiV3HvmTJHfLhYKdZYrVmVUp
         ACnv7B2t0fiM0zXz4MEQyWkpJA46nK/B9SPjRvBFQUi3dV3E8i9uU5iRrEk6fDZe96L2
         lshA==
X-Gm-Message-State: AJcUukdH10XajfP/OJtE72HiHglRblCb41GKMG9+Inp/hs0Q66IRFmFz
        6a1xqYVKVSNiVIUACziaXRSLgONY2j/SCdtHyYYXot4A
X-Google-Smtp-Source: ALg8bN4/FPPcvc2CkQi9v3ek4lK9LmE81LYYguJX3eJoZSFXa5LNxGt0KMWKdCDT9Z4phB8NVAFOQotoqgHYDR0dBdk=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr12811000uae.75.1548144267693;
 Tue, 22 Jan 2019 00:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20190118162258.14592-1-geert+renesas@glider.be>
 <20190121093506.GQ3271@phenom.ffwll.local> <CAMuHMdUzhPg_sR93J2jADS-x-NFofPJR=d6a6qpt50mhyhU-xQ@mail.gmail.com>
 <20190121101826.GT3271@phenom.ffwll.local> <20190122030710.GA11769@pendragon.ideasonboard.com>
In-Reply-To: <20190122030710.GA11769@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 09:04:15 +0100
Message-ID: <CAMuHMdWq_EOLSmgnmNxsnCA4F=BgsQggx0ww66DjqG6uchQ9xQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] drm: Remove unused Renesas SH Mobile DRM driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Jan 22, 2019 at 4:07 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 21, 2019 at 11:18:26AM +0100, Daniel Vetter wrote:
> >  On Mon, Jan 21, 2019 at 11:03:44AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Jan 21, 2019 at 10:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >> On Fri, Jan 18, 2019 at 05:22:58PM +0100, Geert Uytterhoeven wrote:
> > >>> Since its incarnation in v3.7 almost 7 years ago, no users of the SH
> > >>> Mobile DRM driver have appeared.
> > >>>
> > >>> Hence remove the driver.  It can be resurrected from git history,
> > >>> if/when needed.
> > >>>
> > >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>
> > >> I'd prefer removing the fbdev variant tbh ...
> > >
> > > I understand ;-)
> > >
> > > But sh_mobile_lcdc_fb is used on 5 legacy SuperH platforms, and 1 ARM
> > > platform. At least the latter is working fine.
> > >
> > >> Not sure why exactly the switch never happened.
> > >
> > > Me neither.  I^HGoogle can't even find posted patches of board integration.
> > >
> > > Note that both drivers lack DT support, which would be very desirable on
> > > ARM, as graphics is the single remaining working driver on the Atmark
> > > Techno Armadillo 800 EVA board not using DT.
> >
> >  Ah I wondered why the drm driver isn't just automatically picked up in
> >  today's neat world of DT (if you enable it in .config instead of the fbdev
> >  one). It's not even using DT yet :-/
>
> I'd prefer dropping the fbdev driver too, but that would require porting
> the SH boards to the DRM driver, and implement DT support for the ARM
> board. I don't think anyone is willing to invest time in this, so I'm
> fine dropping this driver as the boards are pretty much dead. I would,
> however, also drop the fbdev driver in that case.

I agree the SH boards are pretty much dead.

However, derivatives of the Armadillo-800 EVA board are still available[1],
and even received a product update last month[2].
A relative made it to the International Space Station in 2017[3].

[1] https://armadillo.atmark-techno.com/products
[2] https://armadillo.atmark-techno.com/armadillo-840
[3] https://lists.freedesktop.org/archives/gstreamer-devel/2017-July/064696.html

BTW, do you still have the prototype integration patches for the DRM driver,
presumably for SH-Mobile AP4?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
