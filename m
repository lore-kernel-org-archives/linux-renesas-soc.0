Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36268 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753242AbeDSQDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 12:03:32 -0400
Received: by mail-lf0-f68.google.com with SMTP id d20-v6so944252lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 09:03:31 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77970: fix pin I/O voltage control
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
 <ba26106b-8a22-6784-b8dc-056d7bd9be86@cogentembedded.com>
 <CAMuHMdVgowxnn6puvXg92r-TVJwYPhkfe=DPtLAfJ1CnOQCk5Q@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d649234a-40fd-f0de-b365-7d5324fe6ee1@cogentembedded.com>
Date: Thu, 19 Apr 2018 19:03:29 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVgowxnn6puvXg92r-TVJwYPhkfe=DPtLAfJ1CnOQCk5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/19/2018 04:06 PM, Geert Uytterhoeven wrote:

>> I've included the pin I/O voltage control into the R8A77970 PFC driver but
>> it was incomplete because:
>> - SH_PFC_PIN_CFG_IO_VOLTAGE pin flags weren't set properly;
>> - sh_pfc_soc_info::ioctrl_regs wasn't set at all...
> 
> Thanks for your patch!
> 
>> Fixes: b92ac66a1819 ("pinctrl: sh-pfc: Add R8A77970 PFC support")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Minor nit below...

   Not sure which of your multiple comments was this nit... :-)

>> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> 
>> @@ -2382,18 +2384,33 @@ static const struct pinmux_cfg_reg pinmu
>>         { },
>>  };
>>
>> +enum ioctrl_regs {
>> +       IOCTRL30,
>> +       IOCTRL31,
>> +       IOCTRL32,
>> +       IOCTRL40,
> 
> Note for the future: unlike all other current pocctrl handling, IOCTRL32
> is used to select between 2.5V and 3.3V (instead of 1.8V and 3.3V).

   It also controls a group of pins instead of the individual pins, isn't it?

> Handling that will require changes to the r8a77980_pin_to_pocctrl()

   I'm afraid we'd need a new method, other than pin_to_pocctrl...

> interface (add two output parameters returning supported voltages?).
> 
>> +       IOCTRL40,
> 
> That's TDSEL, and thus not related to I/O voltage.

   It's still an IOCTRL<n> register, no?

> But I agree it should be saved during suspend/resume. ;-)

   You mean we shouldn't use the sh_pfc_soc_info::ioctrl_regs mechanism for it?

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
