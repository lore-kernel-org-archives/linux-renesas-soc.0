Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:35590 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752319AbeAES7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 13:59:35 -0500
Date: Fri, 05 Jan 2018 13:59:33 -0500 (EST)
Message-Id: <20180105.135933.100390185879161281.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] sh_eth: fix SH7757 GEther initialization
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180104180655.936982989@cogentembedded.com>
References: <20180104180655.936982989@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Thu, 04 Jan 2018 21:06:49 +0300

> Renesas  SH7757 has 2 Fast and 2 Gigabit Ether controllers, while the
> 'sh_eth' driver can only reset and initialize TSU of the first controller
> pair. Shimoda-san tried to solve that adding the 'needs_init' member to the
> 'struct sh_eth_plat_data', however the platform code still never sets this
> flag. I think  that we can infer this information from the 'devno' variable
> (set  to 'platform_device::id') and reset/init the Ether controller pair
> only for an even 'devno'; therefore 'sh_eth_plat_data::needs_init' can be
> removed...
> 
> Fixes: 150647fb2c31 ("net: sh_eth: change the condition of initialization")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied and queued up for -stable.
