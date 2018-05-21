Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:37848 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752247AbeEUOeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 10:34:19 -0400
Received: by mail-io0-f195.google.com with SMTP id e20-v6so14538475iof.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 May 2018 07:34:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180513082304.uwlyshoevg5wsax2@verge.net.au>
References: <20180418095700.29948-1-horms+renesas@verge.net.au> <20180513082304.uwlyshoevg5wsax2@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 21 May 2018 16:34:18 +0200
Message-ID: <CAPDyKFqStqxJtxHroAvufje9gGQ0Q9O3NuH1eBy1RLn66sf5jw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] mmc: renesas_sdhi: add eMMC HS400 mode support
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13 May 2018 at 10:23, Simon Horman <horms@verge.net.au> wrote:
> Hi Ulf,
>
> On Wed, Apr 18, 2018 at 11:56:56AM +0200, Simon Horman wrote:
>> Hi,
>>
>> this patch-set provides SDHI driver support for eMMC HS400.
>>
>> Based on mmc-v4.17-2
>>
>> Dependencies for applying these patches:
>> * none
>>
>> Dependencies to test eMMC HS400:
>> * [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
>> * [PATCH v2] arm64: dts: salvator-common: Enable HS400 of SDHI2
>>
>> To assist testing and review this patch and the above mentioned
>> dependencies, which are necessary and sufficient to enable HS400 on H3 /
>> Salvator-X, M3-W 1.0 / Salvator-X and H3 ES2.0 Salvator-XS are available
>> at:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v4
>>
>> Changes since v3:
>> * As a follow-up to discussion with Ulf and Wolfram I have proposed
>>   two new HS400 tuning host operations. These are provided, and explained,
>>   in "mmc: core: more fine-grained hooks for HS400 tuning".
>>
>>   The following driver patches have been updated to use these new operations.
>>
>>   And "mmc: tmio: add eMMC HS400 mode support" proposes a minor cleanup
>>   to make it a little cleaner to add the proposed new host operations to
>>   the MMC core.
>
> I am wondering if you could give me some feedback on the approach that I
> have taken here.
>

Simon, apologize for the delay.

I have had a look at the series an overall the approach seems
reasonable to me. The new callbacks makes sense!

However, allow me another day for going into the details.

Kind regards
Uffe
