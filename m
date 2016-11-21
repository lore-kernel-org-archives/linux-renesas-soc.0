Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36725 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753343AbcKUQsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 11:48:19 -0500
Date: Mon, 21 Nov 2016 10:48:15 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
Message-ID: <20161121164815.bxca4rfvifloizdh@rob-hp-laptop>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> Document properties common to several display panels in a central
> location that can be referenced by the panel device tree bindings.
> 

Looks good. Just one comment...

[...]

> +Connectivity
> +------------
> +
> +- ports: Panels receive video data through one or multiple connections. While
> +  the nature of those connections is specific to the panel type, the
> +  connectivity is expressed in a standard fashion using ports as specified in
> +  the device graph bindings defined in
> +  Documentation/devicetree/bindings/graph.txt.

We allow panels to either use graph binding or be a child of the display 
controller. Using the graph is preferred, but in the simple cases just a 
child node is sufficient. This should be described here or somewhere in 
this doc.

Rob
