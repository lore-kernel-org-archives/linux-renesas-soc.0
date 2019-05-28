Return-Path: <SRS0=f7QG=T4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E736C04AB6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 28 May 2019 12:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF815208C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 28 May 2019 12:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o5huZLjI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfE1Mat (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 28 May 2019 08:30:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48018 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfE1Mat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 08:30:49 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0B87D85;
        Tue, 28 May 2019 14:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559046647;
        bh=caHy49s0LS560k5n2Npm3GA1sKEg331DmzayTd0pV+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o5huZLjIufS0/nMuSSe2H7sPr6XtV5m+CfjGdWMNyK7pdfj3d5WrL8n1aOfD7b7pD
         ryXyVBot89QGedra0WtjBaZYsgG4jekc1Sw+QBkh9UAYLs3tUsJqewH3pNCZYktBDk
         FdibpCvuvDvOBHcClOc5YpOXk0FtisfbRKx8+hl4=
Date:   Tue, 28 May 2019 15:30:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: display: renesas: lvds: Add
 renesas,companion property
Message-ID: <20190528123026.GB5916@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528092847.kxhhq7hevforddb6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528092847.kxhhq7hevforddb6@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, May 28, 2019 at 11:28:47AM +0200, Jacopo Mondi wrote:
> On Sun, May 12, 2019 at 12:06:56AM +0300, Laurent Pinchart wrote:
> > Add a new optional renesas,companion property to point to the companion
> > LVDS encoder. This is used to support dual-link operation where the main
> > LVDS encoder splits even-numbered and odd-numbered pixels between the
> > two LVDS encoders.
> >
> > The new property doesn't control the mode of operation, it only
> > describes the relationship between the master and companion LVDS
> > encoders.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Fixed typo
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index 900a884ad9f5..f2cc01d54cbd 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> >
> >  Each port shall have a single endpoint.
> >
> > +Optional properties:
> > +
> > +- renesas,companion : phandle to the companion LVDS encoder. This property is
> > +  valid for the first LVDS encoder on D3 and E3 SoCs only, and points to the
> > +  second encoder to be used as a companion in dual-link mode.
> > +
> 
> If I got this right, the property does not enable dual-link
> operations by itself, but it needs the next bridge to be operating in
> dual link mode (ie. has both LVDS0 and LVDS1 output connected to its
> input ports).

Correct.

> Is it worth describing it here (or at least clarify the the property
> alone does not enable dual link operations).

How about the following ?

- renesas,companion : phandle to the companion LVDS encoder. This property is
  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to 
  the second encoder to be used as a companion in dual-link mode. It shall not 
  be set for any other LVDS encoder.

> Apart from that
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

-- 
Regards,

Laurent Pinchart
