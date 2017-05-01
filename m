Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:57378 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752814AbdEAOiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 May 2017 10:38:01 -0400
Date: Mon, 1 May 2017 16:37:54 +0200
From: jmondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Message-ID: <20170501143736.GA5814@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
 <1493282548-27673-2-git-send-email-jacopo@jmondi.org>
 <2468637.9LR39KYxFA@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2468637.9LR39KYxFA@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,
   thanks for the extensive review

On Thu, Apr 27, 2017 at 02:47:14PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> This is a partial review, as some of the comments will result in large changes
> that would make review of some of the current code pointless. There is however
> enough comments to keep you busy for a bit :-)
>

Indeed

> By the way, you might want to keep your development history in a private git
> branch, in order to bisect issues when you'll finally be able to test the
> driver on real hardware. Otherwise we'll end up at v7, the driver won't work,
> and you will have no idea why.
>

As many of your comments are on existing code that I blindly took from
the existing driver, I decided to start fresh with a new driver from
scratch.
Next patches I will send will be based on your comments on this
series, and I take the opportunity to ask some questions on some
parts of code that were already in the driver and I'm failing to fully
understand.

To speed things up, I'm going to reply/make questions on code as I'm
rewriting it, so let's start from the bottom of the driver.

> On Thursday 27 Apr 2017 10:42:27 Jacopo Mondi wrote:
> > Add driver for SH Mobile CEU driver, based on
> > drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
> >
> > The original driver was based on soc-camera framework.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/platform/Kconfig         |    9 +
> >  drivers/media/platform/Makefile        |    2 +
> >  drivers/media/platform/sh_ceu_camera.c | 1597 +++++++++++++++++++++++++++++
> >  3 files changed, 1608 insertions(+)
> >  create mode 100644 drivers/media/platform/sh_ceu_camera.c
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index c9106e1..afb10fd 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -114,6 +114,15 @@ config VIDEO_S3C_CAMIF
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called s3c-camif.
> >
> > +config VIDEO_SH_MOBILE_CEU
> > +	tristate "SuperH Mobile CEU Interface driver"
>
> Maybe this should be renamed to include the RZ family ?
>

I have renamed config symbol in RENESAS_CEU and transformed all
instances of "sh_ceu" in driver's code in "ceu_camera" or just "ceu"
when appropriate (eg. "ceu_device" or "ceu_buffer")

> > +	depends on VIDEO_DEV && VIDEO_V4L2 && HAS_DMA && HAVE_CLK
>
> You don't use the clock API directly, I think you can drop HAVE_CLK.
>
> > +	depends on ARCH_SHMOBILE || COMPILE_TEST
> > +	depends on HAS_DMA
>
> This is already included above.
>
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	---help---
> > +	  This is a v4l2 driver for the SuperH Mobile CEU Interface
> > +
> >  source "drivers/media/platform/soc_camera/Kconfig"
> >  source "drivers/media/platform/exynos4-is/Kconfig"
> >  source "drivers/media/platform/am437x/Kconfig"
> > diff --git a/drivers/media/platform/Makefile
> > b/drivers/media/platform/Makefile index 349ddf6..a2b9aa6 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -25,6 +25,8 @@ obj-$(CONFIG_VIDEO_CODA) 		+= coda/
> >
> >  obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o
> >
> > +obj-$(CONFIG_VIDEO_SH_MOBILE_CEU)		+= sh_ceu_camera.o
> > +

This will be renamed in "ceu_camera.c" as well

