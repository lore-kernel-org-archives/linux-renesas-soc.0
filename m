Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39161 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753566AbcKVJgj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 04:36:39 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common panel properties
Date: Tue, 22 Nov 2016 11:36:55 +0200
Message-ID: <2307840.2mk6E40XHl@avalon>
In-Reply-To: <20161121164815.bxca4rfvifloizdh@rob-hp-laptop>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161121164815.bxca4rfvifloizdh@rob-hp-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Monday 21 Nov 2016 10:48:15 Rob Herring wrote:
> On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> > Document properties common to several display panels in a central
> > location that can be referenced by the panel device tree bindings.
> 
> Looks good. Just one comment...
> 
> [...]
> 
> > +Connectivity
> > +------------
> > +
> > +- ports: Panels receive video data through one or multiple connections.
> > While
> > +  the nature of those connections is specific to the panel type, the
> > +  connectivity is expressed in a standard fashion using ports as
> > specified in
> > +  the device graph bindings defined in
> > +  Documentation/devicetree/bindings/graph.txt.
> 
> We allow panels to either use graph binding or be a child of the display
> controller.

I knew that some display controllers use a phandle to the panel (see the 
fsl,panel and nvidia,panel properties), but I didn't know we had panels as 
children of display controller nodes. I don't think we should allow that for 
anything but DSI panels, as the DT hierarchy is based on control buses. Are 
you sure we have other panels instantiated through that mechanism ?

> Using the graph is preferred, but in the simple cases just a child node is
> sufficient. This should be described here or somewhere in this doc.

-- 
Regards,

Laurent Pinchart
