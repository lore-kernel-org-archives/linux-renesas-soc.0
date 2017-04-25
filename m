Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:32988 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1428768AbdDYJfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2017 05:35:52 -0400
Subject: Re: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
 <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
 <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ae65d889-baf4-e24b-d72d-05f29bba4f87@gmail.com>
Date: Tue, 25 Apr 2017 11:35:45 +0200
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

I thought that was a question for Lee initially , IMO it'd make sense if
this went through one tree.

-- 
Best regards,
Marek Vasut
