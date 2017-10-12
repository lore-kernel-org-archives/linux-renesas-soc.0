Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36333 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbdJLJPL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:15:11 -0400
Received: by mail-wm0-f68.google.com with SMTP id 131so3593561wmk.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2017 02:15:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2b11ea5b-052c-69df-8c64-eebf1b28eb48@gmail.com>
References: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
 <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com> <CAMuHMdUrem469jQHMS5wQ8W8ES6fmqnyWufVhP76w3Of2OU_XQ@mail.gmail.com>
 <2b11ea5b-052c-69df-8c64-eebf1b28eb48@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2017 11:15:09 +0200
Message-ID: <CAMuHMdV9GtrpmjoWjsNQ5S5ym8kPE6D3fFxj0PJWiDpEfL2Y2w@mail.gmail.com>
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

On Thu, Oct 12, 2017 at 10:35 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 10/12/2017 08:56 AM, Geert Uytterhoeven wrote:
>> On Wed, Oct 11, 2017 at 11:39 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> On 10/10/2017 04:58 PM, Geert Uytterhoeven wrote:
>>>> Add a device node for the ROHM BD9571MWV PMIC, based on the example in
>>>> the DT binding documentation, but using INTC-EX instead.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>> Do we need to describe more regulators?
>>>
>>> To my knowledge, no.
>>
>> OK, thanks!
>>
>>>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>>> @@ -353,6 +353,30 @@
>>>>
>>>>  &i2c_dvfs {
>>>>       status = "okay";
>>>> +
>>>> +     pmic: pmic@30 {
>>>> +             pinctrl-0 = <&irq0_pins>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             compatible = "rohm,bd9571mwv";
>>>> +             reg = <0x30>;
>>>> +             interrupt-parent = <&intc_ex>;
>>>
>>> Shouldn't this be gpio2 ? Why intc-ex ?
>>
>> Because we now have INTC-EX support ;-)
>>
>> Serious: if a pin used for interrupt signalling can be configured for both
>> GPIO and INTC-EX aka IRQC, we typically configure it for INTC-EX. Probably
>> because the latter is a simpler block, and thus consumes less power?
> That should be in the commit message :)

Does it? The schematics clearly mark the signal as IRQ0n, not GP2_00.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
