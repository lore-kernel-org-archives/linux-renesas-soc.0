Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:19784 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbeIQQUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:20:20 -0400
Date: Mon, 17 Sep 2018 12:53:29 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1034918710.239795.1537181609239@webmail.strato.com>
In-Reply-To: <20180914091046.483-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 03/16] dt-bindings: display: renesas: lvds: Add EXTAL
 and DU_DOTCLKIN clocks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
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
>  - resets: A phandle + reset specifier for the module reset
>  
>  Required nodes:

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
