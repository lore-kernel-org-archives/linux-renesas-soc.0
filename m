Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41923 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751698AbeD3HTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 03:19:54 -0400
Date: Mon, 30 Apr 2018 09:19:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfgang Grandegger <wg@grandegger.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] DT: net: can: rcar_canfd: document R8A77970 bindings
Message-ID: <20180430071949.hg6vw2hre6j22mel@verge.net.au>
References: <7a3d170f-1d3a-a807-9256-15fe1a78ca4e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3d170f-1d3a-a807-9256-15fe1a78ca4e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 26, 2018 at 10:41:14PM +0300, Sergei Shtylyov wrote:
> Document the R-Car V3M (R8A77970) SoC support in the R-Car CAN-FD bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> The patch is against the 'linux-can-next.git' repo but I wouldn't object if
> it's merged to the 'linux-can.git' repo instead. :-)
> 
>  Documentation/devicetree/bindings/net/can/rcar_canfd.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-can-next/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> ===================================================================
> --- linux-can-next.orig/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> +++ linux-can-next/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> @@ -6,6 +6,7 @@ Required properties:
>    - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
>    - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
>    - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3) compatible controller.
> +  - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
>  
>    When compatible with the generic version, nodes must list the
>    SoC-specific version corresponding to the platform first, followed by the
> 
