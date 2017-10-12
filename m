Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37292 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbdJLG4M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 02:56:12 -0400
Received: by mail-wm0-f68.google.com with SMTP id r68so3394445wmr.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 23:56:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com>
References: <1507647516-28993-1-git-send-email-geert+renesas@glider.be> <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2017 08:56:11 +0200
Message-ID: <CAMuHMdUrem469jQHMS5wQ8W8ES6fmqnyWufVhP76w3Of2OU_XQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Wed, Oct 11, 2017 at 11:39 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 10/10/2017 04:58 PM, Geert Uytterhoeven wrote:
>> Add a device node for the ROHM BD9571MWV PMIC, based on the example in
>> the DT binding documentation, but using INTC-EX instead.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Do we need to describe more regulators?
>
> To my knowledge, no.

OK, thanks!

>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -353,6 +353,30 @@
>>
>>  &i2c_dvfs {
>>       status = "okay";
>> +
>> +     pmic: pmic@30 {
>> +             pinctrl-0 = <&irq0_pins>;
>> +             pinctrl-names = "default";
>> +
>> +             compatible = "rohm,bd9571mwv";
>> +             reg = <0x30>;
>> +             interrupt-parent = <&intc_ex>;
>
> Shouldn't this be gpio2 ? Why intc-ex ?

Because we now have INTC-EX support ;-)

Serious: if a pin used for interrupt signalling can be configured for both
GPIO and INTC-EX aka IRQC, we typically configure it for INTC-EX. Probably
because the latter is a simpler block, and thus consumes less power?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
