Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34076 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdAXPvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 10:51:20 -0500
Received: by mail-lf0-f51.google.com with SMTP id v186so113448400lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 07:51:19 -0800 (PST)
Subject: Re: [PATCH 2/3] sh_eth: add missing EESIPR bits
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1636105.gp4aQxGd5K@wasted.cogentembedded.com>
 <3805935.iR4tgtFiHm@wasted.cogentembedded.com>
 <CAMuHMdVED1D46zGkuSbpF22ZnKKjWcf50yRp-uT+LcBY_70xgA@mail.gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f320226f-222a-2d3c-fa70-1e42f27c64f7@cogentembedded.com>
Date: Tue, 24 Jan 2017 18:51:16 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVED1D46zGkuSbpF22ZnKKjWcf50yRp-uT+LcBY_70xgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/23/2017 10:41 AM, Geert Uytterhoeven wrote:

>> Renesas SH77{34|63} manuals  describe more EESIPR bits than the current
>> driver. Declare the new bits with the end goal of using the bit names
>> instead of the bare numbers  for  the 'sh_eth_cpu_data::eesipr_value'
>> initializers...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> ---
>>  drivers/net/ethernet/renesas/sh_eth.h |   10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
>> ===================================================================
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.h
>> @@ -269,13 +269,17 @@ enum EESR_BIT {
>>
>>  /* EESIPR */
>>  enum EESIPR_BIT {
>> -       EESIPR_TWBIP    = 0x40000000,
>> +       EESIPR_TWB1IP   = 0x80000000,
>> +       EESIPR_TWBIP    = 0x40000000,   /* same as TWB0IP */
>
> Ah, your adding it here ;-)

    Do you want me to add such comment in the 1st patch instead?

> Gr{oetje,eeting}s,
>
>                         Geert

MRB, Sergei
