Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51001 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdD0InD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 04:43:03 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Date: Thu, 27 Apr 2017 10:42:27 +0200
Message-Id: <1493282548-27673-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add driver for SH Mobile CEU driver, based on
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c

The original driver was based on soc-camera framework.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/Kconfig         |    9 +
 drivers/media/platform/Makefile        |    2 +
 drivers/media/platform/sh_ceu_camera.c | 1597 ++++++++++++++++++++++++++++++++
 3 files changed, 1608 insertions(+)
 create mode 100644 drivers/media/platform/sh_ceu_camera.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c9106e1..afb10fd 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -114,6 +114,15 @@ config VIDEO_S3C_CAMIF
 	  To compile this driver as a module, choose M here: the module
 	  will be called s3c-camif.
 
+config VIDEO_SH_MOBILE_CEU
+	tristate "SuperH Mobile CEU Interface driver"
+	depends on VIDEO_DEV && VIDEO_V4L2 && HAS_DMA && HAVE_CLK
+	depends on ARCH_SHMOBILE || COMPILE_TEST
+	depends on HAS_DMA
+	select VIDEOBUF2_DMA_CONTIG
+	---help---
+	  This is a v4l2 driver for the SuperH Mobile CEU Interface
+
 source "drivers/media/platform/soc_camera/Kconfig"
 source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/am437x/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 349ddf6..a2b9aa6 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -25,6 +25,8 @@ obj-$(CONFIG_VIDEO_CODA) 		+= coda/
 
 obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o
 
+obj-$(CONFIG_VIDEO_SH_MOBILE_CEU)		+= sh_ceu_camera.o
+
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
 
 obj-$(CONFIG_VIDEO_S3C_CAMIF) 		+= s3c-camif/
