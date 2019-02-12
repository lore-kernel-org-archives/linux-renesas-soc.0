Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6B1C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 16:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65A7C217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 16:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Tj93qAT4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730823AbfBLQKn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 11:10:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53759 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730461AbfBLQKn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 11:10:43 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 21DDE25BEE3;
        Wed, 13 Feb 2019 03:10:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549987841; bh=dfsR211HHe2lLX4k/Ds+2Ucf/g/dEqZHh6iFysJW0aI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tj93qAT4hN+oWZdSk4nrBzhPzooKsRMg3D9L4oL11Ysk5VZQeQ5LPp/bqMSfG2T6C
         c+KhAbMVv6aRguqooljwuOQwWwSUPFxhKtzczUByuIyDIRGKpeesvIbJL3h6o7DWFw
         CbxD8Hdy+hiVXuAe4UCCX1vMBO0a6LPvn7LGFPe4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 630D4940362; Tue, 12 Feb 2019 17:10:39 +0100 (CET)
Date:   Tue, 12 Feb 2019 17:10:39 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix SPDX license
 identifier style
Message-ID: <20190212161035.x2wkopyde6omv4xg@verge.net.au>
References: <20190212152129.10613-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212152129.10613-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 12, 2019 at 04:21:29PM +0100, Geert Uytterhoeven wrote:
> According to Documentation/process/license-rules.rst, SPDX license
> identifiers in DTS files should use C++ style comments.
> 
> Fixes: f37a7767f6c4ec66 ("arm64: dts: renesas: Add Renesas R8A77990 SoC support")
> Fixes: 77049191b24b4586 ("arm64: dts: renesas: Add Renesas Ebisu board support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index b5c0dbf4982febd0..c1aff350308e784b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the ebisu board
>   *
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index cc64dfab03bb3b09..051d3fcc56dfc85f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the R-Car E3 (R8A77990) SoC
>   *
> -- 
> 2.17.1
> 
