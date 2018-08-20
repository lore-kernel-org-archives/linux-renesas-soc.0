Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46960 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbeHTXBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 19:01:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id e23-v6so6453635lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 12:44:21 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <58234466-b523-66da-82fb-12ef54739dfe@cogentembedded.com>
Date: Mon, 20 Aug 2018 22:44:18 +0300
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
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

   Should I repost? Or you'd squash the fouble spaces and ellipsis while applying?

   BTW, will this patch go into the next or fixes branch? (I remember Ulf wanted to
stick the analogous R8A77980 patch into fixes.)

MBR, Sergei
