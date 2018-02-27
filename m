Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:55356 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752573AbeB0PAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 10:00:00 -0500
Date: Tue, 27 Feb 2018 20:33:47 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: fix max_chunk_size for R-Car Gen3
Message-ID: <20180227150347.GB15443@localhost>
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

Applied, thanks

-- 
~Vinod
