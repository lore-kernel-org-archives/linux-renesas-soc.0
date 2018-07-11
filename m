Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbeGKFUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 01:20:36 -0400
Date: Wed, 11 Jul 2018 10:48:00 +0530
From: Vinod <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dmaengine: sh: rcar-dmac: Add dma_pause operation
Message-ID: <20180711051800.GK3219@vkoul-mobl>
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11-07-18, 11:10, Yoshihiro Shimoda wrote:
> This patch set is based on the lasest slave-dma / next branch.
> 
> This issue can be reproduced by the following commands on r8a7795
> Salvator-XS with the fixed patch [1] and Windows Teraterm :) :
>  # stty 921600
>  (Change Teraterm baud rate)
>  # cat > rx.txt
>  (Send 5MiB file by Teraterm.)
>  # cmp <somewhere the 5MiB file> rx.txt
>  output "differ: byte NNNNN, line MMM"

Applied, thanks

-- 
~Vinod
