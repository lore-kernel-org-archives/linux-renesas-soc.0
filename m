Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:42977 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751229AbdL1WUK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Dec 2017 17:20:10 -0500
MIME-Version: 1.0
In-Reply-To: <8e88fcd7-655d-fad6-7838-4e84cdfca7c9@mentor.com>
References: <1514122643-28838-1-git-send-email-ykaneko0929@gmail.com> <8e88fcd7-655d-fad6-7838-4e84cdfca7c9@mentor.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Fri, 29 Dec 2017 07:20:09 +0900
Message-ID: <CAH1o70JGD_144k59U7KcMUYY7ie+a0mL-8_wAXtF=aEFK7mNvw@mail.gmail.com>
Subject: Re: [PATCH/RFT v2] gpio: gpio-rcar: Support S2RAM
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

Thank you for your review.
I will re-spin this patch.

Thanks,
Kaneko

2017-12-25 17:35 GMT+09:00 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>:
> On 12/24/2017 03:37 PM, Yoshihiro Kaneko wrote:
>> From: Hien Dang <hien.dang.eb@renesas.com>
>>
>> This patch adds an implementation that saves and restores the state of
>> GPIO configuration on suspend and resume.
>>
>> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> [Modify structure of the bank info to simplify a saving registers]
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>
> [snip]
>
>> +static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops,
>> +             gpio_rcar_suspend, gpio_rcar_resume);
>> +#define DEV_PM_OPS (&gpio_rcar_pm_ops)
>> +#else
>> +#define DEV_PM_OPS NULL
>> +#endif /* CONFIG_PM_SLEEP*/
>> +
>>  static int gpio_rcar_probe(struct platform_device *pdev)
>>  {
>>       struct gpio_rcar_priv *p;
>> @@ -536,6 +604,7 @@ static int gpio_rcar_remove(struct platform_device *pdev)
>>       .remove         = gpio_rcar_remove,
>>       .driver         = {
>>               .name   = "gpio_rcar",
>> +             .pm     = DEV_PM_OPS,
>>               .of_match_table = of_match_ptr(gpio_rcar_of_table),
>>       }
>>  };
>>
>
> You can safely follow the next simpler pattern (add pm functions after
> gpio_rcar_remove() function and remove DEV_PM_OPS macro):
>
> #ifdef CONFIG_PM_SLEEP
> static int gpio_rcar_suspend(struct device *dev)
> {
>         ...
> }
>
> static int gpio_rcar_resume(struct device *dev)
> {
>         ...
> }
> #endif
>
> static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
>
> static struct platform_driver gpio_rcar_device_driver = {
>         .probe          = gpio_rcar_probe,
>         .remove         = gpio_rcar_remove,
>         .driver         = {
>                 .name   = "gpio_rcar",
>                 .pm     = &gpio_rcar_pm_ops,
>                 .of_match_table = of_match_ptr(gpio_rcar_of_table),
>         }
> };
>
> --
> With best wishes,
> Vladimir
