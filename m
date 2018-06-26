Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54132 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933870AbeFZKhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 06:37:13 -0400
Received: by mail-wm0-f68.google.com with SMTP id x6-v6so1298928wmc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jun 2018 03:37:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] sh_eth: fix *enum* RPADIR_BIT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
 <8c72d27f-8b1a-23cf-3f41-781944cd1388@cogentembedded.com>
 <CAMuHMdXro+fWQtoURHeqC6APqmci60NiMn5JAF98xcLxrjLNEg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e9cd4d85-36ed-b829-ba7a-ccebec306f1d@cogentembedded.com>
Date: Tue, 26 Jun 2018 13:37:10 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXro+fWQtoURHeqC6APqmci60NiMn5JAF98xcLxrjLNEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/26/2018 10:25 AM, Geert Uytterhoeven wrote:

>> The *enum*  RPADIR_BIT  was declared in the commit 86a74ff21a7a ("net:
>> sh_eth: add support for Renesas SuperH Ethernet") adding SH771x support,
>> however the SH771x manual doesn't have the RPADIR register described and,
>> moreover, tells why the padding insertion must not be used. The newer SoC
>> manuals do have RPADIR documented, though with somewhat different layout --
>> update the *enum* according to these manuals...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.h
>> @@ -403,8 +403,7 @@ enum DESC_I_BIT {
>>
>>   /* RPADIR */
>>   enum RPADIR_BIT {
>> -       RPADIR_PADS1 = 0x20000, RPADIR_PADS0 = 0x10000,
>> -       RPADIR_PADR = 0x0003f,
>> +       RPADIR_PADS = 0x1f0000, RPADIR_PADR = 0xffff,
> 
> Perhaps add some comments?
> 
>          RPADIR_PADS = 0x1f0000; /* Padding Size (insert N bytes of padding) */
>          RPADIR_PADR = 0xffff;   /* Padding Slot (insert padding at byte N) */

    It would be nice but inconsistent with what we do for the other registers...

>>   };
> 
> Note that none of the RPADIR enums are actually used.

    I'd surely noted that. :-)

> Gr{oetje,eeting}s,
> 
>                          Geert
> 

MBR, Sergei
