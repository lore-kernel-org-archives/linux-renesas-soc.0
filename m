Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:45714 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754378AbeFYJmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 05:42:07 -0400
Received: by mail-ua0-f193.google.com with SMTP id l5-v6so997144uad.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jun 2018 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180619181835.23926-1-geert+renesas@glider.be>
 <20180620090320.kxgq2cavrzg727p6@verge.net.au> <20180625093433.l6tt332iv5uavexu@verge.net.au>
In-Reply-To: <20180625093433.l6tt332iv5uavexu@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Jun 2018 11:41:55 +0200
Message-ID: <CAMuHMdVu9jozG-XAUyntzQeTDt16LA7CAnzQSd8ZweYC5cVzmg@mail.gmail.com>
Subject: Re: [PATCH] [LOCAL/RFC] MAINTAINERS: renesas_defconfig does not exist upstream
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Jun 25, 2018 at 11:34 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 20, 2018 at 11:03:21AM +0200, Simon Horman wrote:
> > On Tue, Jun 19, 2018 at 08:18:35PM +0200, Geert Uytterhoeven wrote:
> > > Make sure patches for arch/arm64/configs/renesas_defconfig are sent to
> > > the right people, and don't bother anyone outside linux-renesas-soc.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Not intended for upstream merge.
> > >
> > > Is this a good idea, or will it cause too many merge conflicts in
> > > MAINTAINERS?
> >
> > It seems like a good idea to me.
> > We can drop it if it becomes a headache.
>
> Geert, shall I apply this to topic/renesas-defconfig?

Yes please. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
