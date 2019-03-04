Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903B6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EBDF2082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="nZohtNsU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfCDJ7B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:59:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38850 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDJ7A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:59:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 559F925B7C0;
        Mon,  4 Mar 2019 20:58:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693538; bh=DeQ9K3tn21Ol059wARe/cnsBLKmyjrzT06RO450PZ+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nZohtNsUoEmW3GD3sb50hI9GI0rxAWDbEsrPrF8BGkfdHFqEhb1fXX1/TL9a5OPyU
         hdAFNIhikgBCT9MyThGzPabG6sjuMu3TRoZy/VnfvUeWUqhtTi9OypEZr7wbc76G01
         rZUwgNMF4M9MvB1tOzLpS3FT9rNepS+3Id8jyQbw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 91D3994030D; Mon,  4 Mar 2019 10:58:56 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:58:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Message-ID: <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > identical to the one found on the r8a77990.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
