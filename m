Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52151 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752615AbdJLJUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:20:19 -0400
Received: by mail-wm0-f66.google.com with SMTP id f4so11488400wme.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2017 02:20:19 -0700 (PDT)
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
 <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com>
 <CAMuHMdUrem469jQHMS5wQ8W8ES6fmqnyWufVhP76w3Of2OU_XQ@mail.gmail.com>
 <2b11ea5b-052c-69df-8c64-eebf1b28eb48@gmail.com>
 <CAMuHMdV9GtrpmjoWjsNQ5S5ym8kPE6D3fFxj0PJWiDpEfL2Y2w@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1e02094a-b9a3-c406-bd35-1dc867300ef0@gmail.com>
Date: Thu, 12 Oct 2017 11:18:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV9GtrpmjoWjsNQ5S5ym8kPE6D3fFxj0PJWiDpEfL2Y2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/12/2017 11:15 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi Geert,

> On Thu, Oct 12, 2017 at 10:35 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 10/12/2017 08:56 AM, Geert Uytterhoeven wrote:
>>> On Wed, Oct 11, 2017 at 11:39 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 10/10/2017 04:58 PM, Geert Uytterhoeven wrote:
>>>>> Add a device node for the ROHM BD9571MWV PMIC, based on the example in
>>>>> the DT binding documentation, but using INTC-EX instead.
>>>>>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> Do we need to describe more regulators?
>>>>
>>>> To my knowledge, no.
>>>
>>> OK, thanks!
>>>
>>>>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>>>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>>>> @@ -353,6 +353,30 @@
>>>>>
>>>>>  &i2c_dvfs {
>>>>>       status = "okay";
>>>>> +
>>>>> +     pmic: pmic@30 {
>>>>> +             pinctrl-0 = <&irq0_pins>;
>>>>> +             pinctrl-names = "default";
>>>>> +
>>>>> +             compatible = "rohm,bd9571mwv";
>>>>> +             reg = <0x30>;
>>>>> +             interrupt-parent = <&intc_ex>;
>>>>
>>>> Shouldn't this be gpio2 ? Why intc-ex ?
>>>
>>> Because we now have INTC-EX support ;-)
>>>
>>> Serious: if a pin used for interrupt signalling can be configured for both
>>> GPIO and INTC-EX aka IRQC, we typically configure it for INTC-EX. Probably
>>> because the latter is a simpler block, and thus consumes less power?
>> That should be in the commit message :)
> 
> Does it? The schematics clearly mark the signal as IRQ0n, not GP2_00.

I have a patch in my tree which connects the ROHM PMIC to GPIO 2 , so if
there is such a benefit to connecting it to intc-ex , I think it should
be explained in the commit message.

-- 
Best regards,
Marek Vasut
