Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32842 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934284AbeGFSn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 14:43:58 -0400
Received: by mail-wm0-f65.google.com with SMTP id z6-v6so6025993wma.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 11:43:57 -0700 (PDT)
Subject: Re: [PATCH v2 02/14] sh_eth: fix invalid context bug while changing
 link options by ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081245.7395-3-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b943145f-fe1c-f38c-d060-9cba3efa7689@cogentembedded.com>
Date: Fri, 6 Jul 2018 21:43:52 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081245.7395-3-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:12 AM, Vladimir Zapolskiy wrote:

> The change fixes sleep in atomic context bug, which is encountered
> every time when link settings are changed by ethtool.
> 
> Since commit 35b5f6b1a82b ("PHYLIB: Locking fixes for PHY I/O
> potentially sleeping") phy_start_aneg() function utilizes a mutex
> to serialize changes to phy state, however that helper function is
> called in atomic context under a grabbed spinlock, because
> phy_start_aneg() is called by phy_ethtool_ksettings_set() and by
> replaced phy_ethtool_sset() helpers from phylib.

   So if all this boils down to phy_start_aneg(), shouldn't this patch
precede patch #1. Or even fixing both call chains with 1 patch? :-)

> Now duplex mode setting is enforced in sh_eth_adjust_link() only,
> also now RX/TX is disabled when link is put down or modifications
> to E-MAC registers ECMR and GECMR are expected for both cases of
> checked and ignored link status pin state from E-MAC interrupt handler.
> 
> For reference the change is a partial rework of commit 1e1b812bbe10
> ("sh_eth: fix handling of no LINK signal").
> 
> Fixes: dc19e4e5e02f ("sh: sh_eth: Add support ethtool")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