> >  obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
> >
> >  obj-$(CONFIG_VIDEO_S3C_CAMIF) 		+= s3c-camif/
> > diff --git a/drivers/media/platform/sh_ceu_camera.c
> > b/drivers/media/platform/sh_ceu_camera.c new file mode 100644
> > index 0000000..07fe0e7
> > --- /dev/null
> > +++ b/drivers/media/platform/sh_ceu_camera.c
> > @@ -0,0 +1,1597 @@
> > +/*
> > + * V4L2 Driver for SuperH Mobile CEU interface
> > + *
> > + * Copyright (C) 2017 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + *
> > + * Based on soc-camera driver "soc_camera/sh_mobile_ceu_camera.c"
> > + *
> > + * Copyright (C) 2008 Magnus Damm
> > + *
> > + * Based on V4L2 Driver for PXA camera host - "pxa_camera.c",
> > + *
> > + * Copyright (C) 2006, Sascha Hauer, Pengutronix
> > + * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mm.h>
> > +#include <linux/of.h>
> > +#include <linux/time.h>
> > +#include <linux/slab.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/pm_runtime.h>
>
> Please sort headers alphabetically, it makes locating duplicated easier.
>

yup

> > +
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-image-sizes.h>
> > +#include <media/drv-intf/sh_mobile_ceu.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/* register offsets for sh7722 / sh7723 */
> > +
> > +#define CAPSR  0x00 /* Capture start register */
> > +#define CAPCR  0x04 /* Capture control register */
> > +#define CAMCR  0x08 /* Capture interface control register */
> > +#define CMCYR  0x0c /* Capture interface cycle  register */
> > +#define CAMOR  0x10 /* Capture interface offset register */
> > +#define CAPWR  0x14 /* Capture interface width register */
> > +#define CAIFR  0x18 /* Capture interface input format register */
> > +#define CSTCR  0x20 /* Camera strobe control register (<= sh7722) */
> > +#define CSECR  0x24 /* Camera strobe emission count register (<= sh7722) */
> > +#define CRCNTR 0x28 /* CEU register control register */
> > +#define CRCMPR 0x2c /* CEU register forcible control register */
> > +#define CFLCR  0x30 /* Capture filter control register */
> > +#define CFSZR  0x34 /* Capture filter size clip register */
> > +#define CDWDR  0x38 /* Capture destination width register */
> > +#define CDAYR  0x3c /* Capture data address Y register */
> > +#define CDACR  0x40 /* Capture data address C register */
> > +#define CDBYR  0x44 /* Capture data bottom-field address Y register */
> > +#define CDBCR  0x48 /* Capture data bottom-field address C register */
> > +#define CBDSR  0x4c /* Capture bundle destination size register */
> > +#define CFWCR  0x5c /* Firewall operation control register */
> > +#define CLFCR  0x60 /* Capture low-pass filter control register */
> > +#define CDOCR  0x64 /* Capture data output control register */
> > +#define CDDCR  0x68 /* Capture data complexity level register */
> > +#define CDDAR  0x6c /* Capture data complexity level address register */
> > +#define CEIER  0x70 /* Capture event interrupt enable register */
> > +#define CETCR  0x74 /* Capture event flag clear register */
> > +#define CSTSR  0x7c /* Capture status register */
> > +#define CSRTR  0x80 /* Capture software reset register */
> > +#define CDSSR  0x84 /* Capture data size register */
> > +#define CDAYR2 0x90 /* Capture data address Y register 2 */
> > +#define CDACR2 0x94 /* Capture data address C register 2 */
> > +#define CDBYR2 0x98 /* Capture data bottom-field address Y register 2 */
> > +#define CDBCR2 0x9c /* Capture data bottom-field address C register 2 */
> > +
> > +#define CEU_BUS_FLAGS (V4L2_MBUS_MASTER		     |  \
> > +			V4L2_MBUS_PCLK_SAMPLE_RISING |	\
> > +			V4L2_MBUS_HSYNC_ACTIVE_HIGH  |	\
> > +			V4L2_MBUS_HSYNC_ACTIVE_LOW   |	\
> > +			V4L2_MBUS_VSYNC_ACTIVE_HIGH  |	\
> > +			V4L2_MBUS_VSYNC_ACTIVE_LOW   |	\
> > +			V4L2_MBUS_DATA_ACTIVE_HIGH)
> > +
> > +/* per video frame buffer */
> > +struct sh_ceu_buffer {
> > +	struct vb2_v4l2_buffer vb; /* v4l buffer must be first */
>
> s/v4l buffer/vb2 buffer/
>
> > +	struct list_head queue;
> > +};
> > +
> > +struct sh_ceu_fmt;
>
> You can reorder the definitions instead of using forward-declarations.
>

That makes format appear before ceu_device (was sh_ceu_dev), but yes not a big
deal..

