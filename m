Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47136 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752175AbdHGH6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 03:58:06 -0400
Date: Mon, 7 Aug 2017 09:57:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] arm64: renesas: salvator-common: avoid audio_clkout
 naming conflict
Message-ID: <20170807075743.GC7175@verge.net.au>
References: <87ini6p8y6.wl%kuninori.morimoto.gx@renesas.com>
 <20170802122352.GB20012@verge.net.au>
 <874ltppm3l.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ltppm3l.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 02, 2017 at 11:55:12PM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > 
> > > clock name of "audio_clkout" is used by Renesas sound driver.
> > > This duplicated naming breaks its clock registering/unregisering.
> > > Especially, when unbind/bind it can't handle clkout correctly.
> > > This patch renames "audio_clkout" to "audio-clkout" to avoid
> > > naming conflict.
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > > > Simon
> > > 
> > > This patch is for v4.13-rcX
> > 
> > Thanks, could I get a "Fixes" tag?
> 
> Thanks
> Yes, please

Thanks, I have applied this as a fix for v4.13 with the following tag.
Please let me know if that was not your expectation.

Fixes: 8a8f181d2cfd ("arm64: renesas: salvator-x: use CS2000 as AUDIO_CLK_B")
