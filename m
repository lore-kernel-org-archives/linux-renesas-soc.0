Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38702 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbeH3QZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:25:38 -0400
Date: Thu, 30 Aug 2018 14:23:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: r8a774a1: Add Cortex-A53 CPU
 cores
Message-ID: <20180830122340.2viwqv3hitpemu3g@verge.net.au>
References: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1535031788-19907-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180827090833.h3rtup4lqo36brgb@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180827090833.h3rtup4lqo36brgb@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 27, 2018 at 11:08:33AM +0200, Simon Horman wrote:
> On Thu, Aug 23, 2018 at 02:43:05PM +0100, Fabrizio Castro wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> > 
> > This patch adds definitions for L2 cache for the Cortex-A53 CPU
> > cores (512 KiB in size, organized as 32 KiB x 16 ways), adds
> > Cortex-A53 CPU cores (setting a total of 6 cores, 2 x Cortex-A57
> > + 4 x Cortex-A53), and finally enables the performance monitor
> > unit for the Cortex-A53 cores on the R8A774A1 SoC.
> > 
> > Based on work done for r8a7796 SoC.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
