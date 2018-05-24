Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33108 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032623AbeEXRBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 13:01:11 -0400
Received: by mail-wr0-f193.google.com with SMTP id a15-v6so4423253wrm.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 May 2018 10:01:10 -0700 (PDT)
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180524132202.GE24557@lunn.ch>
 <2bf96562-e402-d797-31e6-ba7e262e5637@mleia.com>
 <af16fdce-427e-c73a-b18b-d5f1c1d9d624@cogentembedded.com>
 <20180524164422.GI5128@lunn.ch>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f6e0b8c5-7fb9-babe-0114-350e7d6b2186@cogentembedded.com>
Date: Thu, 24 May 2018 20:01:07 +0300
MIME-Version: 1.0
In-Reply-To: <20180524164422.GI5128@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 07:44 PM, Andrew Lunn wrote:

>>>>> The change fixes a sleep in atomic context issue, which can be
>>>>> always triggered by running 'ethtool -r' command, because
>>>>> phy_start_aneg() protects phydev fields by a mutex.
>>
>>   You don't say that *not* grabbing the spinlock is safe... 
> 
> For it to be unsafe, i think that would mean phylib would need to call
> back into the MAC driver? The only way that could happen is via the
> adjust_link call. And that will deadlock, since it takes the same
> lock.
> 
> Or am i/we missing something?

   It doesn't take any locks currently, only patches #3/#6 makes it do so...

> 	    Andrew

MBR, Sergei
