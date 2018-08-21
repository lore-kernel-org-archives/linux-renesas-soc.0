Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36878 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbeHURlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 13:41:25 -0400
Date: Tue, 21 Aug 2018 15:38:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
Message-ID: <20180821133814.uqnyqve7zuqzlmec@verge.net.au>
References: <1534516265-10059-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1534516265-10059-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534516265-10059-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 17, 2018 at 03:31:04PM +0100, Fabrizio Castro wrote:
> Add support for RZ/G2M (R8A774A1) SoC IPMMUs.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

There seems to be a typo in the subject: s/maching/matching/

That notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
