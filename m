Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60421 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbeK2Unh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 15:43:37 -0500
Date: Thu, 29 Nov 2018 10:38:49 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist()
 to check SoC revisions
Message-ID: <20181129093848.6ffwvnepfd7kziub@verge.net.au>
References: <1543396868-14723-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1543396868-14723-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543396868-14723-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 28, 2018 at 09:23:36AM +0000, Yoshihiro Shimoda wrote:
> Some R-Car Gen3 SoCs has hardware restrictions on the IPMMU. So,
> to check whether this R-Car Gen3 SoC can use the IPMMU correctly,
> this patch modifies the ipmmu_slave_whitelist().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
