Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33315 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbeKHUeP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:34:15 -0500
MIME-Version: 1.0
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org> <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 11:59:08 +0100
Message-ID: <CAMuHMdWsUWSmE2tbHhXEbNGrac+tw0o3kYnOrN21c30cq-c9kA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
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

On Tue, Nov 6, 2018 at 11:35 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Versioned VIN groups can appear on different sets of pins. Using the
> VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
> an optional 'version' argument.
>
> Use the 'version' argument for said macro to fix naming of versioned
> groups for R-Car SoCs that defines them.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Fixes: 7dd74bb1f058786e ("pinctrl: sh-pfc: r8a7792: Add VIN pin groups")
Fixes: a5c2949ff7bd9e04 ("pinctrl: sh-pfc: r8a7796: Deduplicate VIN4 pin
Fixes: 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
