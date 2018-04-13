Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53337 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbeDMIOt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 04:14:49 -0400
Date: Fri, 13 Apr 2018 10:14:45 +0200
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
Message-ID: <20180413081444.ai6eyujitcx2us5s@verge.net.au>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <20180411071416.ohzwyhifviuoq7wo@verge.net.au>
 <20180412112142.mnxzv2hsggwbuta5@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180412112142.mnxzv2hsggwbuta5@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 12, 2018 at 01:21:42PM +0200, Wolfram Sang wrote:
> 
> > > +static unsigned long global_flags;
> > 
> > Is the restriction on concurrent DMA RX streams global or per-device?
> 
> ? Each device has only one DMA RX channel. Hey Simon, you upstreamed
> this driver :) Or did I get the question wrong?

As I understand things this patch implements a restriction on concurrent
DMA RX streams for old SoCs, corresponding with a limitation in the
hardware.

As the implementation stands it is global - only one DMA RX stream may
be in flight for the entire system. I am wondering if that is the right
granularity for the restriction. Perhaps it could be per-SDHI device,
allowing concurrent streams on different SDHI devices.

I think what you have is safe. But perhaps it could be relaxed.
I do not have any insights regarding the extent of the hardware
restriction (that I can recall at this time).

> > > +	if (dir == DMA_FROM_DEVICE)
> > > +		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
> > > +
> > 
> > Is clear_bit() expensive? If so it might be worth avoiding on SoCs that
> > don't have the restriction covered by this patch.
> 
> It's an atoimc bitop, so maybe has a memory barrier. Hmm, the above
> version is better on the cache lines, though, if you don't have the
> restriction.
> 
> Will think about it and make sure both clear_bit() are in sync.

Thanks, I don't feel strongly about this.
