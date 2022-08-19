Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A07C00140
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Aug 2022 01:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbiHSBGp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Aug 2022 21:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiHSBGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 21:06:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D1B729E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2022 18:06:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDE618B;
        Fri, 19 Aug 2022 03:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660871201;
        bh=NNUU5YzrDxjmeQ0TD9XuwhtqJs5RLbmdvu7V+5nLdbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GUhvLH55x4F2J5p+bBI9Zh2v1Ni0ZRMiPDyLpi58F7gJIC852VrhHt0iKg86CP8Ve
         LISRkxpNGwnfFV0ykd1vdQIHi6Af539G1worBZhGU25lofmXhOFfBri1IAvwvZskQe
         LnBl+69dn18/T8yjd4UUcI8OzwAdAyUo9Ic9x/4s=
Date:   Fri, 19 Aug 2022 04:06:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: remove unnecessary include
Message-ID: <Yv7iHRuoSPi8ocZH@pendragon.ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Aug 17, 2022 at 04:28:01PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> rcar_du_regs.h is not needed by rcar_du_drv.c so drop the include.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 00ac233a115e..541c202c993a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -27,7 +27,6 @@
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_kms.h"
> -#include "rcar_du_regs.h"
>  
>  /* -----------------------------------------------------------------------------
>   * Device Information

-- 
Regards,

Laurent Pinchart
