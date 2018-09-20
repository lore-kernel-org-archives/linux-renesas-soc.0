Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:34144 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeITJty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 05:49:54 -0400
Date: Wed, 19 Sep 2018 21:08:36 -0700 (PDT)
Message-Id: <20180919.210836.924996973074874493.davem@davemloft.net>
To: horms+renesas@verge.net.au
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kazuya.mizuguchi.ks@renesas.com
Subject: Re: [PATCH v2 net-next] ravb: remove tx buffer addr 4byte
 alilgnment restriction for R-Car Gen3
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180919080621.821-1-horms+renesas@verge.net.au>
References: <20180919080621.821-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>
Date: Wed, 19 Sep 2018 10:06:21 +0200

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch sets from two descriptor to one descriptor because R-Car Gen3
> does not have the 4 bytes alignment restriction of the transmission buffer.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> * As per review by Sergi Shtylyov
>   - Use reverse xmas tree for variable declarations
>   - Use > rather than >= for conditions
>   - Dropped unnecessary parentheses
>   - Don't allocate memory for tx_align when it will not be used
>   - But, kept NUM_TX_DESC_GEN[23] as I see some value in
>     the self-documentation provided by these #defines
> 
> v1 [Kazuya Mizuguchi]

Applied, thanks.
