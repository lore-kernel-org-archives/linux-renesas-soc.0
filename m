Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:39862 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdLEUOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 15:14:05 -0500
Date: Tue, 05 Dec 2017 15:14:03 -0500 (EST)
Message-Id: <20171205.151403.1813635509479339757.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: thomas.petazzoni@free-electrons.com,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
From: David Miller <davem@davemloft.net>
In-Reply-To: <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
References: <20171205084945.384ea35e@windsurf.lan>
        <c334c622-9381-3bb5-eced-9a2ea6485fbd@cogentembedded.com>
        <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 5 Dec 2017 22:49:10 +0300

> On 12/05/2017 10:04 PM, Sergei Shtylyov wrote:
> 
>>>>> This commit adds the sh_eth_cpu_data structure that describes the
>>>>> SH7786 variant of the IP.
>>>>
>>>>      The manual seems to be unavailable, so I have to trust you. :-)
>>>
>>> Yes, sadly. However, if you tell me what to double check, I'd be happy
>>> to do so.
>>     I have the manual now, will check against it...
>>     DaveM, I'm retracting my ACK for the time being.
> 
>    Starting to look into the manual, the current patch is wrong. SH7786
>    SoC was probably the 1st one to use what we thought was R-Car specific
>    register layout. Definite NAK on this version.

Ok.
