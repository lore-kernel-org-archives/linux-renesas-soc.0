Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521CDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA3B920872
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hGjwSgdW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbfCROWv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:22:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfCROWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 10:22:51 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0788033A;
        Mon, 18 Mar 2019 15:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552918968;
        bh=JU5XYNmSJXqtsMlL99UuDFi5EjjE/2aA95WzBwG5Ak0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hGjwSgdWOKjVX6VAwMILPazrWyhqoreMkaXijFka+KwD/5AI0SrzzAVa3jhlPSj42
         ijjiDMDYhHV35sVG7PzaeaiiOS0FxSlKqvGNK7g1fCT7XB2MP/CimJ4KaSq2aK0kIl
         XK7K5urJMl5f7U6O3MjS9O2Bt2tv6PtMssNdgCq8=
Date:   Mon, 18 Mar 2019 16:22:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH/RFC 07/15] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
Message-ID: <20190318142240.GC12707@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-8-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWfNk+v9PTMpE43DD8DvrmhZDeAocDReVNOsE=oh4P6uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWfNk+v9PTMpE43DD8DvrmhZDeAocDReVNOsE=oh4P6uw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Mar 18, 2019 at 11:21:15AM +0100, Geert Uytterhoeven wrote:
> On Thu, Mar 7, 2019 at 12:24 AM Laurent Pinchart wrote:
> > Add a new optional renesas,companion property to point to the companion
> > LVDS encoder. This is used to support dual-link operation where the main
> > LVDS encoder splits even-numbered and odd-numbered pixels between the
> > two LVDS encoders.
> 
> Note that Documentation/devicetree/bindings/usb/generic.txt already
> describes a "companion" property without vendor prefix.
> 
> > The new property doesn't control the mode of operation, it only
> > describes the relationship between the master and companion LVDS
> > encoders.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index 900a884ad9f5..a720dbb5de69 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> >
> >  Each port shall have a single endpoint.
> >
> > +Optional properties:
> > +
> > +- renesas,companion : phandle to the companion LVDS encoder. This property is
> > +  valid for the first LVDS encoder D3 and E3 SoCs only, and points to the
> 
> ... on D3 ...
> 
> > +  second encoder to be used as a companion in dual-link mode.
> 
> Why restrict this to the first LVDS decoder, and not have a backlink in the
> other node,

Because there's no need to ? :-) Furthermore there's a need for the
master to know its a master, so have a link in a single direction is
pretty convenient. Otherwise I'd need an extra property to identify the
master.

> like for USB?

I'm not sure what USB does in that regard.

-- 
Regards,

Laurent Pinchart
