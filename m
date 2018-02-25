Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42400 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751800AbeBYO1l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Feb 2018 09:27:41 -0500
Received: by mail-lf0-f66.google.com with SMTP id t204so18602941lff.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Feb 2018 06:27:40 -0800 (PST)
Subject: Re: [PATCH net-next] sh_eth: TSU_QTAG0/1 registers the same as
 TSU_QTAGM0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
 <CAMuHMdWCR+yHxwUJuvaDq4ZFuxExjuAZrEY_Vkj88EHbEpi_Og@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6de5c988-df74-2ca5-c3bb-b2979943b85d@cogentembedded.com>
Date: Sun, 25 Feb 2018 17:27:36 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWCR+yHxwUJuvaDq4ZFuxExjuAZrEY_Vkj88EHbEpi_Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/25/2018 04:14 PM, Geert Uytterhoeven wrote:

>> The TSU_QTAG0/1 registers found in the Gigabit Ether controllers actually
>> have the same long name  as the TSU_QTAGM0/1 registers in the early Ether
>> controllers:  Qtag Addition/Deletion Set Register (Port 0/1 to 1/0); thus
>> there's no need to make a difference in sh_eth_tsu_init() between those
>> controllers. Unfortunately, we can't just remove TSU_QTAG0/1 from the
>> register *enum* because that would break the ethtool register dump...
>>
>> Fixes: b0ca2a21f769 ("sh_eth: Add support of SH7763 to sh_eth")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
> 
>> @@ -2097,8 +2097,6 @@ static size_t __sh_eth_get_regs(struct n
>>                 add_tsu_reg(TSU_FWSL0);
>>                 add_tsu_reg(TSU_FWSL1);
>>                 add_tsu_reg(TSU_FWSLC);
>> -               add_tsu_reg(TSU_QTAG0);
>> -               add_tsu_reg(TSU_QTAG1);
> 
> Shouldn't you keep the above for ethtool register dump?

   Why dump the same registers twice? These are no longer marked as valid in the dump
buffer and a dump user's only source of info about the valid registers is the bitmap
at the start of the buffer...
   Note that the dump is only done for the registers actually used by the driver, and
these 2 regs are no longer used anywhere...

>>                 add_tsu_reg(TSU_QTAGM0);
>>                 add_tsu_reg(TSU_QTAGM1);
>>                 add_tsu_reg(TSU_FWSR);

MBR, Sergei
