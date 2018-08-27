Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50083 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbeH0QTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 12:19:30 -0400
Date: Mon, 27 Aug 2018 14:32:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
Message-ID: <20180827123253.56hl2hdumszqxaki@verge.net.au>
References: <CAMuHMdUe=p42Bp6xgmvrNwPKs=VHUP2BezDBPPn9KgPawvOtgA@mail.gmail.com>
 <1535038384-27080-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535038384-27080-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 23, 2018 at 04:33:04PM +0100, Fabrizio Castro wrote:
> Add support for RZ/G2M (R8A774A1) SoC IPMMUs.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1-v2:
> * taken out IOMMU_OF_DECLARE

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
