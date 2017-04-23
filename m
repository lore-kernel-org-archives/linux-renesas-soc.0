Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:56812 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163301AbdDWTC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 15:02:29 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id 7ADFC47ED59
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Apr 2017 21:02:27 +0200 (CEST)
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC] media: platform: Move SH CEU away from soc_camera
Date: Sun, 23 Apr 2017 21:02:14 +0200
Message-Id: <1492974134-11580-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove dependencies from soc_camera framework for SH Mobile CEU driver.
The driver has not been moved away from soc_camera/ subdirectory to ease
review.
---

Hello Renesas list,
   this is a first attempt to move SH Mobile CEU driver away from soc_camera
framework.

The driver is -not tested- for lack of available platforms, just compiled in.
Sending it as RFC to collect early feedbacks.

The driver lacks functionalities provided by the original one, such as
re-scaling and cropping, originally performed using soc_camera provided helpers.
Not yet sharing with linux-media but with original driver authors only, and
Renesas SoC list.

I will move the driver away from drivers/media/platform/soc_camera later, but
to ease review I'm sending it as a patch on top of the currently in-tree one.

I'm particularly interested in feedbacks in size/bus_parameters configuration
functions. While I have used most of the original driver code for functions
dealing with hardware configuration, those two have changed quite a lot, as the
number of FIXMEs and TODOs there show.

Also I have sent this as a single patch. I hope this doesn't make reviewing it
too painful.

Thanks
   j


 drivers/media/platform/soc_camera/Kconfig          |    2 +-
 .../platform/soc_camera/sh_mobile_ceu_camera.c     | 1972 +++++++++-----------
 2 files changed, 874 insertions(+), 1100 deletions(-)

diff --git a/drivers/media/platform/soc_camera/Kconfig b/drivers/media/platform/soc_camera/Kconfig
index 86d7478..8a705d2 100644
--- a/drivers/media/platform/soc_camera/Kconfig
+++ b/drivers/media/platform/soc_camera/Kconfig
@@ -19,7 +19,7 @@ config SOC_CAMERA_PLATFORM

 config VIDEO_SH_MOBILE_CEU
 	tristate "SuperH Mobile CEU Interface driver"
-	depends on VIDEO_DEV && SOC_CAMERA && HAS_DMA && HAVE_CLK
+	depends on VIDEO_DEV && VIDEO_V4L2 && HAS_DMA && HAVE_CLK
 	depends on ARCH_SHMOBILE || COMPILE_TEST
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c b/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
index a15bfb5..877ccab 100644
--- a/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
+++ b/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
@@ -1,6 +1,10 @@
 /*
  * V4L2 Driver for SuperH Mobile CEU interface
  *
+ * Copyright (C) 2017 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ *
+ * Base on soc-camera driver "soc_camera/sh_mobile_ceu_camera.c"
+ *
  * Copyright (C) 2008 Magnus Damm
  *
  * Based on V4L2 Driver for PXA camera host - "pxa_camera.c",
@@ -22,11 +26,9 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fs.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
-#include <linux/moduleparam.h>
 #include <linux/of.h>
 #include <linux/time.h>
 #include <linux/slab.h>
@@ -34,18 +36,16 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/pm_runtime.h>
-#include <linux/sched.h>

 #include <media/v4l2-async.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
 #include <media/v4l2-dev.h>
-#include <media/soc_camera.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-image-sizes.h>
 #include <media/drv-intf/sh_mobile_ceu.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-mediabus.h>
-#include <media/drv-intf/soc_mediabus.h>
-
-#include "soc_scale_crop.h"

 /* register offsets for sh7722 / sh7723 */

@@ -83,21 +83,36 @@
 #define CDBYR2 0x98 /* Capture data bottom-field address Y register 2 */
 #define CDBCR2 0x9c /* Capture data bottom-field address C register 2 */

-#undef DEBUG_GEOMETRY
-#ifdef DEBUG_GEOMETRY
-#define dev_geo	dev_info
-#else
-#define dev_geo	dev_dbg
-#endif
+#define CEU_BUS_FLAGS (V4L2_MBUS_MASTER		     |  \
+			V4L2_MBUS_PCLK_SAMPLE_RISING |	\
+			V4L2_MBUS_HSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_HSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_VSYNC_ACTIVE_HIGH  |	\
+			V4L2_MBUS_VSYNC_ACTIVE_LOW   |	\
+			V4L2_MBUS_DATA_ACTIVE_HIGH)

 /* per video frame buffer */
