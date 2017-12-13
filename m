Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:34981 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbdLMOy1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 09:54:27 -0500
Received: by mail-it0-f44.google.com with SMTP id f143so3939829itb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2017 06:54:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171212224207.xi4yiuyhp5radivr@ninjato>
References: <20171210002340.18460-1-linus.walleij@linaro.org> <20171212224207.xi4yiuyhp5radivr@ninjato>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Dec 2017 15:54:25 +0100
Message-ID: <CACRpkdbK1D6cPm__2DRd0LOi=3RgjBj9ubd1_fWE-=KLcEEbjA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add helpers to determin direction of gpiods
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 12, 2017 at 11:42 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

>>  Documentation/gpio/consumer.txt | 14 +++++++++++---
>
> You need to fix the kerneldoc for 'gpiod_get_direction", too. It still
> mentions GPIOF_DIR_*.

More places? I can't find them!

I thought the patch removed that here:

-This function will return either GPIOF_DIR_IN or GPIOF_DIR_OUT.
+This function will return either 1 (input) or 0 (output). There are also
+these convenience helpers:

I can only find it in Documentation/gpio/gpio-legacy.txt which is
fine.

>> +static inline bool gpiod_is_input(struct gpio_desc *desc)
>> +{
>> +     int ret = gpiod_get_direction(desc);
>> +     if (ret < 0) {
>> +             pr_err("GPIO: failed to get direction\n");
>
> Is that really helpful for the user if we don't say which GPIO failed?

I would have to add yet more APIs to do that.

Hm.

Together with Geert's comments I start to lean towards actually
just creating two new #defines in <linux/consumer.h>.

It has the upside that we can also check the return value
for errors.

Yours,
Linus Walleij
