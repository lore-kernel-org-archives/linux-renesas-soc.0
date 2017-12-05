Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35672 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752766AbdLETEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 14:04:52 -0500
Received: by mail-lf0-f51.google.com with SMTP id j124so1529939lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2017 11:04:52 -0800 (PST)
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
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c334c622-9381-3bb5-eced-9a2ea6485fbd@cogentembedded.com>
Date: Tue, 5 Dec 2017 22:04:42 +0300
MIME-Version: 1.0
In-Reply-To: <20171205084945.384ea35e@windsurf.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/05/2017 10:49 AM, Thomas Petazzoni wrote:

>>> This commit adds the sh_eth_cpu_data structure that describes the
>>> SH7786 variant of the IP.
>>
>>      The manual seems to be unavailable, so I have to trust you. :-)
> 
> Yes, sadly. However, if you tell me what to double check, I'd be happy
> to do so.

    I have the manual now, will check against it...
    DaveM, I'm retracting my ACK for the time being.

> Thanks!
> 
> Thomas

MBR, Sergei
