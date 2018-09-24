Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:52610 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbeIYBHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 21:07:51 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 03/16] dt-bindings: display: renesas: lvds: Add EXTAL
 and DU_DOTCLKIN clocks
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-4-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <54b0f049-9053-ae61-8100-9ab1c9bfeee5@ideasonboard.com>
Date: Mon, 24 Sep 2018 20:04:11 +0100
MIME-Version: 1.0
In-Reply-To: <20180914091046.483-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the patch,

On 14/09/18 10:10, Laurent Pinchart wrote:
> On the D3 and E3 SoCs, the LVDS encoder can derive its internal pixel
> clock from an externally supplied clock, either through the EXTAL pin or
> through one of the DU_DOTCLKINx pins. Add corresponding clocks to the DT
> bindings.
> 
> To retain backward compatibility with DT that don't specify the
> clock-names property, the functional clock must always be specified
> first, and the clock-names property is optional when only the functional
> clock is specified.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Changes since v1:
> 
> - Clarified wording
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 13af7e2ac7e8..3aeb0ec06fd0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -19,7 +19,17 @@ Required properties:
>    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
>  
>  - reg: Base address and length for the memory-mapped registers
> -- clocks: A phandle + clock-specifier pair for the functional clock
> +- clocks: A list of phandles + clock-specifier pairs, one for each entry in
> +  the clock-names property.
> +- clock-names: Name of the clocks. This property is model-dependent.
> +  - The functional clock, which mandatory for all models, shall be listed
> +    first, and shall be named "fck".
> +  - On R8A77990 and R8A77995, the LVDS encoder can use the EXTAL or
> +    DU_DOTCLKINx clocks. Those clocks are optional. When supplied they must be
> +    named "extal" and "dclkin.x" respectively, with "x" being the DU_DOTCLKIN
> +    numerical index.
> +  - When the clocks property only contains the functional clock, the
> +    clock-names property may be omitted.

This all reads well to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  - resets: A phandle + reset specifier for the module reset
>  
>  Required nodes:
> 

-- 
Regards
--
Kieran
