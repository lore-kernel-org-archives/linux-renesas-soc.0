Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50792 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932576AbdKFTWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2017 14:22:03 -0500
Date: Mon, 6 Nov 2017 12:22:01 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Joerg Roedel <joro@8bytes.org>, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] iommu/ipmmu-vmsa: r8a779(70|95) support
Message-ID: <20171106122201.77d640e5@t450s.home>
In-Reply-To: <20171101103423.7334-1-horms+renesas@verge.net.au>
References: <20171101103423.7334-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed,  1 Nov 2017 11:34:21 +0100
Simon Horman <horms+renesas@verge.net.au> wrote:

> Update Update the IPMMU DT binding documentation and driver implementation
> to support the r8a77970 (R-Car V3M) and r8a77995 (R-Car D3).
> 
> Based on work for r8a7796 by Magnus Damm.
> 
> Patches based on:
> * iommu/next
> * [PATCH v5 00/09] iommu/ipmmu-vmsa: r8a7795 support V5
> * [PATCH v4 0/3] iommu/ipmmu-vmsa: r8a7796 support V4
>   (fuzz when applying 3/3)

This last dependent patch series hasn't had any comments or updates
since June.  Do I take it from Simon's new patches here that it's still
relevant and desired?  Perhaps it was simply missed and nobody bothered
to re-send it?  Thanks,

Alex

 
> Simon Horman (2):
>   iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
>   iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code
> 
>  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt         |  2 ++
>  drivers/iommu/ipmmu-vmsa.c                                   | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