-struct sh_mobile_ceu_buffer {
+struct sh_ceu_buffer {
 	struct vb2_v4l2_buffer vb; /* v4l buffer must be first */
 	struct list_head queue;
 };

-struct sh_mobile_ceu_dev {
-	struct soc_camera_host ici;
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

 	unsigned int irq;
 	void __iomem *base;
@@ -108,7 +123,13 @@ struct sh_mobile_ceu_dev {
 	struct list_head capture;
 	struct vb2_v4l2_buffer *active;

-	struct sh_mobile_ceu_info *pdata;
+	enum v4l2_field field;
+	struct v4l2_format v4l2_fmt;
+	unsigned int n_active_fmts;
+	struct sh_ceu_fmt **active_fmts;
+	struct sh_ceu_fmt *current_fmt;
+
+	struct sh_ceu_info *pdata;
 	struct completion complete;

 	u32 cflcr;
@@ -117,7 +138,6 @@ struct sh_mobile_ceu_dev {
 	int max_width;
 	int max_height;

-	enum v4l2_field field;
 	int sequence;
 	unsigned long flags;

@@ -126,42 +146,161 @@ struct sh_mobile_ceu_dev {
 	unsigned int frozen:1;
 };

-struct sh_mobile_ceu_cam {
-	/* CEU offsets within the camera output, before the CEU scaler */
-	unsigned int ceu_left;
-	unsigned int ceu_top;
-	/* Client output, as seen by the CEU */
-	unsigned int width;
-	unsigned int height;
-	/*
-	 * User window from S_SELECTION / G_SELECTION, produced by client cropping and
-	 * scaling, CEU scaling and CEU cropping, mapped back onto the client
-	 * input window
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
 	 */
-	struct v4l2_rect subrect;
-	/* Camera cropping rectangle */
-	struct v4l2_rect rect;
-	const struct soc_mbus_pixelfmt *extra_fmt;
-	u32 code;
 };
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

-static struct sh_mobile_ceu_buffer *to_ceu_vb(struct vb2_v4l2_buffer *vbuf)
+	return NULL;
+}
+
+/**
+ * Walk the active formats and get mbus_code matching fourcc
+ */
+static struct sh_ceu_fmt *get_mbus_from_fourcc(struct sh_ceu_dev *pcdev,
+					       u32 pixfmt)
 {
-	return container_of(vbuf, struct sh_mobile_ceu_buffer, vb);
+	struct sh_ceu_fmt *fmt;
+	unsigned int i;
+
+	fmt = pcdev->active_fmts[0];
+	for(i = 0; i < pcdev->n_active_fmts; i++, fmt++)
+		if (fmt->fourcc == pixfmt)
+			return fmt;
+
+	return NULL;
 }

-static void ceu_write(struct sh_mobile_ceu_dev *priv,
+/* ----------------------------------------------------------------------------
+ * SH CEU HW operations
+ */
+static void ceu_write(struct sh_ceu_dev *priv,
 		      unsigned long reg_offs, u32 data)
 {
 	iowrite32(data, priv->base + reg_offs);
 }

-static u32 ceu_read(struct sh_mobile_ceu_dev *priv, unsigned long reg_offs)
+static u32 ceu_read(struct sh_ceu_dev *priv, unsigned long reg_offs)
 {
 	return ioread32(priv->base + reg_offs);
 }

-static int sh_mobile_ceu_soft_reset(struct sh_mobile_ceu_dev *pcdev)
+static int sh_ceu_soft_reset(struct sh_ceu_dev *pcdev)
 {
 	int i, success = 0;

@@ -186,58 +325,13 @@ static int sh_mobile_ceu_soft_reset(struct sh_mobile_ceu_dev *pcdev)
 	}

 	if (2 != success) {
-		dev_warn(pcdev->ici.v4l2_dev.dev, "soft reset time out\n");
+		dev_warn(&pcdev->vdev.dev, "soft reset time out\n");
 		return -EIO;
 	}

 	return 0;
 }

-/*
- *  Videobuf operations
- */
-
-/*
- * .queue_setup() is called to check, whether the driver can accept the
- *		  requested number of buffers and to fill in plane sizes
- *		  for the current frame format if required
- */
-static int sh_mobile_ceu_videobuf_setup(struct vb2_queue *vq,
-			unsigned int *count, unsigned int *num_planes,
-			unsigned int sizes[], struct device *alloc_devs[])
-{
-	struct soc_camera_device *icd = soc_camera_from_vb2q(vq);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-
-	if (!vq->num_buffers)
-		pcdev->sequence = 0;
-
-	if (!*count)
-		*count = 2;
-
-	/* Called from VIDIOC_REQBUFS or in compatibility mode */
-	if (!*num_planes)
-		sizes[0] = icd->sizeimage;
-	else if (sizes[0] < icd->sizeimage)
-		return -EINVAL;
-
-	/* If *num_planes != 0, we have already verified *count. */
-	if (pcdev->video_limit) {
-		size_t size = PAGE_ALIGN(sizes[0]) * *count;
-
-		if (size + pcdev->buf_total > pcdev->video_limit)
-			*count = (pcdev->video_limit - pcdev->buf_total) /
-				PAGE_ALIGN(sizes[0]);
-	}
-
-	*num_planes = 1;
-
-	dev_dbg(icd->parent, "count=%d, size=%u\n", *count, sizes[0]);
-
-	return 0;
-}
-
 #define CEU_CETCR_MAGIC 0x0317f313 /* acknowledge magical interrupt sources */
 #define CEU_CETCR_IGRW (1 << 4) /* prohibited register access interrupt bit */
 #define CEU_CEIER_CPEIE (1 << 0) /* one-frame capture end interrupt */
@@ -245,19 +339,18 @@ static int sh_mobile_ceu_videobuf_setup(struct vb2_queue *vq,
 #define CEU_CAPCR_CTNCP (1 << 16) /* continuous capture mode (if set) */
 #define CEU_CEIER_MASK (CEU_CEIER_CPEIE | CEU_CEIER_VBP)

-
 /*
- * return value doesn't reflex the success/failure to queue the new buffer,
+ * return value doesn't reflect the success/failure to queue the new buffer,
  * but rather the status of the previous buffer.
  */
-static int sh_mobile_ceu_capture(struct sh_mobile_ceu_dev *pcdev)
+static int sh_ceu_capture(struct sh_ceu_dev *pcdev)
 {
-	struct soc_camera_device *icd = pcdev->ici.icd;
+	struct v4l2_pix_format *pix = &pcdev->v4l2_fmt.fmt.pix;
 	dma_addr_t phys_addr_top, phys_addr_bottom;
-	unsigned long top1, top2;
 	unsigned long bottom1, bottom2;
-	u32 status;
+	unsigned long top1, top2;
 	bool planar;
+	u32 status;
 	int ret = 0;

 	/*
@@ -279,10 +372,11 @@ static int sh_mobile_ceu_capture(struct sh_mobile_ceu_dev *pcdev)
 	 * is needed here.
 	 */
 	if (status & CEU_CEIER_VBP) {
-		sh_mobile_ceu_soft_reset(pcdev);
+		sh_ceu_soft_reset(pcdev);
 		ret = -EIO;
 	}

+	/* FIXME: is this still required? */
 	if (pcdev->frozen) {
 		complete(&pcdev->complete);
 		return ret;
@@ -303,10 +397,10 @@ static int sh_mobile_ceu_capture(struct sh_mobile_ceu_dev *pcdev)
 		bottom2	= CDBCR;
 	}

-	phys_addr_top =
-		vb2_dma_contig_plane_dma_addr(&pcdev->active->vb2_buf, 0);
+	phys_addr_top = vb2_dma_contig_plane_dma_addr(&pcdev->active->vb2_buf,
+						      0);

-	switch (icd->current_fmt->host_fmt->fourcc) {
+	switch (pcdev->current_fmt->fourcc) {
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_NV16:
@@ -319,15 +413,16 @@ static int sh_mobile_ceu_capture(struct sh_mobile_ceu_dev *pcdev)

 	ceu_write(pcdev, top1, phys_addr_top);
 	if (V4L2_FIELD_NONE != pcdev->field) {
-		phys_addr_bottom = phys_addr_top + icd->bytesperline;
+		phys_addr_bottom = phys_addr_top + pix->bytesperline;
 		ceu_write(pcdev, bottom1, phys_addr_bottom);
 	}

 	if (planar) {
-		phys_addr_top += icd->bytesperline * icd->user_height;
+		phys_addr_top += pix->bytesperline * pix->height;
 		ceu_write(pcdev, top2, phys_addr_top);
 		if (V4L2_FIELD_NONE != pcdev->field) {
-			phys_addr_bottom = phys_addr_top + icd->bytesperline;
+			phys_addr_bottom = phys_addr_top +
+					   pix->bytesperline;
 			ceu_write(pcdev, bottom2, phys_addr_bottom);
 		}
 	}
@@ -337,10 +432,155 @@ static int sh_mobile_ceu_capture(struct sh_mobile_ceu_dev *pcdev)
 	return ret;
 }

-static int sh_mobile_ceu_videobuf_prepare(struct vb2_buffer *vb)
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
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct sh_mobile_ceu_buffer *buf = to_ceu_vb(vbuf);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);

 	/* Added list head initialization on alloc */
 	WARN(!list_empty(&buf->queue), "Buffer %p on queue!\n", vb);
@@ -348,26 +588,24 @@ static int sh_mobile_ceu_videobuf_prepare(struct vb2_buffer *vb)
 	return 0;
 }

-static void sh_mobile_ceu_videobuf_queue(struct vb2_buffer *vb)
+static void sh_ceu_videobuf_queue(struct vb2_buffer *vb)
 {
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	struct sh_mobile_ceu_buffer *buf = to_ceu_vb(vbuf);
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);
 	unsigned long size;

-	size = icd->sizeimage;
+	size = pcdev->v4l2_fmt.fmt.pix.sizeimage;

 	if (vb2_plane_size(vb, 0) < size) {
-		dev_err(icd->parent, "Buffer #%d too small (%lu < %lu)\n",
+		dev_err(&pcdev->vdev.dev, "Buffer #%d too small (%lu < %lu)\n",
 			vb->index, vb2_plane_size(vb, 0), size);
 		goto error;
 	}

 	vb2_set_plane_payload(vb, 0, size);

-	dev_dbg(icd->parent, "%s (vb=0x%p) 0x%p %lu\n", __func__,
+	dev_dbg(&pcdev->vdev.dev, "%s (vb=0x%p) 0x%p %lu\n", __func__,
 		vb, vb2_plane_vaddr(vb, 0), vb2_get_plane_payload(vb, 0));

 #ifdef DEBUG
@@ -381,16 +619,6 @@ static void sh_mobile_ceu_videobuf_queue(struct vb2_buffer *vb)

 	spin_lock_irq(&pcdev->lock);
 	list_add_tail(&buf->queue, &pcdev->capture);
-
-	if (!pcdev->active) {
-		/*
-		 * Because there were no active buffer at this moment,
-		 * we are not interested in the return value of
-		 * sh_mobile_ceu_capture here.
-		 */
-		pcdev->active = vbuf;
-		sh_mobile_ceu_capture(pcdev);
-	}
 	spin_unlock_irq(&pcdev->lock);

 	return;
@@ -399,13 +627,11 @@ static void sh_mobile_ceu_videobuf_queue(struct vb2_buffer *vb)
 	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
 }

-static void sh_mobile_ceu_videobuf_release(struct vb2_buffer *vb)
+static void sh_ceu_videobuf_release(struct vb2_buffer *vb)
 {
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_buffer *buf = to_ceu_vb(vbuf);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);

 	spin_lock_irq(&pcdev->lock);

@@ -423,308 +649,242 @@ static void sh_mobile_ceu_videobuf_release(struct vb2_buffer *vb)
 		list_del_init(&buf->queue);

 	pcdev->buf_total -= PAGE_ALIGN(vb2_plane_size(vb, 0));
-	dev_dbg(icd->parent, "%s() %zu bytes buffers\n", __func__,
+	dev_dbg(&pcdev->vdev.dev, "%s() %zu bytes buffers\n", __func__,
 		pcdev->buf_total);

 	spin_unlock_irq(&pcdev->lock);
 }

-static int sh_mobile_ceu_videobuf_init(struct vb2_buffer *vb)
+static int sh_ceu_videobuf_init(struct vb2_buffer *vb)
 {
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
+	struct sh_ceu_buffer *buf = to_ceu_vb(vbuf);

 	pcdev->buf_total += PAGE_ALIGN(vb2_plane_size(vb, 0));
-	dev_dbg(icd->parent, "%s() %zu bytes buffers\n", __func__,
+	dev_dbg(&pcdev->vdev.dev, "%s() %zu bytes buffers\n", __func__,
 		pcdev->buf_total);

 	/* This is for locking debugging only */
-	INIT_LIST_HEAD(&to_ceu_vb(vbuf)->queue);
+	INIT_LIST_HEAD(&buf->queue);
 	return 0;
 }

-static void sh_mobile_ceu_stop_streaming(struct vb2_queue *q)
+static int sh_ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct soc_camera_device *icd = soc_camera_from_vb2q(q);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vq);
 	struct list_head *buf_head, *tmp;
+	struct sh_ceu_buffer *buf;
+	int ret = 0;
+
+	ret = v4l2_subdev_call(pcdev->sensor, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		v4l2_err(&pcdev->v4l2_dev, "stream on failed in subdev\n");
+		goto err_start_sensor;
+	}

 	spin_lock_irq(&pcdev->lock);
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

-	pcdev->active = NULL;
+		pcdev->active = &buf->vb;
+		sh_ceu_capture(pcdev);
+	} else {
+		ret = -EINVAL;
+		goto stop_sensor;
+	}

-	list_for_each_safe(buf_head, tmp, &pcdev->capture)
-		list_del_init(buf_head);
+	spin_unlock_irq(&pcdev->lock);
+
+	return 0;

+stop_sensor:
 	spin_unlock_irq(&pcdev->lock);
+	v4l2_subdev_call(pcdev->sensor, video, s_stream, 0);

-	sh_mobile_ceu_soft_reset(pcdev);
-}
+err_start_sensor:
+	spin_lock_irq(&pcdev->lock);

-static const struct vb2_ops sh_mobile_ceu_videobuf_ops = {
-	.queue_setup	= sh_mobile_ceu_videobuf_setup,
-	.buf_prepare	= sh_mobile_ceu_videobuf_prepare,
-	.buf_queue	= sh_mobile_ceu_videobuf_queue,
-	.buf_cleanup	= sh_mobile_ceu_videobuf_release,
-	.buf_init	= sh_mobile_ceu_videobuf_init,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
-	.stop_streaming	= sh_mobile_ceu_stop_streaming,
-};
-
-static irqreturn_t sh_mobile_ceu_irq(int irq, void *data)
-{
-	struct sh_mobile_ceu_dev *pcdev = data;
-	struct vb2_v4l2_buffer *vbuf;
-	int ret;
-
-	spin_lock(&pcdev->lock);
-
-	vbuf = pcdev->active;
-	if (!vbuf)
-		/* Stale interrupt from a released buffer */
-		goto out;
-
-	list_del_init(&to_ceu_vb(vbuf)->queue);
-
-	if (!list_empty(&pcdev->capture))
-		pcdev->active = &list_entry(pcdev->capture.next,
-					    struct sh_mobile_ceu_buffer, queue)->vb;
-	else
-		pcdev->active = NULL;
+	list_for_each_safe(buf_head, tmp, &pcdev->capture)
+		list_del_init(buf_head);

-	ret = sh_mobile_ceu_capture(pcdev);
-	vbuf->vb2_buf.timestamp = ktime_get_ns();
-	if (!ret) {
-		vbuf->field = pcdev->field;
-		vbuf->sequence = pcdev->sequence++;
-	}
-	vb2_buffer_done(&vbuf->vb2_buf,
-			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+	pcdev->active = NULL;

-out:
-	spin_unlock(&pcdev->lock);
+	spin_unlock_irq(&pcdev->lock);

-	return IRQ_HANDLED;
+	return ret;
 }

-static int sh_mobile_ceu_add_device(struct soc_camera_device *icd)
+static void sh_ceu_stop_streaming(struct vb2_queue *vq)
 {
-	dev_info(icd->parent,
-		 "SuperH Mobile CEU driver attached to camera %d\n",
-		 icd->devnum);
+	struct sh_ceu_dev *pcdev = vb2_get_drv_priv(vq);
+	struct list_head *buf_head, *tmp;

-	return 0;
-}
+	v4l2_subdev_call(pcdev->sensor, video, s_stream, 0);

-static void sh_mobile_ceu_remove_device(struct soc_camera_device *icd)
-{
-	dev_info(icd->parent,
-		 "SuperH Mobile CEU driver detached from camera %d\n",
-		 icd->devnum);
-}
-
-/* Called with .host_lock held */
-static int sh_mobile_ceu_clock_start(struct soc_camera_host *ici)
-{
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
+	spin_lock_irq(&pcdev->lock);

-	pm_runtime_get_sync(ici->v4l2_dev.dev);
+	pcdev->active = NULL;

-	pcdev->buf_total = 0;
+	list_for_each_safe(buf_head, tmp, &pcdev->capture)
+		list_del_init(buf_head);

-	sh_mobile_ceu_soft_reset(pcdev);
+	spin_unlock_irq(&pcdev->lock);

-	return 0;
+	sh_ceu_soft_reset(pcdev);
 }

-/* Called with .host_lock held */
-static void sh_mobile_ceu_clock_stop(struct soc_camera_host *ici)
-{
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
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

-	/* disable capture, disable interrupts */
-	ceu_write(pcdev, CEIER, 0);
-	sh_mobile_ceu_soft_reset(pcdev);
+/**
+ * ----------------------------------------------------------------------------
+ *  SH CEU operations
+ */

-	/* make sure active buffer is canceled */
-	spin_lock_irq(&pcdev->lock);
-	if (pcdev->active) {
-		list_del_init(&to_ceu_vb(pcdev->active)->queue);
-		vb2_buffer_done(&pcdev->active->vb2_buf, VB2_BUF_STATE_ERROR);
-		pcdev->active = NULL;
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
 	}
-	spin_unlock_irq(&pcdev->lock);

-	pm_runtime_put(ici->v4l2_dev.dev);
+	return (!hsync || !vsync || !pclk || !data || !mode) ? 0 : common_flags;
 }

-/*
- * See chapter 29.4.12 "Capture Filter Control Register (CFLCR)"
- * in SH7722 Hardware Manual
+/**
+ * Test bus parameters against sensor provided ones.
+ * Return < 0 for error, 0 if g_mbus_config is not supported,
+ * flags > 0  otherwise
  */
-static unsigned int size_dst(unsigned int src, unsigned int scale)
-{
-	unsigned int mant_pre = scale >> 12;
-	if (!src || !scale)
-		return src;
-	return ((mant_pre + 2 * (src - 1)) / (2 * mant_pre) - 1) *
-		mant_pre * 4096 / scale + 1;
-}
-
-static u16 calc_scale(unsigned int src, unsigned int *dst)
+static int sh_ceu_test_bus_param(struct sh_ceu_dev *pcdev)
 {
-	u16 scale;
+	struct v4l2_subdev *sd = pcdev->sensor;
+	unsigned long common_flags = CEU_BUS_FLAGS;
+	struct v4l2_mbus_config cfg = {
+		.type = V4L2_MBUS_PARALLEL,
+	};
+	int ret;

-	if (src == *dst)
+	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
+	if (ret < 0 && ret == -ENOIOCTLCMD)
+		return ret;
+	else if (ret == -ENOIOCTLCMD)
 		return 0;

-	scale = (src * 4096 / *dst) & ~7;
-
-	while (scale > 4096 && size_dst(src, scale) < *dst)
-		scale -= 8;
-
-	*dst = size_dst(src, scale);
+	common_flags = sh_ceu_mbus_config_compatible(&cfg, common_flags);
+	if (!common_flags)
+		return -EINVAL;

-	return scale;
+	return common_flags;
 }

-/* rect is guaranteed to not exceed the scaled camera rectangle */
-static void sh_mobile_ceu_set_rect(struct soc_camera_device *icd)
+/*
+ * This is a very simplified version of "sh_mobile_ceu_set_rect function
+ * found in the original soc_camera driver
+ */
+static void sh_ceu_set_sizes(struct sh_ceu_dev *pcdev)
 {
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_cam *cam = icd->host_priv;
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	unsigned int height, width, cdwdr_width, in_width, in_height;
+	struct v4l2_pix_format *pix = &pcdev->v4l2_fmt.fmt.pix;
+	unsigned int capwr_hwidth, capwr_vwidth;
 	unsigned int left_offset, top_offset;
+	unsigned int height, width;
+	unsigned int cdwdr_width;
 	u32 camor;

-	dev_geo(icd->parent, "Crop %ux%u@%u:%u\n",
-		icd->user_width, icd->user_height, cam->ceu_left, cam->ceu_top);
-
-	left_offset	= cam->ceu_left;
-	top_offset	= cam->ceu_top;
-
-	WARN_ON(icd->user_width & 3 || icd->user_height & 3);
-
-	width = icd->user_width;
-
-	if (pcdev->image_mode) {
-		in_width = cam->width;
-		if (!pcdev->is_16bit) {
-			in_width *= 2;
-			left_offset *= 2;
-		}
-	} else {
-		unsigned int w_factor;
-
-		switch (icd->current_fmt->host_fmt->packing) {
-		case SOC_MBUS_PACKING_2X8_PADHI:
-			w_factor = 2;
-			break;
-		default:
-			w_factor = 1;
-		}
+	/* TODO: make these offsets configurable.
+	 * These are used to configure CAMOR, that wants to know the number of
+	 * blanks between a VS/HS signal and valid data.
+	 * This value should come from the sensor, how should we retrieve it?
+	 */
+	left_offset = 0;
+	top_offset = 0;

-		in_width = cam->width * w_factor;
-		left_offset *= w_factor;
-	}
+	width = pix->width;
+	height = pix->height;

-	cdwdr_width = icd->bytesperline;
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

-	height = icd->user_height;
-	in_height = cam->height;
-	if (V4L2_FIELD_NONE != pcdev->field) {
-		height = (height / 2) & ~3;
-		in_height /= 2;
-		top_offset /= 2;
-		cdwdr_width *= 2;
-	}
+	/* FIXME: not sure what the original driver does here */
+	cdwdr_width = pix->bytesperline;

 	/* Set CAMOR, CAPWR, CFSZR, take care of CDWDR */
 	camor = left_offset | (top_offset << 16);
-
-	dev_geo(icd->parent,
-		"CAMOR 0x%x, CAPWR 0x%x, CFSZR 0x%x, CDWDR 0x%x\n", camor,
-		(in_height << 16) | in_width, (height << 16) | width,
-		cdwdr_width);
-
 	ceu_write(pcdev, CAMOR, camor);
-	ceu_write(pcdev, CAPWR, (in_height << 16) | in_width);
+	ceu_write(pcdev, CAPWR, (capwr_vwidth << 16) | capwr_hwidth);
+
 	/* CFSZR clipping is applied _after_ the scaling filter (CFLCR) */
 	ceu_write(pcdev, CFSZR, (height << 16) | width);
 	ceu_write(pcdev, CDWDR, cdwdr_width);
 }

-static u32 capture_save_reset(struct sh_mobile_ceu_dev *pcdev)
-{
-	u32 capsr = ceu_read(pcdev, CAPSR);
-	ceu_write(pcdev, CAPSR, 1 << 16); /* reset, stop capture */
-	return capsr;
-}
-
-static void capture_restore(struct sh_mobile_ceu_dev *pcdev, u32 capsr)
-{
-	unsigned long timeout = jiffies + 10 * HZ;
-
-	/*
-	 * Wait until the end of the current frame. It can take a long time,
-	 * but if it has been aborted by a CAPSR reset, it shoule exit sooner.
-	 */
-	while ((ceu_read(pcdev, CSTSR) & 1) && time_before(jiffies, timeout))
-		msleep(1);
-
-	if (time_after(jiffies, timeout)) {
-		dev_err(pcdev->ici.v4l2_dev.dev,
-			"Timeout waiting for frame end! Interface problem?\n");
-		return;
-	}
-
-	/* Wait until reset clears, this shall not hang... */
-	while (ceu_read(pcdev, CAPSR) & (1 << 16))
-		udelay(10);
-
-	/* Anything to restore? */
-	if (capsr & ~(1 << 16))
-		ceu_write(pcdev, CAPSR, capsr);
-}
-
-#define CEU_BUS_FLAGS (V4L2_MBUS_MASTER |	\
-		V4L2_MBUS_PCLK_SAMPLE_RISING |	\
-		V4L2_MBUS_HSYNC_ACTIVE_HIGH |	\
-		V4L2_MBUS_HSYNC_ACTIVE_LOW |	\
-		V4L2_MBUS_VSYNC_ACTIVE_HIGH |	\
-		V4L2_MBUS_VSYNC_ACTIVE_LOW |	\
-		V4L2_MBUS_DATA_ACTIVE_HIGH)
-
 /* Capture is not running, no interrupts, no locking needed */
-static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
+static int sh_ceu_set_bus_param(struct sh_ceu_dev *pcdev)
 {
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	struct sh_mobile_ceu_cam *cam = icd->host_priv;
-	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
-	unsigned long value, common_flags = CEU_BUS_FLAGS;
+	struct v4l2_subdev *sd = pcdev->sensor;
+	unsigned long value;
+	unsigned long common_flags = CEU_BUS_FLAGS;
+	struct v4l2_mbus_config cfg = {
+		.type = V4L2_MBUS_PARALLEL,
+	};
 	u32 capsr = capture_save_reset(pcdev);
 	unsigned int yuv_lineskip;
 	int ret;

 	/*
+	 * TODO:
 	 * If the client doesn't implement g_mbus_config, we just use our
 	 * platform data
 	 */
-	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
-	if (!ret) {
-		common_flags = soc_mbus_config_compatible(&cfg,
-							  common_flags);
-		if (!common_flags)
-			return -EINVAL;
-	} else if (ret != -ENOIOCTLCMD) {
-		return ret;
+	common_flags = sh_ceu_test_bus_param(pcdev);
+	if (common_flags < 0)
+		return common_flags;
+	else if (common_flags == 0) {
+		/* TODO: use platform data */
 	}

 	/* Make choises, based on platform preferences */
@@ -749,7 +909,7 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;

-	if (icd->current_fmt->host_fmt->bits_per_sample > 8)
+	if (pcdev->current_fmt->bits_per_sample > 8)
 		pcdev->is_16bit = 1;
 	else
 		pcdev->is_16bit = 0;
@@ -760,7 +920,13 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 	value = 0x00000010; /* data fetch by default */
 	yuv_lineskip = 0x10;

-	switch (icd->current_fmt->host_fmt->fourcc) {
+	/* FIXME:
+	 * this switch statement has been taken from the original driver but it
+	 * re-write bit value[4] to 0 forcing "image capture mode", while the
+	 * comment few lines above says "data fetch by default".
+	 * Was this intended?
+	 */
+	switch (pcdev->current_fmt->fourcc) {
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 		/* convert 4:2:2 -> 4:2:0 */
@@ -768,7 +934,7 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 		/* fall-through */
 	case V4L2_PIX_FMT_NV16:
 	case V4L2_PIX_FMT_NV61:
-		switch (cam->code) {
+		switch (pcdev->current_fmt->mbus_code) {
 		case MEDIA_BUS_FMT_UYVY8_2X8:
 			value = 0x00000000; /* Cb0, Y0, Cr0, Y1 */
 			break;
@@ -786,8 +952,8 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 		}
 	}

-	if (icd->current_fmt->host_fmt->fourcc == V4L2_PIX_FMT_NV21 ||
-	    icd->current_fmt->host_fmt->fourcc == V4L2_PIX_FMT_NV61)
+	if (pcdev->current_fmt->fourcc == V4L2_PIX_FMT_NV21 ||
+	    pcdev->current_fmt->fourcc == V4L2_PIX_FMT_NV61)
 		value ^= 0x00000100; /* swap U, V to change from NV1x->NVx1 */

 	value |= common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW ? 1 << 1 : 0;
@@ -802,7 +968,7 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)

 	ceu_write(pcdev, CAPCR, 0x00300000);

-	switch (pcdev->field) {
+	switch (pcdev->v4l2_fmt.fmt.pix.field) {
 	case V4L2_FIELD_INTERLACED_TB:
 		value = 0x101;
 		break;
@@ -815,11 +981,9 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 	}
 	ceu_write(pcdev, CAIFR, value);

-	sh_mobile_ceu_set_rect(icd);
-	mdelay(1);
+	sh_ceu_set_sizes(pcdev);

-	dev_geo(icd->parent, "CFLCR 0x%x\n", pcdev->cflcr);
-	ceu_write(pcdev, CFLCR, pcdev->cflcr);
+	/* TODO: CFLCR scale down filter not supported yet */

 	/*
 	 * A few words about byte order (observed in Big Endian mode)
@@ -842,808 +1006,426 @@ static int sh_mobile_ceu_set_bus_param(struct soc_camera_device *icd)
 	capture_restore(pcdev, capsr);

 	/* not in bundle mode: skip CBDSR, CDAYR2, CDACR2, CDBYR2, CDBCR2 */
+
 	return 0;
 }

-static int sh_mobile_ceu_try_bus_param(struct soc_camera_device *icd,
-				       unsigned char buswidth)
+/**
+ * Test format on CEU and sensor
+ *
+ * @v4l2_fmt: format to test
+ * @current_fmt: sh ceu format applied
+ */
+static int sh_ceu_try_fmt(struct sh_ceu_dev *pcdev,
+			  struct v4l2_format *v4l2_fmt,
+			  struct sh_ceu_fmt **current_fmt)
 {
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	unsigned long common_flags = CEU_BUS_FLAGS;
-	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
+	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_format sd_format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
+	struct sh_ceu_fmt *mbus_fmt;
+	unsigned int width, height;
 	int ret;

-	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
-	if (!ret)
-		common_flags = soc_mbus_config_compatible(&cfg,
-							  common_flags);
-	else if (ret != -ENOIOCTLCMD)
-		return ret;
-
-	if (!common_flags || buswidth > 16)
-		return -EINVAL;
-
-	return 0;
-}
-
-static const struct soc_mbus_pixelfmt sh_mobile_ceu_formats[] = {
-	{
-		.fourcc			= V4L2_PIX_FMT_NV12,
-		.name			= "NV12",
-		.bits_per_sample	= 8,
-		.packing		= SOC_MBUS_PACKING_1_5X8,
-		.order			= SOC_MBUS_ORDER_LE,
-		.layout			= SOC_MBUS_LAYOUT_PLANAR_2Y_C,
-	}, {
-		.fourcc			= V4L2_PIX_FMT_NV21,
-		.name			= "NV21",
-		.bits_per_sample	= 8,
-		.packing		= SOC_MBUS_PACKING_1_5X8,
-		.order			= SOC_MBUS_ORDER_LE,
-		.layout			= SOC_MBUS_LAYOUT_PLANAR_2Y_C,
-	}, {
-		.fourcc			= V4L2_PIX_FMT_NV16,
-		.name			= "NV16",
-		.bits_per_sample	= 8,
-		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
-		.order			= SOC_MBUS_ORDER_LE,
-		.layout			= SOC_MBUS_LAYOUT_PLANAR_Y_C,
-	}, {
-		.fourcc			= V4L2_PIX_FMT_NV61,
-		.name			= "NV61",
-		.bits_per_sample	= 8,
-		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
-		.order			= SOC_MBUS_ORDER_LE,
-		.layout			= SOC_MBUS_LAYOUT_PLANAR_Y_C,
-	},
-};
+	dev_dbg(&pcdev->vdev.dev, "try format: 0x%x - %ux%u\n\n",
+		pix->pixelformat, pix->width, pix->height);

-/* This will be corrected as we get more formats */
-static bool sh_mobile_ceu_packing_supported(const struct soc_mbus_pixelfmt *fmt)
-{
-	return	fmt->packing == SOC_MBUS_PACKING_NONE ||
-		(fmt->bits_per_sample == 8 &&
-		 fmt->packing == SOC_MBUS_PACKING_1_5X8) ||
-		(fmt->bits_per_sample == 8 &&
-		 fmt->packing == SOC_MBUS_PACKING_2X8_PADHI) ||
-		(fmt->bits_per_sample > 8 &&
-		 fmt->packing == SOC_MBUS_PACKING_EXTEND16);
-}
+	/* CFSZR requires height and width to be 4-pixel aligned */
+	v4l_bound_align_image(&pix->width, 2, pcdev->max_width, 2,
+			      &pix->height, 4, pcdev->max_height, 2, 0);

-static struct soc_camera_device *ctrl_to_icd(struct v4l2_ctrl *ctrl)
-{
-	return container_of(ctrl->handler, struct soc_camera_device,
-							ctrl_handler);
-}
+	width = pix->width;
+	height = pix->height;

-static int sh_mobile_ceu_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct soc_camera_device *icd = ctrl_to_icd(ctrl);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-
-	switch (ctrl->id) {
-	case V4L2_CID_SHARPNESS:
-		switch (icd->current_fmt->host_fmt->fourcc) {
-		case V4L2_PIX_FMT_NV12:
-		case V4L2_PIX_FMT_NV21:
-		case V4L2_PIX_FMT_NV16:
-		case V4L2_PIX_FMT_NV61:
-			ceu_write(pcdev, CLFCR, !ctrl->val);
-			return 0;
-		}
-		break;
+	/* Set format on sensor subdevice */
+	mbus_fmt = get_mbus_from_fourcc(pcdev, pix->pixelformat);
+	if (!mbus_fmt){
+		mbus_fmt = pcdev->active_fmts[0];
+		pix->pixelformat = mbus_fmt->fourcc;
 	}

-	return -EINVAL;
-}
-
-static const struct v4l2_ctrl_ops sh_mobile_ceu_ctrl_ops = {
-	.s_ctrl = sh_mobile_ceu_s_ctrl,
-};
+	v4l2_fill_mbus_format(&sd_format.format, pix, mbus_fmt->mbus_code);

-static int sh_mobile_ceu_get_formats(struct soc_camera_device *icd, unsigned int idx,
-				     struct soc_camera_format_xlate *xlate)
-{
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	struct device *dev = icd->parent;
-	struct soc_camera_host *ici = to_soc_camera_host(dev);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	int ret, k, n;
-	int formats = 0;
-	struct sh_mobile_ceu_cam *cam;
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.index = idx,
-	};
-	const struct soc_mbus_pixelfmt *fmt;
+	ret = v4l2_subdev_call(sensor, pad, set_fmt, &pad_cfg, &sd_format);
+	if (ret)
+		return ret;

-	ret = v4l2_subdev_call(sd, pad, enum_mbus_code, NULL, &code);
-	if (ret < 0)
-		/* No more formats */
-		return 0;
+	/* TODO: scale CEU format to match what is returned by subdevice */

-	fmt = soc_mbus_get_fmtdesc(code.code);
-	if (!fmt) {
-		dev_warn(dev, "unsupported format code #%u: %d\n", idx, code.code);
-		return 0;
-	}
+	v4l2_fill_pix_format(pix, &sd_format.format);
+	pix->field		= V4L2_FIELD_NONE;
+	pix->bytesperline	= pix->width * mbus_fmt->bpp / 8;
+	pix->sizeimage		= pix->height * pix->bytesperline;

-	ret = sh_mobile_ceu_try_bus_param(icd, fmt->bits_per_sample);
+	/* Test bus parameters */
+	ret = sh_ceu_test_bus_param(pcdev);
 	if (ret < 0)
-		return 0;
-
-	if (!icd->host_priv) {
-		struct v4l2_subdev_format fmt = {
-			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		};
-		struct v4l2_mbus_framefmt *mf = &fmt.format;
-		struct v4l2_rect rect;
-		int shift = 0;
-
-		/* Add our control */
-		v4l2_ctrl_new_std(&icd->ctrl_handler, &sh_mobile_ceu_ctrl_ops,
-				  V4L2_CID_SHARPNESS, 0, 1, 1, 1);
-		if (icd->ctrl_handler.error)
-			return icd->ctrl_handler.error;
-
-		/* FIXME: subwindow is lost between close / open */
-
-		/* Cache current client geometry */
-		ret = soc_camera_client_g_rect(sd, &rect);
-		if (ret < 0)
-			return ret;
-
-		/* First time */
-		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
-		if (ret < 0)
-			return ret;
-
-		/*
-		 * All currently existing CEU implementations support 2560x1920
-		 * or larger frames. If the sensor is proposing too big a frame,
-		 * don't bother with possibly supportred by the CEU larger
-		 * sizes, just try VGA multiples. If needed, this can be
-		 * adjusted in the future.
-		 */
-		while ((mf->width > pcdev->max_width ||
-			mf->height > pcdev->max_height) && shift < 4) {
-			/* Try 2560x1920, 1280x960, 640x480, 320x240 */
-			mf->width	= 2560 >> shift;
-			mf->height	= 1920 >> shift;
-			ret = v4l2_device_call_until_err(sd->v4l2_dev,
-					soc_camera_grp_id(icd), pad,
-					set_fmt, NULL, &fmt);
-			if (ret < 0)
-				return ret;
-			shift++;
-		}
-
-		if (shift == 4) {
-			dev_err(dev, "Failed to configure the client below %ux%x\n",
-				mf->width, mf->height);
-			return -EIO;
-		}
-
-		dev_geo(dev, "camera fmt %ux%u\n", mf->width, mf->height);
-
-		cam = kzalloc(sizeof(*cam), GFP_KERNEL);
-		if (!cam)
-			return -ENOMEM;
-
-		/* We are called with current camera crop, initialise subrect with it */
-		cam->rect	= rect;
-		cam->subrect	= rect;
-
-		cam->width	= mf->width;
-		cam->height	= mf->height;
-
-		icd->host_priv = cam;
-	} else {
-		cam = icd->host_priv;
-	}
-
-	/* Beginning of a pass */
-	if (!idx)
-		cam->extra_fmt = NULL;
-
-	switch (code.code) {
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-	case MEDIA_BUS_FMT_VYUY8_2X8:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YVYU8_2X8:
-		if (cam->extra_fmt)
-			break;
-
-		/*
-		 * Our case is simple so far: for any of the above four camera
-		 * formats we add all our four synthesized NV* formats, so,
-		 * just marking the device with a single flag suffices. If
-		 * the format generation rules are more complex, you would have
-		 * to actually hang your already added / counted formats onto
-		 * the host_priv pointer and check whether the format you're
-		 * going to add now is already there.
-		 */
-		cam->extra_fmt = sh_mobile_ceu_formats;
-
-		n = ARRAY_SIZE(sh_mobile_ceu_formats);
-		formats += n;
-		for (k = 0; xlate && k < n; k++) {
-			xlate->host_fmt	= &sh_mobile_ceu_formats[k];
-			xlate->code	= code.code;
-			xlate++;
-			dev_dbg(dev, "Providing format %s using code %d\n",
-				sh_mobile_ceu_formats[k].name, code.code);
-		}
-		break;
-	default:
-		if (!sh_mobile_ceu_packing_supported(fmt))
-			return 0;
-	}
-
-	/* Generic pass-through */
-	formats++;
-	if (xlate) {
-		xlate->host_fmt	= fmt;
-		xlate->code	= code.code;
-		xlate++;
-		dev_dbg(dev, "Providing format %s in pass-through mode\n",
-			fmt->name);
-	}
+		return ret;

-	return formats;
-}
+	if (current_fmt)
+		*current_fmt = mbus_fmt;

-static void sh_mobile_ceu_put_formats(struct soc_camera_device *icd)
-{
-	kfree(icd->host_priv);
-	icd->host_priv = NULL;
+	return 0;
 }

-#define scale_down(size, scale) soc_camera_shift_scale(size, 12, scale)
-#define calc_generic_scale(in, out) soc_camera_calc_scale(in, 12, out)
-
-/*
- * CEU can scale and crop, but we don't want to waste bandwidth and kill the
- * framerate by always requesting the maximum image from the client. See
- * Documentation/video4linux/sh_mobile_ceu_camera.txt for a description of
- * scaling and cropping algorithms and for the meaning of referenced here steps.
- */
-static int sh_mobile_ceu_set_selection(struct soc_camera_device *icd,
-				       struct v4l2_selection *sel)
+static int sh_ceu_set_fmt(struct sh_ceu_dev *pcdev,
+			  struct v4l2_format *v4l2_fmt)
 {
-	struct v4l2_rect *rect = &sel->r;
-	struct device *dev = icd->parent;
-	struct soc_camera_host *ici = to_soc_camera_host(dev);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	struct v4l2_selection cam_sel;
-	struct sh_mobile_ceu_cam *cam = icd->host_priv;
-	struct v4l2_rect *cam_rect = &cam_sel.r;
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	struct v4l2_subdev_format fmt = {
+	struct sh_ceu_fmt *current_fmt;
+	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	struct v4l2_mbus_framefmt *mf = &fmt.format;
-	unsigned int scale_cam_h, scale_cam_v, scale_ceu_h, scale_ceu_v,
-		out_width, out_height;
-	int interm_width, interm_height;
-	u32 capsr, cflcr;
 	int ret;

-	dev_geo(dev, "S_SELECTION(%ux%u@%u:%u)\n", rect->width, rect->height,
-		rect->left, rect->top);
-
-	/* During camera cropping its output window can change too, stop CEU */
-	capsr = capture_save_reset(pcdev);
-	dev_dbg(dev, "CAPSR 0x%x, CFLCR 0x%x\n", capsr, pcdev->cflcr);
-
-	/*
-	 * 1. - 2. Apply iterative camera S_SELECTION for new input window, read back
-	 * actual camera rectangle.
-	 */
-	ret = soc_camera_client_s_selection(sd, sel, &cam_sel,
-				       &cam->rect, &cam->subrect);
-	if (ret < 0)
+	ret = sh_ceu_try_fmt(pcdev, v4l2_fmt, &current_fmt);
+	if (ret)
 		return ret;

-	dev_geo(dev, "1-2: camera cropped to %ux%u@%u:%u\n",
-		cam_rect->width, cam_rect->height,
-		cam_rect->left, cam_rect->top);
-
-	/* On success cam_crop contains current camera crop */
-
-	/* 3. Retrieve camera output window */
-	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
-	if (ret < 0)
+	v4l2_fill_mbus_format(&format.format, &v4l2_fmt->fmt.pix,
+			      current_fmt->mbus_code);
+	ret = v4l2_subdev_call(pcdev->sensor, pad,
+			       set_fmt, NULL, &format);
+	if (ret)
 		return ret;

-	if (mf->width > pcdev->max_width || mf->height > pcdev->max_height)
-		return -EINVAL;
-
-	/* 4. Calculate camera scales */
-	scale_cam_h	= calc_generic_scale(cam_rect->width, mf->width);
-	scale_cam_v	= calc_generic_scale(cam_rect->height, mf->height);
-
-	/* Calculate intermediate window */
-	interm_width	= scale_down(rect->width, scale_cam_h);
-	interm_height	= scale_down(rect->height, scale_cam_v);
+	pcdev->v4l2_fmt = *v4l2_fmt;
+	pcdev->current_fmt = current_fmt;

-	if (interm_width < icd->user_width) {
-		u32 new_scale_h;
+	ret = sh_ceu_set_bus_param(pcdev);
+	if (ret)
+		return ret;

-		new_scale_h = calc_generic_scale(rect->width, icd->user_width);
+	return 0;
+}

-		mf->width = scale_down(cam_rect->width, new_scale_h);
-	}
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

-	if (interm_height < icd->user_height) {
-		u32 new_scale_v;
+	struct v4l2_subdev_mbus_code_enum mbus_code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.index = 0,
+	};

-		new_scale_v = calc_generic_scale(rect->height, icd->user_height);
+	/* Count how may formats are supported by CEU and sensor subdevice */
+	n_active_fmts = 0;
+	while (!v4l2_subdev_call(sensor, pad, enum_mbus_code,
+				 NULL, &mbus_code)) {
+		mbus_code.index++;

-		mf->height = scale_down(cam_rect->height, new_scale_v);
-	}
+		fmt = get_ceu_fmt_from_mbus(mbus_code.code);
+		if (!fmt)
+			continue;

-	if (interm_width < icd->user_width || interm_height < icd->user_height) {
-		ret = v4l2_device_call_until_err(sd->v4l2_dev,
-					soc_camera_grp_id(icd), pad,
-					set_fmt, NULL, &fmt);
-		if (ret < 0)
-			return ret;
-
-		dev_geo(dev, "New camera output %ux%u\n", mf->width, mf->height);
-		scale_cam_h	= calc_generic_scale(cam_rect->width, mf->width);
-		scale_cam_v	= calc_generic_scale(cam_rect->height, mf->height);
-		interm_width	= scale_down(rect->width, scale_cam_h);
-		interm_height	= scale_down(rect->height, scale_cam_v);
+		fmt->active = 1;
+		n_active_fmts++;
 	}

-	/* Cache camera output window */
-	cam->width	= mf->width;
-	cam->height	= mf->height;
-
-	if (pcdev->image_mode) {
-		out_width	= min(interm_width, icd->user_width);
-		out_height	= min(interm_height, icd->user_height);
-	} else {
-		out_width	= interm_width;
-		out_height	= interm_height;
-	}
+	if (n_active_fmts == 0)
+		return -ENXIO;

-	/*
-	 * 5. Calculate CEU scales from camera scales from results of (5) and
-	 *    the user window
-	 */
-	scale_ceu_h	= calc_scale(interm_width, &out_width);
-	scale_ceu_v	= calc_scale(interm_height, &out_height);
+	pcdev->n_active_fmts = n_active_fmts;
+	pcdev->active_fmts = devm_kcalloc(&pcdev->vdev.dev, n_active_fmts,
+					  sizeof(*pcdev->active_fmts),
+					  GFP_KERNEL);
+	if (!pcdev->active_fmts)
+		return -ENOMEM;

-	dev_geo(dev, "5: CEU scales %u:%u\n", scale_ceu_h, scale_ceu_v);
+	active_fmts = pcdev->active_fmts[0];
+	fmt = &sh_ceu_fmts[0];
+	for (i = 0; i < N_SH_CEU_FMT; i++, fmt++) {
+		if (!fmt->active)
+			continue;

-	/* Apply CEU scales. */
-	cflcr = scale_ceu_h | (scale_ceu_v << 16);
-	if (cflcr != pcdev->cflcr) {
-		pcdev->cflcr = cflcr;
-		ceu_write(pcdev, CFLCR, cflcr);
+		active_fmts = fmt;
+		active_fmts++;
 	}

-	icd->user_width	 = out_width & ~3;
-	icd->user_height = out_height & ~3;
-	/* Offsets are applied at the CEU scaling filter input */
-	cam->ceu_left	 = scale_down(rect->left - cam_rect->left, scale_cam_h) & ~1;
-	cam->ceu_top	 = scale_down(rect->top - cam_rect->top, scale_cam_v) & ~1;
-
-	/* 6. Use CEU cropping to crop to the new window. */
-	sh_mobile_ceu_set_rect(icd);
-
-	cam->subrect = *rect;
-
-	dev_geo(dev, "6: CEU cropped to %ux%u@%u:%u\n",
-		icd->user_width, icd->user_height,
-		cam->ceu_left, cam->ceu_top);
-
-	/* Restore capture. The CE bit can be cleared by the hardware */
-	if (pcdev->active)
-		capsr |= 1;
-	capture_restore(pcdev, capsr);
-
-	/* Even if only camera cropping succeeded */
-	return ret;
+	return 0;
 }

-static int sh_mobile_ceu_get_selection(struct soc_camera_device *icd,
-				       struct v4l2_selection *sel)
+static int sh_ceu_set_default_fmt(struct sh_ceu_dev *pcdev)
 {
-	struct sh_mobile_ceu_cam *cam = icd->host_priv;
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

-	sel->r = cam->subrect;
+	ret = sh_ceu_try_fmt(pcdev, &v4l2_fmt, NULL);
+	if (ret)
+		return ret;
+
+	pcdev->current_fmt = pcdev->active_fmts[0];
+	pcdev->v4l2_fmt = v4l2_fmt;

 	return 0;
 }

-/* Similar to set_crop multistage iterative algorithm */
-static int sh_mobile_ceu_set_fmt(struct soc_camera_device *icd,
-				 struct v4l2_format *f)
+/**
+ * ----------------------------------------------------------------------------
+ *  File Operations
+ */
+static int sh_ceu_open(struct file *file)
 {
-	struct device *dev = icd->parent;
-	struct soc_camera_host *ici = to_soc_camera_host(dev);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	struct sh_mobile_ceu_cam *cam = icd->host_priv;
-	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_mbus_framefmt mf;
-	__u32 pixfmt = pix->pixelformat;
-	const struct soc_camera_format_xlate *xlate;
-	unsigned int ceu_sub_width = pcdev->max_width,
-		ceu_sub_height = pcdev->max_height;
-	u16 scale_v, scale_h;
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct v4l2_subdev *sensor = pcdev->sensor;
 	int ret;
-	bool image_mode;
-	enum v4l2_field field;
-
-	switch (pix->field) {
-	default:
-		pix->field = V4L2_FIELD_NONE;
-		/* fall-through */
-	case V4L2_FIELD_INTERLACED_TB:
-	case V4L2_FIELD_INTERLACED_BT:
-	case V4L2_FIELD_NONE:
-		field = pix->field;
-		break;
-	case V4L2_FIELD_INTERLACED:
-		field = V4L2_FIELD_INTERLACED_TB;
-		break;
-	}
-
-	xlate = soc_camera_xlate_by_fourcc(icd, pixfmt);
-	if (!xlate) {
-		dev_warn(dev, "Format %x not found\n", pixfmt);
-		return -EINVAL;
-	}

-	/* 1.-4. Calculate desired client output geometry */
-	soc_camera_calc_client_output(icd, &cam->rect, &cam->subrect, pix, &mf, 12);
-	mf.field	= pix->field;
-	mf.colorspace	= pix->colorspace;
-	mf.code		= xlate->code;
+	mutex_lock(&pcdev->mlock);
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto out;

-	switch (pixfmt) {
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		image_mode = true;
-		break;
-	default:
-		image_mode = false;
+	sh_ceu_clock_start(pcdev);
+	ret = v4l2_subdev_call(sensor, core, s_power, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		v4l2_fh_release(file);
+		goto out;
 	}

-	dev_geo(dev, "S_FMT(pix=0x%x, fld 0x%x, code 0x%x, %ux%u)\n", pixfmt, mf.field, mf.code,
-		pix->width, pix->height);
-
-	dev_geo(dev, "4: request camera output %ux%u\n", mf.width, mf.height);
-
-	/* 5. - 9. */
-	ret = soc_camera_client_scale(icd, &cam->rect, &cam->subrect,
-				&mf, &ceu_sub_width, &ceu_sub_height,
-				image_mode && V4L2_FIELD_NONE == field, 12);
-
-	dev_geo(dev, "5-9: client scale return %d\n", ret);
-
-	/* Done with the camera. Now see if we can improve the result */
-
-	dev_geo(dev, "fmt %ux%u, requested %ux%u\n",
-		mf.width, mf.height, pix->width, pix->height);
-	if (ret < 0)
-		return ret;
-
-	if (mf.code != xlate->code)
-		return -EINVAL;
-
-	/* 9. Prepare CEU crop */
-	cam->width = mf.width;
-	cam->height = mf.height;
-
-	/* 10. Use CEU scaling to scale to the requested user window. */
-
-	/* We cannot scale up */
-	if (pix->width > ceu_sub_width)
-		ceu_sub_width = pix->width;
-
-	if (pix->height > ceu_sub_height)
-		ceu_sub_height = pix->height;
-
-	pix->colorspace = mf.colorspace;
-
-	if (image_mode) {
-		/* Scale pix->{width x height} down to width x height */
-		scale_h		= calc_scale(ceu_sub_width, &pix->width);
-		scale_v		= calc_scale(ceu_sub_height, &pix->height);
-	} else {
-		pix->width	= ceu_sub_width;
-		pix->height	= ceu_sub_height;
-		scale_h		= 0;
-		scale_v		= 0;
+	ret = sh_ceu_set_fmt(pcdev, &pcdev->v4l2_fmt);
+	if (ret) {
+		v4l2_subdev_call(sensor, core, s_power, 0);
+		v4l2_fh_release(file);
 	}

-	pcdev->cflcr = scale_h | (scale_v << 16);
-
-	/*
-	 * We have calculated CFLCR, the actual configuration will be performed
-	 * in sh_mobile_ceu_set_bus_param()
-	 */
+out:
+	mutex_unlock(&pcdev->mlock);
+	return ret;
+}

-	dev_geo(dev, "10: W: %u : 0x%x = %u, H: %u : 0x%x = %u\n",
-		ceu_sub_width, scale_h, pix->width,
-		ceu_sub_height, scale_v, pix->height);
+static int sh_ceu_release(struct file *file)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct v4l2_subdev *sensor = pcdev->sensor;
+	int ret;

-	cam->code		= xlate->code;
-	icd->current_fmt	= xlate;
+	mutex_lock(&pcdev->mlock);

-	pcdev->field = field;
-	pcdev->image_mode = image_mode;
+	ret = _vb2_fop_release(file, NULL);
+	v4l2_subdev_call(sensor, core, s_power, 0);
+	sh_ceu_clock_stop(pcdev);
+	v4l2_fh_release(file);

-	/* CFSZR requirement */
-	pix->width	&= ~3;
-	pix->height	&= ~3;
+	mutex_unlock(&pcdev->mlock);

 	return 0;
 }

-#define CEU_CHDW_MAX	8188U	/* Maximum line stride */
+static const struct v4l2_file_operations sh_ceu_fops = {
+	.owner			= THIS_MODULE,
+	.open			= sh_ceu_open,
+	.release		= sh_ceu_release,
+	.unlocked_ioctl		= video_ioctl2,
+	.read			= vb2_fop_read,
+	.mmap			= vb2_fop_mmap,
+	.poll			= vb2_fop_poll,
+};

-static int sh_mobile_ceu_try_fmt(struct soc_camera_device *icd,
-				 struct v4l2_format *f)
+/**
+ * ----------------------------------------------------------------------------
+ *  Video Device IOCTLs
+ */
+static int sh_ceu_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
 {
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	const struct soc_camera_format_xlate *xlate;
-	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_format format = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_mbus_framefmt *mf = &format.format;
-	__u32 pixfmt = pix->pixelformat;
-	int width, height;
-	int ret;
-
-	dev_geo(icd->parent, "TRY_FMT(pix=0x%x, %ux%u)\n",
-		 pixfmt, pix->width, pix->height);
-
-	xlate = soc_camera_xlate_by_fourcc(icd, pixfmt);
-	if (!xlate) {
-		xlate = icd->current_fmt;
-		dev_dbg(icd->parent, "Format %x not found, keeping %x\n",
-			pixfmt, xlate->host_fmt->fourcc);
-		pixfmt = xlate->host_fmt->fourcc;
-		pix->pixelformat = pixfmt;
-		pix->colorspace = icd->colorspace;
-	}
-
-	/* FIXME: calculate using depth and bus width */
+	strlcpy(cap->card, "SuperH_Mobile_CEU", sizeof(cap->card));
+	strlcpy(cap->driver, "sh_mobile_ceu", sizeof(cap->driver));
+	strlcpy(cap->bus_info, "platform:sh_mobile_ceu", sizeof(cap->bus_info));
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;

-	/* CFSZR requires height and width to be 4-pixel aligned */
-	v4l_bound_align_image(&pix->width, 2, pcdev->max_width, 2,
-			      &pix->height, 4, pcdev->max_height, 2, 0);
+	return 0;
+}

-	width = pix->width;
-	height = pix->height;
+static int sh_ceu_enum_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);
+	struct sh_ceu_fmt *fmt;

-	/* limit to sensor capabilities */
-	mf->width	= pix->width;
-	mf->height	= pix->height;
-	mf->field	= pix->field;
-	mf->code	= xlate->code;
-	mf->colorspace	= pix->colorspace;
+	if (f->index >= pcdev->n_active_fmts)
+		return -EINVAL;

-	ret = v4l2_device_call_until_err(sd->v4l2_dev, soc_camera_grp_id(icd),
-					 pad, set_fmt, &pad_cfg, &format);
-	if (ret < 0)
-		return ret;
+	fmt = pcdev->active_fmts[f->index];
+	strncpy(f->description, fmt->name, strlen(fmt->name));
+	f->pixelformat = fmt->fourcc;

-	pix->width	= mf->width;
-	pix->height	= mf->height;
-	pix->field	= mf->field;
-	pix->colorspace	= mf->colorspace;
+	return 0;
+}

-	switch (pixfmt) {
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		/* FIXME: check against rect_max after converting soc-camera */
-		/* We can scale precisely, need a bigger image from camera */
-		if (pix->width < width || pix->height < height) {
-			/*
-			 * We presume, the sensor behaves sanely, i.e., if
-			 * requested a bigger rectangle, it will not return a
-			 * smaller one.
-			 */
-			mf->width = pcdev->max_width;
-			mf->height = pcdev->max_height;
-			ret = v4l2_device_call_until_err(sd->v4l2_dev,
-					soc_camera_grp_id(icd), pad,
-					set_fmt, &pad_cfg, &format);
-			if (ret < 0) {
-				/* Shouldn't actually happen... */
-				dev_err(icd->parent,
-					"FIXME: client try_fmt() = %d\n", ret);
-				return ret;
-			}
-		}
-		/* We will scale exactly */
-		if (mf->width > width)
-			pix->width = width;
-		if (mf->height > height)
-			pix->height = height;
-
-		pix->bytesperline = max(pix->bytesperline, pix->width);
-		pix->bytesperline = min(pix->bytesperline, CEU_CHDW_MAX);
-		pix->bytesperline &= ~3;
-		break;
+static int sh_ceu_try_fmt_vid_cap(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);

-	default:
-		/* Configurable stride isn't supported in pass-through mode. */
-		pix->bytesperline  = 0;
-	}
+	return sh_ceu_try_fmt(pcdev, f, NULL);
+}

-	pix->width	&= ~3;
-	pix->height	&= ~3;
-	pix->sizeimage	= 0;
+static int sh_ceu_s_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct sh_ceu_dev *pcdev = video_drvdata(file);

-	dev_geo(icd->parent, "%s(): return %d, fmt 0x%x, %ux%u\n",
-		__func__, ret, pix->pixelformat, pix->width, pix->height);
+	if (vb2_is_streaming(&pcdev->vb2_vq))
+		return -EBUSY;

-	return ret;
+	return sh_ceu_set_fmt(pcdev, f);
 }

-static int sh_mobile_ceu_set_liveselection(struct soc_camera_device *icd,
-					   struct v4l2_selection *sel)
+static int sh_ceu_enum_input(struct file *file, void *priv,
+			   struct v4l2_input *inp)
 {
-	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
-	struct sh_mobile_ceu_dev *pcdev = ici->priv;
-	u32 out_width = icd->user_width, out_height = icd->user_height;
-	int ret;
+	if (inp->index != 0)
+		return -EINVAL;

-	/* Freeze queue */
-	pcdev->frozen = 1;
-	/* Wait for frame */
-	ret = wait_for_completion_interruptible(&pcdev->complete);
-	/* Stop the client */
-	ret = v4l2_subdev_call(sd, video, s_stream, 0);
-	if (ret < 0)
-		dev_warn(icd->parent,
-			 "Client failed to stop the stream: %d\n", ret);
-	else
-		/* Do the crop, if it fails, there's nothing more we can do */
-		sh_mobile_ceu_set_selection(icd, sel);
-
-	dev_geo(icd->parent, "Output after crop: %ux%u\n", icd->user_width, icd->user_height);
-
-	if (icd->user_width != out_width || icd->user_height != out_height) {
-		struct v4l2_format f = {
-			.type	= V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.fmt.pix	= {
-				.width		= out_width,
-				.height		= out_height,
-				.pixelformat	= icd->current_fmt->host_fmt->fourcc,
-				.field		= pcdev->field,
-				.colorspace	= icd->colorspace,
-			},
-		};
-		ret = sh_mobile_ceu_set_fmt(icd, &f);
-		if (!ret && (out_width != f.fmt.pix.width ||
-			     out_height != f.fmt.pix.height))
-			ret = -EINVAL;
-		if (!ret) {
-			icd->user_width		= out_width & ~3;
-			icd->user_height	= out_height & ~3;
-			ret = sh_mobile_ceu_set_bus_param(icd);
-		}
-	}
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	inp->std = 0;
+	strcpy(inp->name, "Camera");

-	/* Thaw the queue */
-	pcdev->frozen = 0;
-	spin_lock_irq(&pcdev->lock);
-	sh_mobile_ceu_capture(pcdev);
-	spin_unlock_irq(&pcdev->lock);
-	/* Start the client */
-	ret = v4l2_subdev_call(sd, video, s_stream, 1);
-	return ret;
+	return 0;
 }

-static unsigned int sh_mobile_ceu_poll(struct file *file, poll_table *pt)
+static int sh_ceu_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct soc_camera_device *icd = file->private_data;
+	*i = 0;

-	return vb2_poll(&icd->vb2_vidq, file, pt);
+	return 0;
 }

-static int sh_mobile_ceu_querycap(struct soc_camera_host *ici,
-				  struct v4l2_capability *cap)
+static int sh_ceu_s_input(struct file *file, void *priv, unsigned int i)
 {
-	strlcpy(cap->card, "SuperH_Mobile_CEU", sizeof(cap->card));
-	strlcpy(cap->driver, "sh_mobile_ceu", sizeof(cap->driver));
-	strlcpy(cap->bus_info, "platform:sh_mobile_ceu", sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+	if (i > 0)
+		return -EINVAL;

 	return 0;
 }

-static int sh_mobile_ceu_init_videobuf(struct vb2_queue *q,
-				       struct soc_camera_device *icd)
-{
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
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

+static int sh_ceu_init_videobuf(struct sh_ceu_dev *pcdev,
+				struct vb2_queue *q)
+{
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR;
-	q->drv_priv = icd;
-	q->ops = &sh_mobile_ceu_videobuf_ops;
+	q->drv_priv = pcdev;
+	q->ops = &sh_ceu_videobuf_ops;
 	q->mem_ops = &vb2_dma_contig_memops;
-	q->buf_struct_size = sizeof(struct sh_mobile_ceu_buffer);
+	q->buf_struct_size = sizeof(struct sh_ceu_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->lock = &ici->host_lock;
-	q->dev = ici->v4l2_dev.dev;
+	q->lock = &pcdev->mlock;
+	q->dev = pcdev->v4l2_dev.dev;

 	return vb2_queue_init(q);
 }

-static struct soc_camera_host_ops sh_mobile_ceu_host_ops = {
-	.owner		= THIS_MODULE,
-	.add		= sh_mobile_ceu_add_device,
-	.remove		= sh_mobile_ceu_remove_device,
-	.clock_start	= sh_mobile_ceu_clock_start,
-	.clock_stop	= sh_mobile_ceu_clock_stop,
-	.get_formats	= sh_mobile_ceu_get_formats,
-	.put_formats	= sh_mobile_ceu_put_formats,
-	.get_selection	= sh_mobile_ceu_get_selection,
-	.set_selection	= sh_mobile_ceu_set_selection,
-	.set_liveselection	= sh_mobile_ceu_set_liveselection,
-	.set_fmt	= sh_mobile_ceu_set_fmt,
-	.try_fmt	= sh_mobile_ceu_try_fmt,
-	.poll		= sh_mobile_ceu_poll,
-	.querycap	= sh_mobile_ceu_querycap,
-	.set_bus_param	= sh_mobile_ceu_set_bus_param,
-	.init_videobuf2	= sh_mobile_ceu_init_videobuf,
-};
+static int sh_ceu_sensor_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_subdev *asd)
+{
+	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
+	struct sh_ceu_dev *pcdev = v4l2_dev_to_ceu_dev(v4l2_dev);
+	struct video_device *vdev = &pcdev->vdev;
+	int err;

-struct bus_wait {
-	struct notifier_block	notifier;
-	struct completion	completion;
-	struct device		*dev;
-};
+	/* Init videobuf queue operations */
+	err = sh_ceu_init_videobuf(pcdev, &pcdev->vb2_vq);
+	if (err)
+		return -EINVAL;

-static int bus_notify(struct notifier_block *nb,
-		      unsigned long action, void *data)
-{
-	struct device *dev = data;
-	struct bus_wait *wait = container_of(nb, struct bus_wait, notifier);
+	mutex_lock(&pcdev->mlock);

-	if (wait->dev != dev)
-		return NOTIFY_DONE;
+	/* Initialize formats and set format on sensor */
+	pcdev->sensor = subdev;
+	err = sh_ceu_init_active_formats(pcdev);
+	if (err)
+		return err;

-	switch (action) {
-	case BUS_NOTIFY_UNBOUND_DRIVER:
-		/* Protect from module unloading */
-		wait_for_completion(&wait->completion);
-		return NOTIFY_OK;
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
 	}
-	return NOTIFY_DONE;
+
+	mutex_unlock(&pcdev->mlock);
+	return 0;
 }

-static int sh_mobile_ceu_probe(struct platform_device *pdev)
+static void sh_ceu_sensor_unbind(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *subdev,
+				 struct v4l2_async_subdev *asd)
 {
-	struct sh_mobile_ceu_dev *pcdev;
+	return;
+}
+static int sh_ceu_probe(struct platform_device *pdev)
+{
+	struct sh_ceu_dev *pcdev;
 	struct resource *res;
 	void __iomem *base;
 	unsigned int irq;
 	int err;
-	struct bus_wait wait = {
-		.completion = COMPLETION_INITIALIZER_ONSTACK(wait.completion),
-		.notifier.notifier_call = bus_notify,
-	};

 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_irq(pdev, 0);
@@ -1658,42 +1440,34 @@ static int sh_mobile_ceu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}

+	mutex_init(&pcdev->mlock);
 	INIT_LIST_HEAD(&pcdev->capture);
 	spin_lock_init(&pcdev->lock);
 	init_completion(&pcdev->complete);

 	pcdev->pdata = pdev->dev.platform_data;
-	if (!pcdev->pdata && !pdev->dev.of_node) {
-		dev_err(&pdev->dev, "CEU platform data not set.\n");
-		return -EINVAL;
-	}
-
-	/* TODO: implement per-device bus flags */
-	if (pcdev->pdata) {
+	if (pdev->dev.of_node && !pcdev->pdata) {
+		/* TODO: implement OF parsing */
+	} else if (pcdev->pdata && !pdev->dev.of_node) {
+		/* TODO: implement per-device bus flags */
 		pcdev->max_width = pcdev->pdata->max_width;
 		pcdev->max_height = pcdev->pdata->max_height;
 		pcdev->flags = pcdev->pdata->flags;
+		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
+		pcdev->asd.match.i2c.adapter_id =
+			pcdev->pdata->sensor_i2c_adapter_id;
+		pcdev->asd.match.i2c.address = pcdev->pdata->sensor_i2c_address;
+	} else {
+		dev_err(&pdev->dev, "CEU platform data not set.\n");
+		return -EINVAL;
 	}
-	pcdev->field = V4L2_FIELD_NONE;

-	if (!pcdev->max_width) {
-		unsigned int v;
-		err = of_property_read_u32(pdev->dev.of_node, "renesas,max-width", &v);
-		if (!err)
-			pcdev->max_width = v;
+	pcdev->field = V4L2_FIELD_NONE;

-		if (!pcdev->max_width)
-			pcdev->max_width = 2560;
-	}
-	if (!pcdev->max_height) {
-		unsigned int v;
-		err = of_property_read_u32(pdev->dev.of_node, "renesas,max-height", &v);
-		if (!err)
-			pcdev->max_height = v;
-
-		if (!pcdev->max_height)
-			pcdev->max_height = 1920;
-	}
+	if (!pcdev->max_width)
+		pcdev->max_width = 2560;
+	if (!pcdev->max_height)
+		pcdev->max_height = 1920;

 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base))
@@ -1719,7 +1493,7 @@ static int sh_mobile_ceu_probe(struct platform_device *pdev)
 	}

 	/* request irq */
-	err = devm_request_irq(&pdev->dev, pcdev->irq, sh_mobile_ceu_irq,
+	err = devm_request_irq(&pdev->dev, pcdev->irq, sh_ceu_irq,
 			       0, dev_name(&pdev->dev), pcdev);
 	if (err) {
 		dev_err(&pdev->dev, "Unable to register CEU interrupt.\n");
@@ -1730,19 +1504,19 @@ static int sh_mobile_ceu_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_resume(&pdev->dev);

-	pcdev->ici.priv = pcdev;
-	pcdev->ici.v4l2_dev.dev = &pdev->dev;
-	pcdev->ici.nr = pdev->id;
-	pcdev->ici.drv_name = dev_name(&pdev->dev);
-	pcdev->ici.ops = &sh_mobile_ceu_host_ops;
-	pcdev->ici.capabilities = SOCAM_HOST_CAP_STRIDE;
+	dev_set_drvdata(&pdev->dev, pcdev);
+	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
+	if (err)
+		goto exit_free_clk;

-	if (pcdev->pdata && pcdev->pdata->asd_sizes) {
-		pcdev->ici.asd = pcdev->pdata->asd;
-		pcdev->ici.asd_sizes = pcdev->pdata->asd_sizes;
-	}
+	pcdev->asds[0] = &pcdev->asd;
+	pcdev->notifier.v4l2_dev = &pcdev->v4l2_dev;
+	pcdev->notifier.subdevs = pcdev->asds;
+	pcdev->notifier.num_subdevs = 1;
+	pcdev->notifier.bound = sh_ceu_sensor_bound;
+	pcdev->notifier.unbind = sh_ceu_sensor_unbind;

-	err = soc_camera_host_register(&pcdev->ici);
+	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
 	if (err)
 		goto exit_free_clk;

@@ -1756,11 +1530,11 @@ static int sh_mobile_ceu_probe(struct platform_device *pdev)
 	return err;
 }

-static int sh_mobile_ceu_remove(struct platform_device *pdev)
+static int sh_ceu_remove(struct platform_device *pdev)
 {
-	struct soc_camera_host *soc_host = to_soc_camera_host(&pdev->dev);

-	soc_camera_host_unregister(soc_host);
+	/* TODO */
+
 	pm_runtime_disable(&pdev->dev);
 	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
 		dma_release_declared_memory(&pdev->dev);
@@ -1768,7 +1542,7 @@ static int sh_mobile_ceu_remove(struct platform_device *pdev)
 	return 0;
 }

-static int sh_mobile_ceu_runtime_nop(struct device *dev)
+static int sh_ceu_runtime_nop(struct device *dev)
 {
 	/* Runtime PM callback shared between ->runtime_suspend()
 	 * and ->runtime_resume(). Simply returns success.
@@ -1780,39 +1554,39 @@ static int sh_mobile_ceu_runtime_nop(struct device *dev)
 	return 0;
 }

-static const struct dev_pm_ops sh_mobile_ceu_dev_pm_ops = {
-	.runtime_suspend = sh_mobile_ceu_runtime_nop,
-	.runtime_resume = sh_mobile_ceu_runtime_nop,
+static const struct dev_pm_ops sh_ceu_dev_pm_ops = {
+	.runtime_suspend = sh_ceu_runtime_nop,
+	.runtime_resume = sh_ceu_runtime_nop,
 };

-static const struct of_device_id sh_mobile_ceu_of_match[] = {
+static const struct of_device_id sh_ceu_of_match[] = {
 	{ .compatible = "renesas,sh-mobile-ceu" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, sh_mobile_ceu_of_match);
+MODULE_DEVICE_TABLE(of, sh_ceu_of_match);

-static struct platform_driver sh_mobile_ceu_driver = {
+static struct platform_driver sh_ceu_driver = {
 	.driver		= {
 		.name	= "sh_mobile_ceu",
-		.pm	= &sh_mobile_ceu_dev_pm_ops,
-		.of_match_table = sh_mobile_ceu_of_match,
+		.pm	= &sh_ceu_dev_pm_ops,
+		.of_match_table = sh_ceu_of_match,
 	},
-	.probe		= sh_mobile_ceu_probe,
-	.remove		= sh_mobile_ceu_remove,
+	.probe		= sh_ceu_probe,
+	.remove		= sh_ceu_remove,
 };

-static int __init sh_mobile_ceu_init(void)
+static int __init sh_ceu_init(void)
 {
-	return platform_driver_register(&sh_mobile_ceu_driver);
+	return platform_driver_register(&sh_ceu_driver);
 }

-static void __exit sh_mobile_ceu_exit(void)
+static void __exit sh_ceu_exit(void)
 {
-	platform_driver_unregister(&sh_mobile_ceu_driver);
+	platform_driver_unregister(&sh_ceu_driver);
 }

-module_init(sh_mobile_ceu_init);
-module_exit(sh_mobile_ceu_exit);
+module_init(sh_ceu_init);
+module_exit(sh_ceu_exit);

 MODULE_DESCRIPTION("SuperH Mobile CEU driver");
 MODULE_AUTHOR("Magnus Damm");
--
2.7.4
