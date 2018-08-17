Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49476 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbeHQNLQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 09:11:16 -0400
Date: Fri, 17 Aug 2018 12:08:24 +0200
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
Subject: Re: [PATCH v2 1/7] dt-bindings: arm: Document Renesas R-Car
 M3-N-based ULCB board
Message-ID: <20180817100823.b25h523oqlpklicu@verge.net.au>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 12, 2018 at 03:31:43PM +0200, Eugeniu Rosca wrote:
> In harmony with ATF and U-Boot outputs [1] and [2], the new board is
> based on M3-N revision ES1.1 and the amount of memory present on SiP
> is 2GiB, contiguously addressed.
> 
> The amount of RAM is mentioned based on the assumption that it is
> encoded in the board id/string. There is some evidence supporting this
> in form of last-digit-mismatch between two R-Car H3 ES2.0 ULCB board
> ids, one with 4GiB and one with 8GiB of RAM (see [3]).
> 
> [1] BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21
>     BL2: PRR is R-Car M3N Ver.1.1
> 
> [2] U-Boot 2015.04-00295-*
>     CPU: Renesas Electronics R8A77965 rev 1.1
>     ---8<----
>     DRAM:  1.9 GiB
>     Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
>     ---8<----
> 
> [3] https://patchwork.kernel.org/patch/10555957/#22169325
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
