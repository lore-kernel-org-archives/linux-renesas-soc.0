Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33381 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbeINOAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 10:00:13 -0400
Received: by mail-it0-f66.google.com with SMTP id j198-v6so4091596ita.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 01:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato> <20180725202005.lflrjvz4aubqskq7@tetsubishi>
 <CACRpkdY2OyDqCOvwr_oPRdrh1VMnvD2e=eawyaKCNbQHfFAq4g@mail.gmail.com> <CAMuHMdWcKHYnyhinzsc-jkLBy+pEypD=Hz_XP0Fy4XyTYszpsA@mail.gmail.com>
In-Reply-To: <CAMuHMdWcKHYnyhinzsc-jkLBy+pEypD=Hz_XP0Fy4XyTYszpsA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Sep 2018 10:46:32 +0200
Message-ID: <CACRpkdb-dSaj=Jn5XsLu6YEDHur4gpGos0mfmYgqYVrZEvYLQA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not available
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 11, 2018 at 2:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Jul 29, 2018 at 11:33 PM Linus Walleij <linus.walleij@linaro.org> wrote:> > On Wed, Jul 25, 2018 at 10:20 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > That all being said, I think this patch is still useful as is.
> > >
> > > Linus, do you have time to comment on this?
> >
> > This looks like a good solution to me.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Any plans to apply it? drivers/gpio/gpiolib.c is your territory, I believe ;-)

Ooops sorry.

Patch applied.

Yours,
Linus Walleij
