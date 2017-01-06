Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:40364 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbdAFUfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 15:35:07 -0500
Date: Fri, 06 Jan 2017 15:35:05 -0500 (EST)
Message-Id: <20170106.153505.2297570621984593459.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh_eth: fix EESIPR values for SH77{34|63}
From: David Miller <davem@davemloft.net>
In-Reply-To: <1819012.0ROIJmx7mp@wasted.cogentembedded.com>
References: <1819012.0ROIJmx7mp@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 04 Jan 2017 22:18:24 +0300

> As the SH77{34|63} manuals are freely available,  I've checked the EESIPR
> values written against the manuals, and they appeared to set the reserved
> bits 11-15 (which should be 0 on write). Fix those EESIPR values.
> 
> Fixes: 380af9e390ec ("net: sh_eth: CPU dependency code collect to "struct sh_eth_cpu_data"")
> Fixes: f5d12767c8fd ("sh_eth: get SH77{34|63} support out of #ifdef")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
