Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:49053 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbdAaJSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 04:18:07 -0500
Subject: Re: [RFC 3/5] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUmy2QkvRomf8euzB0QNkeCA=N8=rhY0GkObz8qn-UvMQ@mail.gmail.com>
 <5227448.uVg4OnCqZq@avalon>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From: jacopo mondi <jacopo@jmondi.org>
Message-ID: <b315cc0c-a9f3-6287-8443-56e866a32924@jmondi.org>
Date: Tue, 31 Jan 2017 10:12:16 +0100
MIME-Version: 1.0
In-Reply-To: <5227448.uVg4OnCqZq@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert, Laurent,

On 30/01/2017 19:30, Laurent Pinchart wrote:
> On Thursday 26 Jan 2017 20:52:33 Geert Uytterhoeven wrote:
>> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi wrote:
>>> Add dt-bindings header for Renesas RZ pincontroller.
>>> The header defines macros for pin description and alternate function
>>> numbers.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>
>>>  include/dt-bindings/pinctrl/pinctrl-renesas-rz.h | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
>>>
>>> diff --git a/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
>>> b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h new file mode 100644
>>> index 0000000..92816d4
>>> --- /dev/null
>>> +++ b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
>>> @@ -0,0 +1,19 @@
>>> +/*
>>> + * Defines macros and constants for Renesas RZ pin controller and muxer
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
>>> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
>>> +
>>> +#define RZ_PIN(b, p) b p
>>
>> And the advantage of this macro is?
>>

Nothing beside being cute

>>> +#define ALTERNATE_FUNC_1       0
>>> +#define ALTERNATE_FUNC_2       1
>>> +#define ALTERNATE_FUNC_3       2
>>> +#define ALTERNATE_FUNC_4       3
>>> +#define ALTERNATE_FUNC_5       4
>>> +#define ALTERNATE_FUNC_6       5
>>> +#define ALTERNATE_FUNC_7       6
>>> +#define ALTERNATE_FUNC_8       7
>>
>> I have mixed feelings about these macros:
>>   1. They're long to type,
>>   2. They just map from n to n-1.
>>
>> Why not use plain numbers 1..8 (the alternate function numbering in the
>> datasheet is 1-based), and subtract 1 in the C code?
>
> I was about to mention the same. I think you can drop this patch and use the
> numbers directly.
>

Please be aware there are values we'll have to define here, such as the 
additional configurations we're talking about in some other part of this 
email thread.

This may become something like:

#define ALT_FUNC_1       0
#define ALT_FUNC_2       1
#define ALT_FUNC_3       2
#define ALT_FUNC_4       3
#define ALT_FUNC_5       4
#define ALT_FUNC_6       5
#define ALT_FUNC_7       6
#define ALT_FUNC_8       7

#define INPUT_MODE	1
#define BIDRECTIONAL	2
#define ...

#define PIN(b, p) b p
#define PIN_MUX(func, conf)	\
	((func & 0xf) | ((conf) << 16))

and in DTS sources you would describe a pin as

pins = <PIN(bank, pin) PIN_MUX(ALT_FUNC_1, INPUT | BIDIRECTIONAL)>;

We can drop the PIN macro as it does not bring anything I agree, but 
it's nicer to see imho

Thanks
    j
