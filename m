Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34260 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753284AbdDDLKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 07:10:22 -0400
Received: by mail-lf0-f49.google.com with SMTP id z15so90640636lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2017 04:10:22 -0700 (PDT)
Date: Tue, 4 Apr 2017 13:10:19 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: koelsch: Correct clock frequency of X2 DU
 clock input
Message-ID: <20170404111019.GF18945@bigcity.dyn.berto.se>
References: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
 <2246751.IOz92zzvZ6@avalon>
 <CAMuHMdXqEhjzo5PH3a7JyUsuCBpnDGibGabD5k5oVhZY=FkRow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXqEhjzo5PH3a7JyUsuCBpnDGibGabD5k5oVhZY=FkRow@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2017-04-04 12:31:39 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, Apr 4, 2017 at 12:05 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Monday 03 Apr 2017 11:55:19 Geert Uytterhoeven wrote:
> >> The X2 crystal oscillator on the Koelsch development board provides a
> >> 74.25 MHz clock, not a 148.5 MHz clock.
> >>
> >> Fixes: cd21cb46e14aae3a ("ARM: shmobile: koelsch: Add DU external pixel
> >> clocks to DT") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> Confirmed by schematics, user manual, and physical inspection of 2
> >> Koelsch instances (my scope has not enough bandwidth to measure the
> >> actual frequency).
> >
> > Stupid question, have you tested the corresponding (HDMI) DU output ? If so,
> 
> No I haven't.
> 
> Niklas, can you please fire up your display? Thanks!

Console during boot works and

modetest -M rcar-du -s 46:1920x1080-60Hz
modetest -M rcar-du -s 46:1280x720-60Hz
modetest -M rcar-du -s 46:720x480-60Hz

Produce stable test patterns.

Tested-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks ;-)
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

-- 
Regards,
Niklas S�derlund
