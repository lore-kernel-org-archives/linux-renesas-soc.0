Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34097 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbeHTUSy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:18:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id g9-v6so6194589lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 10:02:28 -0700 (PDT)
Subject: Re: [PATCH] mmc: tmio_mmc_core: don't claim spurious interrupts
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <f2295f99-2354-a2ad-5013-0501ecb0d3a1@cogentembedded.com>
 <20180820165528.nuf3rmckuu7d4zqs@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ee36da1b-e2a6-41d6-2ec9-08a091621166@cogentembedded.com>
Date: Mon, 20 Aug 2018 20:02:25 +0300
MIME-Version: 1.0
In-Reply-To: <20180820165528.nuf3rmckuu7d4zqs@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/20/2018 07:55 PM, Wolfram Sang wrote:

>> I have encountered an interrupt storm  during the eMMC chip probing (and
>> the chip finally didn't get detected). It  turned out  that U-Boot  left
>> the DMAC interrupts enabled while the  Linux driver didn't use those.
>> The SDHI driver's interrupt handler somehow  assumes that, even if a
>> SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
>> if none of the enabled interrupts happened and got handled, we should
>> return IRQ_NONE -- that  way the kernel IRQ code recoginizes a spurious
>> interrupt and masks  it  off pretty quickly...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Can be argued.

   You get interrupt storm anyway, just not as quickly stopped as with this fix
(I hadn't understood *how* it gets finally stopped, I only know there's ~600000
interrupts before it gets quiet instead of 100000 with IRQ_NONE).

> Should come after Yamada-san's patches, I'd think.

   What are these?

> BTW Sergei, did you test with SDIO devices?

   No. But I really think the current code is borked. If you don't have an interrupt
to handle, you should idicate that.

MBR, Sergei
