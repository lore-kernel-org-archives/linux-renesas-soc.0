Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39151 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbeH3QwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:52:08 -0400
Date: Thu, 30 Aug 2018 14:50:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a77965: m3nulcb-kf:
 Initial device tree
Message-ID: <20180830125005.qm7yiyno6ribxges@verge.net.au>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-7-erosca@de.adit-jv.com>
 <20180822111409.l2iphfvfiecemt3t@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180822111409.l2iphfvfiecemt3t@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 22, 2018 at 01:14:09PM +0200, Simon Horman wrote:
> On Sun, Aug 12, 2018 at 03:31:49PM +0200, Eugeniu Rosca wrote:
> > This is based on the existing KF device tree sources:
> > $ ls -1 arch/arm64/boot/dts/renesas/*-kf.dts
> > arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.

I believe that this entire series has now been applied
or at least all of the portions to be merged via my
renesas tree. Please let me know if I am mistaken.
