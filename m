Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:46760 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730061AbeKGBFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 20:05:19 -0500
Date: Tue, 6 Nov 2018 16:39:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Alex Williamson <alex.williamson@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Hook up r8a77990 DT matching code
Message-ID: <20181106153930.ksklbnemtlfe2neq@8bytes.org>
References: <20181017091322.15177-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017091322.15177-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 11:13:22AM +0200, Simon Horman wrote:
> From: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> 
> Support the R-Car E3 (r8a77990) IPMMU.
> 
> Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [simon: rebased; dropped no longer required IOMMU_OF_DECLARE hunk]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied, thanks.
