Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38660 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728623AbeH3QYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:24:07 -0400
Date: Thu, 30 Aug 2018 14:22:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 4/9] arm64: dts: renesas: r8a774a1: Add IPMMU device nodes
Message-ID: <20180830122209.b6mcbqp4667v3tor@verge.net.au>
References: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1535031788-19907-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180827090236.efu5ezcy4yjecgf3@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180827090236.efu5ezcy4yjecgf3@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 27, 2018 at 11:02:36AM +0200, Simon Horman wrote:
> On Thu, Aug 23, 2018 at 02:43:03PM +0100, Fabrizio Castro wrote:
> > Add r8a774a1 IPMMU nodes.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
