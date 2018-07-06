Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34467 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934095AbeGFT6W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:58:22 -0400
Received: by mail-wm0-f67.google.com with SMTP id s13-v6so5201652wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:58:22 -0700 (PDT)
Subject: Re: [PATCH v2 09/14] ravb: fix invalid context bug while changing
 link options by ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-5-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8c930884-f819-edcb-9b63-07929738a0a3@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:58:18 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-5-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
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

   Wrong commit, as already noted...

> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
