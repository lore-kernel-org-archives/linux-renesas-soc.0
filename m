Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:36670 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752720AbdLKQyL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 11:54:11 -0500
Date: Mon, 11 Dec 2017 11:54:06 -0500 (EST)
Message-Id: <20171211.115406.1236867479446845607.davem@davemloft.net>
To: thomas.petazzoni@free-electrons.com
Cc: sergei.shtylyov@cogentembedded.com,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] net: sh_eth: do not advertise Gigabit capabilities
 when not available
From: David Miller <davem@davemloft.net>
In-Reply-To: <20171208153540.3323-1-thomas.petazzoni@free-electrons.com>
References: <20171208153540.3323-1-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Dec 2017 16:35:40 +0100

> Not all variants of the sh_eth hardware have Gigabit
> support. Unfortunately, the current driver doesn't tell the PHY about
> the limited MAC capabilities. Due to this, if you have a Gigabit
> capable PHY, the PHY will advertise its Gigabit capability and
> establish a link at 1Gbit/s, even though the MAC doesn't support it.
> 
> In order to avoid this, we use the recently introduced
> phy_set_max_speed() to tell the PHY to not advertise speed higher than
> 100 MBit/s.
> 
> Tested on a SH7786 platform, with a Gigabit PHY.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.
