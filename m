Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40592 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbeIZRy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 13:54:26 -0400
MIME-Version: 1.0
References: <20180926091053.21255-1-phil.edworthy@renesas.com> <20180926091053.21255-4-phil.edworthy@renesas.com>
In-Reply-To: <20180926091053.21255-4-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 13:41:39 +0200
Message-ID: <CAMuHMdVg8XZQxpGM5ZB5P03SNbsr3y=kBg-pftNrRLt6xE-34w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] ARM: dts: r9a06g032: Add pinctrl node
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 11:11 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> This provides a pinctrl driver for the Renesas R9A06G032 SoC
>
> Based on a patch originally written by Michel Pollet at Renesas.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
