Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:45290 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbeISOuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:50:25 -0400
Received: by mail-vk1-f193.google.com with SMTP id b78-v6so977518vka.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Sep 2018 02:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180918085053.lu2k46vqffzj37ah@verge.net.au> <CAMuHMdVYPgfXvOzUOOLEwb_uy9Jo=V_Wkcr6mnTbo=YsAk2f0g@mail.gmail.com>
 <20180919090823.qyonqdzlvpkr5qqk@verge.net.au>
In-Reply-To: <20180919090823.qyonqdzlvpkr5qqk@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 11:13:14 +0200
Message-ID: <CAMuHMdWB5XZo+bJFmEmfVk61jwnudeV5FwgcQ7eyXZkEB8_Oig@mail.gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
To: Simon Horman <horms@verge.net.au>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Sep 19, 2018 at 11:08 AM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Sep 18, 2018 at 12:07:50PM +0200, Geert Uytterhoeven wrote:
> > [*] The only regression I'm aware of is a regression in 4.14-stable, which can
> >     be fixed by "tick/nohz: Prevent bogus softirq pending warning".
> >     (https://lore.kernel.org/patchwork/patch/979451/).
>
> Is that something we want to add to LTSI-4.14?

As that is a fix for a regression introduced in v4.14.62, I think it should
be fixed in 4.14-stable instead (and hopefully be fixed automatically in
v4.14.x-ltsi rc2 or final).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
