Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:33082 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752692AbeBSQet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 11:34:49 -0500
Date: Mon, 19 Feb 2018 11:34:47 -0500 (EST)
Message-Id: <20180219.113447.1326450516964533016.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh_eth: simplify sh_eth_check_reset()
From: David Miller <davem@davemloft.net>
In-Reply-To: <0531592f-d845-d6b6-dbd4-bf01515b308c@cogentembedded.com>
References: <0531592f-d845-d6b6-dbd4-bf01515b308c@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 18 Feb 2018 18:21:05 +0300

> The *while* loop in this function  can be turned into a normal *for* loop.
> And getting rid  of the  single return point saves us a few more LoCs...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied to net-next, thanks Sergei.

> The patch is against DaveM's 'net-next.git' repo.

It is actually easier for you (and me) if you just indicate this in
your Subject like "[PATCH net-next]" in the future.

Thank you.
