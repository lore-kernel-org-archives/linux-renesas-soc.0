Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32987 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbeHVXdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 19:33:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id s12-v6so2390321ljj.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 13:07:21 -0700 (PDT)
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <624fec83-0190-18b4-1d80-b59b1bc964b2@cogentembedded.com>
 <20180822193700.nzwxfhmgloslfkzx@katana>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <06154a74-e06b-8a5e-6828-c96946a3ef15@cogentembedded.com>
Date: Wed, 22 Aug 2018 23:07:18 +0300
MIME-Version: 1.0
In-Reply-To: <20180822193700.nzwxfhmgloslfkzx@katana>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/22/2018 10:37 PM, Wolfram Sang wrote:

>> I have encountered an interrupt storm during the eMMC chip probing (and
>> the chip finally didn't get detected).  It turned out that U-Boot left
>> the SDHI DMA interrupts enabled while the Linux driver didn't use those.
>> Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
>> rid of both issues...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC")

MBR, Sergei
