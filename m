Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47866 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbeISIqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 04:46:16 -0400
Date: Tue, 18 Sep 2018 20:10:26 -0700 (PDT)
Message-Id: <20180918.201026.764474223291614125.davem@redhat.com>
To: horms+renesas@verge.net.au
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
From: David Miller <davem@redhat.com>
In-Reply-To: <20180918102226.8017-1-horms+renesas@verge.net.au>
References: <20180918102226.8017-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Simon Horman <horms+renesas@verge.net.au>
Date: Tue, 18 Sep 2018 12:22:26 +0200

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> EtherAVB hardware requires 0 to be written to status register bits in
> order to clear them, however, care must be taken not to:
> 
> 1. Clear other bits, by writing zero to them
> 2. Write one to reserved bits
> 
> This patch corrects the ravb driver with respect to the second point above.
> This is done by defining reserved bit masks for the affected registers and,
> after auditing the code, ensure all sites that may write a one to a
> reserved bit use are suitably masked.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

I've decided to apply this to 'net', let me know if this is a problem.
