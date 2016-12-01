Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36193 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757015AbcLARhz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 12:37:55 -0500
Received: by mail-lf0-f50.google.com with SMTP id t196so177414925lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 09:37:55 -0800 (PST)
Subject: Re: [PATCH v2] sh_eth: remove unchecked interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <chris.brandt@renesas.com>
References: <20161201140642.28583-1-chris.brandt@renesas.com>
 <CAMuHMdU80M2qcK74YgPC8SZ20tNcKrZhj7MXo_Ok=6m4Aa0=-w@mail.gmail.com>
Cc: David Miller <davem@davemloft.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <25b92de0-806b-342b-7556-06b96b948b2c@cogentembedded.com>
Date: Thu, 1 Dec 2016 20:37:51 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU80M2qcK74YgPC8SZ20tNcKrZhj7MXo_Ok=6m4Aa0=-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/01/2016 05:42 PM, Geert Uytterhoeven wrote:

>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -518,7 +518,7 @@ static struct sh_eth_cpu_data r7s72100_data = {
>>
>>         .ecsr_value     = ECSR_ICD,
>>         .ecsipr_value   = ECSIPR_ICDIP,
>> -       .eesipr_value   = 0xff7f009f,
>> +       .eesipr_value   = 0xe77f009f,
>
> Comment not directly related to the merits of this patch: the EESIPR bit
> definitions seem to be identical to those for EESR, so we can get rid of the
> hardcoded values here?

    Do you mean using the @define's? We have EESIPR bits also declared, see 
enum DMAC_IM_BIT,

[...]

MBR, Sergei
