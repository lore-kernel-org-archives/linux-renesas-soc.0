Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58010 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032203AbeBNQUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 11:20:40 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] DT: display: renesas,lvds: document R8A77970 bindings
Date: Wed, 14 Feb 2018 18:21:13 +0200
Message-ID: <5802305.NSMfeCE6G5@avalon>
In-Reply-To: <20180119183553.649510876@cogentembedded.com>
References: <20180119183553.649510876@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Friday, 19 January 2018 20:29:20 EET Sergei Shtylyov wrote:
> Document the R-Car V3M (R8A77970) SoC in the R-Car LVDS bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index:
> linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> =================================================================== ---
> linux.orig/Documentation/devicetree/bindings/display/bridge/renesas,lvds.tx
> t +++
> linux/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt @@
> -13,6 +13,7 @@ Required properties:
>    - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS
> encoders - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS
> encoders - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS
> encoders +  - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible
> LVDS encoders
> 
>  - reg: Base address and length for the memory-mapped registers
>  - clocks: A phandle + clock-specifier pair for the functional clock

-- 
Regards,

Laurent Pinchart
