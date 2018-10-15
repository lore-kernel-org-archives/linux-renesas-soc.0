Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbeJPGFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 02:05:53 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 2/5] dt-bindings: display: renesas: du: Document the r8a7744 bindings
Date: Tue, 16 Oct 2018 01:18:47 +0300
Message-ID: <7588020.PaOoir5Xgb@avalon>
In-Reply-To: <1537553311-8831-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com> <1537553311-8831-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Friday, 21 September 2018 21:08:28 EEST Fabrizio Castro wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Document the RZ/G1N (R8A7744) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> 2b28ae2..aad9cf1 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -4,6 +4,7 @@ Required Properties:
> 
>    - compatible: must be one of the following.
>      - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
> +    - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
>      - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
>      - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> @@ -51,6 +52,7 @@ corresponding to each DU output.
>                          Port0          Port1          Port2          Port3
>  ---------------------------------------------------------------------------
> -- R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              - +
> R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
> R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
> R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
> R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -


-- 
Regards,

Laurent Pinchart
