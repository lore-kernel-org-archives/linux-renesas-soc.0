Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD44C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C436820870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="AUjF6VCa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfAWKDI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:03:08 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50991 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfAWKDI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:03:08 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7BB2325BE34;
        Wed, 23 Jan 2019 21:03:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548237786; bh=t2S39YC2yULZtVdyvavMv4nYIGhRSEnRu6IfPYjzEo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AUjF6VCapjF9YUudK+MQ5Pk3YqJHjIZFRuJ4xZluhz/o+gEFVsT36Lr6cnGP5vvgD
         WoAp2lCx8WSxv1vbYDMqR+9wrvH7kmFUxg14mlfRPK8NK9ULAaEFsp2azBWIehvD/p
         RAtKlyHx3rXl2Bf2DurdNxvXbLxoutQ7VFJfv6Ik=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AC62C940471; Wed, 23 Jan 2019 11:03:04 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:03:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable
 LVDS1 encoder
Message-ID: <20190123100303.yujjpgm7wqxp2e4b@verge.net.au>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190122225405.7815-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190123085656.5mgfcuv55efegrps@verge.net.au>
 <20190123095552.GE4485@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123095552.GE4485@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jan 23, 2019 at 11:55:52AM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Wed, Jan 23, 2019 at 09:56:57AM +0100, Simon Horman wrote:
> > On Wed, Jan 23, 2019 at 12:54:04AM +0200, Laurent Pinchart wrote:
> > > The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
> > > output when the LVDS0 encoder is used. Enable it despite its output not
> > > being connected.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > > 
> > > - Add a comment in the DT to explain why the LVDS1 encoder needs to be
> > >   enabled.
> > 
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Please note that this will likely cause probe failures if applied
> without the driver patches from this series. Would it be OK to merge the
> DT changes through the DRM tree ?

I'm not sure that the probe failures are a problem unless they move
something that was in a working state to a non-working state. Nonetheless
they are at the very least not very nice.

I generally shy away from having DT patches merged in other trees
to avoid the chance of merge conflicts (that need to be resolved by Linus).
What is your feeling on the risk of such a conflict?
