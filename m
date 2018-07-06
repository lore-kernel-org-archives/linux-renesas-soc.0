Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40947 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933109AbeGFPji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 11:39:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id t6-v6so4619793wrn.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 08:39:38 -0700 (PDT)
Subject: Re: [PATCH v2 01/14] sh_eth: fix invalid context bug while calling
 auto-negotiation by ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081245.7395-2-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e2111ad0-1b3e-3295-1367-ca537e616f40@cogentembedded.com>
Date: Fri, 6 Jul 2018 18:39:35 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081245.7395-2-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/4/2018 11:12 AM, Vladimir Zapolskiy wrote:

> Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
> potentially sleeping") phy_start_aneg() function utilizes a mutex
> to serialize changes to phy state, however the helper function is
> called in atomic context.
> 
> The bug can be reproduced by running "ethtool -r" command, the bug
> is reported if CONFIG_DEBUG_ATOMIC_SLEEP build option is enabled.
> 
> Fixes: dc19e4e5e02f ("sh: sh_eth: Add support ethtool")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    The patch obviously does what it promises, however I'm still not sure 
whether it should be placed after the next fix, not before...

MBR, Sergei
