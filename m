Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:51464 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbeFDTYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 15:24:18 -0400
Date: Mon, 04 Jun 2018 15:24:12 -0400 (EDT)
Message-Id: <20180604.152412.1320672866529057364.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] sh_eth: fix & clean up sh_eth_soft_swap()
From: David Miller <davem@davemloft.net>
In-Reply-To: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 2 Jun 2018 22:32:48 +0300

> Here's a set of 3 patches against DaveM's 'net-next.git' repo. First one fixes an
> old buffer endiannes issue (luckily, the ARM SoCs are smart enough to not actually
> care) plus couple clean ups around sh_eth_soft_swap()...
> 
> [1/1] sh_eth: make sh_eth_soft_swap() work on ARM
> [2/3] sh_eth: uninline sh_eth_soft_swap()
> [3/3] sh_eth: use DIV_ROUND_UP() in sh_eth_soft_swap()

Series applied, thank you.
