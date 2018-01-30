Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44232 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751402AbeA3JpL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jan 2018 04:45:11 -0500
Date: Tue, 30 Jan 2018 10:45:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH  2/3] ARM: dts: r8a7743: Add IPMMU DT nodes
Message-ID: <20180130094507.hvgeyt77dt3xfo4s@verge.net.au>
References: <1516808522-17348-1-git-send-email-biju.das@bp.renesas.com>
 <1516808522-17348-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516808522-17348-3-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 24, 2018 at 03:42:01PM +0000, Biju Das wrote:
> Add the six IPMMU instances found in the r8a7743 to DT with a disabled
> status.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 58 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

Thanks, I have applied this after moving the nodes
so they are after the thermal node to take into account
recent sorting of the nodes.
