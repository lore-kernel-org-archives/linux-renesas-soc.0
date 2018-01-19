Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:39819 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756314AbeASWrW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 17:47:22 -0500
Date: Fri, 19 Jan 2018 16:47:20 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Message-ID: <20180119224720.x5xrf5piagwwg7jj@rob-hp-laptop>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112231430.26943-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jan 13, 2018 at 01:14:19AM +0200, Laurent Pinchart wrote:
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Move the SoC name before the IP name in compatible strings
> - Rename parallel input to parallel RGB input
> - Fixed "renesas,r8a7743-lvds" description
> - Document the resets property
> - Fixed typo
> ---
>  .../bindings/display/bridge/renesas,lvds.txt       | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt

Reviewed-by: Rob Herring <robh@kernel.org>
