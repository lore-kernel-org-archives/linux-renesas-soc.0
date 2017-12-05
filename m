Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:41339 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751161AbdLETtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 14:49:15 -0500
Received: by mail-lf0-f49.google.com with SMTP id f18so1651790lfg.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2017 11:49:14 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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
Message-ID: <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
Date: Tue, 5 Dec 2017 22:49:10 +0300
MIME-Version: 1.0
In-Reply-To: <c334c622-9381-3bb5-eced-9a2ea6485fbd@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/05/2017 10:04 PM, Sergei Shtylyov wrote:

>>>> This commit adds the sh_eth_cpu_data structure that describes the
>>>> SH7786 variant of the IP.
>>>
>>>      The manual seems to be unavailable, so I have to trust you. :-)
>>
>> Yes, sadly. However, if you tell me what to double check, I'd be happy
>> to do so.
> 
>     I have the manual now, will check against it...
>     DaveM, I'm retracting my ACK for the time being.

    Starting to look into the manual, the current patch is wrong. SH7786 SoC 
was probably the 1st one to use what we thought was R-Car specific register 
layout. Definite NAK on this version.

>> Thanks!
>>
>> Thomas

MBR, Sergei
