Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56674 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755910AbdLTTCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 14:02:46 -0500
Date: Wed, 20 Dec 2017 12:02:44 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add r8a779(6|70|95) DT
 bindings
Message-ID: <20171220120244.38a2be5a@t450s.home>
In-Reply-To: <20171124105804.26924-1-horms+renesas@verge.net.au>
References: <20171124105804.26924-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 24 Nov 2017 10:58:02 +0000
Simon Horman <horms+renesas@verge.net.au> wrote:

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
> 

Applied to v4.16-iommu/ipmmu-vmsa.  Thanks,

Alex
