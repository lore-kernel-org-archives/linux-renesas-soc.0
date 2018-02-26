Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:45728 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbeBZS7n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 13:59:43 -0500
Date: Mon, 26 Feb 2018 13:59:42 -0500 (EST)
Message-Id: <20180226.135942.1679322395539925771.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] sh_eth: fix TSU init on SH7734/R8A7740
From: David Miller <davem@davemloft.net>
In-Reply-To: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
References: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 24 Feb 2018 22:41:45 +0300

> It appears that the single port Ether controllers having TSU (like SH7734/
> R8A7740) need the same kind of treating in sh_eth_tsu_init() as R7S72100
> currently has -- they also don't have the TSU registers related e.g. to
> passing the frames between ports. Add the 'sh_eth_cpu_data::dual_port'
> flag and use it as a new criterion for taking a "short path" in the TSU
> init sequence in order to avoid writing to the non-existant registers...
> 
> Fixes: f0e81fecd4f8 ("net: sh_eth: Add support SH7734")
> Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied with commit messsage spelling problem fixed.

Thanks.
