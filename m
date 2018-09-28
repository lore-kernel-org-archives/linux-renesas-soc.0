Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55883 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbeI1OZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 10:25:04 -0400
Date: Fri, 28 Sep 2018 10:02:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: remove unneeded sound
 #address/size-cells
Message-ID: <20180928080228.nze6n2jea67rrrco@verge.net.au>
References: <87a7o2tkrc.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7o2tkrc.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 28, 2018 at 02:39:47AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit 2d87dc0e5be2 ("arm64: dts: renesas: r8a7795: Add address
> properties to rcar_sound port nodes") added missing #address-cells
> and #size-cells for sound ports.
> But, these are based on platform, not on SoC. This patch cleanups it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
