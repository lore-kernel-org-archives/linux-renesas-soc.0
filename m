Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53752 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933874AbdDGO5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 10:57:14 -0400
Date: Fri, 7 Apr 2017 10:57:09 -0400
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: renesas: r8a7795-salvator-x: AUDIO-CLKOUTn
 synchronous with L/R clock
Message-ID: <20170407145706.GA1278@verge.net.au>
References: <87h92152o6.wl%kuninori.morimoto.gx@renesas.com>
 <87h921xg5d.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h921xg5d.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 06, 2017 at 11:40:55PM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > This patch adds clkout-lr-synchronous property which synchronizes
> > L/R clock to the rcar_sound node.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > ---
> 
> I'm sorry.
> This patch was wrong.
> Please ignore it.

Thanks Morimoto-san, noted.
