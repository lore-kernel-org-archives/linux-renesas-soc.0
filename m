Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57093 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756673AbdJRGum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 02:50:42 -0400
Date: Wed, 18 Oct 2017 08:49:32 +0200
From: Simon Horman <horms@verge.net.au>
To: David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: sh_eth: add R-Car Gen[12] fallback
 compatibility strings
Message-ID: <20171018064925.5qnuapt3nh25t2we@verge.net.au>
References: <20171017074747.24159-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171017074747.24159-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 17, 2017 at 09:47:44AM +0200, Simon Horman wrote:
> Add fallback compatibility strings for R-Car Gen 1 and 2.
> 
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, f.e. Gen 1 and 2. But beyond that its not clear what the relationship
> between IP blocks might be. For example, I believe that r8a7790 is older
> than r8a7791 but that doesn't imply that the latter is a descendant of the
> former or vice versa.
> 
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
> 
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
> 
> Simon Horman (3):
>   dt-bindings: net: sh_eth: add R-Car Gen[12] fallback compatibility
>     strings
>   net: sh_eth: rename name structures as rcar_gen[12]_*
>   net: sh_eth: implement R-Car Gen[12] fallback compatibility strings

There have been a few comments on this series, I will post v2.
