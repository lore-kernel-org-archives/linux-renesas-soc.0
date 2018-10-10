Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42373 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbeJJS2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 14:28:01 -0400
Received: by mail-vs1-f65.google.com with SMTP id e126so4595174vsc.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Oct 2018 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX=Ys8aq0ehqu9gZchC9bKtgzF9-Tg6-DoTrzMX68SwTg@mail.gmail.com>
 <OSBPR01MB2103F004406C18F6630CD91BB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdUHQ=AHPctY=b7sa0TVUwohP0-d4E2wSMXJ55EQfrLbYA@mail.gmail.com>
 <OSBPR01MB21036654864AE07375A91023B8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103489A3F5C679650B3436BB8E70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdVq3XqkEECzM+xG37o5zqQquu2n6w_-J8mQxU+Dcs+7Kg@mail.gmail.com> <OSBPR01MB2103F030C3C503773FF99EAFB8E00@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103F030C3C503773FF99EAFB8E00@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 13:06:09 +0200
Message-ID: <CAMuHMdWOoTwAVkfWqqEE15aCsVxfD8+6nJ4QqUupCSp7DxZYKQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
To: Biju Das <biju.das@bp.renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Wed, Oct 10, 2018 at 11:50 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Note:-
> > >
> > > For R-Car M3-W board, inconsistency-check and nanosleep tests are
> > working fine.
> > >
> > > However  there is a failure with clocksource_switch  "asynchronous"  test.
> > > The inconsistency-check is failing  for "arch_sys_counter" after some
> > > clocksource_switch operations
> > >
> > > So I skipped the "clocksource_switching"  for  arch_sys_counter  and
> > > the asynchronous test is passing for
> > > CMT0/1/2/3 timers.
> >
> > Sorry, being no timer expert, I don't understand the impact of the above
> > paragraph.
>
> We may start a discussion on this, when we start upstreaming CMT for R-Car M3-W devices.
>
> Basically clocksource_switch  test in "selftests "uses 2 threads,
> In 1 thread it executes inconsistency-check test followed by nano sleep test
> and on the  second thread it keep changing clock source one after the another.
>
> This test always fails  on R-Car M3-W which is based on arm64.

Sergei already enabled CMT on R-Car V3M and V3H, perhaps he has seen
similar issues?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
