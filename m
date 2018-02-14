Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:39720 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754620AbeBNIJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 03:09:49 -0500
Received: by mail-qk0-f176.google.com with SMTP id z197so8802262qkb.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2018 00:09:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180214055800.od5yhgo753522yah@katana>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com> <20180214055800.od5yhgo753522yah@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 09:09:48 +0100
Message-ID: <CAMuHMdU3opUTcOY-UeH4ArB+50_drPhGSoxP-m85p9V36fvTHg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 14, 2018 at 6:58 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> - * The r8a7790/lager and r8a7791/koelsch development boards have da9063 and
>> - * da9210 regulators.  Both regulators have their interrupt request lines tied
>> - * to the same interrupt pin (IRQ2) on the SoC.
>> + * The r8a7790/lager,stout and r8a7791/koelsch development boards have da9063
>> + * and da9210 regulators.  Both regulators have their interrupt request lines
>> + * tied to the same interrupt pin (IRQ2) on the SoC.
>
> I think listing the boards here doesn't scale well. Gose is already
> missing. How about rephrasing the paragraph to something like "Some Gen2
> development boards have..."?

+1

>>   *
>>   * After cold boot or da9063-induced restart, both the da9063 and da9210 seem
>>   * to assert their interrupt request lines.  Hence as soon as one driver
>> @@ -118,6 +118,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>>
>>       if (!of_machine_is_compatible("renesas,koelsch") &&
>>           !of_machine_is_compatible("renesas,lager") &&
>> +         !of_machine_is_compatible("renesas,stout") &&
>>           !of_machine_is_compatible("renesas,gose"))
>>               return -ENODEV;

Have we reached critical mass to start using array-based matching with
of_device_compatible_match()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
