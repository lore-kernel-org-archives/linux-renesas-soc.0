Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44017 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932799AbeGHXdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Jul 2018 19:33:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id b15-v6so9079772wrv.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Jul 2018 16:33:18 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Miller <davem@davemloft.net>
Cc: vladimir_zapolskiy@mentor.com, andrew@lunn.ch,
        geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180707.104719.681210882015993840.davem@davemloft.net>
 <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
 <20180708.085834.1283723823527928346.davem@davemloft.net>
 <efa424b3-1cf8-3eac-aea4-eaaef9df1b66@cogentembedded.com>
Message-ID: <de4d5278-b320-e9a8-7cd1-b158d8b93ffe@cogentembedded.com>
Date: Mon, 9 Jul 2018 02:33:20 +0300
MIME-Version: 1.0
In-Reply-To: <efa424b3-1cf8-3eac-aea4-eaaef9df1b66@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 7/9/2018 2:24 AM, Sergei Shtylyov wrote:

>>>     So you applied the whole series to net.git... that was somewhat
>>>     unexpected, at least by me. Care to share your reasoning?
>>
>> It's fixes a sleep in atomic which is a serious bug.
> 
>     Do you realize that only patches 0, 1, 8, and 9 were real fixes, others 

    1, 2, 8, and 9, of course. :-)

[...]

MBR, Sergei
