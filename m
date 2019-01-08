Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D32C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 15:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 941F020657
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 15:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="FJv0bgz4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfAHP3t (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 10:29:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35109 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfAHP3t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 10:29:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0DFFB25AD76;
        Wed,  9 Jan 2019 02:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546961387; bh=XSbaoS8aBa6s+8tpp/wt/HQhaDclF95v79V8qpZ9v+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FJv0bgz4IKH4/em5/FCKgtWPUhmdMijzWh2qJlQ5Cs22AfJ3Bgd1lNnqWszceKAN2
         5AFjTeBmko+9DrVypNMwDqFR2V1umijdMViY1whFNP+L1MjZGp75nAfXVmOfyIeB4s
         nmrpyXR/N9q5TEf+sJPa5d3hk51SiVThFn28al2k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 30351940420; Tue,  8 Jan 2019 16:29:45 +0100 (CET)
Date:   Tue, 8 Jan 2019 16:29:45 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: renesas: Enable DMA for SCIF2 where
 missing
Message-ID: <20190108152944.qpcvjomitmljsgsa@verge.net.au>
References: <20190108131452.4297-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190108131452.4297-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 08, 2019 at 02:14:47PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> R-Car Gen3 Hardware User Manual Rev. 1.50 (finally) documents DMA
> support for the SCIF2 serial port on R-Car H3, M3-W, M3-N, E3, and D3
> (albeit with the wrong MID/RID, due to a hex-vs-dec mix-up).
> 
> This patch series enables DMA for the SCIF2 serial ports on R-Car Gen3
> and RZ/G2 SoCs that do not have DMA enabled yet.
> 
> This has been tested on R-Car M3-W, M3-N, and E3.

Are we sure these values are also valid on RZ/G2?
Could you consider squashing this series into fewer patches - say one?

> 
> Thanks!
> 
> Geert Uytterhoeven (5):
>   arm64: dts: renesas: r8a774a1: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a774c0: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a77965: Enable DMA for SCIF2
>   arm64: dts: renesas: r8a77990: Enable DMA for SCIF2
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
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 
