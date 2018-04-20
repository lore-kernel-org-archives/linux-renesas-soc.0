Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34982 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754066AbeDTIgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 04:36:55 -0400
Received: by mail-lf0-f66.google.com with SMTP id r125-v6so4013283lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 01:36:55 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77980 to
 whitelist
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
 <20180419200907.udbe3v744a4tvu6c@ninjato>
 <CAPDyKFqM5+oWNoPU1Htj1WVwd798LqCN-3p__3-4ygf_Lhknew@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4f284570-d000-7c6c-4c8e-d5f5920d6203@cogentembedded.com>
Date: Fri, 20 Apr 2018 11:36:51 +0300
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqM5+oWNoPU1Htj1WVwd798LqCN-3p__3-4ygf_Lhknew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 4/20/2018 10:08 AM, Ulf Hansson wrote:

>>> I've successfully tested eMMC on R8A77980/Condor. R8A77980 has a single
>>> SDHI core anyway, so can't be a subject of the known RX DMA errata...

    Should have been s/of/to/, I think.

>> Lucky you ;)
>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
> Seems like this one also should go for fixes/stable then?

    In its current form it's only good for the next branch. Recasting/merging 
it for the fixes branch will result in the rejects in the next branch where 
you have already merged Wolfram's patches. The decision is up to you, of course...

> Kind regards
> Uffe

MBR, Sergei
