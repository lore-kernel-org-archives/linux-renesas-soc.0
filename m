Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:55768 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbeDQON4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 10:13:56 -0400
Date: Tue, 17 Apr 2018 10:13:53 -0400 (EDT)
Message-Id: <20180417.101353.1090312853623596858.davem@davemloft.net>
To: horms+renesas@verge.net.au
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, masaru.nagai.vx@renesas.com,
        kazuya.mizuguchi.ks@renesas.com
Subject: Re: [PATCH/RFC net-next 1/5] ravb: fix inconsistent lock state at
 enabling tx timestamp
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180417085030.32650-2-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
        <20180417085030.32650-2-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>
Date: Tue, 17 Apr 2018 10:50:26 +0200

> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
> 
> [   58.490829] =================================
> [   58.495205] [ INFO: inconsistent lock state ]
> [   58.499583] 4.9.0-yocto-standard-00007-g2ef7caf #57 Not tainted
 ...
> Fixes: f51bdc236b6c ("ravb: Add dma queue interrupt support")
> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

This really needs more than the lockdep dump in the commit message, explaining
what the problem is and how it was corrected.

Are the wrong interrupt types enabled?  Are they handled improperly?
It definitely isn't clear from just reading the patch.
