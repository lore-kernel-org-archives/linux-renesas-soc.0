Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35778 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbdESQDT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 12:03:19 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v4 3/8] media: platform: Add Renesas CEU driver
Date: Fri, 19 May 2017 18:02:55 +0200
Message-Id: <1495209780-27342-4-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
References: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add driver for Renesas Capture Engine Unit (CEU).

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/Kconfig       |    8 +
 drivers/media/platform/Makefile      |    2 +
 drivers/media/platform/renesas-ceu.c | 1525 ++++++++++++++++++++++++++++++++++
 3 files changed, 1535 insertions(+)
 create mode 100644 drivers/media/platform/renesas-ceu.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c9106e1..226a4fd 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -114,6 +114,14 @@ config VIDEO_S3C_CAMIF
 	  To compile this driver as a module, choose M here: the module
 	  will be called s3c-camif.

+config VIDEO_RENESAS_CEU
+	tristate "Renesas Capture Engine Unit (CEU) driver"
+	depends on VIDEO_DEV && VIDEO_V4L2 && HAS_DMA
+	depends on ARCH_SHMOBILE || ARCH_R7S72100 || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	---help---
+	  This is a v4l2 driver for the Renesas CEU Interface
+
 source "drivers/media/platform/soc_camera/Kconfig"
 source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/am437x/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 349ddf6..72f92f5 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -25,6 +25,8 @@ obj-$(CONFIG_VIDEO_CODA) 		+= coda/

 obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o