> > +struct sh_ceu_dev {
> > +	struct video_device vdev;
> > +	struct v4l2_device  v4l2_dev;
> > +
> > +	struct v4l2_subdev *sensor;
> > +
> > +	struct v4l2_async_notifier notifier;
> > +
> > +	struct v4l2_async_subdev asd;
> > +	struct v4l2_async_subdev *asds[1];
> > +
> > +	struct vb2_queue vb2_vq;
> > +
> > +	struct mutex mlock;
>
> You need to document what this lock protects.
>
> > +
> > +	unsigned int irq;
> > +	void __iomem *base;
> > +	size_t video_limit;
> > +	size_t buf_total;
> > +
> > +	spinlock_t lock;		/* Protects video buffer lists */
>
> Please list which field(s) the lock protects explicitly.
>
> > +	struct list_head capture;
> > +	struct vb2_v4l2_buffer *active;
> > +
> > +	enum v4l2_field field;
> > +	struct v4l2_format v4l2_fmt;
>
> v4l2_format is quite a big structure, and you don't need most of it. I would
> store v4l2_pix_format only.
>
> > +	unsigned int n_active_fmts;
> > +	struct sh_ceu_fmt **active_fmts;
> > +	struct sh_ceu_fmt *current_fmt;
>
> These two should be const.
>

Why both of them? I understand the list of active formats is built
during driver initilization, but the "current_fmt" is set during
"set_fmt" and can change at run time, right?

> > +
> > +	struct sh_ceu_info *pdata;
> > +	struct completion complete;
> > +
> > +	u32 cflcr;
> > +
> > +	/* static max sizes either from platform data or default */
> > +	int max_width;
> > +	int max_height;
>
> No platform sets non-default max_width or max_height values, just replace them
> with #define's.
>

yup

> > +
> > +	int sequence;
> > +	unsigned long flags;
> > +
> > +	unsigned int image_mode:1;
> > +	unsigned int is_16bit:1;
> > +	unsigned int frozen:1;
> > +};
> > +
> > +static struct sh_ceu_dev *v4l2_dev_to_ceu_dev(struct v4l2_device *v4l2_dev)
> > +{
> > +	return container_of(v4l2_dev, struct sh_ceu_dev, v4l2_dev);
> > +}
> > +
> > +static struct sh_ceu_buffer *to_ceu_vb(struct vb2_v4l2_buffer *vbuf)
> > +{
> > +	return container_of(vbuf, struct sh_ceu_buffer, vb);
> > +}
> > +
> > +/* ------------------------------------------------------------------------
> > + * SH CEU formats
> > + */
> > +
> > +/**
> > + * sh_ceu_fmt - describe a format associating mbus code with format
> > + *		memory layout description
> > + *
> > + * @mbus_code: bus format code
> > + * @name: memory layout format name
> > + * @fourcc: memory layout fourcc format code
> > + * @bpp: bit for each pixel stored in memory
> > + * @bits_per_sample: bit sent over bus for each sample
> > + * @active: format supported by CEU and subdevice
> > + */
> > +struct sh_ceu_fmt {
> > +	u32			mbus_code;
> > +	const char		*name;
> > +	u32			fourcc;
> > +	u8			bpp;
> > +	u8			bits_per_sample;
> > +	u8			active;
> > +} sh_ceu_fmts[] = {
>
> This should be const, which will require removing the active field from the
> structure.
>

I will see if I need to wrap this in another struct with an active
flag, or I can just add them to the list of active_fmts and drop
active completely

> > +	/* yuv422 8 bit -> NV16 (YUV422) */
> > +	{
> > +		.mbus_code		= MEDIA_BUS_FMT_YUYV8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV16,
> > +		.name			= "YUYV8_NV16",
> > +		.bpp			= 16,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_YVYU8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV16,
> > +		.name			= "YVYU8_NV16",
> > +		.bpp			= 16,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV16,
> > +		.name			= "UYVY8_NV16",
> > +		.bpp			= 16,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV16,
> > +		.name			= "VYUY8_NV16",
> > +		.bpp			= 16,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	},
> > +
> > +	/* yuv422 8 bit -> NV12 (YUV420) */
> > +	{
> > +		.mbus_code		= MEDIA_BUS_FMT_YUYV8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV12,
> > +		.name			= "YUYV8_NV12",
> > +		.bpp			= 12,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_YVYU8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV12,
> > +		.name			= "YVYU8_NV12",
> > +		.bpp			= 12,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV12,
> > +		.name			= "UYVY8_NV12",
> > +		.bpp			= 12,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	}, {
> > +		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
> > +		.fourcc			= V4L2_PIX_FMT_NV12,
> > +		.name			= "VYUY8_NV12",
> > +		.bpp			= 12,
> > +		.bits_per_sample	= 8,
> > +		.active			= 0,
> > +	},
> > +
> > +	/* TODO:
> > +		yuv422 8 bit -> NV61
> > +		yuv422 8 bit -> NV21
> > +		yuv422 16 bit -> NV16
> > +		yuv422 16 bit -> NV61
> > +		yuv422 16 bit -> NV12
> > +		yuv422 16 bit -> NV21
> > +	 */
> > +};
> > +#define N_SH_CEU_FMT	ARRAY_SIZE(sh_ceu_fmts)
> > +
> > +/**
> > + * Walk all supported formats (not only active ones) to find one matching
> > + * the provided mbus format code
> > + */
> > +static struct sh_ceu_fmt *get_ceu_fmt_from_mbus(u32 code)
> > +{
> > +	struct sh_ceu_fmt *fmt;
> > +	unsigned int i;
> > +
> > +	fmt = &sh_ceu_fmts[0];
> > +	for(i = 0; i < N_SH_CEU_FMT; i++, fmt++)
> > +		if (fmt->mbus_code == code)
> > +			return fmt;
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * Walk the active formats and get mbus_code matching fourcc
> > + */
> > +static struct sh_ceu_fmt *get_mbus_from_fourcc(struct sh_ceu_dev *pcdev,
> > +					       u32 pixfmt)
> > +{
> > +	struct sh_ceu_fmt *fmt;
> > +	unsigned int i;
> > +
> > +	fmt = pcdev->active_fmts[0];
> > +	for(i = 0; i < pcdev->n_active_fmts; i++, fmt++)
> > +		if (fmt->fourcc == pixfmt)
> > +			return fmt;
> > +
> > +	return NULL;
> > +}
> > +
> > +/*
> > ---------------------------------------------------------------------------
> > - + * SH CEU HW operations
> > + */
> > +static void ceu_write(struct sh_ceu_dev *priv,
> > +		      unsigned long reg_offs, u32 data)
>
> I don't think the offset needs to be unsigned long, an unsigned int will do.
>
> > +{
> > +	iowrite32(data, priv->base + reg_offs);
> > +}
> > +
> > +static u32 ceu_read(struct sh_ceu_dev *priv, unsigned long reg_offs)
>
> Same here.
>

Gonna re-write these and take this into account

> > +{
>
[snip]
I'm going to reply to your comments on this code parts as soon as I'll
re work them

> > +}
> > +static int sh_ceu_probe(struct platform_device *pdev)
> > +{
> > +	struct sh_ceu_dev *pcdev;
> > +	struct resource *res;
> > +	void __iomem *base;
> > +	unsigned int irq;
> > +	int err;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
> I would move this right before the devm_ioremap_resource() call.
>
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (!res || (int)irq <= 0) {
> > +		dev_err(&pdev->dev, "Not enough CEU platform resources.\n");
> > +		return -ENODEV;
> > +	}
>
> Similarly, I'd move this right before devm_request_irq().
>

Looks better, yes

> > +	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
>
> devm_kzalloc() is harmful here. You're embedding a struct video_device instead
> struct sh_ceu_dev, and the video device can outlive the platform driver
> remove() call if the device node is kept open by userspace when the device is
> removed. You should use kzalloc() and implement a .release callback for the
> video_device to kfree() the memory.
>

Just to make sure: you're referring to vdev->release callback, right?
When does the video device get "released"? is it reference counted?

> Note that devm_ioremap_resource() and devm_request_irq() are fine as the MMIO
> and interrupts must not be used after the remove() function returns.
>
> > +	if (!pcdev) {
> > +		dev_err(&pdev->dev, "Could not allocate pcdev\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	mutex_init(&pcdev->mlock);
> > +	INIT_LIST_HEAD(&pcdev->capture);
> > +	spin_lock_init(&pcdev->lock);
> > +	init_completion(&pcdev->complete);
> > +
> > +	pcdev->pdata = pdev->dev.platform_data;
> > +	if (pdev->dev.of_node && !pcdev->pdata) {
>
> If there's an OF node there's no platform data, you can this code this as
>
> 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
> 		...
> 	} else if (pcdev->pdata) {
> 		...
> 	} else {
> 		...
> 	}
>
> The IS_ENABLED(CONFIG_OF) will make sure the code is not compiled in for non-
> OF platforms.
>
> > +		/* TODO: implement OF parsing */
> > +	} else if (pcdev->pdata && !pdev->dev.of_node) {
> > +		/* TODO: implement per-device bus flags */
>
> Is this needed ? I don't expect any new feature to be implemented for non-OF
> platforms.
>
> > +		pcdev->max_width = pcdev->pdata->max_width;
> > +		pcdev->max_height = pcdev->pdata->max_height;
> > +		pcdev->flags = pcdev->pdata->flags;
> > +		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
> > +		pcdev->asd.match.i2c.adapter_id =
> > +			pcdev->pdata->sensor_i2c_adapter_id;
> > +		pcdev->asd.match.i2c.address = pcdev->pdata-
> >sensor_i2c_address;
> > +	} else {
> > +		dev_err(&pdev->dev, "CEU platform data not set.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pcdev->field = V4L2_FIELD_NONE;
> > +
> > +	if (!pcdev->max_width)
> > +		pcdev->max_width = 2560;
> > +	if (!pcdev->max_height)
> > +		pcdev->max_height = 1920;
> > +
> > +	base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	pcdev->irq = irq;
> > +	pcdev->base = base;
> > +	pcdev->video_limit = 0; /* only enabled if second resource exists */
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	if (res) {
> > +		err = dma_declare_coherent_memory(&pdev->dev, res->start,
> > +						  res->start,
> > +						  resource_size(res),
> > +						  DMA_MEMORY_MAP |
> > +						  DMA_MEMORY_EXCLUSIVE);
> > +		if (!err) {
> > +			dev_err(&pdev->dev, "Unable to declare CEU memory.
> \n");
> > +			return -ENXIO;
> > +		}

I'm not sure I got this piece of code.
Seems like the second MEM resource is optional, but if it is not provided
then in "sh_ceu_videobuf_setup" the driver does not set the "count"
number of buffers..

If the second resource is not provided, where is DMA-able memory
reserved? Also, I have found this is the only driver using
"dma_declare_coherent_memory" in whole drivers/media/platform
directory. Why we cannot use dma_alloc_coherent? (my understanding is
also that a call to that function should be made after a coherent dma
area has been declared but I haven't found it.. maybe it's just me
failing to understand DMA-API)
EDIT: see below comments, probably you can ignore this questions...

> > +
> > +		pcdev->video_limit = resource_size(res);
>
> You can get rid of this, we now have CMA that can be used unconditionally to
> allocate physically contiguous memory. Don't forget to remove the
> corresponding resource from SH board code that instantiate CEU devices.
>

I guess this comment applies not only to this last line but to the
whole block I've previously commented. If so, ignore my previous
questions...

> > +	}
> > +
> > +	/* request irq */
>
> I'm not sure the comment is really valuable :-)
>
> > +	err = devm_request_irq(&pdev->dev, pcdev->irq, sh_ceu_irq,
> > +			       0, dev_name(&pdev->dev), pcdev);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Unable to register CEU interrupt.\n");
> > +		goto exit_release_mem;
> > +	}
> > +
> > +	pm_suspend_ignore_children(&pdev->dev, true);
> > +	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_resume(&pdev->dev);
> > +
> > +	dev_set_drvdata(&pdev->dev, pcdev);
> > +	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> > +	if (err)
> > +		goto exit_free_clk;
> > +
> > +	pcdev->asds[0] = &pcdev->asd;
> > +	pcdev->notifier.v4l2_dev = &pcdev->v4l2_dev;
> > +	pcdev->notifier.subdevs = pcdev->asds;
> > +	pcdev->notifier.num_subdevs = 1;
> > +	pcdev->notifier.bound = sh_ceu_sensor_bound;
> > +	pcdev->notifier.unbind = sh_ceu_sensor_unbind;
> > +
> > +	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev-
> >notifier);
> > +	if (err)
> > +		goto exit_free_clk;
> > +
> > +	return 0;
> > +
> > +exit_free_clk:
>
> I'd call the label error_pm_runtime, as it's not specific to clocks anymore.
> error is always a better prefix than exit in my opinion, as exit could
> indicate early exit in a non-error case. And this being said, if you remove
> the second MEM resource, you can drop the exit_release_mem() label, so this
> one could just be called error.
>

I guess this confirms me I should move to use dma_alloc_coherent() and
related APIs

> > +	pm_runtime_disable(&pdev->dev);
> > +exit_release_mem:
> > +	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
> > +		dma_release_declared_memory(&pdev->dev);
> > +	return err;
> > +}
> > +
> > +static int sh_ceu_remove(struct platform_device *pdev)
> > +{
> > +
> > +	/* TODO */
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
> > +		dma_release_declared_memory(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_runtime_nop(struct device *dev)
> > +{
> > +	/* Runtime PM callback shared between ->runtime_suspend()
> > +	 * and ->runtime_resume(). Simply returns success.
> > +	 *
> > +	 * This driver re-initializes all registers after
> > +	 * pm_runtime_get_sync() anyway so there is no need
> > +	 * to save and restore registers here.
> > +	 */
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops sh_ceu_dev_pm_ops = {
> > +	.runtime_suspend = sh_ceu_runtime_nop,
> > +	.runtime_resume = sh_ceu_runtime_nop,
>
> You can use the SET_RUNTIME_PM_OPS() macro here.
>
> > +};
> > +
> > +static const struct of_device_id sh_ceu_of_match[] = {
> > +	{ .compatible = "renesas,sh-mobile-ceu" },
>
> You need to document DT bindings to add a compatible string, and I expect some
> bikeshed about the compatible string :-)
>

looking forward to that :)

> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sh_ceu_of_match);
> > +
> > +static struct platform_driver sh_ceu_driver = {
> > +	.driver		= {
> > +		.name	= "sh_mobile_ceu",
> > +		.pm	= &sh_ceu_dev_pm_ops,
> > +		.of_match_table = sh_ceu_of_match,
>
> You should use the of_match_ptr() macro here and protect the OF module device
> table with #if CONFIG_OF to allow driver compilation on SH without OF support.
>
> > +	},
> > +	.probe		= sh_ceu_probe,
> > +	.remove		= sh_ceu_remove,
> > +};
> > +
> > +static int __init sh_ceu_init(void)
> > +{
> > +	return platform_driver_register(&sh_ceu_driver);
> > +}
> > +
> > +static void __exit sh_ceu_exit(void)
> > +{
> > +	platform_driver_unregister(&sh_ceu_driver);
> > +}
> > +
> > +module_init(sh_ceu_init);
> > +module_exit(sh_ceu_exit);
>
> module_platform_driver(sh_ceu_unit);
>
> is a nice shortcut for this.
>
> > +
> > +MODULE_DESCRIPTION("SuperH Mobile CEU driver");
>
> Maybe "Renesas CEU Driver" to include the RZ family ?

Yes, I have changed this all over the driver.

Thanks
  j

>
> > +MODULE_AUTHOR("Magnus Damm");
>
> As this is a rewrite, you can list yourself as the author, Magnus is already
> credited at the top of the file.
>
> > +MODULE_LICENSE("GPL");
> > +MODULE_VERSION("0.1.0");
>
> I would drop the version, it's quite pointless as there's 99.9999% of chances
> that it will always stay at 0.1.0 :-)
>
> > +MODULE_ALIAS("platform:sh_mobile_ceu");
>
> --
> Regards,
>
> Laurent Pinchart
>
