Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53122 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166891AbeBOSwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 13:52:30 -0500
Date: Thu, 15 Feb 2018 19:52:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: fix max_chunk_size for R-Car Gen3
Message-ID: <20180215185225.7bzdtp6fc5l7sjct@verge.net.au>
References: <1518601212-25250-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518601212-25250-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 14, 2018 at 06:40:12PM +0900, Yoshihiro Shimoda wrote:
> According to R-Car Gen3 Rev.0.80 manual, the DMATCR can be set to
> 16,777,215 as maximum. So, this patch fixes the max_chunk_size for
> safety on all of SoCs. Otherwise, a system may hang if the DMATCR
> is set to 0 on R-Car Gen3.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
