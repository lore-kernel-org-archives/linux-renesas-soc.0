Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43716 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbeKMUXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 15:23:32 -0500
MIME-Version: 1.0
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org> <1541693247-15599-5-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-5-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 11:25:52 +0100
Message-ID: <CAMuHMdU1Zf2Z0i7So8gE1_=jB8kd045nQ=JCuf_kN4Mv8guZpQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] pinctrl: sh-pfc: r8a7792: Fix VIN versioned groups
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Thu, Nov 8, 2018 at 5:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Versioned VIN groups can appear on different sets of pins. Use of the
> VIN_DATA_PIN_GROUP macro fix naming of said groups through an optional
> 'version' argument.

I more liked the description from the previous version, which you retained
in PATCH 6/6, so I used that ;-)

> Use the 'version' argument for said macro to fix naming of versioned
> groups for R-Car V2H R8A7792 SoC.
>
> Fixes: 7dd74bb1f058 ("pinctrl: sh-pfc: r8a7792: Add VIN pin groups")
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Queuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
