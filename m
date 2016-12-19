Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33866 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbcLSQ4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 11:56:46 -0500
Received: by mail-lf0-f43.google.com with SMTP id y21so58204161lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Dec 2016 08:56:45 -0800 (PST)
Subject: Re: [PATCHv2 1/5] sh_eth: add generic wake-on-lan support via magic
 packet
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20161212160931.6478-1-niklas.soderlund+renesas@ragnatech.se>
 <20161212160931.6478-2-niklas.soderlund+renesas@ragnatech.se>
 <079800f0-2e80-7a0b-01e2-51e09f05345c@cogentembedded.com>
 <20161219164159.GF21006@bigcity.dyn.berto.se>
Cc: Simon Horman <horms+renesas@verge.net.au>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <45380308-8a49-3a0c-b4cb-502908ad983f@cogentembedded.com>
Date: Mon, 19 Dec 2016 19:56:41 +0300
MIME-Version: 1.0
In-Reply-To: <20161219164159.GF21006@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/19/2016 07:41 PM, Niklas Söderlund wrote:

[...]

>>> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
>>> index 05b0dc5..87640b9 100644
>>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
[...]
>>> index d050f37..4ceed00 100644
>>> --- a/drivers/net/ethernet/renesas/sh_eth.h
>>> +++ b/drivers/net/ethernet/renesas/sh_eth.h
>>> @@ -493,6 +493,7 @@ struct sh_eth_cpu_data {
>>>  	unsigned shift_rd0:1;	/* shift Rx descriptor word 0 right by 16 */
>>>  	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
>>>  	unsigned rtrate:1;	/* EtherC has RTRATE register */
>>> +	unsigned magic:1;	/* EtherC has ECMR.PMDE and ECSR.MPD */
>>
>>    After looking at the SH7734/63 manuals it became obvious that PMDE was a
>> result of typo, the bit is called MPDE actually, the current name doesn't
>> make sense anyway. Care to fix?
>
> Sure, I add fixup patch to the front of this series which cleans this up
> before adding WoL support.

    That would be fine, TIA!

[...]

MBR, Sergei
