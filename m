Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:45714 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbeBZS6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 13:58:14 -0500
Date: Mon, 26 Feb 2018 13:58:12 -0500 (EST)
Message-Id: <20180226.135812.1342671817131564676.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] sh_eth: TSU_QTAG0/1 registers the same as
 TSU_QTAGM0/1
From: David Miller <davem@davemloft.net>
In-Reply-To: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
References: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 24 Feb 2018 20:28:16 +0300

> The TSU_QTAG0/1 registers found in the Gigabit Ether controllers actually
> have the same long name  as the TSU_QTAGM0/1 registers in the early Ether
> controllers:  Qtag Addition/Deletion Set Register (Port 0/1 to 1/0); thus
> there's no need to make a difference in sh_eth_tsu_init() between those
> controllers. Unfortunately, we can't just remove TSU_QTAG0/1 from the
> register *enum* because that would break the ethtool register dump...
> 
> Fixes: b0ca2a21f769 ("sh_eth: Add support of SH7763 to sh_eth")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
