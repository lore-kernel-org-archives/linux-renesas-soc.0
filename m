Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbeJGVmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Oct 2018 17:42:06 -0400
Date: Sun, 7 Oct 2018 20:04:31 +0530
From: Vinod <vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dmaengine: rcar-dmac: set scatter/gather max segment size
Message-ID: <20181007143431.GW2372@vkoul-mobl>
References: <20180914154328.984-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180914154328.984-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 14-09-18, 17:43, Wolfram Sang wrote:
> Fix warning when running with CONFIG_DMA_API_DEBUG_SG=y by allocating a
> device_dma_parameters structure and filling in the max segment size.

Applied, thanks

-- 
~Vinod
