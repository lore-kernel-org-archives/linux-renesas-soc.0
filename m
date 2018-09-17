Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:36102 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbeIQQ0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:26:21 -0400
Date: Mon, 17 Sep 2018 12:53:16 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1438354243.239781.1537181596678@webmail.strato.com>
In-Reply-To: <20180914091046.483-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: display: renesas: du: Document
 r8a77990 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> Document the E3 (r8a77990) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index caae2348a292..9de67be632d1 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -16,6 +16,7 @@ Required Properties:
>      - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>      - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
> +    - "renesas,du-r8a77990" for R8A77990 (R-Car E3) compatible DU
>      - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
>  
>    - reg: the memory-mapped I/O registers base address and length
> @@ -63,6 +64,7 @@ corresponding to each DU output.
>   R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
>   R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
>   R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
> + R8A77990 (R-Car E3)    DPAD 0         LVDS 0         LVDS 1         -
>   R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1         -
>  
>  

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
