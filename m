Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42115 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbeHTXcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 19:32:51 -0400
Received: by mail-lf1-f65.google.com with SMTP id z11-v6so9561664lff.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 13:15:49 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato>
 <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
 <20180820200704.smyo2bc3tn5road2@katana>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4d51bb61-148d-4b5b-24bd-a5f9d6c27b7b@cogentembedded.com>
Date: Mon, 20 Aug 2018 23:15:46 +0300
MIME-Version: 1.0
In-Reply-To: <20180820200704.smyo2bc3tn5road2@katana>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/20/2018 11:07 PM, Wolfram Sang wrote:

>>>> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
>>>> has a single SDHI core anyway, so can't be  a subject to the known RX DMA
>>>> errata...
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Nit: some strange double spaces and '...' in the commit message:
>>>
>>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>>    Should I repost? Or you'd squash the fouble spaces and ellipsis while applying?
>>
>>    BTW, will this patch go into the next or fixes branch? (I remember Ulf wanted to
>> stick the analogous R8A77980 patch into fixes.)
> 
> I'll leave all these questions to Ulf.

   Sorry, I forgot you don't have a separate repo.

MBR, Sergei
