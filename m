Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:55884 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbeHFNGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 09:06:35 -0400
Received: by mail-it0-f67.google.com with SMTP id d10-v6so16804893itj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 03:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <1533548881-35174-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533548881-35174-1-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Aug 2018 12:57:52 +0200
Message-ID: <CACRpkdabfRiZ_gXc7Z44OzWDrCFHv1h1w=eX+-Yr8epab1oHkw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix of_node inconsistency
To: Biju Das <biju.das@bp.renesas.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 6, 2018 at 11:53 AM Biju Das <biju.das@bp.renesas.com> wrote:

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

After reading through context this seems like the right fix so patch applied!

In the long run I want to get rid of this extra of_node in the chip, but it
kind of requires every driver in the kernel to pass in a valid parent device
representing the OF node. And there are so many hairy corner cases
where they don't.

Yours,
Linus Walleij
