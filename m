Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:39003 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932547AbeAJNnL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jan 2018 08:43:11 -0500
Received: by mail-io0-f193.google.com with SMTP id g70so22463728ioj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2018 05:43:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180109135859.20771-4-wsa@the-dreams.de>
References: <20180109135859.20771-1-wsa@the-dreams.de> <20180109135859.20771-4-wsa@the-dreams.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Jan 2018 14:43:10 +0100
Message-ID: <CACRpkdYZZ+KtpxxDzFdYqXT+2Gj4B4T-FwVzNw-J+Hj6f3UQEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] i2c: add 'set_sda' to bus_recovery_info
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 9, 2018 at 2:58 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> This will be needed when we want to create STOP conditions, too, later.
> Create the needed fields and populate them for the GPIO case if the GPIO
> is set to output.
>
> Tested-by: Phil Reid <preid@electromag.com.au>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Geert pointed out a bug in *_cansleep() so I have merged his fix
for v4.15.

Everything "should be smooth".

> +                       /* FIXME: add proper flag instead of '0' once available */
> +                       if (gpiod_get_direction(bri->sda_gpiod) == 0)

Yeah I should fix ... I suspect I need to do something kernel-wide
to shape this up.

Yours,
Linus Walleij
