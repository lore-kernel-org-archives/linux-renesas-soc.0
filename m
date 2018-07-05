Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:46316 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751447AbeGEGJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 02:09:32 -0400
Subject: Re: [PATCH v2 09/14] ravb: fix invalid context bug while changing
 link options by ethtool
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-5-vladimir_zapolskiy@mentor.com>
CC: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <e24a092c-9a7a-f246-f243-74835eb6b15b@mentor.com>
Date: Thu, 5 Jul 2018 09:09:27 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-5-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:14 AM, Vladimir Zapolskiy wrote:
> The change fixes sleep in atomic context bug, which is encountered
> every time when link settings are changed by ethtool.
> 
> Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
> potentially sleeping") phy_start_aneg() function utilizes a mutex
> to serialize changes to phy state, however that helper function is
> called in atomic context under a grabbed spinlock, because
> phy_start_aneg() is called by phy_ethtool_ksettings_set() and by
> replaced phy_ethtool_sset() helpers from phylib.
> 
> Now duplex mode setting is enforced in ravb_adjust_link() only, also
> now RX/TX is disabled when link is put down or modifications to E-MAC
> registers ECMR and GECMR are expected for both cases of checked and
> ignored link status pin state from E-MAC interrupt handler.
> 
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")

Here is an invalid commit specified, the proper tag is

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

--
Best wishes,
Vladimir
