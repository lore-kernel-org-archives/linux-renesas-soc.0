Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:44293 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750791AbeDXTzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 15:55:33 -0400
Received: by mail-lf0-f67.google.com with SMTP id g203-v6so22096417lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 12:55:32 -0700 (PDT)
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com. [209.85.215.49])
        by smtp.gmail.com with ESMTPSA id 18-v6sm3529550lfy.62.2018.04.24.12.55.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Apr 2018 12:55:31 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id m18-v6so4818707lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 12:55:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424153942.2526-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180424153942.2526-1-kieran.bingham+renesas@ideasonboard.com>
From: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Date: Wed, 25 Apr 2018 01:25:30 +0530
Message-ID: <CAK-LDbJ1R7Ltwufe2VxOuWYygFvDTX8s1oSJ1-ycHe27MmkF4g@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: of: Include header to define prototypes
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 9:09 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The symbol 'rcar_du_of_init' is defined by the rcar_du_of module header,
> but it is not included by the C implementation.
>
> Include the header to correctly define the function prototypes.
>
> Fixes the following warning:
>
> linux/drivers/gpu/drm/rcar-du/rcar_du_of.c:319:13:
>    warning: symbol 'rcar_du_of_init' was not declared. Should it be static?
>     CC      drivers/gpu/drm/rcar-du/rcar_du_of.o
>
> Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encoder nodes")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Vaishali Thakkar <vthakkar@vaishalithakkar.in>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_of.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> index 68a0b82cb17e..afef69669bb4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -18,6 +18,7 @@
>
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
> +#include "rcar_du_of.h"
>
>  /* -----------------------------------------------------------------------------
>   * Generic Overlay Handling
> --
> 2.17.0
>
