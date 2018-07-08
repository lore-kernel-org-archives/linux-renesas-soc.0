Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40783 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932692AbeGHXYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Jul 2018 19:24:42 -0400
Received: by mail-wm0-f65.google.com with SMTP id z13-v6so18859997wma.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Jul 2018 16:24:42 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
To: David Miller <davem@davemloft.net>
Cc: vladimir_zapolskiy@mentor.com, andrew@lunn.ch,
        geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180707.104719.681210882015993840.davem@davemloft.net>
 <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
 <20180708.085834.1283723823527928346.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <efa424b3-1cf8-3eac-aea4-eaaef9df1b66@cogentembedded.com>
Date: Mon, 9 Jul 2018 02:24:45 +0300
MIME-Version: 1.0
In-Reply-To: <20180708.085834.1283723823527928346.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/8/2018 2:58 AM, David Miller wrote:

>>     So you applied the whole series to net.git... that was somewhat
>>     unexpected, at least by me. Care to share your reasoning?
> 
> It's fixes a sleep in atomic which is a serious bug.

    Do you realize that only patches 0, 1, 8, and 9 were real fixes, others 
were just follow-up cleanups? (Although the wording of the cover letter could 
have made people think that the whole series is the fixes...)
    OK, I understand what's done is done and it's not me that would have to 
justify the cleanups in a middle of the 4.18-rc's. But still, it was not a 
pleasant surprise (and I told Vladimir he shouldn't mix the real fixes and
cleanups in reply to his cover letter, IIRC).

MBR, Sergei
