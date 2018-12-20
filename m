Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EE1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD18321720
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JnqTkxip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbeLTH4w (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 02:56:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57931 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbeLTH4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 02:56:52 -0500
Received: from penelope.horms.nl (softbank060150141248.bbtec.net [60.150.141.248])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D37A925B770;
        Thu, 20 Dec 2018 18:56:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545292610; bh=dlpixibvzLm2SdFfwnpBzM4aKs6/UkhfPdGmWqWmy/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JnqTkxipa1HtP4e3s9nDT0Ok9gNreKSuQ3Noo2nD2eSgxOWkWdBMvY90sETmvj8FI
         LFzAXmFaXZwc8ua17K6O2mwFz0f6O203HcFIQT/e8qMi4p4WV3YPGGRkwouc/zc0PH
         ERJ28TlGlQ+I41DF/d4CLf+MRzuvEq6SJD9Mj5kY=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 678BDE218FB; Wed, 19 Dec 2018 23:56:48 -0800 (PST)
Date:   Thu, 20 Dec 2018 16:56:48 +0900
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Fix hsusb reg size
Message-ID: <20181220075647.mr7vmtfa3t6oxzh3@verge.net.au>
References: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 01:07:19PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 18, 2018 at 1:02 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > HS-USB has registers outside the currently specified memory area,
> > therefore change the definition accordingly.
> >
> > Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and
> > HSUSB device nodes")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.
