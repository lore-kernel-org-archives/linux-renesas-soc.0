Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35058 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932398AbcIAK0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:26:00 -0400
Received: by mail-lf0-f47.google.com with SMTP id e198so23350919lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 03:25:03 -0700 (PDT)
Subject: Re: [PATCH v3 05/12] arm64: dts: h3ulcb: enable GPIO leds
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637789-14780-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdUpcajev3CsdhtpaD4PrqAOPsAcnv+65TFv-we6FPmDVw@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <c9c67ae9-d540-df19-14ab-e01b9248ffd2@cogentembedded.com>
Date: Thu, 1 Sep 2016 13:24:58 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUpcajev3CsdhtpaD4PrqAOPsAcnv+65TFv-we6FPmDVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the review.

On 01.09.2016 10:52, Geert Uytterhoeven wrote:
> On Wed, Aug 31, 2016 at 12:03 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> This supports GPIO leds on H3ULCB board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> @@ -31,6 +31,19 @@
>>                  /* first 128MB is reserved for secure area. */
>>                  reg = <0x0 0x48000000 0x0 0x38000000>;
>>          };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +               led4 {
>> +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
>> +               };
>> +               led5 {
>> +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
>> +               };
>> +               led6 {
>> +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
>> +               };
>> +       };
> The LEDs share GPIOs with the switches. Unfortunately you cannot use both
> at the same time.
> Perhaps we want to configure one of them for the switch, to be used as a
> wakeup-source?
This is a good point.

I will respin this patch accordingly to your suggestion.

Regards,
Vladimir
>
> The same applies to Salvator-X, where we haven't wired up the LEDs nor
> switches (yet).
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
