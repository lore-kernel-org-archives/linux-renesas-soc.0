Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:43772 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753411AbdJMCaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 22:30:24 -0400
Received: by mail-wm0-f66.google.com with SMTP id m72so26227699wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2017 19:30:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUrem469jQHMS5wQ8W8ES6fmqnyWufVhP76w3Of2OU_XQ@mail.gmail.com>
References: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
 <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com> <CAMuHMdUrem469jQHMS5wQ8W8ES6fmqnyWufVhP76w3Of2OU_XQ@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 13 Oct 2017 11:30:22 +0900
Message-ID: <CANqRtoTvqzRVqj6ViGN-t7EBRTXJ-8UQzXmPUa3g22MQL6TGDw@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Oct 12, 2017 at 3:56 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Marek,
>
> On Wed, Oct 11, 2017 at 11:39 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 10/10/2017 04:58 PM, Geert Uytterhoeven wrote:
>>> Add a device node for the ROHM BD9571MWV PMIC, based on the example in
>>> the DT binding documentation, but using INTC-EX instead.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Do we need to describe more regulators?
>>
>> To my knowledge, no.
>
> OK, thanks!
>
>>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> @@ -353,6 +353,30 @@
>>>
>>>  &i2c_dvfs {
>>>       status = "okay";
>>> +
>>> +     pmic: pmic@30 {
>>> +             pinctrl-0 = <&irq0_pins>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             compatible = "rohm,bd9571mwv";
>>> +             reg = <0x30>;
>>> +             interrupt-parent = <&intc_ex>;
>>
>> Shouldn't this be gpio2 ? Why intc-ex ?
>
> Because we now have INTC-EX support ;-)
>
> Serious: if a pin used for interrupt signalling can be configured for both
> GPIO and INTC-EX aka IRQC, we typically configure it for INTC-EX. Probably
> because the latter is a simpler block, and thus consumes less power?

I agree with your decision to use INTC-EX over GPIO, however I do
think that this discussion smells like software policy...

Isn't DT supposed to describe the hardware? =)

It's almost like we want to DT to point out the pin, not the function....

Cheers,

/ magnus
