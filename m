Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50390 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbdFTNUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 09:20:43 -0400
Date: Tue, 20 Jun 2017 15:20:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: defconfig: ak4613/renesas sound will be
 kernle module
Message-ID: <20170620132038.GG14340@verge.net.au>
References: <87injs25la.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87injs25la.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 19, 2017 at 12:23:22AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These exchange Renesas sound related driver as module.
> But, it doesn't exchange simple-sound-card which is
> used from other platform.
> 
> Kuninori Morimoto (2):
>   arm64: defconfig: compile ak4613 as kernel module
>   arm64: defconfig: compile renesas sound as kernel module

Thanks Morimoto-san,

do you mind if I squash these into one patch?
