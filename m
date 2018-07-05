Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:46302 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeGEGJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 02:09:13 -0400
Subject: Re: [PATCH v2 08/14] ravb: fix invalid context bug while calling
 auto-negotiation by ethtool
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <fe75ec1c-4288-0cd2-e772-5553cadc5430@mentor.com>
Date: Thu, 5 Jul 2018 09:09:07 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-4-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset="windows-1252"
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

Here is an invalid commit specified, the proper tag is

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

--
Best wishes,
Vladimir
