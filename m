Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:47058 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932155AbeAHTcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 14:32:10 -0500
Date: Mon, 08 Jan 2018 14:32:09 -0500 (EST)
Message-Id: <20180108.143209.1582638715239179133.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] sh_eth: fix TXALCR1 offsets
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180106212652.818833413@cogentembedded.com>
References: <20180106212652.818833413@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 07 Jan 2018 00:26:47 +0300

> The  TXALCR1 offsets are incorrect in the register offset tables, most
> probably due to copy&paste error.  Luckily, the driver never uses this
> register. :-)
> 
> Fixes: 4a55530f38e4 ("net: sh_eth: modify the definitions of register")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
