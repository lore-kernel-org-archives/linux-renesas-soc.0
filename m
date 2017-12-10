Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:39544 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751709AbdLJLzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 06:55:19 -0500
Received: by mail-lf0-f51.google.com with SMTP id l81so16200748lfl.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Dec 2017 03:55:19 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
 <4c0c70ac-6db2-7c8a-4e5e-9364919e5012@cogentembedded.com>
 <20171205084945.384ea35e@windsurf.lan>
 <c334c622-9381-3bb5-eced-9a2ea6485fbd@cogentembedded.com>
 <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
 <20171208164017.3e9a7cc6@windsurf.lan>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4d54778c-fc3f-067d-3d35-62b9f009c9d0@cogentembedded.com>
Date: Sun, 10 Dec 2017 14:55:15 +0300
MIME-Version: 1.0
In-Reply-To: <20171208164017.3e9a7cc6@windsurf.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/08/2017 06:40 PM, Thomas Petazzoni wrote:

>>>>>> This commit adds the sh_eth_cpu_data structure that describes the
>>>>>> SH7786 variant of the IP.
>>>>>
>>>>>       The manual seems to be unavailable, so I have to trust you. :-)
>>>>
>>>> Yes, sadly. However, if you tell me what to double check, I'd be happy
>>>> to do so.
>>>
>>>      I have the manual now, will check against it...
>>>      DaveM, I'm retracting my ACK for the time being.
>>
>>      Starting to look into the manual, the current patch is wrong. SH7786 SoC
>> was probably the 1st one to use what we thought was R-Car specific register
>> layout. Definite NAK on this version.
> 
> Thanks for the feedback. How do we proceed from there ? I don't have

    Please use SH_ETH_REG_FAST_RCAR for the register layout.

> access to a lot of datasheets of the different Renesas SoCs, so it's
> not easy to figure out which IP variant the SH7786 is using compared to
> other Renesas SoCs.

    I've already done that for you. :-)

> Just out of curiosity, which specific aspect makes you think the
> proposed patch is wrong ?

    Total Ether register/bit documentation rehaul done for SH7786/R-Car -- 
including the register (and bit) rename and moving the registers to different 
offsets...

> Have you noticed a specific register or field
> that isn't compatible with SH_ETH_REG_FAST_SH4 layout ?

    There are surely SH4 registers that don't exist on SH7786 -- like BCFRR, 
RTRATE, RPADIR, RBWAR, RDFAR, TBRAR, TDFAR...

> Note that my patch makes Ethernet work in practice on SH7784, I have
> root over NFS working as we speak.

   I don't doubt it...

> This certainly doesn't mean that the
> patch is entirely correct, but it definitely means that the
> SH_ETH_REG_FAST_SH4 is close enough to what the SH7786 is using :-)

    SH_ETH_REG_FAST_RCAR is definitely closer. :-)

> Thanks!
> 
> Thomas

MBR, Sergei
