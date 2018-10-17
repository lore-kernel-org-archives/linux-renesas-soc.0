Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44986 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbeJQRIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:08:39 -0400
Date: Wed, 17 Oct 2018 11:13:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Hook up r8a77990 DT matching code
Message-ID: <20181017091348.gg4rifioitndu3am@verge.net.au>
References: <20181015095557.25135-1-horms+renesas@verge.net.au>
 <c90c9a8b-d101-280f-7ee6-67e6cc473e64@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c90c9a8b-d101-280f-7ee6-67e6cc473e64@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 15, 2018 at 01:56:18PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 10/15/2018 12:55 PM, Simon Horman wrote:
> 
> > From: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> > 
> > Support the r8a77990 IPMMU and update IPMMU_OF_DECLARE to hook up
> 
>    That macro is gone, you need to update the description.

Thanks, v2 sent.

> 
> > the updated compat string.
> > 
> > Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > [simon: rebased; dropped no longer required IOMMU_OF_DECLARE hunk]
> 
>    Yet you didn't drop it from the description. :-)
> 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]
> 
> MBR, Sergei
> 
