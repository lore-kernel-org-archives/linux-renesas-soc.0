Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:59258 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727518AbeGTMwV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:52:21 -0400
Date: Fri, 20 Jul 2018 14:04:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: IMUCTRn.TTSEL needs a special usage on
 R-Car Gen3
Message-ID: <20180720120422.f6whui2dtr5ygscu@8bytes.org>
References: <1531104811-23417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531104811-23417-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 09, 2018 at 11:53:31AM +0900, Yoshihiro Shimoda wrote:
> The TTSEL bit of IMUCTRn register of R-Car Gen3 needs to be set
> unused MMU context number even if uTLBs are disabled
> (The MMUEN bit of IMUCTRn register = 0).
> Since initial values of IMUCTRn.TTSEL on all IPMMU-domains are 0,
> this patch adds a new feature "reserved_context" to reserve IPMMU
> context number 0 as the unused MMU context.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.
