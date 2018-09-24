Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45136 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbeIXRhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 13:37:42 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 02/16] dt-bindings: display: renesas: lvds: Document
 r8a77990 bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-3-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2ed87630-2f54-6ace-30b1-5a5667911aa2@ideasonboard.com>
Date: Mon, 24 Sep 2018 12:36:00 +0100
MIME-Version: 1.0
In-Reply-To: <20180914091046.483-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 14/09/18 10:10, Laurent Pinchart wrote:
> The E3 (r8a77990) supports two LVDS channels. Extend the binding to
> support them.

This commit message sounds rather like we are modifying the bindings,
rather than just adding a compatible string. I went looking for extra
changes - but I see we only need a compatible addition.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Still, the change looks accurate to me - and at the moment I can't think
of a better description so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 5a4e379bb414..13af7e2ac7e8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -15,6 +15,7 @@ Required properties:
>    - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
>    - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
>    - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
> +  - "renesas,r8a77990-lvds" for R8A77990 (R-Car E3) compatible LVDS encoders
>    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
>  
>  - reg: Base address and length for the memory-mapped registers
> 

-- 
Regards
--
Kieran