diff --git a/drivers/media/platform/sh_ceu_camera.c b/drivers/media/platform/sh_ceu_camera.c
new file mode 100644
index 0000000..07fe0e7
--- /dev/null
+++ b/drivers/media/platform/sh_ceu_camera.c
@@ -0,0 +1,1597 @@
+/*
+ * V4L2 Driver for SuperH Mobile CEU interface
+ *
+ * Copyright (C) 2017 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ *
+ * Based on soc-camera driver "soc_camera/sh_mobile_ceu_camera.c"
+ *
+ * Copyright (C) 2008 Magnus Damm
+ *
+ * Based on V4L2 Driver for PXA camera host - "pxa_camera.c",
+ *
+ * Copyright (C) 2006, Sascha Hauer, Pengutronix
+ * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/time.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/videodev2.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-image-sizes.h>
+#include <media/drv-intf/sh_mobile_ceu.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-mediabus.h>
+
+/* register offsets for sh7722 / sh7723 */
+
+#define CAPSR  0x00 /* Capture start register */
+#define CAPCR  0x04 /* Capture control register */
+#define CAMCR  0x08 /* Capture interface control register */
+#define CMCYR  0x0c /* Capture interface cycle  register */
+#define CAMOR  0x10 /* Capture interface offset register */
+#define CAPWR  0x14 /* Capture interface width register */
+#define CAIFR  0x18 /* Capture interface input format register */
+#define CSTCR  0x20 /* Camera strobe control register (<= sh7722) */
+#define CSECR  0x24 /* Camera strobe emission count register (<= sh7722) */
+#define CRCNTR 0x28 /* CEU register control register */
+#define CRCMPR 0x2c /* CEU register forcible control register */
+#define CFLCR  0x30 /* Capture filter control register */
+#define CFSZR  0x34 /* Capture filter size clip register */
+#define CDWDR  0x38 /* Capture destination width register */
+#define CDAYR  0x3c /* Capture data address Y register */
+#define CDACR  0x40 /* Capture data address C register */
+#define CDBYR  0x44 /* Capture data bottom-field address Y register */
+#define CDBCR  0x48 /* Capture data bottom-field address C register */
+#define CBDSR  0x4c /* Capture bundle destination size register */
+#define CFWCR  0x5c /* Firewall operation control register */
+#define CLFCR  0x60 /* Capture low-pass filter control register */
+#define CDOCR  0x64 /* Capture data output control register */
+#define CDDCR  0x68 /* Capture data complexity level register */
+#define CDDAR  0x6c /* Capture data complexity level address register */
+#define CEIER  0x70 /* Capture event interrupt enable register */
+#define CETCR  0x74 /* Capture event flag clear register */
+#define CSTSR  0x7c /* Capture status register */
+#define CSRTR  0x80 /* Capture software reset register */
+#define CDSSR  0x84 /* Capture data size register */
+#define CDAYR2 0x90 /* Capture data address Y register 2 */
+#define CDACR2 0x94 /* Capture data address C register 2 */
+#define CDBYR2 0x98 /* Capture data bottom-field address Y register 2 */
+#define CDBCR2 0x9c /* Capture data bottom-field address C register 2 */
+
+#define CEU_BUS_FLAGS (V4L2_MBUS_MASTER		     |  \
+			V4L2_MBUS_PCLK_SAMPLE_RISING |	\
+			V4L2_MBUS_HSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_HSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_VSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_VSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_DATA_ACTIVE_HIGH)
+
+/* per video frame buffer */
+struct sh_ceu_buffer {
+	struct vb2_v4l2_buffer vb; /* v4l buffer must be first */
+	struct list_head queue;
+};
+
+struct sh_ceu_fmt;
+
+struct sh_ceu_dev {
+	struct video_device vdev;
+	struct v4l2_device  v4l2_dev;
+
+	struct v4l2_subdev *sensor;
+
+	struct v4l2_async_notifier notifier;
+
+	struct v4l2_async_subdev asd;
+	struct v4l2_async_subdev *asds[1];
+
+	struct vb2_queue vb2_vq;
+
+	struct mutex mlock;
+
+	unsigned int irq;
+	void __iomem *base;
+	size_t video_limit;
+	size_t buf_total;
+
+	spinlock_t lock;		/* Protects video buffer lists */
+	struct list_head capture;
+	struct vb2_v4l2_buffer *active;
+
+	enum v4l2_field field;
+	struct v4l2_format v4l2_fmt;
+	unsigned int n_active_fmts;
+	struct sh_ceu_fmt **active_fmts;
+	struct sh_ceu_fmt *current_fmt;
+
+	struct sh_ceu_info *pdata;
+	struct completion complete;
+
+	u32 cflcr;
+
+	/* static max sizes either from platform data or default */
+	int max_width;
+	int max_height;
+
+	int sequence;
+	unsigned long flags;
+
+	unsigned int image_mode:1;
+	unsigned int is_16bit:1;
+	unsigned int frozen:1;
+};
+
+static struct sh_ceu_dev *v4l2_dev_to_ceu_dev(struct v4l2_device *v4l2_dev)
+{
+	return container_of(v4l2_dev, struct sh_ceu_dev, v4l2_dev);
+}
+
+static struct sh_ceu_buffer *to_ceu_vb(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct sh_ceu_buffer, vb);
+}
+
+/* ----------------------------------------------------------------------------
+ * SH CEU formats
+ */
+
+/**
+ * sh_ceu_fmt - describe a format associating mbus code with format
+ *		memory layout description
+ *
+ * @mbus_code: bus format code
+ * @name: memory layout format name
+ * @fourcc: memory layout fourcc format code
+ * @bpp: bit for each pixel stored in memory
+ * @bits_per_sample: bit sent over bus for each sample
+ * @active: format supported by CEU and subdevice
+ */
+struct sh_ceu_fmt {
+	u32			mbus_code;
+	const char		*name;
+	u32			fourcc;
+	u8			bpp;
+	u8			bits_per_sample;
+	u8			active;
+} sh_ceu_fmts[] = {
+	/* yuv422 8 bit -> NV16 (YUV422) */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV16,
+		.name			= "YUYV8_NV16",
+		.bpp			= 16,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV16,
+		.name			= "YVYU8_NV16",
+		.bpp			= 16,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV16,
+		.name			= "UYVY8_NV16",
+		.bpp			= 16,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV16,
+		.name			= "VYUY8_NV16",
+		.bpp			= 16,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	},
+
+	/* yuv422 8 bit -> NV12 (YUV420) */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV12,
+		.name			= "YUYV8_NV12",
+		.bpp			= 12,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV12,
+		.name			= "YVYU8_NV12",
+		.bpp			= 12,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV12,
+		.name			= "UYVY8_NV12",
+		.bpp			= 12,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	}, {
+		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.fourcc			= V4L2_PIX_FMT_NV12,
+		.name			= "VYUY8_NV12",
+		.bpp			= 12,
+		.bits_per_sample	= 8,
+		.active			= 0,
+	},
+
+	/* TODO:
+		yuv422 8 bit -> NV61
+		yuv422 8 bit -> NV21
+		yuv422 16 bit -> NV16
+		yuv422 16 bit -> NV61
+		yuv422 16 bit -> NV12
+		yuv422 16 bit -> NV21
+	 */
+};
+#define N_SH_CEU_FMT	ARRAY_SIZE(sh_ceu_fmts)
+
+/**
+ * Walk all supported formats (not only active ones) to find one matching
+ * the provided mbus format code
+ */
+static struct sh_ceu_fmt *get_ceu_fmt_from_mbus(u32 code)
+{
+	struct sh_ceu_fmt *fmt;
+	unsigned int i;
+
+	fmt = &sh_ceu_fmts[0];
+	for(i = 0; i < N_SH_CEU_FMT; i++, fmt++)
+		if (fmt->mbus_code == code)
+			return fmt;
+
+	return NULL;
+}
+
+/**
+ * Walk the active formats and get mbus_code matching fourcc
+ */
+static struct sh_ceu_fmt *get_mbus_from_fourcc(struct sh_ceu_dev *pcdev,
+					       u32 pixfmt)
+{
+	struct sh_ceu_fmt *fmt;
+	unsigned int i;
+
+	fmt = pcdev->active_fmts[0];
+	for(i = 0; i < pcdev->n_active_fmts; i++, fmt++)
+		if (fmt->fourcc == pixfmt)
+			return fmt;
+
+	return NULL;
+}
+
+/* ----------------------------------------------------------------------------
+ * SH CEU HW operations
+ */
+static void ceu_write(struct sh_ceu_dev *priv,
+		      unsigned long reg_offs, u32 data)
+{
+	iowrite32(data, priv->base + reg_offs);
+}
+
+static u32 ceu_read(struct sh_ceu_dev *priv, unsigned long reg_offs)
+{
+	return ioread32(priv->base + reg_offs);
+}
+
+static int sh_ceu_soft_reset(struct sh_ceu_dev *pcdev)
+{
+	int i, success = 0;
+
+	ceu_write(pcdev, CAPSR, 1 << 16); /* reset */
+
+	/* wait CSTSR.CPTON bit */
+	for (i = 0; i < 1000; i++) {
+		if (!(ceu_read(pcdev, CSTSR) & 1)) {
+			success++;
+			break;
+		}
+		udelay(1);
+	}
+
+	/* wait CAPSR.CPKIL bit */
+	for (i = 0; i < 1000; i++) {
+		if (!(ceu_read(pcdev, CAPSR) & (1 << 16))) {
+			success++;
+			break;
+		}
+		udelay(1);
+	}
+
+	if (2 != success) {
+		dev_warn(&pcdev->vdev.dev, "soft reset time out\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+#define CEU_CETCR_MAGIC 0x0317f313 /* acknowledge magical interrupt sources */
+#define CEU_CETCR_IGRW (1 << 4) /* prohibited register access interrupt bit */
+#define CEU_CEIER_CPEIE (1 << 0) /* one-frame capture end interrupt */
+#define CEU_CEIER_VBP   (1 << 20) /* vbp error */
+#define CEU_CAPCR_CTNCP (1 << 16) /* continuous capture mode (if set) */
+#define CEU_CEIER_MASK (CEU_CEIER_CPEIE | CEU_CEIER_VBP)
+
+/*
+ * return value doesn't reflect the success/failure to queue the new buffer,
+ * but rather the status of the previous buffer.
+ */
+static int sh_ceu_capture(struct sh_ceu_dev *pcdev)
+{
+	struct v4l2_pix_format *pix = &pcdev->v4l2_fmt.fmt.pix;
+	dma_addr_t phys_addr_top, phys_addr_bottom;
+	unsigned long bottom1, bottom2;
+	unsigned long top1, top2;
+	bool planar;
+	u32 status;
+	int ret = 0;
+
+	/*
+	 * The hardware is _very_ picky about this sequence. Especially
+	 * the CEU_CETCR_MAGIC value. It seems like we need to acknowledge
+	 * several not-so-well documented interrupt sources in CETCR.
+	 */
+	ceu_write(pcdev, CEIER, ceu_read(pcdev, CEIER) & ~CEU_CEIER_MASK);
+	status = ceu_read(pcdev, CETCR);
+	ceu_write(pcdev, CETCR, ~status & CEU_CETCR_MAGIC);
+	if (!pcdev->frozen)
+		ceu_write(pcdev, CEIER, ceu_read(pcdev, CEIER) | CEU_CEIER_MASK);
+	ceu_write(pcdev, CAPCR, ceu_read(pcdev, CAPCR) & ~CEU_CAPCR_CTNCP);
+	ceu_write(pcdev, CETCR, CEU_CETCR_MAGIC ^ CEU_CETCR_IGRW);
+
+	/*
+	 * When a VBP interrupt occurs, a capture end interrupt does not occur
+	 * and the image of that frame is not captured correctly. So, soft reset
+	 * is needed here.
+	 */
+	if (status & CEU_CEIER_VBP) {
+		sh_ceu_soft_reset(pcdev);
+		ret = -EIO;
+	}
+
+	/* FIXME: is this still required? */
+	if (pcdev->frozen) {
+		complete(&pcdev->complete);
+		return ret;
+	}
+
+	if (!pcdev->active)
+		return ret;
+
+	if (V4L2_FIELD_INTERLACED_BT == pcdev->field) {
+		top1	= CDBYR;
+		top2	= CDBCR;
+		bottom1	= CDAYR;
+		bottom2	= CDACR;
+	} else {
+		top1	= CDAYR;
+		top2	= CDACR;
+		bottom1	= CDBYR;
+		bottom2	= CDBCR;
+	}
+
+	phys_addr_top = vb2_dma_contig_plane_dma_addr(&pcdev->active->vb2_buf,
+						      0);
+
+	switch (pcdev->current_fmt->fourcc) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		planar = true;
+		break;
+	default:
+		planar = false;
+	}
+
+	ceu_write(pcdev, top1, phys_addr_top);
+	if (V4L2_FIELD_NONE != pcdev->field) {
+		phys_addr_bottom = phys_addr_top + pix->bytesperline;
+		ceu_write(pcdev, bottom1, phys_addr_bottom);
+	}
+
+	if (planar) {
+		phys_addr_top += pix->bytesperline * pix->height;
+		ceu_write(pcdev, top2, phys_addr_top);
+		if (V4L2_FIELD_NONE != pcdev->field) {
+			phys_addr_bottom = phys_addr_top +
+					   pix->bytesperline;
+			ceu_write(pcdev, bottom2, phys_addr_bottom);
+		}
+	}
+
+	ceu_write(pcdev, CAPSR, 0x1); /* start capture */
+
+	return ret;
+}
+
+static irqreturn_t sh_ceu_irq(int irq, void *data)
+{
+	struct sh_ceu_dev *pcdev = data;
+	struct vb2_v4l2_buffer *vbuf;
+	int ret;
+
+	spin_lock(&pcdev->lock);
+
+	vbuf = pcdev->active;
+	if (!vbuf)
+		/* Stale interrupt from a released buffer */
+		goto out;
+
+	list_del_init(&to_ceu_vb(vbuf)->queue);
+
+	if (!list_empty(&pcdev->capture))
+		pcdev->active = &list_entry(pcdev->capture.next,
+					    struct sh_ceu_buffer, queue)->vb;
+	else
+		pcdev->active = NULL;
+
+	ret = sh_ceu_capture(pcdev);
+	vbuf->vb2_buf.timestamp = ktime_get_ns();
+	if (!ret) {
+		vbuf->field = pcdev->field;
+		vbuf->sequence = pcdev->sequence++;
+	}
+	vb2_buffer_done(&vbuf->vb2_buf,
+			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+
+out:
+	spin_unlock(&pcdev->lock);
+
+	return IRQ_HANDLED;
+}
+
+/* Called with mlock held */
+static int sh_ceu_clock_start(struct sh_ceu_dev *pcdev)
+{
+
+	pm_runtime_get_sync(pcdev->v4l2_dev.dev);
+
+	pcdev->buf_total = 0;
+
+	sh_ceu_soft_reset(pcdev);
+
+	return 0;
+}
+
+/* Called with mlock held */
+static void sh_ceu_clock_stop(struct sh_ceu_dev *pcdev)
+{
+	/* disable capture, disable interrupts */
+	ceu_write(pcdev, CEIER, 0);
+	sh_ceu_soft_reset(pcdev);
+
+	/* make sure active buffer is canceled */
+	spin_lock_irq(&pcdev->lock);
+	if (pcdev->active) {
+		list_del_init(&to_ceu_vb(pcdev->active)->queue);
+		vb2_buffer_done(&pcdev->active->vb2_buf, VB2_BUF_STATE_ERROR);
+		pcdev->active = NULL;
+	}
+	spin_unlock_irq(&pcdev->lock);
+
+	pm_runtime_put(pcdev->v4l2_dev.dev);
+}
+
+static u32 capture_save_reset(struct sh_ceu_dev *pcdev)
+{
+	u32 capsr = ceu_read(pcdev, CAPSR);
+	ceu_write(pcdev, CAPSR, 1 << 16); /* reset, stop capture */
+	return capsr;
+}
+
+static void capture_restore(struct sh_ceu_dev *pcdev, u32 capsr)
+{
+	unsigned long timeout = jiffies + 10 * HZ;
+
+	/*
+	 * Wait until the end of the current frame. It can take a long time,
+	 * but if it has been aborted by a CAPSR reset, it shoule exit sooner.
+	 */
+	while ((ceu_read(pcdev, CSTSR) & 1) && time_before(jiffies, timeout))
+		msleep(1);
+
+	if (time_after(jiffies, timeout)) {
+		dev_err(&pcdev->vdev.dev,
+			"Timeout waiting for frame end! Interface problem?\n");
+		return;
+	}
+
+	/* Wait until reset clears, this shall not hang... */
+	while (ceu_read(pcdev, CAPSR) & (1 << 16))
+		udelay(10);
+
+	/* Anything to restore? */
+	if (capsr & ~(1 << 16))
+		ceu_write(pcdev, CAPSR, capsr);
+}
+
+/* ----------------------------------------------------------------------------
+ *  Videobuf operations
+ */
+
+/*
+ * .queue_setup() is called to check, whether the driver can accept the
+ *		  requested number of buffers and to fill in plane sizes
+ *		  for the current frame format if required
+ */
+static int sh_ceu_videobuf_setup(struct vb2_queue *vq,
+			unsigned int *count, unsigned int *num_planes,
+			unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &pcdev->v4l2_fmt.fmt.pix;
+
+	if (!vq->num_buffers)
+		pcdev->sequence = 0;
+
+	if (!*count)
+		*count = 2;
+
+	/* Called from VIDIOC_REQBUFS or in compatibility mode */
+	if (!*num_planes)
+		sizes[0] = pix->sizeimage;
+	else if (sizes[0] < pix->sizeimage)
+		return -EINVAL;
+
+	/* If *num_planes != 0, we have already verified *count. */
+	if (pcdev->video_limit) {
+		size_t size = PAGE_ALIGN(sizes[0]) * *count;
+
+		if (size + pcdev->buf_total > pcdev->video_limit)
+			*count = (pcdev->video_limit - pcdev->buf_total) /
+				PAGE_ALIGN(sizes[0]);
+	}
+
+	*num_planes = 1;
+
+	dev_dbg(&pcdev->vdev.dev, "count=%d, size=%u\n", *count, sizes[0]);
+
+	return 0;
+}
+
+static int sh_ceu_videobuf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);
+
+	/* Added list head initialization on alloc */
+	WARN(!list_empty(&buf->queue), "Buffer %p on queue!\n", vb);
+
+	return 0;
+}
+
+static void sh_ceu_videobuf_queue(struct vb2_buffer *vb)
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);
+	unsigned long size;
+
+	size = pcdev->v4l2_fmt.fmt.pix.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(&pcdev->vdev.dev, "Buffer #%d too small (%lu < %lu)\n",
+			vb->index, vb2_plane_size(vb, 0), size);
+		goto error;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	dev_dbg(&pcdev->vdev.dev, "%s (vb=0x%p) 0x%p %lu\n", __func__,
+		vb, vb2_plane_vaddr(vb, 0), vb2_get_plane_payload(vb, 0));
+
+#ifdef DEBUG
+	/*
+	 * This can be useful if you want to see if we actually fill
+	 * the buffer with something
+	 */
+	if (vb2_plane_vaddr(vb, 0))
+		memset(vb2_plane_vaddr(vb, 0), 0xaa, vb2_get_plane_payload(vb, 0));
+#endif
+
+	spin_lock_irq(&pcdev->lock);
+	list_add_tail(&buf->queue, &pcdev->capture);
+	spin_unlock_irq(&pcdev->lock);
+
+	return;
+
+error:
+	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+}
+
+static void sh_ceu_videobuf_release(struct vb2_buffer *vb)
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);
+
+	spin_lock_irq(&pcdev->lock);
+
+	if (pcdev->active == vbuf) {
+		/* disable capture (release DMA buffer), reset */
+		ceu_write(pcdev, CAPSR, 1 << 16);
+		pcdev->active = NULL;
+	}
+
+	/*
+	 * Doesn't hurt also if the list is empty, but it hurts, if queuing the
+	 * buffer failed, and .buf_init() hasn't been called
+	 */
+	if (buf->queue.next)
+		list_del_init(&buf->queue);
+
+	pcdev->buf_total -= PAGE_ALIGN(vb2_plane_size(vb, 0));
+	dev_dbg(&pcdev->vdev.dev, "%s() %zu bytes buffers\n", __func__,
+		pcdev->buf_total);
+
+	spin_unlock_irq(&pcdev->lock);
+}
+
+static int sh_ceu_videobuf_init(struct vb2_buffer *vb)
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);
+
+	pcdev->buf_total += PAGE_ALIGN(vb2_plane_size(vb, 0));
+	dev_dbg(&pcdev->vdev.dev, "%s() %zu bytes buffers\n", __func__,
+		pcdev->buf_total);
+
+	/* This is for locking debugging only */
+	INIT_LIST_HEAD(&buf->queue);
+	return 0;
+}
+
+static int sh_ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vq);
+	struct list_head *buf_head, *tmp;
+	struct sh_ceu_buffer *buf;
+	int ret = 0;
+
+	ret = v4l2_subdev_call(pcdev->sensor, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		v4l2_err(&pcdev->v4l2_dev, "stream on failed in subdev\n");
+		goto err_start_sensor;
+	}
+
+	spin_lock_irq(&pcdev->lock);
+	if (!pcdev->active) {
+		/*
+		 * Because there were no active buffer at this moment,
+		 * we are not interested in the return value of
+		 * sh_ceu_capture here.
+		 */
+		buf = list_first_entry(&pcdev->capture, struct sh_ceu_buffer,
+				       queue);
+		if (!buf) {
+			ret = -EINVAL;
+			goto stop_sensor;
+		}
+
+		pcdev->active = &buf->vb;
+		sh_ceu_capture(pcdev);
+	} else {
+		ret = -EINVAL;
+		goto stop_sensor;
+	}
+
+	spin_unlock_irq(&pcdev->lock);
+
+	return 0;
+
+stop_sensor:
+	spin_unlock_irq(&pcdev->lock);
+	v4l2_subdev_call(pcdev->sensor, video, s_stream, 0);
+
+err_start_sensor:
+	spin_lock_irq(&pcdev->lock);
+
+	list_for_each_safe(buf_head, tmp, &pcdev->capture)
+		list_del_init(buf_head);
+
+	pcdev->active = NULL;
+
+	spin_unlock_irq(&pcdev->lock);
+
+	return ret;
+}
+
+static void sh_ceu_stop_streaming(struct vb2_queue *vq)
+{
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vq);
+	struct list_head *buf_head, *tmp;
+
+	v4l2_subdev_call(pcdev->sensor, video, s_stream, 0);
+
+	spin_lock_irq(&pcdev->lock);
+
+	pcdev->active = NULL;
+
+	list_for_each_safe(buf_head, tmp, &pcdev->capture)
+		list_del_init(buf_head);
+
+	spin_unlock_irq(&pcdev->lock);
+
+	sh_ceu_soft_reset(pcdev);
+}
+
+static const struct vb2_ops sh_ceu_videobuf_ops = {
+	.queue_setup	= sh_ceu_videobuf_setup,
+	.buf_prepare	= sh_ceu_videobuf_prepare,
+	.buf_queue	= sh_ceu_videobuf_queue,
+	.buf_cleanup	= sh_ceu_videobuf_release,
+	.buf_init	= sh_ceu_videobuf_init,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+	.start_streaming= sh_ceu_start_streaming,
+	.stop_streaming	= sh_ceu_stop_streaming,
+};
+
+/**
+ * ----------------------------------------------------------------------------
+ *  SH CEU operations
+ */
+
+static unsigned int sh_ceu_mbus_config_compatible(
+		const struct v4l2_mbus_config *cfg,
+		unsigned int ceu_host_flags)
+{
+	unsigned int common_flags = cfg->flags & ceu_host_flags;
+	bool hsync, vsync, pclk, data, mode;
+
+	switch (cfg->type) {
+	case V4L2_MBUS_PARALLEL:
+		hsync = common_flags & (V4L2_MBUS_HSYNC_ACTIVE_HIGH |
+					V4L2_MBUS_HSYNC_ACTIVE_LOW);
+		vsync = common_flags & (V4L2_MBUS_VSYNC_ACTIVE_HIGH |
+					V4L2_MBUS_VSYNC_ACTIVE_LOW);
+		pclk = common_flags & (V4L2_MBUS_PCLK_SAMPLE_RISING |
+				       V4L2_MBUS_PCLK_SAMPLE_FALLING);
+		data = common_flags & (V4L2_MBUS_DATA_ACTIVE_HIGH |
+				       V4L2_MBUS_DATA_ACTIVE_LOW);
+		mode = common_flags & (V4L2_MBUS_MASTER | V4L2_MBUS_SLAVE);
+		break;
+	default:
+		return 0;
+	}
+
+	return (!hsync || !vsync || !pclk || !data || !mode) ? 0 : common_flags;
+}
+
+/**
+ * Test bus parameters against sensor provided ones.
+ * Return < 0 for error, 0 if g_mbus_config is not supported,
+ * flags > 0  otherwise
+ */
+static int sh_ceu_test_bus_param(struct sh_ceu_dev *pcdev)
+{
+	struct v4l2_subdev *sd = pcdev->sensor;
+	unsigned long common_flags = CEU_BUS_FLAGS;
+	struct v4l2_mbus_config cfg = {
+		.type = V4L2_MBUS_PARALLEL,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
+	if (ret < 0 && ret == -ENOIOCTLCMD)
+		return ret;
+	else if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	common_flags = sh_ceu_mbus_config_compatible(&cfg, common_flags);
+	if (!common_flags)
+		return -EINVAL;
+
+	return common_flags;
+}
+
+/*
+ * This is a very simplified version of "sh_mobile_ceu_set_rect function
+ * found in the original soc_camera driver
+ */
+static void sh_ceu_set_sizes(struct sh_ceu_dev *pcdev)
+{
+	struct v4l2_pix_format *pix = &pcdev->v4l2_fmt.fmt.pix;
+	unsigned int capwr_hwidth, capwr_vwidth;
+	unsigned int left_offset, top_offset;
+	unsigned int height, width;
+	unsigned int cdwdr_width;
+	u32 camor;
+
+	/* TODO: make these offsets configurable.
+	 * These are used to configure CAMOR, that wants to know the number of
+	 * blanks between a VS/HS signal and valid data.
+	 * This value should come from the sensor, how should we retrieve it?
+	 */
+	left_offset = 0;
+	top_offset = 0;
+
+	width = pix->width;
+	height = pix->height;
+
+	/* Configure CAPWR: lenght of horizontal/vertical capture period */
+	/* TODO:
+	 * veritcal widht depends on pcdev->field value? Is this interlaced? */
+	capwr_vwidth = height;
+	/* TODO: make sure this is correct:
+	 * horizontal width depends on macropixel size (bpp / 8);
+	 * a VGA (640x480) image in yuv422 input format has a line length of
+	 * (640 * 16 / 8) = 1280 bytes
+	 */
+	capwr_hwidth = pix->bytesperline;
+
+	/* FIXME: not sure what the original driver does here */
+	cdwdr_width = pix->bytesperline;
+
+	/* Set CAMOR, CAPWR, CFSZR, take care of CDWDR */
+	camor = left_offset | (top_offset << 16);
+	ceu_write(pcdev, CAMOR, camor);
+	ceu_write(pcdev, CAPWR, (capwr_vwidth << 16) | capwr_hwidth);
+
+	/* CFSZR clipping is applied _after_ the scaling filter (CFLCR) */
+	ceu_write(pcdev, CFSZR, (height << 16) | width);
+	ceu_write(pcdev, CDWDR, cdwdr_width);
+}
+
+/* Capture is not running, no interrupts, no locking needed */
+static int sh_ceu_set_bus_param(struct sh_ceu_dev *pcdev)
+{
+	struct v4l2_subdev *sd = pcdev->sensor;
+	unsigned long value;
+	unsigned long common_flags = CEU_BUS_FLAGS;
+	struct v4l2_mbus_config cfg = {
+		.type = V4L2_MBUS_PARALLEL,
+	};
+	u32 capsr = capture_save_reset(pcdev);
+	unsigned int yuv_lineskip;
+	int ret;
+
+	/*
+	 * TODO:
+	 * If the client doesn't implement g_mbus_config, we just use our
+	 * platform data
+	 */
+	common_flags = sh_ceu_test_bus_param(pcdev);
+	if (common_flags < 0)
+		return common_flags;
+	else if (common_flags == 0) {
+		/* TODO: use platform data */
+	}
+
+	/* Make choises, based on platform preferences */
+	if ((common_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) &&
+	    (common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)) {
+		if (pcdev->flags & SH_CEU_FLAG_HSYNC_LOW)
+			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_HIGH;
+		else
+			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_LOW;
+	}
+
+	if ((common_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) &&
+	    (common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)) {
+		if (pcdev->flags & SH_CEU_FLAG_VSYNC_LOW)
+			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_HIGH;
+		else
+			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_LOW;
+	}
+
+	cfg.flags = common_flags;
+	ret = v4l2_subdev_call(sd, video, s_mbus_config, &cfg);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	if (pcdev->current_fmt->bits_per_sample > 8)
+		pcdev->is_16bit = 1;
+	else
+		pcdev->is_16bit = 0;
+
+	ceu_write(pcdev, CRCNTR, 0);
+	ceu_write(pcdev, CRCMPR, 0);
+
+	value = 0x00000010; /* data fetch by default */
+	yuv_lineskip = 0x10;
+
+	/* FIXME:
+	 * this switch statement has been taken from the original driver but it
+	 * re-write bit value[4] to 0 forcing "image capture mode", while the
+	 * comment few lines above says "data fetch by default".
+	 * Was this intended?
+	 */
+	switch (pcdev->current_fmt->fourcc) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		/* convert 4:2:2 -> 4:2:0 */
+		yuv_lineskip = 0; /* skip for NV12/21, no skip for NV16/61 */
+		/* fall-through */
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		switch (pcdev->current_fmt->mbus_code) {
+		case MEDIA_BUS_FMT_UYVY8_2X8:
+			value = 0x00000000; /* Cb0, Y0, Cr0, Y1 */
+			break;
+		case MEDIA_BUS_FMT_VYUY8_2X8:
+			value = 0x00000100; /* Cr0, Y0, Cb0, Y1 */
+			break;
+		case MEDIA_BUS_FMT_YUYV8_2X8:
+			value = 0x00000200; /* Y0, Cb0, Y1, Cr0 */
+			break;
+		case MEDIA_BUS_FMT_YVYU8_2X8:
+			value = 0x00000300; /* Y0, Cr0, Y1, Cb0 */
+			break;
+		default:
+			BUG();
+		}
+	}
+
+	if (pcdev->current_fmt->fourcc == V4L2_PIX_FMT_NV21 ||
+	    pcdev->current_fmt->fourcc == V4L2_PIX_FMT_NV61)
+		value ^= 0x00000100; /* swap U, V to change from NV1x->NVx1 */
+
+	value |= common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW ? 1 << 1 : 0;
+	value |= common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW ? 1 << 0 : 0;
+
+	if (pcdev->is_16bit)
+		value |= 1 << 12;
+	else if (pcdev->flags & SH_CEU_FLAG_LOWER_8BIT)
+		value |= 2 << 12;
+
+	ceu_write(pcdev, CAMCR, value);
+
+	ceu_write(pcdev, CAPCR, 0x00300000);
+
+	switch (pcdev->v4l2_fmt.fmt.pix.field) {
+	case V4L2_FIELD_INTERLACED_TB:
+		value = 0x101;
+		break;
+	case V4L2_FIELD_INTERLACED_BT:
+		value = 0x102;
+		break;
+	default:
+		value = 0;
+		break;
+	}
+	ceu_write(pcdev, CAIFR, value);
+
+	sh_ceu_set_sizes(pcdev);
+
+	/* TODO: CFLCR scale down filter not supported yet */
+
+	/*
+	 * A few words about byte order (observed in Big Endian mode)
+	 *
+	 * In data fetch mode bytes are received in chunks of 8 bytes.
+	 * D0, D1, D2, D3, D4, D5, D6, D7 (D0 received first)
+	 *
+	 * The data is however by default written to memory in reverse order:
+	 * D7, D6, D5, D4, D3, D2, D1, D0 (D7 written to lowest byte)
+	 *
+	 * The lowest three bits of CDOCR allows us to do swapping,
+	 * using 7 we swap the data bytes to match the incoming order:
+	 * D0, D1, D2, D3, D4, D5, D6, D7
+	 */
+	value = 0x00000007 | yuv_lineskip;
+
+	ceu_write(pcdev, CDOCR, value);
+	ceu_write(pcdev, CFWCR, 0); /* keep "datafetch firewall" disabled */
+
+	capture_restore(pcdev, capsr);
+
+	/* not in bundle mode: skip CBDSR, CDAYR2, CDACR2, CDBYR2, CDBCR2 */
+
+	return 0;
+}
+
+/**
+ * Test format on CEU and sensor
+ *
+ * @v4l2_fmt: format to test
+ * @current_fmt: sh ceu format applied
+ */
+static int sh_ceu_try_fmt(struct sh_ceu_dev *pcdev,
+			  struct v4l2_format *v4l2_fmt,
+			  struct sh_ceu_fmt **current_fmt)
+{
+	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_format sd_format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	struct sh_ceu_fmt *mbus_fmt;
+	unsigned int width, height;
+	int ret;
+
+	dev_dbg(&pcdev->vdev.dev, "try format: 0x%x - %ux%u\n\n",
+		pix->pixelformat, pix->width, pix->height);
+
+	/* CFSZR requires height and width to be 4-pixel aligned */
+	v4l_bound_align_image(&pix->width, 2, pcdev->max_width, 2,
+			      &pix->height, 4, pcdev->max_height, 2, 0);
+
+	width = pix->width;
+	height = pix->height;
+
+	/* Set format on sensor subdevice */
+	mbus_fmt = get_mbus_from_fourcc(pcdev, pix->pixelformat);
+	if (!mbus_fmt){
+		mbus_fmt = pcdev->active_fmts[0];
+		pix->pixelformat = mbus_fmt->fourcc;
+	}
+
+	v4l2_fill_mbus_format(&sd_format.format, pix, mbus_fmt->mbus_code);
+
+	ret = v4l2_subdev_call(sensor, pad, set_fmt, &pad_cfg, &sd_format);
+	if (ret)
+		return ret;
+
+	/* TODO: scale CEU format to match what is returned by subdevice */
+
+	v4l2_fill_pix_format(pix, &sd_format.format);
+	pix->field		= V4L2_FIELD_NONE;
+	pix->bytesperline	= pix->width * mbus_fmt->bpp / 8;
+	pix->sizeimage		= pix->height * pix->bytesperline;
+
+	/* Test bus parameters */
+	ret = sh_ceu_test_bus_param(pcdev);
+	if (ret < 0)
+		return ret;
+
+	if (current_fmt)
+		*current_fmt = mbus_fmt;
+
+	return 0;
+}
+
+static int sh_ceu_set_fmt(struct sh_ceu_dev *pcdev,
+			  struct v4l2_format *v4l2_fmt)
+{
+	struct sh_ceu_fmt *current_fmt;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int ret;
+
+	ret = sh_ceu_try_fmt(pcdev, v4l2_fmt, &current_fmt);
+	if (ret)
+		return ret;
+
+	v4l2_fill_mbus_format(&format.format, &v4l2_fmt->fmt.pix,
+			      current_fmt->mbus_code);
+	ret = v4l2_subdev_call(pcdev->sensor, pad,
+			       set_fmt, NULL, &format);
+	if (ret)
+		return ret;
+
+	pcdev->v4l2_fmt = *v4l2_fmt;
+	pcdev->current_fmt = current_fmt;
+
+	ret = sh_ceu_set_bus_param(pcdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * Collect formats supported by CEU and sensor subdevice
+ */
+static int sh_ceu_init_active_formats(struct sh_ceu_dev *pcdev)
+{
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	struct sh_ceu_fmt *active_fmts;
+	unsigned int n_active_fmts;
+	struct sh_ceu_fmt *fmt;
+	unsigned int i;
+
+	struct v4l2_subdev_mbus_code_enum mbus_code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.index = 0,
+	};
+
+	/* Count how may formats are supported by CEU and sensor subdevice */
+	n_active_fmts = 0;
+	while (!v4l2_subdev_call(sensor, pad, enum_mbus_code,
+				 NULL, &mbus_code)) {
+		mbus_code.index++;
+
+		fmt = get_ceu_fmt_from_mbus(mbus_code.code);
+		if (!fmt)
+			continue;
+
+		fmt->active = 1;
+		n_active_fmts++;
+	}
+
+	if (n_active_fmts == 0)
+		return -ENXIO;
+
+	pcdev->n_active_fmts = n_active_fmts;
+	pcdev->active_fmts = devm_kcalloc(&pcdev->vdev.dev, n_active_fmts,
+					  sizeof(*pcdev->active_fmts),
+					  GFP_KERNEL);
+	if (!pcdev->active_fmts)
+		return -ENOMEM;
+
+	active_fmts = pcdev->active_fmts[0];
+	fmt = &sh_ceu_fmts[0];
+	for (i = 0; i < N_SH_CEU_FMT; i++, fmt++) {
+		if (!fmt->active)
+			continue;
+
+		active_fmts = fmt;
+		active_fmts++;
+	}
+
+	return 0;
+}
+
+static int sh_ceu_set_default_fmt(struct sh_ceu_dev *pcdev)
+{
+	int ret;
+	struct v4l2_format v4l2_fmt = {
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.fmt.pix = {
+			.width		= VGA_WIDTH,
+			.height		= VGA_HEIGHT,
+			.field		= V4L2_FIELD_NONE,
+			.pixelformat	= pcdev->active_fmts[0]->fourcc,
+		},
+	};
+
+	ret = sh_ceu_try_fmt(pcdev, &v4l2_fmt, NULL);
+	if (ret)
+		return ret;
+
+	pcdev->current_fmt = pcdev->active_fmts[0];
+	pcdev->v4l2_fmt = v4l2_fmt;
+
+	return 0;
+}
+
+/**
+ * ----------------------------------------------------------------------------
+ *  File Operations
+ */
+static int sh_ceu_open(struct file *file)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	int ret;
+
+	mutex_lock(&pcdev->mlock);
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto out;
+
+	sh_ceu_clock_start(pcdev);
+	ret = v4l2_subdev_call(sensor, core, s_power, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		v4l2_fh_release(file);
+		goto out;
+	}
+
+	ret = sh_ceu_set_fmt(pcdev, &pcdev->v4l2_fmt);
+	if (ret) {
+		v4l2_subdev_call(sensor, core, s_power, 0);
+		v4l2_fh_release(file);
+	}
+
+out:
+	mutex_unlock(&pcdev->mlock);
+	return ret;
+}
+
+static int sh_ceu_release(struct file *file)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	int ret;
+
+	mutex_lock(&pcdev->mlock);
+
+	ret = _vb2_fop_release(file, NULL);
+	v4l2_subdev_call(sensor, core, s_power, 0);
+	sh_ceu_clock_stop(pcdev);
+	v4l2_fh_release(file);
+
+	mutex_unlock(&pcdev->mlock);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations sh_ceu_fops = {
+	.owner			= THIS_MODULE,
+	.open			= sh_ceu_open,
+	.release		= sh_ceu_release,
+	.unlocked_ioctl		= video_ioctl2,
+	.read			= vb2_fop_read,
+	.mmap			= vb2_fop_mmap,
+	.poll			= vb2_fop_poll,
+};
+
+/**
+ * ----------------------------------------------------------------------------
+ *  Video Device IOCTLs
+ */
+static int sh_ceu_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	strlcpy(cap->card, "SuperH_Mobile_CEU", sizeof(cap->card));
+	strlcpy(cap->driver, "sh_mobile_ceu", sizeof(cap->driver));
+	strlcpy(cap->bus_info, "platform:sh_mobile_ceu", sizeof(cap->bus_info));
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int sh_ceu_enum_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct sh_ceu_fmt *fmt;
+
+	if (f->index >= pcdev->n_active_fmts)
+		return -EINVAL;
+
+	fmt = pcdev->active_fmts[f->index];
+	strncpy(f->description, fmt->name, strlen(fmt->name));
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int sh_ceu_try_fmt_vid_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+
+	return sh_ceu_try_fmt(pcdev, f, NULL);
+}
+
+static int sh_ceu_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+
+	if (vb2_is_streaming(&pcdev->vb2_vq))
+		return -EBUSY;
+
+	return sh_ceu_set_fmt(pcdev, f);
+}
+
+static int sh_ceu_enum_input(struct file *file, void *priv,
+			   struct v4l2_input *inp)
+{
+	if (inp->index != 0)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	inp->std = 0;
+	strcpy(inp->name, "Camera");
+
+	return 0;
+}
+
+static int sh_ceu_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+
+	return 0;
+}
+
+static int sh_ceu_s_input(struct file *file, void *priv, unsigned int i)
+{
+	if (i > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops sh_ceu_ioctl_ops = {
+	.vidioc_querycap		= sh_ceu_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= sh_ceu_enum_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= sh_ceu_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= sh_ceu_s_fmt_vid_cap,
+
+	.vidioc_enum_input		= sh_ceu_enum_input,
+	.vidioc_g_input			= sh_ceu_g_input,
+	.vidioc_s_input			= sh_ceu_s_input,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	/* TODO
+	.vidioc_g_parm			=
+	.vidioc_s_parm			=
+	.vidioc_enum_framesizes		=
+	.vidioc_enum_frameintervals	=
+	*/
+};
+
+static int sh_ceu_init_videobuf(struct sh_ceu_dev *pcdev,
+				struct vb2_queue *q)
+{
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_USERPTR;
+	q->drv_priv = pcdev;
+	q->ops = &sh_ceu_videobuf_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct sh_ceu_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &pcdev->mlock;
+	q->dev = pcdev->v4l2_dev.dev;
+
+	return vb2_queue_init(q);
+}
+
+static int sh_ceu_sensor_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_subdev *asd)
+{
+	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
+	struct sh_ceu_dev *pcdev = v4l2_dev_to_ceu_dev(v4l2_dev);
+	struct video_device *vdev = &pcdev->vdev;
+	int err;
+
+	/* Init videobuf queue operations */
+	err = sh_ceu_init_videobuf(pcdev, &pcdev->vb2_vq);
+	if (err)
+		return -EINVAL;
+
+	mutex_lock(&pcdev->mlock);
+
+	/* Initialize formats and set format on sensor */
+	pcdev->sensor = subdev;
+	err = sh_ceu_init_active_formats(pcdev);
+	if (err)
+		return err;
+
+	err = sh_ceu_set_default_fmt(pcdev);
+	if (err)
+		return err;
+
+	/* Register the video device */
+	strncpy(vdev->name, "sh_ceu", strlen("sh_ceu"));
+	vdev->minor		= -1;
+	vdev->v4l2_dev		= v4l2_dev;
+	vdev->lock		= &pcdev->mlock;
+	vdev->queue		= &pcdev->vb2_vq;
+	vdev->ctrl_handler	= subdev->ctrl_handler;
+	vdev->fops		= &sh_ceu_fops;
+	vdev->ioctl_ops		= &sh_ceu_ioctl_ops;
+	vdev->release		= video_device_release_empty;
+	vdev->device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_set_drvdata(vdev, pcdev);
+
+	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (err < 0) {
+		mutex_unlock(&pcdev->mlock);
+		v4l2_err(vdev->v4l2_dev,
+			 "video_register_device failed: %d\n", err);
+		return err;
+	}
+
+	mutex_unlock(&pcdev->mlock);
+	return 0;
+}
+
+static void sh_ceu_sensor_unbind(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *subdev,
+				 struct v4l2_async_subdev *asd)
+{
+	/* TODO */
+
+	return;
+}
+static int sh_ceu_probe(struct platform_device *pdev)
+{
+	struct sh_ceu_dev *pcdev;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int irq;
+	int err;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	irq = platform_get_irq(pdev, 0);
+	if (!res || (int)irq <= 0) {
+		dev_err(&pdev->dev, "Not enough CEU platform resources.\n");
+		return -ENODEV;
+	}
+
+	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
+	if (!pcdev) {
+		dev_err(&pdev->dev, "Could not allocate pcdev\n");
+		return -ENOMEM;
+	}
+
+	mutex_init(&pcdev->mlock);
+	INIT_LIST_HEAD(&pcdev->capture);
+	spin_lock_init(&pcdev->lock);
+	init_completion(&pcdev->complete);
+
+	pcdev->pdata = pdev->dev.platform_data;
+	if (pdev->dev.of_node && !pcdev->pdata) {
+		/* TODO: implement OF parsing */
+	} else if (pcdev->pdata && !pdev->dev.of_node) {
+		/* TODO: implement per-device bus flags */
+		pcdev->max_width = pcdev->pdata->max_width;
+		pcdev->max_height = pcdev->pdata->max_height;
+		pcdev->flags = pcdev->pdata->flags;
+		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
+		pcdev->asd.match.i2c.adapter_id =
+			pcdev->pdata->sensor_i2c_adapter_id;
+		pcdev->asd.match.i2c.address = pcdev->pdata->sensor_i2c_address;
+	} else {
+		dev_err(&pdev->dev, "CEU platform data not set.\n");
+		return -EINVAL;
+	}
+
+	pcdev->field = V4L2_FIELD_NONE;
+
+	if (!pcdev->max_width)
+		pcdev->max_width = 2560;
+	if (!pcdev->max_height)
+		pcdev->max_height = 1920;
+
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pcdev->irq = irq;
+	pcdev->base = base;
+	pcdev->video_limit = 0; /* only enabled if second resource exists */
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		err = dma_declare_coherent_memory(&pdev->dev, res->start,
+						  res->start,
+						  resource_size(res),
+						  DMA_MEMORY_MAP |
+						  DMA_MEMORY_EXCLUSIVE);
+		if (!err) {
+			dev_err(&pdev->dev, "Unable to declare CEU memory.\n");
+			return -ENXIO;
+		}
+
+		pcdev->video_limit = resource_size(res);
+	}
+
+	/* request irq */
+	err = devm_request_irq(&pdev->dev, pcdev->irq, sh_ceu_irq,
+			       0, dev_name(&pdev->dev), pcdev);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to register CEU interrupt.\n");
+		goto exit_release_mem;
+	}
+
+	pm_suspend_ignore_children(&pdev->dev, true);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_resume(&pdev->dev);
+
+	dev_set_drvdata(&pdev->dev, pcdev);
+	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
+	if (err)
+		goto exit_free_clk;
+
+	pcdev->asds[0] = &pcdev->asd;
+	pcdev->notifier.v4l2_dev = &pcdev->v4l2_dev;
+	pcdev->notifier.subdevs = pcdev->asds;
+	pcdev->notifier.num_subdevs = 1;
+	pcdev->notifier.bound = sh_ceu_sensor_bound;
+	pcdev->notifier.unbind = sh_ceu_sensor_unbind;
+
+	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
+	if (err)
+		goto exit_free_clk;
+
+	return 0;
+
+exit_free_clk:
+	pm_runtime_disable(&pdev->dev);
+exit_release_mem:
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
+		dma_release_declared_memory(&pdev->dev);
+	return err;
+}
+
+static int sh_ceu_remove(struct platform_device *pdev)
+{
+
+	/* TODO */
+
+	pm_runtime_disable(&pdev->dev);
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
+		dma_release_declared_memory(&pdev->dev);
+
+	return 0;
+}
+
+static int sh_ceu_runtime_nop(struct device *dev)
+{
+	/* Runtime PM callback shared between ->runtime_suspend()
+	 * and ->runtime_resume(). Simply returns success.
+	 *
+	 * This driver re-initializes all registers after
+	 * pm_runtime_get_sync() anyway so there is no need
+	 * to save and restore registers here.
+	 */
+	return 0;
+}
+
+static const struct dev_pm_ops sh_ceu_dev_pm_ops = {
+	.runtime_suspend = sh_ceu_runtime_nop,
+	.runtime_resume = sh_ceu_runtime_nop,
+};
+
+static const struct of_device_id sh_ceu_of_match[] = {
+	{ .compatible = "renesas,sh-mobile-ceu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sh_ceu_of_match);
+
+static struct platform_driver sh_ceu_driver = {
+	.driver		= {
+		.name	= "sh_mobile_ceu",
+		.pm	= &sh_ceu_dev_pm_ops,
+		.of_match_table = sh_ceu_of_match,
+	},
+	.probe		= sh_ceu_probe,
+	.remove		= sh_ceu_remove,
+};
+
+static int __init sh_ceu_init(void)
+{
+	return platform_driver_register(&sh_ceu_driver);
+}
+
+static void __exit sh_ceu_exit(void)
+{
+	platform_driver_unregister(&sh_ceu_driver);
+}
+
+module_init(sh_ceu_init);
+module_exit(sh_ceu_exit);
+
+MODULE_DESCRIPTION("SuperH Mobile CEU driver");
+MODULE_AUTHOR("Magnus Damm");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("0.1.0");
+MODULE_ALIAS("platform:sh_mobile_ceu");
-- 
2.7.4
