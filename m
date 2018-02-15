Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:43137 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755297AbeBOKDT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:03:19 -0500
Received: by mail-wr0-f171.google.com with SMTP id b52so2702855wrd.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 02:03:18 -0800 (PST)
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
 <20180214055800.od5yhgo753522yah@katana>
 <CAMuHMdU3opUTcOY-UeH4ArB+50_drPhGSoxP-m85p9V36fvTHg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ae3206a3-4735-87c8-9688-3acdbf06cc36@gmail.com>
Date: Thu, 15 Feb 2018 10:44:01 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU3opUTcOY-UeH4ArB+50_drPhGSoxP-m85p9V36fvTHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 09:09 AM, Geert Uytterhoeven wrote:
> On Wed, Feb 14, 2018 at 6:58 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>> - * The r8a7790/lager and r8a7791/koelsch development boards have da9063 and
>>> - * da9210 regulators.  Both regulators have their interrupt request lines tied
>>> - * to the same interrupt pin (IRQ2) on the SoC.
>>> + * The r8a7790/lager,stout and r8a7791/koelsch development boards have da9063
>>> + * and da9210 regulators.  Both regulators have their interrupt request lines
>>> + * tied to the same interrupt pin (IRQ2) on the SoC.
>>
>> I think listing the boards here doesn't scale well. Gose is already
>> missing. How about rephrasing the paragraph to something like "Some Gen2
>> development boards have..."?
> 
> +1
> 
>>>   *
>>>   * After cold boot or da9063-induced restart, both the da9063 and da9210 seem
>>>   * to assert their interrupt request lines.  Hence as soon as one driver
>>> @@ -118,6 +118,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>>>
>>>       if (!of_machine_is_compatible("renesas,koelsch") &&
>>>           !of_machine_is_compatible("renesas,lager") &&
>>> +         !of_machine_is_compatible("renesas,stout") &&
>>>           !of_machine_is_compatible("renesas,gose"))
>>>               return -ENODEV;
> 
> Have we reached critical mass to start using array-based matching with
> of_device_compatible_match()?

We're matching on machine , not device , here . I guess our device node
would be / ?
-- 
Best regards,
Marek Vasut
