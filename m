Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:47844 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933003AbeGISQt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 14:16:49 -0400
Date: Mon, 09 Jul 2018 11:16:45 -0700 (PDT)
Message-Id: <20180709.111645.379820862060333809.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: vladimir_zapolskiy@mentor.com, andrew@lunn.ch,
        geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
From: David Miller <davem@davemloft.net>
In-Reply-To: <efa424b3-1cf8-3eac-aea4-eaaef9df1b66@cogentembedded.com>
References: <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
        <20180708.085834.1283723823527928346.davem@davemloft.net>
        <efa424b3-1cf8-3eac-aea4-eaaef9df1b66@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 9 Jul 2018 02:24:45 +0300

> Hello!
> 
> On 7/8/2018 2:58 AM, David Miller wrote:
> 
>>>     So you applied the whole series to net.git... that was somewhat
>>>     unexpected, at least by me. Care to share your reasoning?
>> It's fixes a sleep in atomic which is a serious bug.
> 
>    Do you realize that only patches 0, 1, 8, and 9 were real fixes,
>    others were just follow-up cleanups? (Although the wording of the
>    cover letter could have made people think that the whole series is the
>    fixes...)
>    OK, I understand what's done is done and it's not me that would have
>    to justify the cleanups in a middle of the 4.18-rc's. But still, it
>    was not a pleasant surprise (and I told Vladimir he shouldn't mix the
>    real fixes and
> cleanups in reply to his cover letter, IIRC).

I was disappointed the series was so large as well.

Let's try to work together to handle this better next time, ok?
