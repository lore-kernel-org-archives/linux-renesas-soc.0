Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34106 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdJCVl5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 17:41:57 -0400
Date: Tue, 3 Oct 2017 16:41:55 -0500
From: Rob Herring <robh@kernel.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com
Subject: Re: [PATCH 2/3] iommu/ipmmu-vmsa: Document R-Car V3M IPMMU DT
 bindings
Message-ID: <20171003214155.fiql4u6zwdntc3df@rob-hp-laptop>
References: <150603029494.9664.3785539947602559695.sendpatchset@little-apple>
 <150603031620.9664.13111068977966766494.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150603031620.9664.13111068977966766494.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 22, 2017 at 06:45:16AM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the IPMMU DT binding documentation to include the r8a77970 compat
> string for the IPMMU devices included in the R-Car V3M SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
