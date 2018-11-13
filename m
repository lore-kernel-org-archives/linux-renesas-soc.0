Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43121 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732115AbeKMUWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 15:22:07 -0500
MIME-Version: 1.0
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org> <1541693247-15599-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-2-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 11:24:28 +0100
Message-ID: <CAMuHMdW4Pq9RVWJYe3cm80Ls75zCegFHNV1QYrcnVhM_e6K+hg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
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
> VIN data groups may appear on different sets of pins, usually named
> "vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support
> appending the '_a' or '_b' suffix, leading to the definition of group
> names not consistent with the ones defined using the SH_PFC_PIN_GROUP()
> macro.
>
> Fix this by making the VIN_DATA_PIN_GROUP macro a variadic one,
> which accepts an optional 'version' argument.
>
> Fixes: 423caa52534f ("pinctrl: sh-pfc: r8a779[01]: Move 'union vin_data' to shared header file")
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
