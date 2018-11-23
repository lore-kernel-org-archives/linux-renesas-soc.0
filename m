Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33462 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbeKWWuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 17:50:15 -0500
MIME-Version: 1.0
References: <20181123105428.13457-1-phil.edworthy@renesas.com> <20181123105428.13457-2-phil.edworthy@renesas.com>
In-Reply-To: <20181123105428.13457-2-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 13:06:02 +0100
Message-ID: <CAMuHMdW8_1cuLNyUFVVfdydbRmiqY6F+-Qfj9XEX3enz4-z00A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rzn1: Fix of_get_child_count() error check
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 23, 2018 at 11:54 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> If we assign the result of of_get_child_count() to an unsigned int,
> the code will not detect any errors. Therefore assign it to an int
> instead.

Note that currently of_get_child_count() never returns a negative
error code. But it does return int, not unsigned int.

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
