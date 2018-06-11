Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37668 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933168AbeFKNjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 09:39:03 -0400
Received: by mail-wm0-f66.google.com with SMTP id r125-v6so16580071wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jun 2018 06:39:02 -0700 (PDT)
Subject: Re: [PATCH V3] ARM: shmobile: Rework the PMIC IRQ line quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <20180604175911.799-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXG6mMfFTz+fdZQ53hLxYgVZPmsGpaRri8TesiruUNYUg@mail.gmail.com>
 <fa4f843b-ae9d-fac2-77e2-b3ac1116f916@gmail.com>
 <CAMuHMdXw146fwm0tHS7CBAofDAgRgDD2tNqgEJwzx0Jm1xKCyw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <967b800e-c935-aa35-da5a-ca3672fd18c2@gmail.com>
Date: Mon, 11 Jun 2018 15:35:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXw146fwm0tHS7CBAofDAgRgDD2tNqgEJwzx0Jm1xKCyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/11/2018 03:03 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Mon, Jun 11, 2018 at 2:15 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 06/11/2018 11:56 AM, Geert Uytterhoeven wrote:
>>> On Mon, Jun 4, 2018 at 7:59 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> Rather than hard-coding the quirk topology, which stopped scaling,
>>>> parse the information from DT. The code looks for all compatible
>>>> PMICs -- da9036 and da9210 -- and checks if their IRQ line is tied
>>>
>>> da9063
>>>
>>>> to the same pin. If so, the code sends a matching sequence to the
>>>> PMIC to deassert the IRQ.
> 
>>>> @@ -122,7 +143,13 @@ static struct notifier_block regulator_quirk_nb = {
>>>>
>>>>  static int __init rcar_gen2_regulator_quirk(void)
>>>>  {
>>>> -       u32 mon;
>>>> +       struct device_node *np;
>>>> +       const struct of_device_id *id;
>>>> +       struct regulator_quirk *quirk;
>>>> +       struct regulator_quirk *pos;
>>>> +       struct of_phandle_args *argsa, *argsb;
>>>> +       u32 mon, addr;
>>>> +       int ret;
>>>
>>> Some people prefer "Reverse Christmas Tree Ordering", i.e. longest line first.
>>>
>>>>
>>>>         if (!of_machine_is_compatible("renesas,koelsch") &&
>>>>             !of_machine_is_compatible("renesas,lager") &&
>>>> @@ -130,6 +157,45 @@ static int __init rcar_gen2_regulator_quirk(void)
>>>>             !of_machine_is_compatible("renesas,gose"))
>>>>                 return -ENODEV;
>>>
>>> I think the board checks above can be removed. That will auto-enable the
>>> fix on e.g. Porter (once its regulators have ended up in DTS, of course).
>>
>> Removing the check would also enable it on boards where we don't want
>> this enabled, so I'd prefer to keep the check to avoid strange surprises.
> 
> Like, Porter? ;-)

I'm adding Porter in a separate patch.

>>>> +               ret = of_property_read_u32(np, "reg", &addr);
>>>> +               if (ret)
>>>> +                       return ret;
>>>
>>> I think it's safer to skip this entry and continue, after calling
>>> kfree(quirk), of course.
>>>
>>>> +
>>>> +               quirk->id = id;
>>>> +               quirk->i2c_msg.addr = addr;
>>>> +               quirk->shared = false;
>>>> +
>>>> +               ret = of_irq_parse_one(np, 0, &quirk->irq_args);
>>>> +               if (ret)
>>>> +                       return ret;
>>>
>>> kfree(quirk) and continue...
>>
>> I wonder if it shouldn't rather free the entire list and abort ?
> 
> "Be strict when sending, be liberal when receiving."

Meaning ? I think "the language barrier is protecting me" (TM)

-- 
Best regards,
Marek Vasut
