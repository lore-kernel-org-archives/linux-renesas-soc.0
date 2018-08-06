Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:34739 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731868AbeHFRU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 13:20:29 -0400
MIME-Version: 1.0
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com> <20180806145958.k7bt6buvekfbyxnw@ninjato>
In-Reply-To: <20180806145958.k7bt6buvekfbyxnw@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 17:10:44 +0200
Message-ID: <CAMuHMdX5QcZOzGArJaZPoX1DMLMgCK97-2pZM2MCEL+Vs5SWPg@mail.gmail.com>
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, Aug 6, 2018 at 5:00 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > "platform suspend"? Is that s2ram aka a full PSCI system suspend?
>
> It is this:
>
> echo platform > /sys/power/pm_test
> echo mem > /sys/power/state

Thanks!

> Is there a better name for it?

I don't know. It never gets to the actual system suspend step.

> The HDD was also spinning down/up during the cycle...
>
> > I guess not, as it is supposed to fail without PCA9654 suspend/resume support...
>
> Yeah, I was wondering about that last time, too.
>
> > So more information is needed to convince me ;-)
>
> Here they are :)

With "platform", it doesn't do the full cycle.
Please try without that step, or do "echo none > /sys/power/pm_test".

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
