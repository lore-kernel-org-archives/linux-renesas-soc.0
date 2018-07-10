Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933900AbeGJPVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 11:21:51 -0400
Date: Tue, 10 Jul 2018 20:51:47 +0530
From: Vinod <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] dma: sh: rcar-dmac: Add dma_pause operation
Message-ID: <20180710152147.GD3219@vkoul-mobl>
References: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530523312-2253-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02-07-18, 18:21, Yoshihiro Shimoda wrote:
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

This fails to apply for me. Please rebase. Also please fix the subsystem
name

-- 
~Vinod
