Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeHXO71 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 10:59:27 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas: lvds: document R8A77980 bindings
Date: Fri, 24 Aug 2018 14:25:10 +0300
Message-ID: <3909495.C7QA1pO7y4@avalon>
In-Reply-To: <bd7295cd-ac3c-a01a-683a-f2e324469bcb@cogentembedded.com>
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com> <bd7295cd-ac3c-a01a-683a-f2e324469bcb@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Tuesday, 5 June 2018 23:28:58 EEST Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the R-Car LVDS bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: drm/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> =================================================================== ---
> drm.orig/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ drm/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -14,6 +14,7 @@ Required properties:
>    - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
>    - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS
> encoders
>    - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS
> encoders
> +  - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS
> encoders
>    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS
> encoders
> 
>  - reg: Base address and length for the memory-mapped registers

-- 
Regards,

Laurent Pinchart
