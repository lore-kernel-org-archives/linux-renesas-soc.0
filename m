Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389D2C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 08:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08D6120861
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 08:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TPaKZMIr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfAWI7V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:59:21 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbfAWI7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 03:59:21 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D97E125BDDE;
        Wed, 23 Jan 2019 19:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548233960; bh=uUwVWWd68y1Uzm8MKAzUjUCk0B09JymTRKXLlS+TelU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TPaKZMIru+aQZ8AcOTcISfUoUJH2w4CoV5piGrewZEG5iJoBDNg29mrW42uG+BvL4
         m7MMidOz56a5OUtR6LvI958UmxIHwaheQql736FLoutmr2gPvX4BYPPrOezbAH/sih
         VcC47A0VCiafjvtM2LnQaOVbTePwxqOz7SshlHFU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F0D96940471; Wed, 23 Jan 2019 09:59:17 +0100 (CET)
Date:   Wed, 23 Jan 2019 09:59:17 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Message-ID: <20190123085916.enynafmsnrhm2bmk@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
 <20190122154428.GE11461@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122154428.GE11461@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 05:44:28PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:46PM +0000, Biju Das wrote:
> > Document the RZ/G1N (R8A7744) LVDS bindings.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and taken in my tree.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > ---
> >  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index 27a054e..900a884 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -8,6 +8,7 @@ Required properties:
> >  
> >  - compatible : Shall contain one of
> >    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> > +  - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> >    - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
> >    - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
> >    - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
