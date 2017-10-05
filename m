Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:53126 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751625AbdJELHk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 07:07:40 -0400
Received: by mail-io0-f176.google.com with SMTP id i197so13046331ioe.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Oct 2017 04:07:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB08956748EF3D3A4A530903C0C0700@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1506079337-12882-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <7e1bdda1-d790-0db2-540c-69fabe22850a@rock-chips.com> <20170922160405.wfpi4fyziz3sxtmh@katana>
 <TY1PR06MB089584E681911E2C49953F29C0730@TY1PR06MB0895.apcprd06.prod.outlook.com>
 <20171004183024.zv6oir7bc4te4k24@ninjato> <TY1PR06MB08956748EF3D3A4A530903C0C0700@TY1PR06MB0895.apcprd06.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Oct 2017 13:07:38 +0200
Message-ID: <CAPDyKFokf_5eOOGf2kzVQtqSLCwpV9bf8Jp=1P63A4fnz6Bf7g@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: tmio: check mmc_regulator_get_supply return value
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[...]

>>
>> Well, the good news is that it didn't cause a regression for me on R-Car
>> E2 (Alt board) and H3 (Salvator X board).
>>
>> Sadly, it doesn't also fix the SDR104 problems on Alt. I had a little
>> hope this could be the culprit, but sadly it is not. But this is not a
>> problem with this patch. It still fixes a valid issue.
>>
>> Looking how other drivers deal with the issue, though, I noticed they
>> only bail out on -EPROBE_DEFER and would continue on other errors (if
>> mmc_regulator_get_supply would throw them, but it doesn't). So some
>> digging why other drivers do it that way seems to be apropriate to me.
>
> Good point!
> Maybe if this patch explicitly tested for -EPROBE_DEFER the maintenance
> of mmc_regulator_get_supply would be easier as all of the drivers behaved
> similarly.
> On the other hand, both "vmmc" and "vqmmc" are considered optional by
> mmc_regulator_get_supply, therefore their absence is tolerated (0 is
> returned), and as you said the only other possible value returned by
> mmc_regulator_get_supply is -EPROBE_DEFER.
> If in the future the logic of mmc_regulator_get_supply changes, I guess
> even the driver needs to adapt as there may be something wrong with the
> regulators, therefore I personally rather the driver to bail out whatever
> the error returned by mmc_regulator_get_supply. Looking at the history
> of the other drivers I couldn't spot any meaningful comment connected
> to the return value of mmc_regulator_get_supply.

It has been a bit tricky to deal with these regulators in *one* common
way. For some platforms a regulator are optional, while for other it
isn't.

In the end we decided to pick the "optional" way for both vmmc and
vqmmc, and then leave the details in the error path to be sorted out
by each an every mmc host driver.

>
>> Or asking Ulf :)
>
> I guess you are right! ;)
>
> Ulf, what's the best option here?

I think it's perfectly okay to return an error if
mmc_regulator_get_supply() propagates that. That's likely what all
host driver should be doing, instead of explicitly check for
-EPROBE_DEFER.

Of course, even when mmc_regulator_get_supply() returns 0, that's not
a guarantee that the regulator(s) was actually hooked up.

Kind regards
Uffe
