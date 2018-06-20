Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58986 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbeFTL3S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 07:29:18 -0400
Date: Wed, 20 Jun 2018 13:29:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, magnus.damm@gmail.com,
        yoshihiro.shimoda.uh@renesas.com, joro@8bytes.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RESEND 0/6] iommu: ipmmu-vmsa: Add more Gen3 SoCs support
Message-ID: <20180620112909.gzbdpj2kwcehebnx@verge.net.au>
References: <1528973306-7962-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528973306-7962-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[CC Alex Williamson]

On Thu, Jun 14, 2018 at 12:48:20PM +0200, Jacopo Mondi wrote:
> Hello,
>    this series collects patches sent to mailing lists in late 2017 to add
> support for a number of R-Car Gen3 SoCs to the ipmmu-vmsa driver.
> 
> Part of the series these patches were part of went in through Alex Williamson
> tree and are now included in v4.17.
> 
> These patches have not yet been collected, and need to be rebased on v4.17,
> and this what this series serves for.
> 
> The series:
> - Increses the micro-TLB size to 48bits to accomodate newer SoCs
> - Adds support for M3-N, M3-W, V3-M and E3 to ipmmu-vmsa driver
> - Documents M3-N, V3H and E3 device tree bindings
> 
> All patches have been acked/reviewed by, if nothing big happens they should
> be ready to be collected.

All patches:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Joerg, Alex,

I'd be most grateful if we could find a way for these patches to progress
into mainline.

> 
> Thanks
>    j
> 
> Jacopo Mondi (2):
>   dt-bindings: iommu/ipmmu-vmsa: Add R-Car M3-N (R8A77965)
>   iommu/ipmmu-vmsa: Hook up R8A77965 DT matching code
> 
> Magnus Damm (3):
>   iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
>   iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
>   iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> 
> Simon Horman (1):
>   iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code
> 
>  .../bindings/iommu/renesas,ipmmu-vmsa.txt          |  3 ++
>  drivers/iommu/ipmmu-vmsa.c                         | 38 ++++++++++++++++++----
>  2 files changed, 34 insertions(+), 7 deletions(-)
> 
> --
> 2.7.4
> 
