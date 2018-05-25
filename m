Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:36083 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932304AbeEYGFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 02:05:33 -0400
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Andrew Lunn <andrew@lunn.ch>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180524132202.GE24557@lunn.ch>
 <2bf96562-e402-d797-31e6-ba7e262e5637@mleia.com>
 <af16fdce-427e-c73a-b18b-d5f1c1d9d624@cogentembedded.com>
 <20180524164422.GI5128@lunn.ch>
 <f6e0b8c5-7fb9-babe-0114-350e7d6b2186@cogentembedded.com>
CC: Vladimir Zapolskiy <vz@mleia.com>,
        "David S. Miller" <davem@davemloft.net>, <netdev@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <701f71f8-5943-216e-9f81-62f88b9b0dc2@mentor.com>
Date: Fri, 25 May 2018 09:05:17 +0300
MIME-Version: 1.0
In-Reply-To: <f6e0b8c5-7fb9-babe-0114-350e7d6b2186@cogentembedded.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Sergei,

On 05/24/2018 08:01 PM, Sergei Shtylyov wrote:
> On 05/24/2018 07:44 PM, Andrew Lunn wrote:
> 
>>>>>> The change fixes a sleep in atomic context issue, which can be
>>>>>> always triggered by running 'ethtool -r' command, because
>>>>>> phy_start_aneg() protects phydev fields by a mutex.
>>>
>>>   You don't say that *not* grabbing the spinlock is safe...

I say both that it is the fix and it is safe, I've already described
the function of the spinlock in my comments, and it is more or less
clear from the driver code.

>>
>> For it to be unsafe, i think that would mean phylib would need to call
>> back into the MAC driver? The only way that could happen is via the
>> adjust_link call. And that will deadlock, since it takes the same
>> lock.
>>
>> Or am i/we missing something?
> 
>    It doesn't take any locks currently, only patches #3/#6 makes it do so...

And that's the proper fix in my opinion, my tests don't unveil any issues.

--
With best wishes,
Vladimir
