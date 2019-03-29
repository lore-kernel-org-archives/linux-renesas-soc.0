Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E15C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90B1A206B7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbfC2JrJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:47:09 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39472 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbfC2JrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 05:47:09 -0400
Received: by mail-vs1-f67.google.com with SMTP id g127so924090vsd.6;
        Fri, 29 Mar 2019 02:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IrrZ8I6KjNRK5iA6fKgmwYUPioJcOx0IMStCv5IxvgY=;
        b=WJ2tkHelXev50CZ/puJbfenwRLPI7mB2olPmCu+mFrvOGKwR/MTSBeTC5JM3Sv0/dQ
         JY1f8g2UTIYQ2ozpudBBJtbRWLey6HW72/8htnpPNC6J93gmpnjpn1DCFbjtC2Xdkscs
         93HhPV1NVx6+umkG2MTxpQ29vMIshBSGX7Dwu1paLgchl+5WZc5RVGGaK/UiONv9ByyV
         6c/AcPvxemki08YKa1RsGUf9Uaw7gSmnkyLREVtUGM2jkVmFVXsYiex86bOzDOaFmsmW
         ZL/pudMAYsIe2po63JkKR9P9K2xYduwYT6Uc0piMIsdz4eq9OY5zrZxjuK215ZQK8fO7
         jwew==
X-Gm-Message-State: APjAAAVT+rtpAvj8xL0Z7ZVAWTakAf4361perk2zxDQXDxcH1W0MayU7
        yGBomDVk8UiHjogWhusptz3bZoBI4JJlBUGl0hY=
X-Google-Smtp-Source: APXvYqz9rWSgOO2UkqqvfYPyv+KH0zNZZmNA0zvKqSvh9oFsCfFrFu/NJeM0ZDhIKRGeMHw4Wv3YkjxgNa58vbhqQzU=
X-Received: by 2002:a67:8546:: with SMTP id h67mr10549729vsd.11.1553852827616;
 Fri, 29 Mar 2019 02:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com> <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com> <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
In-Reply-To: <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Mar 2019 10:46:55 +0100
Message-ID: <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

On Fri, Mar 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 28.03.2019 12:30, Dirk Behme wrote:
> > On 28.03.2019 11:16, Dirk Behme wrote:
> >> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
> >>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com>
> >>> wrote:
> >>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and
> >>>> the
> >>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3],
> >>>> which
> >>>> mirrors v4.18-rc1 commit [4] in mainline.
> >>>>
> >>>> JFYI, quite far away in the delivery chain, we've received below
> >>>> report:
> >>>>
> >>>>> With this patch [2-4] there are reports about broken data
> >>>>> communication with 115200 baud with SXM module. Reverting
> >>>>> this patch results in successful communication, again.
> >>>>
> >>>> While this scarce information barely helps anybody, I thought that
> >>>> sharing it with you might be beneficial in case you collect several
> >>>> reports linked to this specific commit in future, meaning it
> >>>> potentially
> >>>> adds a regression.
> >>>>
> >>>> Also, if you are aware of any userland changes that might be
> >>>> required/assumed by this patch or in case you have any alternative
> >>>> ideas how to avoid reverting this patch, your feedback would be very
> >>>> appreciated.
> >>>
> >>> Thanks for your report!
> >>>
> >>> [TLDR: skip to the suggested fix below; I only noticed the bug after
> >>>         writing the below paragraphs, which are still useful
> >>> questions to
> >>>         let us reproduce the issue]
> >>>
> >>> Which SoC are you using?
> >>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
> >>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
> >>> hence the affected code path is not exercised:
> >>>
> >>>      sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
> >>>      sh-sci e6550000.serial: Using clk scif for 115200+0 bps
> >>>
> >>> Does your board have an external SCIF clock? Which frequency?
> >>> Can you check the clock values and deviation for your configuration, by
> >>> changing the calls to print the above information from dev_dbg() to
> >>> dev_info()?
> >>>
> >>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
> >>> of the posted patch, help?
> >>> Perhaps the sampling point shift is inverted? Does -shift work better?
> >>>
> >>> [possible solution]
> >>>
> >>>> +                               int shift = min(-8, max(7, deviation
> >>>> / 2));
> >>>
> >>> Oops, min and max are exchanged!
> >>>
> >>> I guess using
> >>>
> >>>      int shift = clamp(deviation / 2, -8, 7)
> >>>
> >>> instead fixes the issue?
> >>
> >>
> >> Uh, that was fast :) Many thanks!
> >>
> >> We will test this as fast as possible! But due to the long delivery
> >> chain Eugeniu mentioned this will take some time. I'll try my best to
> >> come back to you as fast as possible.
> >
> >
> > Just for the archives: We are testing the attached patch.
>
>
> * Testing the patch [5]
>
> - int shift = min(-8, max(7, deviation / 2));
> + int shift = clamp(deviation / 2, -8, 7);
>
> does *not* fix our issue. Or in other words: Testing was *not* successful.

I'm sorry to hear that.

> * However, from review point of view we think that it fixes a serious
> bug. So maybe it should be applied, anyhow?

Yes, submitted.

> * Using strace we managed to get some more information about the usage
> of the serial port [6]. With this, we are talking about 57600 and not 115200
>
> * Switching to dev_info() [7] as requested above we get
>
> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41,
> base_baud = 0) is a hscif
> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps
>
> * We are talking about a custom r8a7796 board

The above values match with what I see on Salvator-X, after disabling
scif_clk in DTS.

If your board does have scif_clk populated, you want to describe that in
DT, as it may improve the situation.

BTW, have you verified the actual clock rate used? It wouldn't be the
first time that a crystal description in DTS has a typo in its
clock-frequency property, breaking UART communication at "high"
speeds.
A simple way to do that is outputting a square wave using:

    yes U | tr -d "\n" > /dev/ttySC3

This should give an (approximate) square wave of 28797 Hz.

>  From 9a3c199f02cb66cb67e93e0824b03b622ab3b024 Mon Sep 17 00:00:00 2001
> From: Dirk Behme <dirk.behme@de.bosch.com>
> Date: Fri, 29 Mar 2019 06:39:31 +0100
> Subject: [PATCH] serial: sh-sci: Enable debug output
>
> Enable some debug output as requested by Geert in
>
> https://patchwork.kernel.org/patch/10322809/#22554727
>
> Change-Id: Icd2f97138516a0e40726fa1ccd50a69abb57cb76
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>   drivers/tty/serial/sh-sci.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index eba08cd892e5..32210cf2413c 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2161,7 +2161,7 @@ static int sci_brg_calc(struct sci_port *s,
> unsigned int bps,
>                         break;
>         }
>
> -       dev_dbg(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
> +       dev_info(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
>                 min_err, *dlr, *srr + 1);
>         return min_err;
>   }
> @@ -2376,7 +2376,7 @@ static void sci_set_termios(struct uart_port
> *port, struct ktermios *termios,
>
>   done:
>         if (best_clk >= 0)
> -               dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
> +               dev_info(port->dev, "Using clk %pC for %u%+d bps\n",
>                         s->clks[best_clk], baud, min_err);
>
>         sci_port_enable(s);

You way want to enable printing of the other debug lines that contain
"+d bps", for comparison with SCK and BRR alternatives.
But in the absence of a suitable scif_clk, the clock rate achieved using
the BRG is the best option.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
