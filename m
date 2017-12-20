Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53740 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932269AbdLTK0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 05:26:39 -0500
Date: Wed, 20 Dec 2017 11:26:35 +0100
From: Simon Horman <horms@verge.net.au>
To: Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add r8a779(6|70|95) DT bindings
Message-ID: <20171220102635.z2tsusclwelvobmd@verge.net.au>
References: <20171124105804.26924-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171124105804.26924-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alex,

On Fri, Nov 24, 2017 at 10:58:02AM +0000, Simon Horman wrote:
> Update the IPMMU DT binding documentation to include r8a7796 (R-Car M3-W),
> r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) compat strings.
> 
> This patch-set is comprised of patches previously included in
> * [PATCH v4 0/3] iommu/ipmmu-vmsa: r8a7796 support V4
> * [PATCH 0/2] iommu/ipmmu-vmsa: r8a779(70|95) support
> 
> Those series also include driver updates to implement the bindings,
> however, it while it is felt that the bindings themselves are ready
> to be merged we feel that the driver updates are not at that stage yet.
> 
> Changes since v1:
> * Correct typo in r8a779(70|95) patch: R8A7770 -> R8A77970
> 
> 
> Magnus Damm (1):
>   iommu/ipmmu-vmsa: Add r8a7796 DT binding
> 
> Simon Horman (1):
>   iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 3 +++
>  1 file changed, 3 insertions(+)

I'm not aware of any problems with this series.
Could you consider applying it?
