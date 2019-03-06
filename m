Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79C5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 755EC20652
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QvM1ERR3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729116AbfCFMyE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 07:54:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53352 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbfCFMyE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 07:54:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B267925B7D0;
        Wed,  6 Mar 2019 23:54:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551876842; bh=plVVvFDsAxgNbSlongmn5q7Ov2kXRJtOPWuAFaEgJEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QvM1ERR3xhtAlid79mzJkV0s2RJPGIjCmq9sc0/L7aTxM0u5YXHVb7ALn9mveZxL+
         TxVEznH5QHiWvnHnzLxPL+hJrALuo2tilAcjTUGl/IGiY3D8pYWG8LICra7uFcXsbQ
         x4G5IjBc11K3scRxV/ymI77h4azT2eWlW/a2LHl0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3213494030D; Wed,  6 Mar 2019 13:54:00 +0100 (CET)
Date:   Wed, 6 Mar 2019 13:54:00 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Message-ID: <20190306125359.xqtuq35ccwfbbk5q@verge.net.au>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
 <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
 <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 04, 2019 at 10:10:49AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 04 March 2019 09:59
> > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> > Magnus Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND
> > FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Chris Paterson <Chris.Paterson2@renesas.com>; Biju Das
> > <biju.das@bp.renesas.com>
> > Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
> > 
> > On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > > > identical to the one found on the r8a77990.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied.
> 
> The patch that adds R8A774C0_CLK_CANFD (https://patchwork.kernel.org/patch/10766867/)
> Isn't in a release candidate just yet, therefore I was expecting this patch to be deferred to
> to when R8A774C0_CLK_CANFD is finally available, similarly to:
> https://www.spinics.net/lists/netdev/msg547320.html
> 
> Was I wrong?

No, I was wrong in sending out the email above.

The patch is still deferred.
