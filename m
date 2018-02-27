Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:33336 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbeB0TkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 14:40:19 -0500
Date: Tue, 27 Feb 2018 14:40:17 -0500 (EST)
Message-Id: <20180227.144017.1195873739791164596.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] sh_eth: uninline TSU register accessors
From: David Miller <davem@davemloft.net>
In-Reply-To: <ed6bd038-fc53-b6ce-b987-a752f2be8335@cogentembedded.com>
References: <ed6bd038-fc53-b6ce-b987-a752f2be8335@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 27 Feb 2018 14:58:16 +0300

> We have uninlined the sh_eth_{read|write}() functions introduced in the
> commit 4a55530f38e ("net: sh_eth: modify the definitions of register").
> Now remove *inline* from sh_eth_tsu_{read|write}() as  well and move
> these functions from the header to the driver itself. This saves 684
> more bytes of object code (ARM gcc 4.8.5)...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied to 'net', as requested in a followup.
