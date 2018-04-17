Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:36531 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbeDQHmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 03:42:47 -0400
MIME-Version: 1.0
In-Reply-To: <60f64683-4627-b108-41d8-23f86b7eb893@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <1c6cc202-5f20-4304-11ae-79ea0c559457@cogentembedded.com> <CAMuHMdVBxjMuB8A5tgEhhRsSzNH=ww3Wf2ednAiY4MDr6gmFLw@mail.gmail.com>
 <60f64683-4627-b108-41d8-23f86b7eb893@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 09:42:46 +0200
Message-ID: <CAMuHMdUA8LAzcczsog-Snh-qFcp+250u3737cFHwynjYX07VUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add pin I/O voltage control
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Apr 16, 2018 at 5:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 04/16/2018 04:02 PM, Geert Uytterhoeven wrote:
>>> Add the pin I/O voltage level control to the R8A77980 PFC driver.
>>
>> Subject says r8a77970?
>
>    Typo, I guess. :-)
>
>>> Loosely based on the original (and large) patch by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c |   50 +++++++++++++++++++++++++++++++---
>>>  1 file changed, 47 insertions(+), 3 deletions(-)
>>>
>>> Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
>>> ===================================================================
>>> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
>>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
>>
>> Ah, pfc-r8a77980.c it is.
>>
>>> @@ -2779,8 +2779,51 @@ static const struct pinmux_cfg_reg pinmu
>>>         { },
>>>  };
>>>
>>> +enum ioctrl_regs {
>>> +       IOCTRL30,
>>> +       IOCTRL31,
>>> +       IOCTRL32,
>>> +};
>>> +
>>> +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>>> +       [IOCTRL30] = { 0xe6060380, },
>>> +       [IOCTRL31] = { 0xe6060384, },
>>> +       [IOCTRL32] = { 0xe6060388, },
>>> +       { /* sentinel */ },
>>
>> However, r8a77980 has 4 IOCTRL3x registers (r8a77970 has three)?
>
>    I thought that since we don't change it, no need to list it for save/restore
> either. I was wrong?

Given the system resume path differs from the boot path (resume skips the
boot loader, and thus all PFC initialization it performs), I think it is
safest to list it anyway, so it is saved and restored.

>> Something is wrong: which SoC source file is this patch for?
>
>    R8A77980.

Thanks for confirming, will resume reviewing (either this version, or v2 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
