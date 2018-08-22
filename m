Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51097 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbeHVPF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 11:05:56 -0400
Date: Wed, 22 Aug 2018 13:41:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
Message-ID: <20180822114118.pu6bosqi2fvtbyvl@verge.net.au>
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Aug 18, 2018 at 09:08:26PM +0300, Sergei Shtylyov wrote:
> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
> has a single SDHI core anyway, so can't be  a subject to the known RX DMA
> errata...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
