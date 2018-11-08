Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45149 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbeKHWD3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:03:29 -0500
Date: Thu, 8 Nov 2018 13:28:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
Message-ID: <20181108122810.z45jpmp4uhmht7eq@verge.net.au>
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

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v1-v2:
> * taken out IOMMU_OF_DECLARE
> 
>  drivers/iommu/ipmmu-vmsa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 51af2c5..331562f 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -761,6 +761,7 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>  }
>  
>  static const struct soc_device_attribute soc_rcar_gen3[] = {
> +	{ .soc_id = "r8a774a1", },
>  	{ .soc_id = "r8a7795", },
>  	{ .soc_id = "r8a7796", },
>  	{ .soc_id = "r8a77965", },
> @@ -942,6 +943,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
>  		.compatible = "renesas,ipmmu-vmsa",
>  		.data = &ipmmu_features_default,
>  	}, {
> +		.compatible = "renesas,ipmmu-r8a774a1",
> +		.data = &ipmmu_features_rcar_gen3,
> +	}, {
>  		.compatible = "renesas,ipmmu-r8a7795",
>  		.data = &ipmmu_features_rcar_gen3,
>  	}, {
> -- 
> 2.7.4
> 
