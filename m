Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ABEC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C299821872
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="aHIOq4Wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfBGKnK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:43:10 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53889 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfBGKnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:43:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E3F5B25B7E2;
        Thu,  7 Feb 2019 21:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549536188; bh=gMoPz83w4HzJEYuhMpjIwQUa8uOTHQQ792/s/W9wibA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHIOq4Wd2hoJVOyOW1hEdUocrW+jL0ytMcFEFE/CXQGiOdOhdN8XLYGCfChzw3j73
         93eB06nhZIMtopu81kln9iyS914l7/zlbbovSWNGHcfgUGXkK6poGMazLk8W7+YgHv
         PVVqjyFHIoX9QcmUnD4GWLAZtWXLIEiTn5GXW/F8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 346A39444BE; Thu,  7 Feb 2019 11:43:06 +0100 (CET)
Date:   Thu, 7 Feb 2019 11:43:06 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add pciec0
 support
Message-ID: <20190207104305.tchwfqwqxysum4la@verge.net.au>
References: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVeVV9d4Sf=iPQ2UCrGqrnsh2Y9QCWaupwKc7QmRhCebw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeVV9d4Sf=iPQ2UCrGqrnsh2Y9QCWaupwKc7QmRhCebw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 07, 2019 at 11:13:03AM +0100, Geert Uytterhoeven wrote:
> On Thu, Feb 7, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Silicon Linux CAT 874 board has 2GB DDR memory. Update the dma-ranges
> > mapping for pciec0 node. Also declare pcie bus clock, since it is
> > generated on the CAT874 main board.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1.
