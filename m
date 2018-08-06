Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:34219 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbeHFUsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 16:48:19 -0400
MIME-Version: 1.0
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com>
 <20180806145958.k7bt6buvekfbyxnw@ninjato> <CAMuHMdX5QcZOzGArJaZPoX1DMLMgCK97-2pZM2MCEL+Vs5SWPg@mail.gmail.com>
 <20180806170432.26uxlzaqvhtjcp6w@ninjato>
In-Reply-To: <20180806170432.26uxlzaqvhtjcp6w@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 20:37:44 +0200
Message-ID: <CAMuHMdX8ypugACi2bqL=z6Y0iXZv+C6z3hh3vKF-EQA-10f42g@mail.gmail.com>
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

On Mon, Aug 6, 2018 at 7:04 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Please try without that step, or do "echo none > /sys/power/pm_test".
>
> Did this now with a q'n'd hacked gpio driver (see below). Worked like a
> charm. So, the sata_rcar patch under discussion here seems to be fine.
> We only need the GPIO resume on specific boards. This is a seperate
> task. D'accord?

Thanks for testing!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
