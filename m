Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50660 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbeHVOil (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 10:38:41 -0400
Date: Wed, 22 Aug 2018 13:14:09 +0200
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
Message-ID: <20180822111409.l2iphfvfiecemt3t@verge.net.au>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-7-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180812133149.7710-7-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 12, 2018 at 03:31:49PM +0200, Eugeniu Rosca wrote:
> This is based on the existing KF device tree sources:
> $ ls -1 arch/arm64/boot/dts/renesas/*-kf.dts
> arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
