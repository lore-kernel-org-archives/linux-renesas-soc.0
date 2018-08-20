Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38721 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbeHTUIm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:08:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id i7-v6so1835104lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 09:52:17 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <711ef434-1208-4a9b-1c0d-519395251531@cogentembedded.com>
 <20180820163856.cqp62em4ccerf7x5@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <027a20b0-5047-2d89-76f7-55dec7a67dba@cogentembedded.com>
Date: Mon, 20 Aug 2018 19:52:14 +0300
MIME-Version: 1.0
In-Reply-To: <20180820163856.cqp62em4ccerf7x5@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 08/20/2018 07:38 PM, Wolfram Sang wrote:

>> I have encountered an interrupt storm during the eMMC chip probing (and
>> the chip finally didn't get detected). It turned out  that U-Boot  left
>> the SDHI DMA interrupts enabled while the Linux  driver didn't use those.
>> Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
>> rid  of both  issues...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for fixing this issue.
> 
>>
>> ---
>> The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.
>>
>>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> ===================================================================
>> --- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> +++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> @@ -51,10 +51,12 @@
>>  #define INFO1_CLEAR		0
>>  #define INFO1_DTRANEND1		BIT(17)
>>  #define INFO1_DTRANEND0		BIT(16)
>> +#define INFO1_RESERVED_BITS	GENMASK_ULL(32, 0)
> 
> 31?

   Indeed. Than RST_RESERVED_BITS (from which I copied w/o much thinking)
is also wrong!

> Also, RESERVED_BITS is not quite proper. Not all of those bits are
> reserved. Maybe CLEAR_MASK?

   Indeed, would seem better... but RST_RESERVED_BITS also needs fixing then...

>>  /* DM_CM_INFO2 and DM_CM_INFO2_MASK */
>>  #define INFO2_DTRANERR1		BIT(17)
>>  #define INFO2_DTRANERR0		BIT(16)
>> +#define INFO2_RESERVED_BITS	GENMASK_ULL(32, 0)
> 
> Same as above. Maybe we even need one define only?

   No, I think 2 separate regs deserve 2 separate masks.

>> +	/*
>> +	 * We don't use the DMA interrupts,  but they might have been enabled
>> +	 * by a bootloader,  so mask them to avoid an interrupt storm...
>> +	 */
> 
> Two spaces after ',' looks odd to me. Also, no need for "..."

   Both are my preferences. Yes, I probably should have worked in the
typesetting industry... :-) 

> I'd even think with a name like CLEAR_MASK, the comment could even go.

   Disagree here. The register #defines don't provide enough info on what's
going on...

>> +	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1_MASK,
>> +					    INFO1_RESERVED_BITS);
>> +	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO2_MASK,
>> +					    INFO2_RESERVED_BITS);

MBR, Sergei
