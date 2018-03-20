Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57931 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbeCTIRj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 04:17:39 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
Date: Tue, 20 Mar 2018 10:18:44 +0200
Message-ID: <1662708.Iq9jEY22gx@avalon>
In-Reply-To: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
References: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thank you for the patch.

On Tuesday, 20 March 2018 08:48:11 EET Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the IPMMU DT binding documentation to include the r8a77965 compat
> string for the IPMMU devices included in the R-Car M3-N SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- 0001/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> +++
> work/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt	
2018-03
> -20 15:30:50.640607110 +0900 @@ -17,6 +17,7 @@ Required Properties:
>      - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
>      - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
>      - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
> +    - "renesas,ipmmu-r8a77965" for the R8A77965 (R-Car M3-N) IPMMU.
>      - "renesas,ipmmu-r8a77970" for the R8A77970 (R-Car V3M) IPMMU.
>      - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
>      - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.

-- 
Regards,

Laurent Pinchart
