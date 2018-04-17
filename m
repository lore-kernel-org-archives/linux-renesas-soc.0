Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:55818 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752273AbeDQOPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 10:15:54 -0400
Date: Tue, 17 Apr 2018 10:15:53 -0400 (EDT)
Message-Id: <20180417.101553.1512039208518397234.davem@davemloft.net>
To: horms+renesas@verge.net.au
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, kazuya.mizuguchi.ks@renesas.com
Subject: Re: [PATCH/RFC net-next 3/5] ravb: do not write 1 to reserved bits
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180417085030.32650-4-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
        <20180417085030.32650-4-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>
Date: Tue, 17 Apr 2018 10:50:28 +0200

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch corrects writing 1 to reserved bits.
> The write value should be 0.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

How are we ending up in situations where the driver is trying to write
non-zero values to those fields in the first place?

The places creating those values should be making sure that the
reserved bits are never set.

If you mask out the reserved bits in the register writing locations,
this just hides bugs.
