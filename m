Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33811 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbeHTUfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:35:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so12187728ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 10:18:31 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6968b8d4-edb1-c8ac-239a-26278bc7470b@cogentembedded.com>
Date: Mon, 20 Aug 2018 20:18:28 +0300
MIME-Version: 1.0
In-Reply-To: <20180820164236.26nocbvtr5scp62v@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/20/2018 07:42 PM, Wolfram Sang wrote:

>> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
>> has a single SDHI core anyway, so can't be  a subject to the known RX DMA
>> errata...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Nit: some strange double spaces and '...' in the commit message:

   Why are you so hostile to ...? :-)

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> And out of interest: was this an HS400 eMMC memory?

   I ndon';t have the datasheet handy but I don't think it matters -- the board
only supplies 3.3V on both chip's voltage inputs...

> Thanks!

MBR, Sergei
