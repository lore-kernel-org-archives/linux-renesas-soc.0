Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:40626 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbeLDQtj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 11:49:39 -0500
Date: Tue, 04 Dec 2018 08:49:37 -0800 (PST)
Message-Id: <20181204.084937.2062398264103773495.davem@davemloft.net>
To: andrew@lunn.ch
Cc: f.fainelli@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181204104333.GC741@lunn.ch>
References: <20181203.152057.61263535375452379.davem@davemloft.net>
        <92358866-e231-15e7-84f4-86a6fa51ed49@gmail.com>
        <20181204104333.GC741@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 4 Dec 2018 11:43:33 +0100

>> > Series applied, thank you.
>> 
>> Meh! I guess we should be faster at reviewing stuff :/
> 
> And there have been things going on behind the scenes to try to get a
> real fix. Sorry, i should of mentioned that.
> 
> David, could you revert this please?

Sure, done.
