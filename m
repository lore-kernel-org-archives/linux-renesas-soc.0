Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7958C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3F102087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="q/Lz37Zk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfBYJiQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:38:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40729 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfBYJiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:38:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D234625BEE0;
        Mon, 25 Feb 2019 20:38:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551087494; bh=vV4YWF6OlrnhFeIPT5GSvAtQG7xphf/CvBrbf/lxDzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q/Lz37ZkhrOmErianziUt2KNUR6g7PwYScM3ena/RlrAoWAyxCxhzbuX6crcxGx80
         7k1IGhUnXZ/OF2hHuXlsiXsQzAHWYO/XLn0ccJGq1VCKJO8ra7M5dzDUqwddMojGTO
         poh2iQGNw168AR1QdyM/J00pkPdsfsOsPbVOa3IY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 094AF94056F; Mon, 25 Feb 2019 10:38:11 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:38:11 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
Message-ID: <20190225093811.cpsbp43sykdjkyvs@verge.net.au>
References: <20190221140428.17411-1-geert+renesas@glider.be>
 <TY1PR01MB1770B67191409067BBBDBF51C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B67191409067BBBDBF51C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 02:09:12PM +0000, Fabrizio Castro wrote:
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > Sent: 21 February 2019 14:04
> > Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
> > 
> > Correct the DMA channels for SCIF5 from 16..47 to 0..15, as was done for
> > R-Car E3.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: 2660a6af690ebbb4 ("arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, applied as a fix for v5.1.
