Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbeJPGDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 02:03:48 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: renesas: du: Document the r8a77470 bindings
Date: Tue, 16 Oct 2018 01:16:42 +0300
Message-ID: <21387491.YtWCBA7EHF@avalon>
In-Reply-To: <1537553311-8831-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com> <1537553311-8831-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Friday, 21 September 2018 21:08:27 EEST Fabrizio Castro wrote:
> Document the RZ/G1C (r8a77470) SoC in R-Car DU bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> ec9d34be..2b28ae2 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -5,6 +5,7 @@ Required Properties:
>    - compatible: must be one of the following.
>      - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
>      - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
> +    - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
>      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> @@ -51,6 +52,7 @@ corresponding to each DU output.
>  ---------------------------------------------------------------------------
> -- R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
> R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              - +
> R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
> R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -

-- 
Regards,

Laurent Pinchart
