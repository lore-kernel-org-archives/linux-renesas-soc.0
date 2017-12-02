Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:40070 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751749AbdLBP0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Dec 2017 10:26:20 -0500
Received: by mail-it0-f68.google.com with SMTP id f190so5520297ita.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Dec 2017 07:26:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1512046646-15253-2-git-send-email-geert+renesas@glider.be>
References: <1512046646-15253-1-git-send-email-geert+renesas@glider.be> <1512046646-15253-2-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Dec 2017 16:26:19 +0100
Message-ID: <CACRpkdbY=zAw-8LrqmMcGGf7cHmAaC=YvpovxqTTPwcsXPUYAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: armadillo800eva: Convert to named
 i2c-gpio bindings
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
Sender: linux-renesas-soc-owner@vger.kernel.org
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
> The latter gets rid of the message:
>
>     gpio-208 (?): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>     gpio-91 (?): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
