Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:55402 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1428342AbdDXR7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 13:59:08 -0400
Date: Mon, 24 Apr 2017 13:59:05 -0400 (EDT)
Message-Id: <20170424.135905.515581977383181185.davem@davemloft.net>
To: dan.carpenter@oracle.com
Cc: sergei.shtylyov@cogentembedded.com,
        kazuya.mizuguchi.ks@renesas.com, horms+renesas@verge.net.au,
        ykaneko0929@gmail.com, masaru.nagai.vx@renesas.com,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se,
        tremyfr@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] ravb: Double free on error in ravb_start_xmit()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170422104656.jjnooh3or4x3lbw3@mwanda>
References: <20170422104656.jjnooh3or4x3lbw3@mwanda>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Apr 2017 13:46:56 +0300

> If skb_put_padto() fails then it frees the skb.  I shifted that code
> up a bit to make my error handling a little simpler.
> 
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
