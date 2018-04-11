Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51066 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752693AbeDKHP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Apr 2018 03:15:57 -0400
Date: Wed, 11 Apr 2018 09:15:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/5] mmc: renesas_sdhi: use helpers to access struct
 scatterlist members
Message-ID: <20180411071553.f4gvp2f7a72ftkif@verge.net.au>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180410093831.1759-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 11:38:28AM +0200, Wolfram Sang wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Instead of directly accessing the members of struct scatterlist use the
> helpers mmc_get_dma_dir() and sg_dma_address() in
> renesas_sdhi_internal_dmac_start_dma(). Based on previous work by
> Masaharu Hayakawa.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [rebased to mmc/next]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
