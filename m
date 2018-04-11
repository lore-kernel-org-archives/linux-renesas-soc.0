Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51117 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752783AbeDKHRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Apr 2018 03:17:40 -0400
Date: Wed, 11 Apr 2018 09:17:36 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 3/5] mmc: renesas_sdhi: Fix alignment check of sg buffer
Message-ID: <20180411071736.xklynm2iloluon5u@verge.net.au>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180410093831.1759-4-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 11:38:29AM +0200, Wolfram Sang wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> Sometimes sg->offset is not used for buffer addresses allocated by
> dma_map_sg(), so alignment checks should be done on the allocated buffer
> addresses. Delete the alignment check for sg->offset that is done before
> dma_map_sg(). Instead, it performs the alignment check for
> sg->dma_address after dma_map_sg().
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: broke this commit in two and tidied small style issue]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [rebased to mmc/next]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
