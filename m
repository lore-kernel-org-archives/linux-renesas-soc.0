Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36611 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754215AbdCFQcT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:32:19 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Mon, 06 Mar 2017 18:32:55 +0200
Message-ID: <1503576.T3vfvR3RGC@avalon>
In-Reply-To: <1488817556-21410-1-git-send-email-geert+renesas@glider.be>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Monday 06 Mar 2017 17:25:56 Geert Uytterhoeven wrote:
> Document the optional properties for describing module resets, to
> support resetting display channels and LVDS encoders on R-Car Gen2 and
> Gen3.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks good to me.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think we should try implementing support for reset in the DU driver before 
merging this though, it always helps to test the proposed DT bindings.

> ---
> See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
> support" (https://patchwork.kernel.org/patch/9536627/) for the format of
> a reset specifier in the Renesas CPG/MSSR case.
> 
> E.g. "resets = <&cpg 310>;"
> 
> v2:
>   - s/phandles/phandle/.
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> 1a02f099a0ff0a3a..3db418c827193e82 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -36,6 +36,16 @@ Required Properties:
>        When supplied they must be named "dclkin.x" with "x" being the input
>        clock numerical index.
> 
> +Optional properties:
> +  - resets: A list of phandle + reset-specifier pairs, one for each entry
> in +    the reset-names property.
> +  - reset-names: Names of the resets. This property is model-dependent.
> +    - R8A779[0123456] use one reset for a group of one or more successive
> +      channels, and one reset per LVDS encoder (if available). The resets
> +      must be named "du.x" with "x" being the numerical index of the lowest
> +      channel in the group. The LVDS resets must be named "lvds.x" with
> "x" +      being the LVDS encoder numerical index.
> +
>  Required nodes:
> 
>  The connections to the DU output video ports are modeled using the OF graph

-- 
Regards,

Laurent Pinchart
