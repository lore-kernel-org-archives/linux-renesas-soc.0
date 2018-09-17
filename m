Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:23188 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbeIQQXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:23:22 -0400
Date: Mon, 17 Sep 2018 12:53:22 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <854428431.239787.1537181602733@webmail.strato.com>
In-Reply-To: <20180914091046.483-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 02/16] dt-bindings: display: renesas: lvds: Document
 r8a77990 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> The E3 (r8a77990) supports two LVDS channels. Extend the binding to
> support them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
