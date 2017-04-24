Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37112 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1170237AbdDXN4J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 09:56:09 -0400
Received: by mail-it0-f43.google.com with SMTP id x188so55415442itb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2017 06:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170416180801.17828-3-marek.vasut+renesas@gmail.com>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com> <20170416180801.17828-3-marek.vasut+renesas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 15:55:12 +0200
Message-ID: <CACRpkdZYpijY5pxYNpwQyPubC4Ud5qMuM+4hgJvd1W1gAvOcFQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 16, 2017 at 8:08 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> This block is pretty trivial and supports setting GPIO direction
> as Input/Output and in case of Output, supports setting value.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>

(...)

> +#include <linux/gpio.h>

Only use
#include <linux/gpio/driver.h>

It should be enough.

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess you plan to merge this through MFD?

Yours,
Linus Walleij
