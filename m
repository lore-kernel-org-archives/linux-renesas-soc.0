Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:51830 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbeHWOM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 10:12:27 -0400
Received: by mail-it0-f65.google.com with SMTP id e14-v6so6918810itf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 03:43:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <06154a74-e06b-8a5e-6828-c96946a3ef15@cogentembedded.com>
References: <624fec83-0190-18b4-1d80-b59b1bc964b2@cogentembedded.com>
 <20180822193700.nzwxfhmgloslfkzx@katana> <06154a74-e06b-8a5e-6828-c96946a3ef15@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Aug 2018 12:43:20 +0200
Message-ID: <CAPDyKFpgXT9udOYLmRchvMQ-oCo8ZBY18iCaae1zVbT1=YuWQw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22 August 2018 at 22:07, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 08/22/2018 10:37 PM, Wolfram Sang wrote:
>
>>> I have encountered an interrupt storm during the eMMC chip probing (and
>>> the chip finally didn't get detected).  It turned out that U-Boot left
>>> the SDHI DMA interrupts enabled while the Linux driver didn't use those.
>>> Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
>>> rid of both issues...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC")
>
> MBR, Sergei

Applied for fixes, thanks!

Kind regards
Uffe
