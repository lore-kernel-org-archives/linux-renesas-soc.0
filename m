Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34496 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934695AbeGFTrI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:47:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id c13-v6so5142099wrt.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:47:08 -0700 (PDT)
Subject: Re: [PATCH v2 08/14] ravb: fix invalid context bug while calling
 auto-negotiation by ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <979018fc-19a6-6092-3453-16c0fa9df187@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:47:04 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:14 AM, Vladimir Zapolskiy wrote:

> Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
> potentially sleeping") phy_start_aneg() function utilizes a mutex
> to serialize changes to phy state, however the helper function is
> called in atomic context.
> 
> The bug can be reproduced by running "ethtool -r" command, the bug
> is reported if CONFIG_DEBUG_ATOMIC_SLEEP build option is enabled.
> 
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   Again, the patch order question...

MBR, Sergei
