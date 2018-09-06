Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58929 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbeIFODP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:03:15 -0400
Date: Thu, 6 Sep 2018 11:28:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: enable CMT/TMU support for Renesas SoC
Message-ID: <20180906092836.zcbizy2yzj5x33r6@verge.net.au>
References: <ebd7d1f7-d99b-f0a1-f05e-d822254b2e86@cogentembedded.com>
 <20180903071715.gim5ukqkmvxjp3vm@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180903071715.gim5ukqkmvxjp3vm@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 03, 2018 at 09:17:15AM +0200, Simon Horman wrote:
> On Fri, Aug 31, 2018 at 10:54:42PM +0300, Sergei Shtylyov wrote:
> > Renesas R-Car gen3 SoCs have both CMT and TMU timers, so we have to enable
> > building them in Kconfig.platforms (as they don't normally have the prompts
> > in Kconfig).
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thank Sergei,
> 
> this looks fine to me and I'd be happy to take it through the renesas tree,
> after others have been given time for review, if that is the appropriate
> path for this patch.

Thanks again, I have applied this to the renesas tree for v4.20.
