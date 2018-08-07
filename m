Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33301 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388852AbeHGKDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:03:15 -0400
MIME-Version: 1.0
References: <1533548881-35174-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533548881-35174-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 09:49:58 +0200
Message-ID: <CAMuHMdVoTTO74y524wudUBcpZbQreofJsTOF3GK5qeHnssJawQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix of_node inconsistency
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 6, 2018 at 11:54 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Some platforms are not setting of_node in the driver. On these platforms
> defining gpio-reserved-ranges on device tree leads to kernel crash.
>
> It is due to some parts of the gpio core relying on the driver to set up
> of_node,while other parts do themselves.This inconsistent behaviour leads
> to a crash.
>
> gpiochip_add_data_with_key() calls gpiochip_init_valid_mask() with of_node
> as NULL. of_gpiochip_add() fills "of_node" and calls
> of_gpiochip_init_valid_mask().
>
> The fix is to move the assignment to chip->of_node from of_gpiochip_add()
> to gpiochip_add_data_with_key().
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
