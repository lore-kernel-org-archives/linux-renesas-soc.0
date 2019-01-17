Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D62C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 13:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81B5320657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 13:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZVqrkiVU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfAQNZV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 08:25:21 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34412 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfAQNZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 08:25:21 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8763225B760;
        Fri, 18 Jan 2019 00:25:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547731519; bh=bqXyr0uQAtzaNBAZKEvZfDWj6A/3Rmzk2KYyom7IbT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZVqrkiVUwAF55KXpKLufNN4+KcyZkWupE1KQEBgWcg4cVzyH9BvgYH5Ryc0HRHvng
         cYAdAwzR9tOonaqO0MDvehcTbDmJVDnCO5D9BgKT85pqjWKTCqCnwjmYYPmsGdgEys
         ggyj3uU2ZejfYNyqR07iQClKmsPabMCVSsy9QhUs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7B151940459; Thu, 17 Jan 2019 14:25:17 +0100 (CET)
Date:   Thu, 17 Jan 2019 14:25:17 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: renesas: Enable DMA for SCIF2 where
 missing
Message-ID: <20190117132517.itz5bi4haa5zscem@verge.net.au>
References: <20190110133917.21353-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190110133917.21353-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 02:39:12PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> R-Car Gen3 Hardware User Manual Rev. 1.50 (finally) documents DMA
> support for the SCIF2 serial port on R-Car H3, M3-W, M3-N, E3, and D3
> (albeit with the wrong MID/RID, due to a hex-vs-dec mix-up).
> 
> This patch series enables DMA for the SCIF2 serial ports on R-Car Gen3
> and RZ/G2 SoCs that do not have DMA enabled yet.  It consists of 5
> separate patches, one for each SoC, to ease backporting.
> 
> Changes compared to v1:
>   - Add Fixes tags where appropriate.
> 
> This has been tested on R-Car M3-W, M3-N, and E3.
> 
> Thanks!
> 
> Geert Uytterhoeven (5):
>   arm64: dts: renesas: r8a774a1: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a774c0: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a77965: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a77990: Enable DMA for SCIF2

Thanks, I have applied the r8a77965, r8a7796 and r8a774a1 patches
as fixes for v5.0 and the other patches for v5.1.

> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 3 +++
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 +++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 3 +++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 +++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +++-
>  5 files changed, 15 insertions(+), 1 deletion(-)
> 
> -- 
> 2.17.1
> 
