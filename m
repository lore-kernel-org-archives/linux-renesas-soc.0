Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40467 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbeIKRDI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 13:03:08 -0400
MIME-Version: 1.0
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato> <20180725202005.lflrjvz4aubqskq7@tetsubishi>
 <CACRpkdY2OyDqCOvwr_oPRdrh1VMnvD2e=eawyaKCNbQHfFAq4g@mail.gmail.com>
In-Reply-To: <CACRpkdY2OyDqCOvwr_oPRdrh1VMnvD2e=eawyaKCNbQHfFAq4g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Sep 2018 14:03:53 +0200
Message-ID: <CAMuHMdWcKHYnyhinzsc-jkLBy+pEypD=Hz_XP0Fy4XyTYszpsA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not available
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Sun, Jul 29, 2018 at 11:33 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jul 25, 2018 at 10:20 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > That all being said, I think this patch is still useful as is.
> >
> > Linus, do you have time to comment on this?
>
> This looks like a good solution to me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Any plans to apply it? drivers/gpio/gpiolib.c is your territory, I believe ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
