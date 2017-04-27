Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33343 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938841AbdD0Sfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 14:35:30 -0400
Subject: Re: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
 <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
 <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b1515cf0-31b5-a413-db2e-de0385ce106a@gmail.com>
Date: Thu, 27 Apr 2017 20:35:27 +0200
MIME-Version: 1.0
In-Reply-To: <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/25/2017 11:32 AM, Linus Walleij wrote:
> On Mon, Apr 24, 2017 at 5:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
>> This block is pretty trivial and supports setting GPIO direction
>> as Input/Output and in case of Output, supports setting value.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> V2: Use linux/gpio/driver.h instead of linux/gpio.h
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are you merging this through MFD?

Well, since Mark already picked the regulator patch and since the GPIO
driver is protected from being compiled by an Kconfig symbol, you can
take this through the GPIO tree and I can then ask Lee to apply the MFD
bits via MFD. This will probably reduce the friction a bit ...

-- 
Best regards,
Marek Vasut
