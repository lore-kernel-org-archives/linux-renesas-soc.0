Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37090 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750810AbdLEIjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 03:39:49 -0500
Received: by mail-it0-f43.google.com with SMTP id d137so13397540itc.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2017 00:39:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204123640.3382-4-wsa+renesas@sang-engineering.com>
References: <20171204123640.3382-1-wsa+renesas@sang-engineering.com> <20171204123640.3382-4-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Dec 2017 09:39:48 +0100
Message-ID: <CACRpkdZzwo9UhT08VDHXg6=eXdK80Pt1omZ4Xda_HFwguyNpaw@mail.gmail.com>
Subject: Re: [PATCH 3/6] i2c: add 'set_sda' to bus_recovery_info
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Claudio Foellmi <claudio.foellmi@ergon.ch>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 4, 2017 at 1:36 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> This will be needed when we want to create STOP conditions, too, later.
> Create the needed fields and populate them for the GPIO case if the GPIO
> is set to output.
>
> Cc: Phil Reid <preid@electromag.com.au>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Claudio Foellmi <claudio.foellmi@ergon.ch>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

(...)
>  #include <linux/errno.h>
> +#include <linux/gpio.h>

Please no.

> +                       if (gpiod_get_direction(bri->sda_gpiod) == GPIOF_DIR_OUT)
> +                               bri->set_sda = set_sda_gpio_value;

Just compare it to zero. if (!gpiod_get_direction())

This flag is only for requesting GPIOs in the old API.
We didn't add a define in the new API, it seemed overengineered.

Yours,
Linus Walleij
