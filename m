Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36574 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbeLCLlm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 06:41:42 -0500
Subject: Re: [PATCH 01/14] gpio: pca953x: Deduplicate the bank_size
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        marek.vasut+renesas@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
 <CAMpxmJV++wAmkF28CK9vO5Zia7Sd9zVyAw+Y_C=qci_0oWHLog@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8e0b5a14-22cc-9956-c8f8-aa64bb55bac5@gmail.com>
Date: Mon, 3 Dec 2018 12:00:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAMpxmJV++wAmkF28CK9vO5Zia7Sd9zVyAw+Y_C=qci_0oWHLog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/03/2018 10:36 AM, Bartosz Golaszewski wrote:
> niedz., 2 gru 2018 o 20:36 Marek Vasut <marek.vasut@gmail.com> napisał(a):
>>
>> The bank_size = fls(...) code was duplicated in the driver 5 times,
>> pull it into separate function.
>>
> 
> Shouldn't it be bank_shift in the commit message?

It should, fixed

-- 
Best regards,
Marek Vasut
