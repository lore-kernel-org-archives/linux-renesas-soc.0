Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:35783 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933291AbeEWSeM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 14:34:12 -0400
Date: Wed, 23 May 2018 13:34:09 -0500
From: Rob Herring <robh@kernel.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT
 bindings
Message-ID: <20180523183409.GA20806@rob-hp-laptop>
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
> ---
> 
>  Developed on top of renesas-drivers-2018-05-15-v4.17-rc5
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
