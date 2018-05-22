Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40561 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751229AbeEVMuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:50:09 -0400
Date: Tue, 22 May 2018 14:50:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT
 bindings
Message-ID: <20180522125005.cq7tmiaueoffjuoa@verge.net.au>
References: <152691369384.29456.13581918319106400529.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152691369384.29456.13581918319106400529.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 11:41:33PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the IPMMU DT binding documentation to include the compat strings
> for the IPMMU devices included in the R-Car V3H and E3 SoCs.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
>  Developed on top of renesas-drivers-2018-05-15-v4.17-rc5
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> +++ work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	2018-05-21 23:37:16.370607110 +0900
> @@ -20,6 +20,8 @@ Required Properties:
>      - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
>      - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
>      - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
> +    - "renesas,ipmmu-r8a77980" for the R8A77980 (R-Car V3H) IPMMU.
> +    - "renesas,ipmmu-r8a77990" for the R8A77990 (R-Car E3) IPMMU.
>      - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
>      - "renesas,ipmmu-vmsa" for generic R-Car Gen2 or RZ/G1 VMSA-compatible
>  			   IPMMU.
> 
