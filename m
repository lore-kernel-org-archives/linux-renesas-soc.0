Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:37827 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbdHQHdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 03:33:38 -0400
Received: by mail-pg0-f47.google.com with SMTP id y129so37419225pgy.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Aug 2017 00:33:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 09:33:37 +0200
Message-ID: <CAMuHMdXX6tfwyWGXWhT-=4LwoBAqbJxmcwzEe0uQE2uFORLh1A@mail.gmail.com>
Subject: Re: Status of r8a7795 SDHI support?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Thu, Aug 17, 2017 at 9:23 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> since ages I tried recent mainline (v4.13-rc5) on a custom r8a7795 board.

R-Car H3 ES1.x or ES2.0?

> I tried with the attachment and picked some patches from
> renesas-drivers-2017-08-16-v4.13-rc5 [1] but it doesn't look like any SD
> card / eMMC is detected at all [2].

That patch is for ES2.0. There are indeed no SDHI pins in the upstream pinctrl
driver for ES2.0 yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
