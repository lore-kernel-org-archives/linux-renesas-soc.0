Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33360 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1428664AbdDYJcr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2017 05:32:47 -0400
Received: by mail-io0-f173.google.com with SMTP id k87so212854987ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2017 02:32:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com> <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Apr 2017 11:32:45 +0200
Message-ID: <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 24, 2017 at 5:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> This block is pretty trivial and supports setting GPIO direction
> as Input/Output and in case of Output, supports setting value.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> V2: Use linux/gpio/driver.h instead of linux/gpio.h

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Are you merging this through MFD?

Yours,
Linus Walleij
