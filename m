Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171207112535.oqtnemvi4q5xnewh@ninjato>
References: <20171204123640.3382-1-wsa+renesas@sang-engineering.com>
 <20171204123640.3382-4-wsa+renesas@sang-engineering.com> <CACRpkdZzwo9UhT08VDHXg6=eXdK80Pt1omZ4Xda_HFwguyNpaw@mail.gmail.com>
 <20171205133848.nzrhysiz2twvlamx@ninjato> <CACRpkdYuHit1w1_d4h++vOuSWosf+iBdgimtCUbmic3mkbm1Wg@mail.gmail.com>
 <20171205164307.65htuotj3heglefj@ninjato> <20171207112535.oqtnemvi4q5xnewh@ninjato>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Dec 2017 01:24:33 +0100
Message-ID: <CACRpkdag_1vh1agnFQxLfw0QF8njOQW1pUY+Qzsn3BhK3jD72w@mail.gmail.com>
Subject: Re: [PATCH 3/6] i2c: add 'set_sda' to bus_recovery_info
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Claudio Foellmi <claudio.foellmi@ergon.ch>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 7, 2017 at 12:25 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> > Two statice inlines in <linux/gpio/consumer.h>
>> > named
>> >
>> > int gpiod_is output()
>> > int gpiod_is_input()
>> >
>> > should conform to Rusty Russell's API hierarchy.
>>
>> Yes, sounds good!
>>
>> > Interested in fixing it, or should I?
>>
>> Please do. I don't want to add magic numbers to the kernel ;)
>
> OK?

Just slow, sorry. Sent a patch now!

Yours,
Linus Walleij
