Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36330 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdETL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 May 2017 07:59:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v4 1/8] include: media: Move and update CEU driver interface
Date: Sat, 20 May 2017 14:59:18 +0300
Message-ID: <4250769.ZVgmE1TOyq@avalon>
In-Reply-To: <1495209780-27342-2-git-send-email-jacopo@jmondi.org>
References: <1495209780-27342-1-git-send-email-jacopo@jmondi.org> <1495209780-27342-2-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday 19 May 2017 18:02:53 Jacopo Mondi wrote:
> Update Renesas CEU driver interface to use driver interface

I'm not sure this matches the content of the patch.

> SQUASH

? :-)

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  include/media/drv-intf/renesas_ceu.h   | 28 ++++++++++++++++++++++++++++
>  include/media/drv-intf/sh_mobile_ceu.h | 28 ----------------------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
>  create mode 100644 include/media/drv-intf/renesas_ceu.h
>  delete mode 100644 include/media/drv-intf/sh_mobile_ceu.h
> 
> diff --git a/include/media/drv-intf/renesas_ceu.h
> b/include/media/drv-intf/renesas_ceu.h new file mode 100644
> index 0000000..291661d
> --- /dev/null
> +++ b/include/media/drv-intf/renesas_ceu.h
> @@ -0,0 +1,28 @@
> +#ifndef __ASM_RENESAS_CEU_H__
> +#define __ASM_RENESAS_CEU_H__
> +
> +#define CEU_FLAG_USE_8BIT_BUS   (1 << 0) /* use  8bit bus width */
> +#define CEU_FLAG_USE_16BIT_BUS  (1 << 1) /* use 16bit bus width */
> +#define CEU_FLAG_HSYNC_LOW      (1 << 2) /* default High if possible */
> +#define CEU_FLAG_VSYNC_LOW      (1 << 3)
> +#define CEU_FLAG_LOWER_8BIT     (1 << 4) /* default upper 8bit */
> +#define CEU_FLAG_PRIMARY_SENS	(1 << 5) /* sensor is primary */
> +
> +#define CEU_MAX_SENS		2
> +
> +struct device;
> +struct resource;
> +
> +struct ceu_async_subdev {
> +	unsigned long flags;
> +	unsigned int i2c_adapter_id;
> +	unsigned int i2c_address;
> +
> +};
> +
> +struct ceu_info {
> +	unsigned int num_subdevs;
> +	struct ceu_async_subdev subdevs[CEU_MAX_SENS];
> +};

You're renaming structures and macros that are in use, this will break 
compilation when bisecting.

> +#endif /* __ASM_RENESAS_CEU_H__ */
> diff --git a/include/media/drv-intf/sh_mobile_ceu.h
> b/include/media/drv-intf/sh_mobile_ceu.h deleted file mode 100644
> index 2f43f7d..0000000
> --- a/include/media/drv-intf/sh_mobile_ceu.h
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -#ifndef __ASM_SH_MOBILE_CEU_H__
> -#define __ASM_SH_MOBILE_CEU_H__
> -
> -#define SH_CEU_FLAG_USE_8BIT_BUS	(1 << 0) /* use  8bit bus width */
> -#define SH_CEU_FLAG_USE_16BIT_BUS	(1 << 1) /* use 16bit bus width */
> -#define SH_CEU_FLAG_HSYNC_LOW		(1 << 2) /* default High if 
possible */
> -#define SH_CEU_FLAG_VSYNC_LOW		(1 << 3) /* default High if 
possible */
> -#define SH_CEU_FLAG_LOWER_8BIT		(1 << 4) /* default upper 8bit 
*/
> -
> -struct device;
> -struct resource;
> -
> -struct sh_mobile_ceu_companion {
> -	u32		num_resources;
> -	struct resource	*resource;
> -	int		id;
> -	void		*platform_data;
> -};
> -
> -struct sh_mobile_ceu_info {
> -	unsigned long flags;
> -	int max_width;
> -	int max_height;
> -	struct v4l2_async_subdev **asd;	/* Flat array, arranged in groups */
> -	unsigned int *asd_sizes;	/* 0-terminated array pf asd group 
sizes */
> -};
> -
> -#endif /* __ASM_SH_MOBILE_CEU_H__ */

-- 
Regards,

Laurent Pinchart
