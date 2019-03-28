Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5663C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 09:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACB532173C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 09:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfC1JYP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 05:24:15 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41922 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbfC1JYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 05:24:15 -0400
Received: by mail-vs1-f68.google.com with SMTP id g187so11691105vsc.8;
        Thu, 28 Mar 2019 02:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e9d5vhUL6aKweUurzwNBc8A5dBUhld1kIxI1XXv1WOE=;
        b=Ob+6Gb/+GnO456PY6Z3HcGu/2OzSo3+l1oH87IA0lyZDcIeA1O5pp6J/fPApXGy5Zw
         AZ3sx+asXNjeiVS2WDc89PJSBy5t8EmS1g/BtM4RLxAk1sqKjACS5d4LojLbeSz3nM2Q
         PndoNrqKtq1gg7PyZVIlWwhBexWNUrVhUxGgSD/Oo44p4cmLIGScb33GkQJe7HV12bud
         NPK2daG6k6RimLhOUPsrKy9Q3cG8gbwGUyh3f+bGMiqx7/GvSE3UXm7daTgDRz68aOxI
         H45wDA1gyh2/3Rt6c7E0H90loPVStuxMAY+Z3bj4D9v+vCxJeEwed3V/q6bBtpKrQK3h
         PyDQ==
X-Gm-Message-State: APjAAAXOu9xbmbDRqJLx/deqIXrEi7wWGRugh8+gA5t3TkbzdgRI91zu
        9HlsnfgOQlzV8mrhILr4SvTr3kR0MhzE4dwlPX4=
X-Google-Smtp-Source: APXvYqzuOxtaXZ2urceSTtXs899r85ls5RE7fZxSC0plQZfqeG3uvlVLFuidLifHRJfFmI59Wc/8WH6l0P229B2PUFI=
X-Received: by 2002:a05:6102:199:: with SMTP id r25mr3909513vsq.166.1553765053805;
 Thu, 28 Mar 2019 02:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Mar 2019 10:24:01 +0100
Message-ID: <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
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

Hi Eugeniu,

On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and the
> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3], which
> mirrors v4.18-rc1 commit [4] in mainline.
>
> JFYI, quite far away in the delivery chain, we've received below report:
>
> > With this patch [2-4] there are reports about broken data
> > communication with 115200 baud with SXM module. Reverting
> > this patch results in successful communication, again.
>
> While this scarce information barely helps anybody, I thought that
> sharing it with you might be beneficial in case you collect several
> reports linked to this specific commit in future, meaning it potentially
> adds a regression.
>
> Also, if you are aware of any userland changes that might be
> required/assumed by this patch or in case you have any alternative
> ideas how to avoid reverting this patch, your feedback would be very
> appreciated.

Thanks for your report!

[TLDR: skip to the suggested fix below; I only noticed the bug after
       writing the below paragraphs, which are still useful questions to
       let us reproduce the issue]

Which SoC are you using?
I assume this is on a custom board, as Salvator-X(S) and ULCB have
external SCIF clock crystals, which allow to use a perfect 115200 bps,
hence the affected code path is not exercised:

    sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
    sh-sci e6550000.serial: Using clk scif for 115200+0 bps

Does your board have an external SCIF clock? Which frequency?
Can you check the clock values and deviation for your configuration, by
changing the calls to print the above information from dev_dbg() to
dev_info()?

Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
of the posted patch, help?
Perhaps the sampling point shift is inverted? Does -shift work better?

[possible solution]

> +                               int shift = min(-8, max(7, deviation / 2));

Oops, min and max are exchanged!

I guess using

    int shift = clamp(deviation / 2, -8, 7)

instead fixes the issue?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
