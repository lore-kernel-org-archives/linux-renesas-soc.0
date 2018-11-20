Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46878 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbeKTSz1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 13:55:27 -0500
MIME-Version: 1.0
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <0f421bfb-8d5b-1a28-e5e5-2cbccfc62479@cogentembedded.com>
In-Reply-To: <0f421bfb-8d5b-1a28-e5e5-2cbccfc62479@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Nov 2018 09:27:20 +0100
Message-ID: <CAMuHMdVvT_XNoQABhBsHYVdhiKkGv8MMr7Vxz=sYMq2vH9jekw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77980: add QSPI pins, groups, and functions
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 19, 2018 at 6:30 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> From: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
>
> Add the QSPI{0|1} pins/groups/functions to the R8A77980 PFC driver.
>
> [Sergei: ported to the upstream driver, fixed up the swapped QSPI0 SPCLK/
> SSL pins, fixed up the comments, moved the QSPI pins/groups/functions to
> be in the alphanumeric order, removed unneeded empty lines, renamed the
> patch.]
>
> Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
