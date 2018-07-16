Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-he1eur01on0127.outbound.protection.outlook.com ([104.47.0.127]:8991
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727649AbeGPLn0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 07:43:26 -0400
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXKk=ON9kabroLUAexCJ2xRQEOCtty+sTP1vsqiusQBEg@mail.gmail.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <6101f50f-0bf5-b660-0cec-af089eddcb1a@axentia.se>
Date: Mon, 16 Jul 2018 13:16:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXKk=ON9kabroLUAexCJ2xRQEOCtty+sTP1vsqiusQBEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-16 12:37, Geert Uytterhoeven wrote:
> On Thu, Jul 12, 2018 at 7:49 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> When we we initialize the pins, make sure it looks like STOP by dividing
>> the delay into halves. It shouldn't matter because SDA is expected to be
>> held low by a device, but for super-safety, let's do it.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  drivers/i2c/i2c-core-base.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 51cbb0c158f2..e57231ccb32a 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -191,9 +191,10 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>>                 bri->prepare_recovery(adap);
>>
>>         bri->set_scl(adap, scl);
>> +       ndelay(RECOVERY_NDELAY / 2);
> 
> Any change someone changes RECOVERY_NDELAY to 1, leading to a
> zero delay here? Is that an issue?

No!

Above this, there is this line:

#define RECOVERY_NDELAY		5000

Cheers,
Peter

>>         if (bri->set_sda)
>> -               bri->set_sda(adap, 1);
>> -       ndelay(RECOVERY_NDELAY);
>> +               bri->set_sda(adap, scl);
>> +       ndelay(RECOVERY_NDELAY / 2);
>>
>>         /*
>>          * By this time SCL is high, as we need to give 9 falling-rising edges
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
