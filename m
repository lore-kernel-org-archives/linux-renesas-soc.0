Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34130 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1428264AbdDXPHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 11:07:55 -0400
Subject: Re: [PATCH 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com>
 <20170416180801.17828-3-marek.vasut+renesas@gmail.com>
 <CACRpkdZYpijY5pxYNpwQyPubC4Ud5qMuM+4hgJvd1W1gAvOcFQ@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0105020f-b1b3-6306-4759-25924ad4bcd6@gmail.com>
Date: Mon, 24 Apr 2017 17:07:32 +0200
MIME-Version: 1.0
In-Reply-To: <CACRpkdZYpijY5pxYNpwQyPubC4Ud5qMuM+4hgJvd1W1gAvOcFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/24/2017 03:55 PM, Linus Walleij wrote:
> On Sun, Apr 16, 2017 at 8:08 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
>> This block is pretty trivial and supports setting GPIO direction
>> as Input/Output and in case of Output, supports setting value.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> (...)
> 
>> +#include <linux/gpio.h>
> 
> Only use
> #include <linux/gpio/driver.h>
> 
> It should be enough.
> 
> With that:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It is, done, will be in V2, thanks.

> I guess you plan to merge this through MFD?
> 
> Yours,
> Linus Walleij
> 


-- 
Best regards,
Marek Vasut
