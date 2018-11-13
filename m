Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39409 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731968AbeKMUWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 15:22:48 -0500
MIME-Version: 1.0
References: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org> <1541693247-15599-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541693247-15599-3-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 11:25:08 +0100
Message-ID: <CAMuHMdWo9kUBLCaRdx_OrS-sDSukUJXUaCYytOPjHQZxDfunOA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions
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
> The VIN4 and VIN5 interfaces supports parallel video input.
> Add pin, mux and functions definitions for VIN4 and VIN5 for R-Car M3-N.
>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> ---
> v4 -> v5:
> - Add definitions for 10, 12 and 20 pin groups for VIN4 as suggested by Geert
> - Add definitions for 10 and 12 pin groups for VIN5 as suggested by Geert
> - s/union vin_data/union vin_data16/ for VIN5 pins and mux as suggested by Geert

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. queuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
