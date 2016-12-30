Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:60328 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752946AbcL3DQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 22:16:25 -0500
Date: Thu, 29 Dec 2016 22:16:22 -0500 (EST)
Message-Id: <20161229.221622.1861506744608931336.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        ben.hutchings@codethink.co.uk
Subject: Re: [PATCH] sh_eth: fix branch prediction in sh_eth_interrupt()
From: David Miller <davem@davemloft.net>
In-Reply-To: <2810883.6xQhqSTVDe@wasted.cogentembedded.com>
References: <2810883.6xQhqSTVDe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 30 Dec 2016 00:07:38 +0300

> IIUC, likely()/unlikely() should apply to the whole *if* statement's
> expression, not a part of it  -- fix such expression in  sh_eth_interrupt()
> accordingly...
> 
> Fixes: 283e38db65e7 ("sh_eth: Fix serialisation of interrupt disable with interrupt & NAPI handlers")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against DaveM's 'net-next.git' repo; I'm not sure if it should
> be  targeted to the 'net.git' repo instead...

I decided to apply this to 'net', thanks.
