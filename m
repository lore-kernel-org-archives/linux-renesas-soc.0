Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01540C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA2B721738
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="q0YcGLHz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfBYJNx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:13:53 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40379 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfBYJNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:13:52 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 61E4F25B784;
        Mon, 25 Feb 2019 20:13:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551086031; bh=41cAx7DljS9pxOT0Nid/zPds+9pnTbZ8xIP34CAFX5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0YcGLHz7SMzsPIi7zIjCAiT24Hi+ayAdHeLhWiJ45dOFttaOqpH+0T3VCr2tJZpi
         KapQC7jJa/cwAsaPdvmt8hF2kw0fz+Xdwt8DkmX6K1mUozohGG/V3UxnsxdWXp+iQv
         JYdX4YX027WhSnn54jj5JLJrjudMWttoDtJsakbM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8560094056F; Mon, 25 Feb 2019 10:13:49 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:13:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable
 LVDS1 encoder
Message-ID: <20190225091348.hpuaidjgow43al72@verge.net.au>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190122225405.7815-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190123085656.5mgfcuv55efegrps@verge.net.au>
 <20190123095552.GE4485@pendragon.ideasonboard.com>
 <20190123100303.yujjpgm7wqxp2e4b@verge.net.au>
 <20190215114443.GA6737@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190215114443.GA6737@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 15, 2019 at 01:44:43PM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Wed, Jan 23, 2019 at 11:03:04AM +0100, Simon Horman wrote:
> > On Wed, Jan 23, 2019 at 11:55:52AM +0200, Laurent Pinchart wrote:
> > > On Wed, Jan 23, 2019 at 09:56:57AM +0100, Simon Horman wrote:
> > >> On Wed, Jan 23, 2019 at 12:54:04AM +0200, Laurent Pinchart wrote:
> > >>> The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
> > >>> output when the LVDS0 encoder is used. Enable it despite its output not
> > >>> being connected.
> > >>> 
> > >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >>> ---
> > >>> Changes since v1:
> > >>> 
> > >>> - Add a comment in the DT to explain why the LVDS1 encoder needs to be
> > >>>   enabled.
> > >> 
> > >> Thanks,
> > >> 
> > >> This looks fine to me but I will wait to see if there are other reviews
> > >> before applying.
> > >> 
> > >> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > > 
> > > Please note that this will likely cause probe failures if applied
> > > without the driver patches from this series. Would it be OK to merge the
> > > DT changes through the DRM tree ?
> > 
> > I'm not sure that the probe failures are a problem unless they move
> > something that was in a working state to a non-working state. Nonetheless
> > they are at the very least not very nice.
> > 
> > I generally shy away from having DT patches merged in other trees
> > to avoid the chance of merge conflicts (that need to be resolved by Linus).
> > What is your feeling on the risk of such a conflict?
> 
> I would have said low, but given that it's too late to get the DT
> changes in v5.1 anyway, it's no big deal. The driver patches have been
> merged for v5.1, so could you queue the DT changes for v5.2 ?

Thanks, I've applied patches 5 and 6 of this series to my
renesas tree for inclusion in v5.2.
