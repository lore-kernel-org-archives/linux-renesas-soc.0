Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36203 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753287AbeGEI1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 04:27:55 -0400
Received: by mail-wm0-f65.google.com with SMTP id s14-v6so9401431wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Jul 2018 01:27:55 -0700 (PDT)
Subject: Re: [PATCH v2 08/14] ravb: fix invalid context bug while calling
 auto-negotiation by ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
 <fe75ec1c-4288-0cd2-e772-5553cadc5430@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a840dedf-d636-ace4-18b4-a08f4c6b5a1e@cogentembedded.com>
Date: Thu, 5 Jul 2018 11:27:51 +0300
MIME-Version: 1.0
In-Reply-To: <fe75ec1c-4288-0cd2-e772-5553cadc5430@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/5/2018 9:09 AM, Vladimir Zapolskiy wrote:

>> Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
>> potentially sleeping") phy_start_aneg() function utilizes a mutex
>> to serialize changes to phy state, however the helper function is
>> called in atomic context.
>>
>> The bug can be reproduced by running "ethtool -r" command, the bug
>> is reported if CONFIG_DEBUG_ATOMIC_SLEEP build option is enabled.
>>
>> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> 
> Here is an invalid commit specified, the proper tag is
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

    I was just going to tell you that. :-)
> --
> Best wishes,
> Vladimir

MBR, Sergei
