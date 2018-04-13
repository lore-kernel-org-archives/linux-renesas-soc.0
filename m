Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54209 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753254AbeDMJrf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 05:47:35 -0400
Date: Fri, 13 Apr 2018 11:47:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180413094722.2pfeimdatpwf6fc7@verge.net.au>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <20180411071416.ohzwyhifviuoq7wo@verge.net.au>
 <20180412112142.mnxzv2hsggwbuta5@katana>
 <20180413081444.ai6eyujitcx2us5s@verge.net.au>
 <20180413083548.3655nepuqdjbjulk@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180413083548.3655nepuqdjbjulk@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 13, 2018 at 10:35:48AM +0200, Wolfram Sang wrote:
> 
> > As the implementation stands it is global - only one DMA RX stream may
> > be in flight for the entire system. I am wondering if that is the right
> > granularity for the restriction. Perhaps it could be per-SDHI device,
> > allowing concurrent streams on different SDHI devices.
> 
> As we have only one DMA RX channel per device, there is no other
> concurrency than the global concurrency.

Thanks, understood.
