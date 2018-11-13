Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44256 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbeKMUXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 15:23:13 -0500
MIME-Version: 1.0
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org> <1541693247-15599-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-4-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 11:25:32 +0100
Message-ID: <CAMuHMdWuuMOFkQbOUc-uuPCZ0dLZARq0X_dTvwQcVVK-HZRc5A@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] pinctrl: sh-pfc: r8a77990: Add VIN[4|5] groups/functions
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

On Thu, Nov 8, 2018 at 5:07 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add pin, mux and functions definitions for VIN4 and VIN5 for R-Car E3.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. queuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
