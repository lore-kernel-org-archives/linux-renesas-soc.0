Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1512046646-15253-4-git-send-email-geert+renesas@glider.be>
References: <1512046646-15253-1-git-send-email-geert+renesas@glider.be> <1512046646-15253-4-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Dec 2017 16:26:55 +0100
Message-ID: <CACRpkdbw9KzHPRYMZMV+yxTL+emO3tGwTzj9Av7+paYTeo7QEg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: koelsch: Convert to named i2c-gpio bindings
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 30, 2017 at 1:57 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commits 7d29f509d2cfd807 ("dt-bindings: i2c: i2c-gpio: Add support for
> named gpios") and 05c74778858d7d99 ("i2c: gpio: Add support for named
> gpios in DT") introduced named i2c-gpio DT bindings, and deprecated the
> more error-prone unnamed variant.
>
> Switch to the new bindings, and add the missing GPIO_OPEN_DRAIN I/O
> flags, which were implicitly assumed before.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
