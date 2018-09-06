Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59147 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbeIFOQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:16:39 -0400
Date: Thu, 6 Sep 2018 11:41:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: enable SDR104 on R-Car Gen3
Message-ID: <20180906094158.ckail4qj2semyaj3@verge.net.au>
References: <20180821190356.32070-1-wsa+renesas@sang-engineering.com>
 <20180822112203.mhai5bpucabkjpxj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180822112203.mhai5bpucabkjpxj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 22, 2018 at 01:22:03PM +0200, Simon Horman wrote:
> On Tue, Aug 21, 2018 at 09:03:56PM +0200, Wolfram Sang wrote:
> > Successfully tested on H3 ES1.0 and ES2.0, M3-W ES1.0, and M3-N ES1.0.
> > Even previously stubborn cards work fine. Transfer rates were >60MB/s.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > 
> > The problems I reported last week were simply me booting the wrong kernel on H3
> > ES1.0 :(
> 
> :)
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again Wolfram,

applied for v4.20.
