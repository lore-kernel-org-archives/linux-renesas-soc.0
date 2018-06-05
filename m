Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35706 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751494AbeFEKJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 06:09:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980 bindings
Date: Tue, 05 Jun 2018 13:09:53 +0300
Message-ID: <3941727.PNGxG4XCLb@avalon>
In-Reply-To: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Monday, 4 June 2018 22:04:59 EEST Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
> hardware seems the same as in the R-Car V3M (R8A77970).

How about "the DU hardware has the same topology as in the R-Car V3M 
(R8A77970)" ? "seems" sounds like we're very unsure :-)

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'drm-next' branch of David Airlie's 'linux.git'
> repo.

Then you might want to switch to git://anongit.freedesktop.org/drm/drm :-)

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you agree with the small change to the commit message I'll fix the conflict 
locally, there's no need to resubmit.

>  Documentation/devicetree/bindings/display/renesas,du.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: linux/Documentation/devicetree/bindings/display/renesas,du.txt
> ===================================================================
> --- linux.orig/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ linux/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -14,6 +14,7 @@ Required Properties:
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
> +    - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
>      - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
> 
>    - reg: the memory-mapped I/O registers base address and length
> @@ -60,6 +61,7 @@ corresponding to each DU output.
>   R8A7795 (R-Car H3)   DPAD 0         HDMI 0         HDMI 1         LVDS 0
>   R8A7796 (R-Car M3-W) DPAD 0         HDMI 0         LVDS 0         -
>   R8A77970 (R-Car V3M) DPAD 0         LVDS 0         -              -
> + R8A77980 (R-Car V3H) DPAD 0         LVDS 0         -              -
>   R8A77995 (R-Car D3)  DPAD 0         LVDS 0         LVDS 1         -

-- 
Regards,

Laurent Pinchart
