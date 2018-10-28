Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:44200 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbeJ1WNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Oct 2018 18:13:48 -0400
MIME-Version: 1.0
References: <20181021200048.2114-1-wsa+renesas@sang-engineering.com> <20181021200048.2114-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200048.2114-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 28 Oct 2018 14:28:56 +0100
Message-ID: <CAMuHMdUBf7AZSeEX4SffGapBRainhRCoKKVrEXA1dmyM=7kh6A@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi: spi-rspi: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sun, Oct 21, 2018 at 10:03 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Build tested only. buildbot is happy.

How disappointing, you do have a Lager ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
