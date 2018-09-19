Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42032 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbeISNQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 09:16:32 -0400
Date: Wed, 19 Sep 2018 09:39:45 +0200
From: Simon Horman <horms@verge.net.au>
To: David Miller <davem@redhat.com>
Cc: sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
Message-ID: <20180919073939.6kf3ow63wqqulxdh@verge.net.au>
References: <20180918102226.8017-1-horms+renesas@verge.net.au>
 <20180918.201026.764474223291614125.davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918.201026.764474223291614125.davem@redhat.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 08:10:26PM -0700, David Miller wrote:
> From: Simon Horman <horms+renesas@verge.net.au>
> Date: Tue, 18 Sep 2018 12:22:26 +0200
> 
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > 
> > EtherAVB hardware requires 0 to be written to status register bits in
> > order to clear them, however, care must be taken not to:
> > 
> > 1. Clear other bits, by writing zero to them
> > 2. Write one to reserved bits
> > 
> > This patch corrects the ravb driver with respect to the second point above.
> > This is done by defining reserved bit masks for the affected registers and,
> > after auditing the code, ensure all sites that may write a one to a
> > reserved bit use are suitably masked.
> > 
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> I've decided to apply this to 'net', let me know if this is a problem.

Thanks Dave, 'net' is fine by me.