+obj-$(CONFIG_VIDEO_RENESAS_CEU)		+= renesas-ceu.o
+
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o

 obj-$(CONFIG_VIDEO_S3C_CAMIF) 		+= s3c-camif/
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
new file mode 100644
index 0000000..8ebc2547
--- /dev/null
+++ b/drivers/media/platform/renesas-ceu.c
@@ -0,0 +1,1525 @@
+/*
+ * V4L2 Driver for Renesas CEU interface
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
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/time.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-image-sizes.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-mediabus.h>
+
+#include <media/drv-intf/renesas_ceu.h>
+
+#define DRIVER_NAME	"renesas-ceu"
+
+/* ----------------------------------------------------------------------------
+ * CEU registers offsets and masks
+ */
+#define CEU_CAPSR	0x00 /* Capture start register */
+#define CEU_CAPCR	0x04 /* Capture control register */
+#define CEU_CAMCR	0x08 /* Capture interface control register */
+#define CEU_CMCYR	0x0c /* Capture interface cycle  register */
+#define CEU_CAMOR	0x10 /* Capture interface offset register */
+#define CEU_CAPWR	0x14 /* Capture interface width register */
+#define CEU_CAIFR	0x18 /* Capture interface input format register */
+#define CEU_CSTCR	0x20 /* Camera strobe control register (<= sh7722) */
+#define CEU_CSECR	0x24 /* Camera strobe emission count register (<= sh7722) */
+#define CEU_CRCNTR	0x28 /* CEU register control register */
+#define CEU_CRCMPR	0x2c /* CEU register forcible control register */
+#define CEU_CFLCR	0x30 /* Capture filter control register */
+#define CEU_CFSZR	0x34 /* Capture filter size clip register */
+#define CEU_CDWDR	0x38 /* Capture destination width register */
+#define CEU_CDAYR	0x3c /* Capture data address Y register */
+#define CEU_CDACR	0x40 /* Capture data address C register */
+#define CEU_CDBYR	0x44 /* Capture data bottom-field address Y register */
+#define CEU_CDBCR	0x48 /* Capture data bottom-field address C register */
+#define CEU_CBDSR	0x4c /* Capture bundle destination size register */
+#define CEU_CFWCR	0x5c /* Firewall operation control register */
+#define CEU_CLFCR	0x60 /* Capture low-pass filter control register */
+#define CEU_CDOCR	0x64 /* Capture data output control register */
+#define CEU_CDDCR	0x68 /* Capture data complexity level register */
+#define CEU_CDDAR	0x6c /* Capture data complexity level address register */
+#define CEU_CEIER	0x70 /* Capture event interrupt enable register */
+#define CEU_CETCR	0x74 /* Capture event flag clear register */
+#define CEU_CSTSR	0x7c /* Capture status register */
+#define CEU_CSRTR	0x80 /* Capture software reset register */
+#define CEU_CDSSR	0x84 /* Capture data size register */
+#define CEU_CDAYR2	0x90 /* Capture data address Y register 2 */
+#define CEU_CDACR2	0x94 /* Capture data address C register 2 */
+#define CEU_CDBYR2	0x98 /* Capture data bottom-field address Y register 2 */
+#define CEU_CDBCR2	0x9c /* Capture data bottom-field address C register 2 */
+
+/* Input components ordering: CEU_CAMCR.DTARY field */
+#define CEU_CAMCR_DTARY_BITSHIFT	8
+#define CEU_CAMCR_DTARY_8_UYVY		(0x00 << CEU_CAMCR_DTARY_BITSHIFT)
+#define CEU_CAMCR_DTARY_8_VYUY		(0x01 << CEU_CAMCR_DTARY_BITSHIFT)
+#define CEU_CAMCR_DTARY_8_YUYV		(0x02 << CEU_CAMCR_DTARY_BITSHIFT)
+#define CEU_CAMCR_DTARY_8_YVYU		(0x03 << CEU_CAMCR_DTARY_BITSHIFT)
+/* TODO: input components ordering for 16 bits input */
+
+/* Bus transfer MTU */
+#define CEU_CAPCR_MTCM_BITSHIFT		20
+#define CEU_CAPCR_BUS_WIDTH256		(0x3 << CEU_CAPCR_MTCM_BITSHIFT)
+
+/* Bus width configuration */
+#define CEU_CAMCR_DTIF_BITSHIFT		12
+#define CEU_CAMCR_DTIF_8BITS		(0 << CEU_CAMCR_DTIF_BITSHIFT)
+#define CEU_CAMCR_DTIF_16BITS		BIT(CEU_CAMCR_DTIF_BITSHIFT)
+
+/* No downsampling to planar YUV420 in image fetch mode */
+#define CEU_CDOCR_NO_DOWSAMPLE		BIT(4)
+
+/* Capture reset and enable bits */
+#define CEU_CAPSR_CPKIL			BIT(16)
+#define CEU_CAPSR_CE			BIT(0)
+
+/* CEU operating flag bit */
+#define CEU_CSTRST_CPTON		BIT(1)
+
+/* Acknowledge magical interrupt sources */
+#define CEU_CETCR_MAGIC			0x0317f313
+/* Prohibited register access interrupt bit */
+#define CEU_CETCR_IGRW			BIT(4)
+/* One-frame capture end interrupt */
+#define CEU_CEIER_CPE			BIT(0)
+/* VBP error */
+#define CEU_CEIER_VBP			BIT(20)
+/* Continuous capture mode (if set) */
+#define CEU_CAPCR_CTNCP			BIT(16)
+#define CEU_CEIER_MASK			(CEU_CEIER_CPE | CEU_CEIER_VBP)
+
+#define CEU_BUS_FLAGS (V4L2_MBUS_MASTER		     |  \
+			V4L2_MBUS_PCLK_SAMPLE_RISING |	\
+			V4L2_MBUS_HSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_HSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_VSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_VSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_DATA_ACTIVE_HIGH)
+
+#define CEU_MAX_WIDTH	2560
+#define CEU_MAX_HEIGHT	1920
+#define CEU_W_MAX(w)	((w) < CEU_MAX_WIDTH ? (w) : CEU_MAX_WIDTH)
+#define CEU_H_MAX(h)	((h) < CEU_MAX_HEIGHT ? (h) : CEU_MAX_HEIGHT)
+
+/* ----------------------------------------------------------------------------
+ * CEU formats
+ */
+
+/**
+ * ceu_bus_fmt - describe a 8-bits yuyv format the sensor can produce
+ *
+ * @mbus_code: bus format code
+ * @fmt_order: CEU_CAMCR.DTARY ordering of input components (Y, Cb, Cr)
+ * @fmt_order_swap: swapped CEU_CAMCR.DTARY ordering of input components
+ *		    (Y, Cr, Cb)
+ * @swapped: does Cr appear before Cb?
+ * @bps: number of bits sent over bus for each sample
+ */
+struct ceu_mbus_fmt {
+	u32	mbus_code;
+	u32	fmt_order;
+	u32	fmt_order_swap;
+	bool	swapped;
+	u8	bps;
+};
+
+/**
+ * ceu_buffer - Link vb2 buffer to the list of active buffers
+ */
+struct ceu_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+};
+
+static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct ceu_buffer, vb);
+}
+
+/**
+ * ceu_device - CEU device instance
+ */
+struct ceu_device {
+	struct device		*dev;
+	struct video_device	vdev;
+	struct v4l2_device	v4l2_dev;
+
+	struct v4l2_subdev	*sensor;
+	struct ceu_mbus_fmt	sensor_fmt;
+
+	struct v4l2_async_notifier	notifier;
+	struct v4l2_async_subdev	asd;
+	struct v4l2_async_subdev	*asds[1];
+
+	/* vb2 queue, capture buffer list and active buffer pointer */
+	struct vb2_queue	vb2_vq;
+	struct list_head	capture;
+	struct vb2_v4l2_buffer	*active;
+	unsigned int		sequence;
+
+	/* mlock - locks on open/close and vb2 operations */
+	struct mutex	mlock;
+
+	/* lock - lock access to capture buffer queue and active buffer */
+	spinlock_t	lock;
+
+	void __iomem	*base;
+
+	enum v4l2_field		field;
+	struct v4l2_pix_format	v4l2_pix;
+
+	unsigned long		mbus_flags;
+	struct ceu_info		*pdata;
+};
+
+static inline struct ceu_device *v4l2_to_ceu(struct v4l2_device *v4l2_dev)
+{
+	return container_of(v4l2_dev, struct ceu_device, v4l2_dev);
+}
+
+/* ----------------------------------------------------------------------------
+ * CEU memory output formats
+ */
+
+/**
+ * ceu_fmt - describe a memory output format supported by CEU interface
+ *
+ * @fourcc: memory layout fourcc format code
+ * @bpp: bit for each pixel stored in memory
+ */
+struct ceu_fmt {
+	u32	fourcc;
+	u8	bpp;
+};
+
+/**
+ * ceu_format_list - List of supported memory output formats
+ *
+ * If sensor provides any YUYV bus format, all the following planar memory
+ * formats are available thanks to CEU re-ordering and sub-sampling.
+ *
+ * TODO: extend with packed YUYV (data synch fetch mode)
+ * TODO: extend with binary and RAW (data synch fetch mode)
+ */
+static const struct ceu_fmt ceu_fmt_list[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_NV16,
+		.bpp	= 16,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.bpp	= 16,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_NV12,
+		.bpp	= 12,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_NV21,
+		.bpp	= 12,
+	},
+};
+
+static const struct ceu_fmt *get_ceu_fmt_from_fourcc(unsigned int fourcc)
+{
+	const struct ceu_fmt *fmt = &ceu_fmt_list[0];
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ceu_fmt_list); i++, fmt++)
+		if (fmt->fourcc == fourcc)
+			return fmt;
+
+	return NULL;
+}
+
+/* ----------------------------------------------------------------------------
+ * CEU HW operations
+ */
+static void ceu_write(struct ceu_device *priv, unsigned int reg_offs, u32 data)
+{
+	iowrite32(data, priv->base + reg_offs);
+}
+
+static u32 ceu_read(struct ceu_device *priv, unsigned int reg_offs)
+{
+	return ioread32(priv->base + reg_offs);
+}
+
+/**
+ * ceu_soft_reset() - Software reset the CEU interface
+ *
+ * TODO: characterize delays (Figure 46.6)
+ */
+static int ceu_soft_reset(struct ceu_device *ceudev)
+{
+	unsigned int reset_done;
+	unsigned int i;
+
+	ceu_write(ceudev, CEU_CAPSR, CEU_CAPSR_CPKIL);
+	/*
+	 * FIXME: the manual says "clear the CE bit when set CPKIL", well,
+	 * I'm doing it even if the original driver did not
+	 */
+	ceu_write(ceudev, CEU_CAPSR, ~CEU_CAPSR_CE);
+
+	reset_done = 0;
+	for (i = 0; i < 1000 && !reset_done; i++) {
+		udelay(1);
+		if (!(ceu_read(ceudev, CEU_CSTSR) & CEU_CSTRST_CPTON))
+			reset_done++;
+
+	}
+
+	if (!reset_done) {
+		dev_warn(&ceudev->vdev.dev, "soft reset time out\n");
+		return -EIO;
+	}
+
+	reset_done = 0;
+	for (i = 0; i < 1000; i++) {
+		udelay(1);
+		if (!(ceu_read(ceudev, CEU_CAPSR) & CEU_CAPSR_CPKIL))
+			return 0;
+	}
+
+	/* if we get here, CEU has not reset properly */
+	return -EIO;
+}
+
+/* ----------------------------------------------------------------------------
+ * CEU Capture Operations
+ */
+
+/**
+ * ceu_capture() - Trigger start of a capture sequence
+ *
+ * Return value doesn't reflect the success/failure to queue the new buffer,
+ * but rather the status of the previous buffer.
+ */
+static int ceu_capture(struct ceu_device *ceudev)
+{
+	struct v4l2_pix_format *pix = &ceudev->v4l2_pix;
+	dma_addr_t phys_addr_top, phys_addr_bottom;
+	unsigned long bottom1, bottom2;
+	unsigned long top1, top2;
+	u32 status;
+	int ret = 0;
+
+	/*
+	 * The hardware is _very_ picky about this sequence. Especially
+	 * the CEU_CETCR_MAGIC value. It seems like we need to acknowledge
+	 * several not-so-well documented interrupt sources in CETCR.
+	 */
+	ceu_write(ceudev, CEU_CEIER,
+		  ceu_read(ceudev, CEU_CEIER) & ~CEU_CEIER_MASK);
+	status = ceu_read(ceudev, CEU_CETCR);
+	ceu_write(ceudev, CEU_CETCR, ~status & CEU_CETCR_MAGIC);
+
+	/*
+	 * FIXME: return error to user space reset interface in stop_streaming
+	 * When a VBP interrupt occurs, a capture end interrupt does not occur
+	 * and the image of that frame is not captured correctly.
+	 */
+	if (status & CEU_CEIER_VBP)
+		return -EIO;
+
+	/* Re-enable interrupt and set one-frame capture mode */
+	ceu_write(ceudev, CEU_CEIER,
+		  ceu_read(ceudev, CEU_CEIER) | CEU_CEIER_MASK);
+
+	ceu_write(ceudev, CEU_CAPCR,
+		  ceu_read(ceudev, CEU_CAPCR) & ~CEU_CAPCR_CTNCP);
+
+	ceu_write(ceudev, CEU_CETCR, CEU_CETCR_MAGIC ^ CEU_CETCR_IGRW);
+
+	if (ceudev->field == V4L2_FIELD_INTERLACED_BT) {
+		top1	= CEU_CDBYR;
+		top2	= CEU_CDBCR;
+		bottom1	= CEU_CDAYR;
+		bottom2	= CEU_CDACR;
+	} else {
+		top1	= CEU_CDAYR;
+		top2	= CEU_CDACR;
+		bottom1	= CEU_CDBYR;
+		bottom2	= CEU_CDBCR;
+	}
+
+	phys_addr_top = vb2_dma_contig_plane_dma_addr(&ceudev->active->vb2_buf,
+						      0);
+
+	ceu_write(ceudev, top1, phys_addr_top);
+	if (ceudev->field != V4L2_FIELD_NONE) {
+		phys_addr_bottom = phys_addr_top + pix->bytesperline;
+		ceu_write(ceudev, bottom1, phys_addr_bottom);
+	}
+
+	/* FIXME: this works only for planar formats */
+	phys_addr_top += pix->bytesperline * pix->height;
+	ceu_write(ceudev, top2, phys_addr_top);
+	if (ceudev->field != V4L2_FIELD_NONE) {
+		phys_addr_bottom = phys_addr_top +
+				   pix->bytesperline;
+		ceu_write(ceudev, bottom2, phys_addr_bottom);
+	}
+
+	/*
+	 * Trigger new capture start: once per each frame, as we work in
+	 * one-frame capture mode
+	 */
+	ceu_write(ceudev, CEU_CAPSR, CEU_CAPSR_CE);
+
+	return ret;
+}
+
+static irqreturn_t ceu_irq(int irq, void *data)
+{
+	struct ceu_device *ceudev = data;
+	struct vb2_v4l2_buffer *vbuf;
+	struct ceu_buffer *buf;
+	int ret;
+
+	spin_lock(&ceudev->lock);
+
+	vbuf = ceudev->active;
+	if (!vbuf)
+		/* Stale interrupt from a released buffer */
+		goto out;
+
+	buf = vb2_to_ceu(vbuf);
+	vbuf->vb2_buf.timestamp = ktime_get_ns();
+	list_del_init(&buf->queue);
+
+	if (!list_empty(&ceudev->capture)) {
+		buf = list_first_entry(&ceudev->capture, struct ceu_buffer,
+				       queue);
+		list_del(&buf->queue);
+		ceudev->active = &buf->vb;
+	} else
+		ceudev->active = NULL;
+
+	ret = ceu_capture(ceudev);
+	if (!ret) {
+		vbuf->field = ceudev->field;
+		vbuf->sequence = ceudev->sequence++;
+	}
+
+	vb2_buffer_done(&vbuf->vb2_buf,
+			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+
+out:
+	spin_unlock(&ceudev->lock);
+
+	return IRQ_HANDLED;
+}
+
+/* ----------------------------------------------------------------------------
+ * CEU Videobuf operations
+ */
+
+/*
+ * ceu_videobuf_setup() - is called to check, whether the driver can accept the
+ *			  requested number of buffers and to fill in plane sizes
+ *			  for the current frame format if required
+ */
+static int ceu_videobuf_setup(struct vb2_queue *vq, unsigned int *count,
+			      unsigned int *num_planes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct ceu_device *ceudev = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *pix = &ceudev->v4l2_pix;
+
+	if (!vq->num_buffers)
+		ceudev->sequence = 0;
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
+	*num_planes = 1;
+
+	dev_dbg(ceudev->dev, "count=%d, size=%u\n", *count, sizes[0]);
+
+	return 0;
+}
+
+static void ceu_videobuf_queue(struct vb2_buffer *vb)
+{
+	struct ceu_device *ceudev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ceu_buffer *buf = vb2_to_ceu(vbuf);
+	unsigned long irqflags;
+	unsigned long size;
+
+	size = ceudev->v4l2_pix.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		dev_err(&ceudev->vdev.dev, "Buffer #%d too small (%lu < %lu)\n",
+			vb->index, vb2_plane_size(vb, 0), size);
+		goto error;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	dev_dbg(&ceudev->vdev.dev, "%s (vb=0x%p) 0x%p %lu\n", __func__,
+		vb, vb2_plane_vaddr(vb, 0), vb2_get_plane_payload(vb, 0));
+
+	spin_lock_irqsave(&ceudev->lock, irqflags);
+	list_add_tail(&buf->queue, &ceudev->capture);
+	spin_unlock_irqrestore(&ceudev->lock, irqflags);
+
+	return;
+
+error:
+	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+}
+
+static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct ceu_device *ceudev = vb2_get_drv_priv(vq);
+	struct ceu_buffer *buf;
+	unsigned long irqflags;
+	int ret = 0;
+
+	ret = v4l2_subdev_call(ceudev->sensor, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		v4l2_err(&ceudev->v4l2_dev, "stream on failed in subdev\n");
+		goto error_return_bufs;
+	}
+
+	spin_lock_irqsave(&ceudev->lock, irqflags);
+	ceudev->sequence = 0;
+
+	if (ceudev->active) {
+		ret = -EINVAL;
+		spin_unlock_irq(&ceudev->lock);
+		goto error_stop_sensor;
+	}
+
+	buf = list_first_entry(&ceudev->capture, struct ceu_buffer,
+			       queue);
+	list_del(&buf->queue);
+
+	ceudev->active = &buf->vb;
+	ret = ceu_capture(ceudev);
+	if (ret) {
+		spin_unlock_irqrestore(&ceudev->lock, irqflags);
+		goto error_stop_sensor;
+	}
+
+	spin_unlock_irqrestore(&ceudev->lock, irqflags);
+
+	return 0;
+
+error_stop_sensor:
+	v4l2_subdev_call(ceudev->sensor, video, s_stream, 0);
+
+error_return_bufs:
+	spin_lock_irqsave(&ceudev->lock, irqflags);
+	list_for_each_entry(buf, &ceudev->capture, queue)
+		vb2_buffer_done(&ceudev->active->vb2_buf,
+				VB2_BUF_STATE_QUEUED);
+	ceudev->active = NULL;
+	spin_unlock_irqrestore(&ceudev->lock, irqflags);
+
+	return ret;
+}
+
+static void ceu_stop_streaming(struct vb2_queue *vq)
+{
+	struct ceu_device *ceudev = vb2_get_drv_priv(vq);
+	struct ceu_buffer *buf;
+	unsigned long irqflags;
+
+	v4l2_subdev_call(ceudev->sensor, video, s_stream, 0);
+
+	spin_lock_irqsave(&ceudev->lock, irqflags);
+	if (ceudev->active) {
+		vb2_buffer_done(&ceudev->active->vb2_buf,
+				VB2_BUF_STATE_ERROR);
+		ceudev->active = NULL;
+	}
+
+	/* Release all queued buffers */
+	list_for_each_entry(buf, &ceudev->capture, queue)
+		vb2_buffer_done(&ceudev->active->vb2_buf,
+				VB2_BUF_STATE_ERROR);
+	INIT_LIST_HEAD(&ceudev->capture);
+
+	spin_unlock_irqrestore(&ceudev->lock, irqflags);
+
+	/* FIXME: do we really need to reset the interface here? */
+	ceu_soft_reset(ceudev);
+}
+
+static const struct vb2_ops ceu_videobuf_ops = {
+	.queue_setup	= ceu_videobuf_setup,
+	.buf_queue	= ceu_videobuf_queue,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+	.start_streaming = ceu_start_streaming,
+	.stop_streaming	= ceu_stop_streaming,
+};
+/**
+ * ----------------------------------------------------------------------------
+ *  CEU bus operations
+ */
+static unsigned int ceu_mbus_config_compatible(
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
+	return (hsync && vsync && pclk && data && mode) ? common_flags : 0;
+}
+/**
+ * ceu_test_mbus_param() - test bus parameters against sensor provided ones.
+ *
+ * Return < 0 for error, 0 if g_mbus_config is not supported,
+ * flags > 0  otherwise
+ */
+static int ceu_test_mbus_param(struct ceu_device *ceudev)
+{
+	struct v4l2_subdev *sd = ceudev->sensor;
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
+	common_flags = ceu_mbus_config_compatible(&cfg, common_flags);
+	if (!common_flags)
+		return -EINVAL;
+
+	return common_flags;
+}
+
+/*
+ * ceu_set_sizes() - compute register settings to accommodate image sizes
+ *
+ * This is a very simplified version of "sh_mobile_ceu_set_rect function
+ * found in the original soc_camera driver
+ */
+static void ceu_set_sizes(struct ceu_device *ceudev)
+{
+	struct v4l2_pix_format *pix = &ceudev->v4l2_pix;
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
+	/* Configure CAPWR: length of horizontal/vertical capture period */
+	/* TODO:
+	 * vertical width depends on ceudev->field value? Is this interlaced?
+	 */
+	capwr_vwidth = height;
+
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
+	ceu_write(ceudev, CEU_CAMOR, camor);
+	ceu_write(ceudev, CEU_CAPWR, (capwr_vwidth << 16) | capwr_hwidth);
+
+	/* CFSZR clipping is applied _after_ the scaling filter (CEU_CFLCR) */
+	ceu_write(ceudev, CEU_CFSZR, (height << 16) | width);
+	ceu_write(ceudev, CEU_CDWDR, cdwdr_width);
+}
+
+/**
+ * ceu_set_bus_params() - Configure CEU interface registers using bus
+ *			  parameters
+ *
+ * FIXME: compared to the original soc-driver set_bus_param is only called
+ * by set_fmt, which cannot be called while actively streaming.
+ * This probably means we do not have to save_reset and restore CAPSR at the
+ * beginning and at the end of this function like the original one did.
+ */
+static int ceu_set_bus_params(struct ceu_device *ceudev)
+{
+	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct v4l2_pix_format *pix = &ceudev->v4l2_pix;
+	unsigned long common_flags = CEU_BUS_FLAGS;
+	struct v4l2_subdev *sd = ceudev->sensor;
+	u32 camcr, caifr, cdocr;
+	int ret;
+
+	struct v4l2_mbus_config cfg = {
+		.type = V4L2_MBUS_PARALLEL,
+	};
+
+	/*
+	 * TODO: if client doesn't implement g_mbus_config, we just use our
+	 * platform data
+	 */
+	common_flags = ceu_test_mbus_param(ceudev);
+	if (common_flags < 0)
+		return common_flags;
+	else if (common_flags == 0)
+		/* TODO: use platform data */
+
+	/*
+	 * Make choices, based on platform preferences if the we can chose
+	 * between multiple alternatives.
+	 */
+	if ((common_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) &&
+	    (common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)) {
+		if (ceudev->mbus_flags & CEU_FLAG_HSYNC_LOW)
+			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_HIGH;
+		else
+			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_LOW;
+	}
+
+	if ((common_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) &&
+	    (common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)) {
+		if (ceudev->mbus_flags & CEU_FLAG_VSYNC_LOW)
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
+	/* Start configuring CEU registers */
+	ceu_write(ceudev, CEU_CRCNTR, 0);
+	ceu_write(ceudev, CEU_CRCMPR, 0);
+
+	/* TODO: handle bps > 8 */
+
+	/*
+	 * Configure CAMCR and CDOCR:
+	 * match input components ordering with memory output format and
+	 * handle downsampling to YUV420.
+	 *
+	 * If the memory output format is swapped (Cr before Cb) and input
+	 * format is not, use the swapped version of CAMCR.DTARY.
+	 *
+	 * If the memory output format is not swapped (Cb before Cr) and
+	 * input format is, use the swapped version of CAMCR.DTARY.
+	 *
+	 * CEU by default downsample to planar YUV420 (CDCOR[4] = 0).
+	 * If output is planar YUV422 set CDOCR[4] = 1
+	 */
+	cdocr = 0;
+	camcr = 0;
+	switch (pix->pixelformat) {
+	/* non-swapped output formats */
+	case V4L2_PIX_FMT_NV16:
+		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
+	case V4L2_PIX_FMT_NV12:
+		if (sensor_fmt->swapped)
+			camcr |= sensor_fmt->fmt_order_swap;
+		else
+			camcr |= sensor_fmt->fmt_order;
+		break;
+
+	/* swapped output formats */
+	case V4L2_PIX_FMT_NV61:
+		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
+	case V4L2_PIX_FMT_NV21:
+		if (sensor_fmt->swapped)
+			camcr |= sensor_fmt->fmt_order;
+		else
+			camcr |= sensor_fmt->fmt_order_swap;
+		break;
+	}
+	camcr |= common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW ? 1 << 1 : 0;
+	camcr |= common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW ? 1 << 0 : 0;
+
+	/* TODO: handle 16 bit bus width; use 8 bits by default now */
+	camcr |= CEU_CAMCR_DTIF_8BITS;
+	ceu_write(ceudev, CEU_CAMCR, camcr);
+
+	/*
+	 * TODO: handle data swap mode in CDOCR[3:0] for data fetch sync
+	 * before writing CDOCR register
+	 */
+	ceu_write(ceudev, CEU_CDOCR, cdocr);
+
+	ceu_write(ceudev, CEU_CAPCR, CEU_CAPCR_BUS_WIDTH256);
+
+	/*
+	 * Support for interlaced input source.
+	 * FIXME: this comes from soc-camera driver. Investigate further
+	 */
+	switch (pix->field) {
+	case V4L2_FIELD_INTERLACED_TB:
+		caifr = 0x101;
+		break;
+	case V4L2_FIELD_INTERLACED_BT:
+		caifr = 0x102;
+		break;
+	default:
+		caifr = 0;
+		break;
+	}
+	ceu_write(ceudev, CEU_CAIFR, caifr);
+
+	ceu_set_sizes(ceudev);
+
+	/* TODO: CEU_CFLCR scale down filter not supported yet */
+
+	/* Keep "datafetch firewall" disabled */
+	ceu_write(ceudev, CEU_CFWCR, 0);
+
+	/*
+	 * Not in bundle mode: skip CEU_CBDSR, CEU_CDAYR2, CEU_CDACR2,
+	 * CEU_CDBYR2, CEU_CDBCR2
+	 */
+
+	return 0;
+}
+
+/**
+ * ----------------------------------------------------------------------------
+ *  CEU image formats handling
+ */
+
+/**
+ * ceu_try_fmt() - test format on CEU and sensor
+ *
+ * @v4l2_fmt: format to test
+ */
+static int ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
+{
+	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
+	struct v4l2_subdev *sensor = ceudev->sensor;
+	struct v4l2_subdev_pad_config pad_cfg;
+	const struct ceu_fmt *ceu_fmt;
+	int ret;
+
+	struct v4l2_subdev_format sd_format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		ceu_fmt = get_ceu_fmt_from_fourcc(pix->pixelformat);
+		break;
+
+	default:
+		/*
+		 * Reject all non-NV[12|21|16|61] pixel formats as we only
+		 * support image fetch mode.
+		 *
+		 * TODO: add support for packed YUYV output formats, binary and
+		 * raw data capture through data fetch sync mode
+		 */
+		dev_err(ceudev->dev, "Pixel format 0x%x not supported\n",
+			pix->pixelformat);
+		return -EINVAL;
+	}
+
+	dev_dbg(ceudev->dev, "Try format: 0x%x - %ux%u\n\n",
+		pix->pixelformat, pix->width, pix->height);
+
+	/* CFSZR requires height and width to be 4-pixel aligned */
+	v4l_bound_align_image(&pix->width, 2, CEU_MAX_WIDTH, 2,
+			      &pix->height, 4, CEU_MAX_HEIGHT, 2, 0);
+
+	/*
+	 * Set format on sensor sub device: bus format is selected at
+	 * format initialization time
+	 */
+	v4l2_fill_mbus_format(&sd_format.format, pix, sensor_fmt->mbus_code);
+	ret = v4l2_subdev_call(sensor, pad, set_fmt, &pad_cfg, &sd_format);
+	if (ret)
+		return ret;
+
+	/* TODO: scale CEU format to match what is returned by subdevice */
+
+	v4l2_fill_pix_format(pix, &sd_format.format);
+	pix->field		= V4L2_FIELD_NONE;
+	pix->bytesperline	= pix->width * ceu_fmt->bpp / 8;
+	pix->sizeimage		= pix->height * pix->bytesperline;
+
+	/* Test bus parameters */
+	ret = ceu_test_mbus_param(ceudev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ceu_set_fmt() - Apply the supplied format to both sensor and CEU
+ */
+static int ceu_set_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
+{
+	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	int ret;
+
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	ret = ceu_try_fmt(ceudev, v4l2_fmt);
+	if (ret)
+		return ret;
+
+	v4l2_fill_mbus_format(&format.format, &v4l2_fmt->fmt.pix,
+			      sensor_fmt->mbus_code);
+	ret = v4l2_subdev_call(ceudev->sensor, pad,
+			       set_fmt, NULL, &format);
+	if (ret)
+		return ret;
+
+	ceudev->v4l2_pix = v4l2_fmt->fmt.pix;
+
+	ret = ceu_set_bus_params(ceudev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ceu_set_default_fmt() - Apply default NV16 memory output format with VGA
+ *			   sizes
+ */
+static int ceu_set_default_fmt(struct ceu_device *ceudev)
+{
+	int ret;
+	struct v4l2_format v4l2_fmt = {
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.fmt.pix = {
+			.width		= VGA_WIDTH,
+			.height		= VGA_HEIGHT,
+			.field		= V4L2_FIELD_NONE,
+			.pixelformat	= V4L2_PIX_FMT_NV16,
+		},
+	};
+
+	ret = ceu_try_fmt(ceudev, &v4l2_fmt);
+	if (ret)
+		return ret;
+
+	ceudev->v4l2_pix = v4l2_fmt.fmt.pix;
+
+	return 0;
+}
+
+/**
+ * ceu_init_formats() - Query sensor for supported formats and initialize
+ *			CEU supported format list
+ *
+ * Find out if sensor can produce a permutation of 8-bits YUYV bus format.
+ * From a single 8-bits YUYV bus format the CEU can produce several memory
+ * output formats:
+ * - NV[12|21|16|61] through image fetch mode;
+ * - TODO: Packed YUYV permutations throug data fetch sync mode;
+ * - TODO: Binary data (eg. JPEG) and raw formats. through data fetch sync mode
+ */
+static int ceu_init_formats(struct ceu_device *ceudev)
+{
+	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct v4l2_subdev *sensor = ceudev->sensor;
+	bool yuyv_bus_fmt = false;
+
+	struct v4l2_subdev_mbus_code_enum mbus_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.index = 0,
+	};
+
+	/* Find out if sensor can produce any permutation of 8-bits yuyv */
+	while (!yuyv_bus_fmt &&
+	       !v4l2_subdev_call(sensor, pad, enum_mbus_code,
+				 NULL, &mbus_fmt)) {
+		switch (mbus_fmt.code) {
+		case MEDIA_BUS_FMT_YUYV8_2X8:
+		case MEDIA_BUS_FMT_YVYU8_2X8:
+		case MEDIA_BUS_FMT_UYVY8_2X8:
+		case MEDIA_BUS_FMT_VYUY8_2X8:
+			yuyv_bus_fmt = true;
+			break;
+		default:
+			/*
+			 * Only support 8-bits YUYV bus formats at the moment;
+			 *
+			 * TODO: add support for binary formats (data sync
+			 * fetch mode).
+			 */
+			break;
+		}
+	}
+
+	if (!yuyv_bus_fmt)
+		return -ENXIO;
+
+	/*
+	 * Save the first encountered YUYV format as "sensor_fmt" and use it
+	 * to output all planar YUV422 and YUV420 (NV*) formats to memory.
+	 */
+	sensor_fmt->mbus_code	= mbus_fmt.code;
+	sensor_fmt->bps		= 8;
+
+	/* Annotate the selected bus format components ordering */
+	switch (mbus_fmt.code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YUYV;
+		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YVYU;
+		sensor_fmt->swapped		= false;
+		break;
+
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YVYU;
+		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YUYV;
+		sensor_fmt->swapped		= true;
+		break;
+
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_UYVY;
+		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_VYUY;
+		sensor_fmt->swapped		= false;
+		break;
+
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_VYUY;
+		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_UYVY;
+		sensor_fmt->swapped		= true;
+		break;
+	}
+
+	ceudev->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+/**
+ * ----------------------------------------------------------------------------
+ *  Runtime PM Handlers
+ */
+
+/**
+ * ceu_runtime_suspend() - disable capture and interrupts and soft-reset.
+ *			   Turn sensor power off.
+ */
+static int ceu_runtime_suspend(struct device *dev)
+{
+	struct ceu_device *ceudev = dev_get_drvdata(dev);
+	struct v4l2_subdev *sensor = ceudev->sensor;
+
+	v4l2_subdev_call(sensor, core, s_power, 0);
+
+	ceu_write(ceudev, CEU_CEIER, 0);
+	ceu_soft_reset(ceudev);
+
+	return 0;
+}
+
+/**
+ * ceu_runtime_resume() - soft-reset the interface and turn sensor power on.
+ */
+static int ceu_runtime_resume(struct device *dev)
+{
+	struct ceu_device *ceudev = dev_get_drvdata(dev);
+	struct v4l2_subdev *sensor = ceudev->sensor;
+
+	v4l2_subdev_call(sensor, core, s_power, 1);
+
+	ceu_soft_reset(ceudev);
+
+	return 0;
+}
+
+/**
+ * ----------------------------------------------------------------------------
+ *  File Operations
+ */
+static int ceu_open(struct file *file)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+	int ret;
+
+	ret = v4l2_fh_open(file);
+	if (ret)
+		return ret;
+
+	mutex_lock(&ceudev->mlock);
+	/* Causes soft-reset and sensor power on on first open */
+	pm_runtime_get_sync(ceudev->dev);
+	mutex_unlock(&ceudev->mlock);
+
+	return 0;
+}
+
+static int ceu_release(struct file *file)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	vb2_fop_release(file);
+
+	mutex_lock(&ceudev->mlock);
+	/* Causes soft-reset and sensor power down on last close */
+	pm_runtime_put(ceudev->dev);
+	mutex_unlock(&ceudev->mlock);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations ceu_fops = {
+	.owner			= THIS_MODULE,
+	.open			= ceu_open,
+	.release		= ceu_release,
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
+static int ceu_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	strlcpy(cap->card, "Renesas-CEU", sizeof(cap->card));
+	strlcpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
+	strlcpy(cap->bus_info, "platform:renesas-ceu", sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int ceu_enum_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	const struct ceu_fmt *fmt;
+
+	if (f->index >= ARRAY_SIZE(ceu_fmt_list) - 1)
+		return -EINVAL;
+
+	fmt = &ceu_fmt_list[f->index];
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int ceu_try_fmt_vid_cap(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	return ceu_try_fmt(ceudev, f);
+}
+
+static int ceu_s_fmt_vid_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	if (vb2_is_streaming(&ceudev->vb2_vq))
+		return -EBUSY;
+
+	return ceu_set_fmt(ceudev, f);
+}
+
+static int ceu_enum_input(struct file *file, void *priv,
+			  struct v4l2_input *inp)
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
+static int ceu_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+
+	return 0;
+}
+
+static int ceu_s_input(struct file *file, void *priv, unsigned int i)
+{
+	if (i > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ceu_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	return v4l2_subdev_call(ceudev->sensor, video, g_parm, a);
+}
+
+static int ceu_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	return v4l2_subdev_call(ceudev->sensor, video, s_parm, a);
+}
+
+static int ceu_enum_framesizes(struct file *file, void *fh,
+			       struct v4l2_frmsizeenum *fsize)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+	int ret;
+
+	struct v4l2_subdev_frame_size_enum fse = {
+		.code	= ceudev->sensor_fmt.mbus_code,
+		.index	= fsize->index,
+		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	ret = v4l2_subdev_call(ceudev->sensor, pad, enum_frame_size,
+			       NULL, &fse);
+	if (ret)
+		return ret;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = CEU_W_MAX(fse.max_width);
+	fsize->discrete.height = CEU_H_MAX(fse.max_height);
+
+	return 0;
+}
+
+static int ceu_enum_frameintervals(struct file *file, void *fh,
+				    struct v4l2_frmivalenum *fival)
+{
+	struct ceu_device *ceudev = video_drvdata(file);
+	int ret;
+
+	struct v4l2_subdev_frame_interval_enum fie = {
+		.code	= ceudev->sensor_fmt.mbus_code,
+		.index = fival->index,
+		.width = fival->width,
+		.height = fival->height,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	ret = v4l2_subdev_call(ceudev->sensor, pad, enum_frame_interval, NULL,
+			       &fie);
+	if (ret)
+		return ret;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = fie.interval;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops ceu_ioctl_ops = {
+	.vidioc_querycap		= ceu_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= ceu_enum_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap		= ceu_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= ceu_s_fmt_vid_cap,
+
+	.vidioc_enum_input		= ceu_enum_input,
+	.vidioc_g_input			= ceu_g_input,
+	.vidioc_s_input			= ceu_s_input,
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
+	.vidioc_g_parm			= ceu_g_parm,
+	.vidioc_s_parm			= ceu_s_parm,
+	.vidioc_enum_framesizes		= ceu_enum_framesizes,
+	.vidioc_enum_frameintervals	= ceu_enum_frameintervals,
+};
+
+/**
+ * ceu_vdev_release() - release CEU video device memory when last reference
+ *			to this driver is closed
+ */
+void ceu_vdev_release(struct video_device *vdev)
+{
+	struct ceu_device *ceudev = video_get_drvdata(vdev);
+
+	kfree(ceudev);
+}
+
+static int ceu_sensor_bound(struct v4l2_async_notifier *notifier,
+			    struct v4l2_subdev *subdev,
+			    struct v4l2_async_subdev *asd)
+{
+	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
+	struct ceu_device *ceudev = v4l2_to_ceu(v4l2_dev);
+	struct video_device *vdev = &ceudev->vdev;
+	struct vb2_queue *q = &ceudev->vb2_vq;
+	int ret;
+
+	/* Initialize vb2 queue */
+	q->type			= V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes		= VB2_MMAP | VB2_USERPTR;
+	q->drv_priv		= ceudev;
+	q->ops			= &ceu_videobuf_ops;
+	q->mem_ops		= &vb2_dma_contig_memops;
+	q->buf_struct_size	= sizeof(struct ceu_buffer);
+	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock			= &ceudev->mlock;
+	q->dev			= ceudev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	/* Initialize formats and set default format on sensor */
+	ceudev->sensor = subdev;
+	ret = ceu_init_formats(ceudev);
+	if (ret)
+		return ret;
+
+	ret = ceu_set_default_fmt(ceudev);
+	if (ret)
+		return ret;
+
+	/* Register the video device */
+	strncpy(vdev->name, DRIVER_NAME, strlen(DRIVER_NAME));
+	vdev->v4l2_dev		= v4l2_dev;
+	vdev->lock		= &ceudev->mlock;
+	vdev->queue		= &ceudev->vb2_vq;
+	vdev->ctrl_handler	= subdev->ctrl_handler;
+	vdev->fops		= &ceu_fops;
+	vdev->ioctl_ops		= &ceu_ioctl_ops;
+	vdev->release		= ceu_vdev_release;
+	vdev->device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_set_drvdata(vdev, ceudev);
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret < 0) {
+		v4l2_err(vdev->v4l2_dev,
+			 "video_register_device failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ceu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ceu_device *ceudev;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int irq;
+	int ret;
+
+	ceudev = kzalloc(sizeof(*ceudev), GFP_KERNEL);
+	if (!ceudev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ceudev);
+	dev_set_drvdata(dev, ceudev);
+	ceudev->dev = dev;
+
+	INIT_LIST_HEAD(&ceudev->capture);
+	spin_lock_init(&ceudev->lock);
+	mutex_init(&ceudev->mlock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+	ceudev->base = base;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "failed to get irq: %d\n", ret);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev, irq, ceu_irq,
+			       0, dev_name(dev), ceudev);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to register CEU interrupt.\n");
+		return ret;
+	}
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		/* TODO: implement OF parsing */
+	} else if (dev->platform_data) {
+		ceudev->pdata = dev->platform_data;
+		ceudev->mbus_flags = ceudev->pdata->flags;
+		ceudev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
+		ceudev->asd.match.i2c.adapter_id =
+			ceudev->pdata->sensor_i2c_adapter_id;
+		ceudev->asd.match.i2c.address =
+			ceudev->pdata->sensor_i2c_address;
+	} else {
+		dev_err(&pdev->dev, "CEU platform data not set.\n");
+		return -EINVAL;
+	}
+
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
+
+	ret = v4l2_device_register(dev, &ceudev->v4l2_dev);
+	if (ret)
+		goto error_pm_disable;
+
+	ceudev->asds[0]			= &ceudev->asd;
+	ceudev->notifier.v4l2_dev	= &ceudev->v4l2_dev;
+	ceudev->notifier.subdevs	= ceudev->asds;
+	ceudev->notifier.num_subdevs	= 1;
+	ceudev->notifier.bound		= ceu_sensor_bound;
+	ret = v4l2_async_notifier_register(&ceudev->v4l2_dev,
+					   &ceudev->notifier);
+	if (ret)
+		goto error_v4l2_unregister;
+
+	return 0;
+
+error_v4l2_unregister:
+	v4l2_device_unregister(&ceudev->v4l2_dev);
+error_pm_disable:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int ceu_remove(struct platform_device *pdev)
+{
+	struct ceu_device *ceudev = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(ceudev->dev);
+
+	v4l2_async_notifier_unregister(&ceudev->notifier);
+	v4l2_device_unregister(&ceudev->v4l2_dev);
+
+	video_unregister_device(&ceudev->vdev);
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id ceu_of_match[] = {
+	/* FIXME: find a better "compatible" string, maybe */
+	{ .compatible = "renesas,renesas-ceu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ceu_of_match);
+#endif
+
+static const struct dev_pm_ops ceu_pm_ops = {
+	SET_RUNTIME_PM_OPS(ceu_runtime_suspend,
+			   ceu_runtime_resume,
+			   NULL)
+};
+
+static struct platform_driver ceu_driver = {
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.pm	= &ceu_pm_ops,
+		.of_match_table = of_match_ptr(ceu_of_match),
+	},
+	.probe		= ceu_probe,
+	.remove		= ceu_remove,
+};
+
+module_platform_driver(ceu_driver);
+
+MODULE_DESCRIPTION("Renesas CEU camera driver");
+MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org>");
+MODULE_LICENSE("GPL");
--
2.7.4
