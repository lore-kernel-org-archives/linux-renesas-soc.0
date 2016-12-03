Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33418 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbcLCK3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Dec 2016 05:29:17 -0500
Received: by mail-io0-f194.google.com with SMTP id j92so12840253ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Dec 2016 02:29:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU8mvXkhaUJJKu7KPxHsjt4k4Z3MreFiwRggGV0NkamyA@mail.gmail.com>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480693434-9415-3-git-send-email-jacopo@jmondi.org> <CAMuHMdU8mvXkhaUJJKu7KPxHsjt4k4Z3MreFiwRggGV0NkamyA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Dec 2016 11:29:16 +0100
Message-ID: <CAMuHMdVqt2LCcm-zX83bMSWYe93D1NTBP15fzK=Cqw0NWybswA@mail.gmail.com>
Subject: Re: [RFC 2/3] dts: arm: genmai: Add MAXDESREF4x spidev
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 2, 2016 at 8:23 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> +                       compatible = "linux,spidev";
>
> These days you should use "maxim,max11100", and at that compatible

s/at/add/, of course

> value to drivers/spi/spidev.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
