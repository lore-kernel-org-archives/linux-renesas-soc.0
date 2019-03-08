Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5B1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E28A20851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sM9ImBL8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfCHR5s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 12:57:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfCHR5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 12:57:47 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87E4D309;
        Fri,  8 Mar 2019 18:57:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552067865;
        bh=+nXVp31FXEvDPcR+O25rAMdjJfs7VoggnLYiTx6d3Os=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sM9ImBL8+aJgbARZ57LyUm8NWua2pZo3IAWcfHDvibeT2mvbsLqPE/F+vtBpL+nPd
         ok4aWEWX9xnpI6HxUUhXVLqAP9XUU9LcTERrCcpe6XPV+Xa/UhiOj+bW3H7VFHo+j/
         g0y3O7s7rPXYooXFhKia/EEz7gStIvz6ttYFCuyQ=
Date:   Fri, 8 Mar 2019 19:57:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190308175739.GA11318@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Mar 08, 2019 at 05:49:25PM +0100, Jacopo Mondi wrote:
> On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> > The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> > dual-link. In dual-link mode both input ports are used to carry even-
> > and odd-numbered pixels separately. Document this in the DT bindings,
> > along with the related rules governing port and usage.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > index 37f0c04d5a28..4ff6eb9bbc19 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > @@ -28,6 +28,13 @@ Optional video port nodes:
> >  - port@1: Second LVDS input port
> >  - port@3: Second digital CMOS/TTL parallel output
> >
> > +The device can operate in single-link mode or dual-link mode. In single-link
> > +mode, all pixels are received on port@0, and port@1 shall not contain any
> > +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> > +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> > +endpoints.
> 
> You know, I'm not sure this is helpful, as if we have to go and
> describe what the chip supports, a paragraph for dual ouput mode would
> be required as well. The bindings already document that the chip
> supports single/dual input/output modes, maybe you can just add rules
> that prescribes how to populate the endpoints, for both input and
> output modes?

That's what I was trying to do :-) How else would you like to see it
described ?

> > +
> > +
> 
> You can drop this empty line.
> 
> >  Example:
> >  --------
> >

-- 
Regards,

Laurent Pinchart
