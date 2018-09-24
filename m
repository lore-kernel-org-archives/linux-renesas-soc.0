Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49967 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbeIXPUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 11:20:43 -0400
Date: Mon, 24 Sep 2018 11:19:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: add default bootargs
Message-ID: <20180924091931.lhj25jt4h7va572v@verge.net.au>
References: <87h8im7y8z.wl-kuninori.morimoto.gx@renesas.com>
 <20180919091644.gt3lri333fundjmj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180919091644.gt3lri333fundjmj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 11:16:45AM +0200, Simon Horman wrote:
> On Wed, Sep 19, 2018 at 07:24:05AM +0000, Kuninori Morimoto wrote:
> > 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > It can't boot without bootargs settings on Uboot on ulcb board.
> > This patch adds missing default bootargs.
> > ulcb BSP can overwrite it by own UBoot settings.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thanks Morimoto-san,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again Morimoto-san,

applied for v4.20.
