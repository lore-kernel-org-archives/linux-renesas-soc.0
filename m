Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36714 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbeKHWqv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:46:51 -0500
MIME-Version: 1.0
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <38b17a18-59d6-3fbf-8413-915005b274f6@cogentembedded.com>
In-Reply-To: <38b17a18-59d6-3fbf-8413-915005b274f6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 14:11:12 +0100
Message-ID: <CAMuHMdXJ=nwrgwuKv++Jn14onbp8p2oXbXqD7pg_NBdYfoq7Gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add QSPI pins, groups, and functions
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 6, 2018 at 7:53 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> From: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
>
> Add the QSPI{0|1} pins/groups/functions to the R8A77970 PFC driver.
>
> [Sergei: ported to the upstream driver, fixed up the swapped QSPI0 SPCLK/
> SSL pins, fixed up the comments, moved the QSPI pins/groups/functions to
> be in the alphanumeric order, removed unneeded empty lines, renamed the
> patch.]
>
> Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
