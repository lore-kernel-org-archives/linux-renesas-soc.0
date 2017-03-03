Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39990 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbdCCPGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 10:06:48 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Fri, 03 Mar 2017 16:41:40 +0200
Message-ID: <2423895.QcDWT1fsiC@avalon>
In-Reply-To: <1488547835-25229-1-git-send-email-geert+renesas@glider.be>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Friday 03 Mar 2017 14:30:35 Geert Uytterhoeven wrote:
> Document the optional properties for describing module resets, to
> support resetting display channels and LVDS encoders on R-Car Gen2 and
> Gen3.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> 1a02f099a0ff0a3a..7873d53764a297c2 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -36,6 +36,16 @@ Required Properties:
>        When supplied they must be named "dclkin.x" with "x" being the input
>        clock numerical index.
> 
> +Optional properties:
> +  - resets: A list of phandles + reset-specifier pairs, one for each entry
> in

s/phandlers/phandle/

> +    the reset-names property.

What's in the reset specifier ?

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
