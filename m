Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49231 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbeDSHgq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 03:36:46 -0400
Date: Thu, 19 Apr 2018 09:36:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH v3 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180419073642.bqrttr34ht4atoyt@verge.net.au>
References: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
 <20180418182101.5723-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180418182101.5723-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 18, 2018 at 08:20:57PM +0200, Wolfram Sang wrote:
> Early revisions of certain SoCs cannot do multiple DMA RX streams in
> parallel. To avoid data corruption, only allow one DMA RX channel and
> fall back to PIO, if needed.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
