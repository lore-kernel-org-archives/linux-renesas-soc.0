Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:43950 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031140AbeEXQo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 12:44:29 -0400
Date: Thu, 24 May 2018 18:44:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
Message-ID: <20180524164422.GI5128@lunn.ch>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180524132202.GE24557@lunn.ch>
 <2bf96562-e402-d797-31e6-ba7e262e5637@mleia.com>
 <af16fdce-427e-c73a-b18b-d5f1c1d9d624@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af16fdce-427e-c73a-b18b-d5f1c1d9d624@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 24, 2018 at 07:18:28PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 05/24/2018 05:11 PM, Vladimir Zapolskiy wrote:
> 
> >>> The change fixes a sleep in atomic context issue, which can be
> >>> always triggered by running 'ethtool -r' command, because
> >>> phy_start_aneg() protects phydev fields by a mutex.
> 
>   You don't say that *not* grabbing the spinlock is safe... 

For it to be unsafe, i think that would mean phylib would need to call
back into the MAC driver? The only way that could happen is via the
adjust_link call. And that will deadlock, since it takes the same
lock.

Or am i/we missing something?

	    Andrew
