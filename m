Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34468 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbeAOUZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 15:25:19 -0500
Received: by mail-lf0-f65.google.com with SMTP id h140so14777136lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2018 12:25:19 -0800 (PST)
Subject: Re: [PATCH v2 04/12] drm: rcar-du: Convert LVDS encoder code to
 bridge driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-5-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9a2806f3-d232-b587-bc77-733e9d45c138@cogentembedded.com>
Date: Mon, 15 Jan 2018 23:25:16 +0300
MIME-Version: 1.0
In-Reply-To: <20180112231430.26943-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 01/13/2018 02:14 AM, Laurent Pinchart wrote:

> The LVDS encoders used to be described in DT as part of the DU. They now
> have their own DT node, linked to the DU using the OF graph bindings.
> This allows moving internal LVDS encoder support to a separate driver
> modelled as a DRM bridge. Backward compatibility is retained as legacy
> DT is patched live to move to the new bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[...]
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 6e02c762a557..06a3fbdd728a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
[...]
>   /* -----------------------------------------------------------------------------
> @@ -74,7 +75,6 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
>   			.port = 1,
>   		},
>   	},
> -	.num_lvds = 0,
>   };
>   
>   static const struct rcar_du_device_info rcar_du_r8a7779_info = {
> @@ -95,14 +95,13 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
>   			.port = 1,
>   		},
>   	},
> -	.num_lvds = 0,
>   };
>   
>   static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>   	.gen = 2,
>   	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>   		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
> -	.quirks = RCAR_DU_QUIRK_ALIGN_128B | RCAR_DU_QUIRK_LVDS_LANES,
> +	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
>   	.num_crtcs = 3,
>   	.routes = {
>   		/*
> @@ -164,7 +163,6 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
>   			.port = 1,
>   		},
>   	},
> -	.num_lvds = 0,
>   };
>   
>   static const struct rcar_du_device_info rcar_du_r8a7794_info = {
> @@ -186,7 +184,6 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
>   			.port = 1,
>   		},
>   	},
> -	.num_lvds = 0,

    I think you can remove *all* such initializers and the field itself with 
them -- otherwise it looks like you're doing a not-quite-related drive-by 
clean up...

[...]

MBR, Sergei
