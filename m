Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34381 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388145AbeKWUuM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 15:50:12 -0500
MIME-Version: 1.0
References: <20181122201941.1654-1-vz@mleia.com>
In-Reply-To: <20181122201941.1654-1-vz@mleia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 11:06:22 +0100
Message-ID: <CAMuHMdXTkY8LQqwpw87hcLD2Y16y1EGWk0ic0CrhZtKNoGfa8A@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: reference device instead of platform device
To: vz@mleia.com
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 22, 2018 at 9:19 PM Vladimir Zapolskiy <vz@mleia.com> wrote:
> The change simplifies dereferences to the mediated struct device, also
> it allows to limit the scope of the platform device usage to probe and
> remove functions only.
>
> Non-functional change.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
