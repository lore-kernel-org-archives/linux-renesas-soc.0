Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86D2C4321A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2F5F206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfDZJmZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:42:25 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46501 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfDZJmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:42:24 -0400
Received: by mail-vs1-f67.google.com with SMTP id e2so1531708vsc.13;
        Fri, 26 Apr 2019 02:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9511K6JgBr+IbA4Fszoo2CtE7O51bF0vnC6ZdRs0iUU=;
        b=Fg4df24YA7LfhS8N/H9t850pEQCEMbA5zl+NvEbAr531qfBbD6IT8DYk4RFoiYJ8g4
         /GassBNeptlKpqMp6RhPjjn1ilr6RwZ9P+ZayYXqS219f2CaKA8ZkB5OPFHz5GPNhIYW
         OzoldRGwUW186NOs3nznvIlzUMW9zGOnJdgBvA0wwVkPhh9GkGCloMUTbGkrLPXmDDVg
         34FaHRCPWUzgP9fn06ZNWnMa7ujvMdCU7HEB/NgAk093v/UIEKo35r0t/v1oLhNOOhmL
         7DpxFStoYgRyIsHpiuZCREUI/y+WRnGf7tCIQL/dMc5Kxw7E79ilni+ePyXapLW/KkQN
         qPSQ==
X-Gm-Message-State: APjAAAXyE4XtdRtXWjSfkt6a3Qu6J71roxrPKUZpMffIFmJoYU/nzX7E
        wSFluAHU2CV7hyeT9d7+Ww4oFfKdJnQVRNT0EYc=
X-Google-Smtp-Source: APXvYqyG6hM0RhoKKtYo/aiU7hHq73OVvijlmP4QOwNPt6JJZ0sGD4glyhpeiYEGiLB62zx9e0AdKJMIx5a/23G8SYA=
X-Received: by 2002:a05:6102:1d2:: with SMTP id s18mr5977336vsq.11.1556271743440;
 Fri, 26 Apr 2019 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190425095542.726-1-geert+renesas@glider.be> <20190425095542.726-4-geert+renesas@glider.be>
 <20190426093454.pvmc426w5wca2jj3@verge.net.au>
In-Reply-To: <20190426093454.pvmc426w5wca2jj3@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Apr 2019 11:42:11 +0200
Message-ID: <CAMuHMdW1T-LCRN0R=3bh1gq1Ai3g1jgy8jcxQP6Xd0uVDeHHwA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: Add check for empty pinmux groups/functions
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Apr 26, 2019 at 11:35 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Apr 25, 2019 at 11:55:41AM +0200, Geert Uytterhoeven wrote:
> > The pinmux groups and functions arrays may contain two parts, to ease
> > supporting SoCs that expose pin subsets of other related SoCs.  Both
> > parts need to be declared with explicit sizes, which thus need to be
> > updated when adding support for more groups and functions.
> >
> > If a size is too small, the compiler will detect this at build time
> > ("excess elements in array initializer").
> > If a size is too large, this may go undetected (for pin groups), lead to
> > pin controller registration failures (for pin functions: "pinmux ops has
> > no name for functionN"), or crash the optional run-time debug code (for
> > pin groups).
> >
> > Extend the run-time debug code with checks to detect this, to help
> > catching bugs early.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you!

> > --- a/drivers/pinctrl/sh-pfc/core.c
> > +++ b/drivers/pinctrl/sh-pfc/core.c
> > @@ -780,9 +780,15 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
> >
> >       for (i = 0; i < info->nr_functions; i++) {
> >               func = &info->functions[i];
> > +             if (!func->name) {
> > +                     pr_err("%s: empty function %u\n", drvname, i);
> > +                     sh_pfc_errors++;
>
> Not strictly related to this patch but did
> you consider not having sh_pfc_errors global to this file?

Do you have an alternative?
I could hide it, and combine it with the pr_err() in a sh_pfc_report_error()
function, but it would still be global.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
