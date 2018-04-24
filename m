Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41216 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751476AbeDXTx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 15:53:26 -0400
Received: by mail-lf0-f68.google.com with SMTP id o123-v6so19523818lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 12:53:25 -0700 (PDT)
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com. [209.85.215.41])
        by smtp.gmail.com with ESMTPSA id q11-v6sm3511750lfb.68.2018.04.24.12.53.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Apr 2018 12:53:24 -0700 (PDT)
Received: by mail-lf0-f41.google.com with SMTP id j16-v6so4860454lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 12:53:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180424154003.2604-1-kieran.bingham+renesas@ideasonboard.com>
From: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Date: Wed, 25 Apr 2018 01:23:23 +0530
Message-ID: <CAK-LDbJzT46BNoVuqjcoPi2kdSQgxVr1wSFTk6u76utwK25zdQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use NULL for table initialisation
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 9:10 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Replace the initialisation of the vsps table with a NULL specifier.
>
> Fixes the following warning:
>  linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c:483:40:
>     warning: Using plain integer as NULL pointer
>       CC      drivers/gpu/drm/rcar-du/rcar_du_kms.o

Hi Kieran,

Change looks ok to me.

> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Vaishali Thakkar <vthakkar@vaishalithakkar.in>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index ef72dff00763..cf5b422fc753 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -480,7 +480,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>         struct {
>                 struct device_node *np;
>                 unsigned int crtcs_mask;
> -       } vsps[RCAR_DU_MAX_VSPS] = { { 0, }, };
> +       } vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
>         unsigned int vsps_count = 0;
>         unsigned int cells;
>         unsigned int i;
> --
> 2.17.0
>
