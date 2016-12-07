Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 14.mo7.mail-out.ovh.net ([178.33.251.19]:57089 "EHLO
        14.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751636AbcLGJRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 04:17:44 -0500
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 999B22362F
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Dec 2016 10:17:42 +0100 (CET)
Subject: Re: [RFC] dts: arm: renesas: koelsh: Add MAX11100 device
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1481042071-18659-1-git-send-email-jacopo@jmondi.org>
 <CAMuHMdUBHtaLE9WobEobiVgtYk-_wx-DLff5=nqfur34q2nd9A@mail.gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: "jacopo@jmondi.org" <jacopo@jmondi.org>
Message-ID: <84510dca-b4b1-4917-71e0-91256ff1dad0@jmondi.org>
Date: Wed, 7 Dec 2016 10:17:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUBHtaLE9WobEobiVgtYk-_wx-DLff5=nqfur34q2nd9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,
     thanks for review

On 07/12/2016 09:40, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Dec 6, 2016 at 5:34 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
>> Add node to test MAX11100 ADC with LED28 connected to the chip input
>> line.
>
> What does the name "LED28" refer to?

It's simply gpio #28 on port gpio5.
I have exported that as gpio-led, but it's totally equivalent to 
exporting it from sysfs gpio interface.
Using gpio-led it's just there in as /sys/class/leds/LED28 without need 
to export it everytime.

>
>> The ADC sits on a gpio-spi master.
>>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>
>> Sending as RFC only, not for inclusion.
>> Used to test MAX11100 ADC driver currently connected to Koelsch GPIO
>> expander.
>> Adding LED28 as ADC input line.
>>
>> ---
>>  arch/arm/boot/dts/r8a7791-koelsch.dts | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
>> index 5405d33..ac8f10d 100644
>> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
>> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
>> @@ -170,6 +170,27 @@
>>                         gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
>>                         label = "LED8";
>>                 };
>> +               led28 {
>> +                       gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
>> +                       label = "LED28";
>> +               };
>> +       };
>> +
>> +       spi_gpio: spi-gpio {
>> +               compatible = "spi-gpio";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               gpio-sck = <&gpio5 27 GPIO_ACTIVE_HIGH>;
>> +               gpio-miso = <&gpio5 25 GPIO_ACTIVE_HIGH>;
>> +               num-chipselects = <1>;
>> +               cs-gpios = <&gpio5 26 GPIO_ACTIVE_LOW>;
>
> I would keep all gpios together.
>
>> +               status = "okay";
>> +
>> +               spi@0 {
>
> adc@0
>
>> +                       compatible = "maxim,max11100";
>> +                       reg = <0>;
>> +                       spi-max-frequency = <2500000>;
>> +               };
>>         };

will change both in v2, thanks
    j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
