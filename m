Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34232 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728738AbeHVNNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:13:04 -0400
Received: by mail-io0-f195.google.com with SMTP id c22-v6so985142iob.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 02:48:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato> <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Aug 2018 11:48:54 +0200
Message-ID: <CAPDyKFoTV+bfgrHei4Q6aouW5sFFuZ0STmO2Zfv9YC3S2VvmTA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to whitelist
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20 August 2018 at 21:44, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 08/20/2018 07:42 PM, Wolfram Sang wrote:
>
>>> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
>>> has a single SDHI core anyway, so can't be  a subject to the known RX DMA
>>> errata...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Nit: some strange double spaces and '...' in the commit message:
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
>    Should I repost? Or you'd squash the fouble spaces and ellipsis while applying?

No need to repost, I have amended the change.

>
>    BTW, will this patch go into the next or fixes branch? (I remember Ulf wanted to
> stick the analogous R8A77980 patch into fixes.)

Don't recall, but decided to queue this for v4.20. Please tell if you
want me to do otherwise.

Kind regards
Uffe
