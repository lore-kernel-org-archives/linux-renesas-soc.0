Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50965 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727633AbeJRVSL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 17:18:11 -0400
Date: Thu, 18 Oct 2018 15:17:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a774a1: Add VIN and CSI-2
 nodes
Message-ID: <20181018131707.apo5zolpqsmokzjg@verge.net.au>
References: <1536589878-26218-1-git-send-email-biju.das@bp.renesas.com>
 <1536589878-26218-6-git-send-email-biju.das@bp.renesas.com>
 <20180911135341.j5nj4crbg5bjeibw@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180911135341.j5nj4crbg5bjeibw@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 11, 2018 at 03:53:42PM +0200, Simon Horman wrote:
> On Mon, Sep 10, 2018 at 03:31:18PM +0100, Biju Das wrote:
> > Add VIN and CSI-2 nodes to RZ/G2M SoC dtsi.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks, I would value a review of this entire series before I apply this
> patch.

That has now happened, applied for v4.21.
