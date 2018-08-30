Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38554 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbeH3QU4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:20:56 -0400
Date: Thu, 30 Aug 2018 14:19:00 +0200
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
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Add GPIO device nodes
Message-ID: <20180830121900.tzvmqqmdwqio257x@verge.net.au>
References: <1535033898-23610-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180827080019.ry5pbwm24qlmnk7k@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180827080019.ry5pbwm24qlmnk7k@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 27, 2018 at 10:00:20AM +0200, Simon Horman wrote:
> On Thu, Aug 23, 2018 at 03:18:18PM +0100, Fabrizio Castro wrote:
> > Add GPIO device nodes to the DT of the r8a774a1 SoC.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > 
> > This patch depends on:
> > https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30549.html
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
