Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34306 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751364AbdGSHh4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 03:37:56 -0400
MIME-Version: 1.0
In-Reply-To: <20170718214339.7774-43-robh@kernel.org>
References: <20170718214339.7774-43-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jul 2017 09:37:53 +0200
Message-ID: <CAMuHMdXsmcN892-2qxx5W7LX976ARbPH33bWDZ5mTO_PPXL2kg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Convert to using %pOF instead of full_name
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Barry Song <baohua@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 11:43 PM, Rob Herring <robh@kernel.org> wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  drivers/pinctrl/sh-pfc/pinctrl.c          |  2 +-

For the sh-pfc part:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
