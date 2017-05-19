Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37159 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752905AbdESQG3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 12:06:29 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
Subject: [RFC v4 4/8] media: platform: ceu: Support for multiple subdevs
Date: Fri, 19 May 2017 18:02:56 +0200
Message-Id: <1495209780-27342-5-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
References: <1495209780-27342-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for registration of multiple subdevices to renesas CEU
driver.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/renesas-ceu.c | 323 +++++++++++++++++++++++++----------
 1 file changed, 235 insertions(+), 88 deletions(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 8ebc2547..05cb1fc 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -174,6 +174,27 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
 }

 /**
+ * ceu_subdev - Wraps v4l2 sub-device and provides async notification
+ */
+struct ceu_subdev {
+	struct v4l2_subdev *v4l2_subdev;
+
+	/* async subdev notification */
+	struct v4l2_async_notifier notifier;
+	struct v4l2_async_subdev *asd;
+
+	unsigned int mbus_flags;
+	struct ceu_mbus_fmt mbus_fmt;
+
+	struct list_head list;
+};
+
+static inline struct ceu_subdev *to_ceu_subdev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct ceu_subdev, notifier);
+}
+
+/**
  * ceu_device - CEU device instance
  */
 struct ceu_device {
@@ -181,12 +202,12 @@ struct ceu_device {
 	struct video_device	vdev;
 	struct v4l2_device	v4l2_dev;

-	struct v4l2_subdev	*sensor;
-	struct ceu_mbus_fmt	sensor_fmt;
-
-	struct v4l2_async_notifier	notifier;
-	struct v4l2_async_subdev	asd;
-	struct v4l2_async_subdev	*asds[1];
+	/* subdevs list, number and current subdev */
+	struct list_head	subdev_list;
+	unsigned int		num_subdevs;
+	struct ceu_subdev	*subdevs;
+	struct ceu_subdev	*subdev;
+	unsigned int		subdev_index;

 	/* vb2 queue, capture buffer list and active buffer pointer */
 	struct vb2_queue	vb2_vq;
@@ -205,7 +226,6 @@ struct ceu_device {
 	enum v4l2_field		field;
 	struct v4l2_pix_format	v4l2_pix;

-	unsigned long		mbus_flags;
 	struct ceu_info		*pdata;
 };

@@ -518,11 +538,12 @@ static void ceu_videobuf_queue(struct vb2_buffer *vb)
 static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ceu_device *ceudev = vb2_get_drv_priv(vq);
+	struct v4l2_subdev *v4l2_sd = ceudev->subdev->v4l2_subdev;
 	struct ceu_buffer *buf;
 	unsigned long irqflags;
 	int ret = 0;

-	ret = v4l2_subdev_call(ceudev->sensor, video, s_stream, 1);
+	ret = v4l2_subdev_call(v4l2_sd, video, s_stream, 1);
 	if (ret && ret != -ENOIOCTLCMD) {
 		v4l2_err(&ceudev->v4l2_dev, "stream on failed in subdev\n");
 		goto error_return_bufs;
@@ -553,7 +574,7 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;

 error_stop_sensor:
-	v4l2_subdev_call(ceudev->sensor, video, s_stream, 0);
+	v4l2_subdev_call(v4l2_sd, video, s_stream, 0);

 error_return_bufs:
 	spin_lock_irqsave(&ceudev->lock, irqflags);
@@ -569,10 +590,11 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void ceu_stop_streaming(struct vb2_queue *vq)
 {
 	struct ceu_device *ceudev = vb2_get_drv_priv(vq);
+	struct v4l2_subdev *v4l2_sd = ceudev->subdev->v4l2_subdev;
 	struct ceu_buffer *buf;
 	unsigned long irqflags;

-	v4l2_subdev_call(ceudev->sensor, video, s_stream, 0);
+	v4l2_subdev_call(v4l2_sd, video, s_stream, 0);

 	spin_lock_irqsave(&ceudev->lock, irqflags);
 	if (ceudev->active) {
@@ -638,14 +660,14 @@ static unsigned int ceu_mbus_config_compatible(
  */
 static int ceu_test_mbus_param(struct ceu_device *ceudev)
 {
-	struct v4l2_subdev *sd = ceudev->sensor;
+	struct v4l2_subdev *v4l2_sd = ceudev->subdev->v4l2_subdev;
 	unsigned long common_flags = CEU_BUS_FLAGS;
 	struct v4l2_mbus_config cfg = {
 		.type = V4L2_MBUS_PARALLEL,
 	};
 	int ret;

-	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
+	ret = v4l2_subdev_call(v4l2_sd, video, g_mbus_config, &cfg);
 	if (ret < 0 && ret == -ENOIOCTLCMD)
 		return ret;
 	else if (ret == -ENOIOCTLCMD)
@@ -721,10 +743,12 @@ static void ceu_set_sizes(struct ceu_device *ceudev)
  */
 static int ceu_set_bus_params(struct ceu_device *ceudev)
 {
-	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct ceu_mbus_fmt *mbus_fmt = &ceu_sd->mbus_fmt;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
+	unsigned int mbus_flags = ceu_sd->mbus_flags;
 	struct v4l2_pix_format *pix = &ceudev->v4l2_pix;
 	unsigned long common_flags = CEU_BUS_FLAGS;
-	struct v4l2_subdev *sd = ceudev->sensor;
 	u32 camcr, caifr, cdocr;
 	int ret;

@@ -748,7 +772,7 @@ static int ceu_set_bus_params(struct ceu_device *ceudev)
 	 */
 	if ((common_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) &&
 	    (common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)) {
-		if (ceudev->mbus_flags & CEU_FLAG_HSYNC_LOW)
+		if (mbus_flags & CEU_FLAG_HSYNC_LOW)
 			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_HIGH;
 		else
 			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_LOW;
@@ -756,14 +780,14 @@ static int ceu_set_bus_params(struct ceu_device *ceudev)

 	if ((common_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) &&
 	    (common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)) {
-		if (ceudev->mbus_flags & CEU_FLAG_VSYNC_LOW)
+		if (mbus_flags & CEU_FLAG_VSYNC_LOW)
 			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_HIGH;
 		else
 			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_LOW;
 	}

 	cfg.flags = common_flags;
-	ret = v4l2_subdev_call(sd, video, s_mbus_config, &cfg);
+	ret = v4l2_subdev_call(v4l2_sd, video, s_mbus_config, &cfg);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;

@@ -794,20 +818,20 @@ static int ceu_set_bus_params(struct ceu_device *ceudev)
 	case V4L2_PIX_FMT_NV16:
 		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
 	case V4L2_PIX_FMT_NV12:
-		if (sensor_fmt->swapped)
-			camcr |= sensor_fmt->fmt_order_swap;
+		if (mbus_fmt->swapped)
+			camcr |= mbus_fmt->fmt_order_swap;
 		else
-			camcr |= sensor_fmt->fmt_order;
+			camcr |= mbus_fmt->fmt_order;
 		break;

 	/* swapped output formats */
 	case V4L2_PIX_FMT_NV61:
 		cdocr	|= CEU_CDOCR_NO_DOWSAMPLE;
 	case V4L2_PIX_FMT_NV21:
-		if (sensor_fmt->swapped)
-			camcr |= sensor_fmt->fmt_order;
+		if (mbus_fmt->swapped)
+			camcr |= mbus_fmt->fmt_order;
 		else
-			camcr |= sensor_fmt->fmt_order_swap;
+			camcr |= mbus_fmt->fmt_order_swap;
 		break;
 	}
 	camcr |= common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW ? 1 << 1 : 0;
@@ -869,9 +893,10 @@ static int ceu_set_bus_params(struct ceu_device *ceudev)
  */
 static int ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
 {
-	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct ceu_mbus_fmt *mbus_fmt = &ceu_sd->mbus_fmt;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
 	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
-	struct v4l2_subdev *sensor = ceudev->sensor;
 	struct v4l2_subdev_pad_config pad_cfg;
 	const struct ceu_fmt *ceu_fmt;
 	int ret;
@@ -912,8 +937,8 @@ static int ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
 	 * Set format on sensor sub device: bus format is selected at
 	 * format initialization time
 	 */
-	v4l2_fill_mbus_format(&sd_format.format, pix, sensor_fmt->mbus_code);
-	ret = v4l2_subdev_call(sensor, pad, set_fmt, &pad_cfg, &sd_format);
+	v4l2_fill_mbus_format(&sd_format.format, pix, mbus_fmt->mbus_code);
+	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_cfg, &sd_format);
 	if (ret)
 		return ret;

@@ -937,7 +962,9 @@ static int ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
  */
 static int ceu_set_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
 {
-	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
+	struct ceu_mbus_fmt *mbus_fmt = &ceu_sd->mbus_fmt;
 	int ret;

 	struct v4l2_subdev_format format = {
@@ -949,9 +976,8 @@ static int ceu_set_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt)
 		return ret;

 	v4l2_fill_mbus_format(&format.format, &v4l2_fmt->fmt.pix,
-			      sensor_fmt->mbus_code);
-	ret = v4l2_subdev_call(ceudev->sensor, pad,
-			       set_fmt, NULL, &format);
+			      mbus_fmt->mbus_code);
+	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &format);
 	if (ret)
 		return ret;

@@ -1003,20 +1029,21 @@ static int ceu_set_default_fmt(struct ceu_device *ceudev)
  */
 static int ceu_init_formats(struct ceu_device *ceudev)
 {
-	struct ceu_mbus_fmt *sensor_fmt = &ceudev->sensor_fmt;
-	struct v4l2_subdev *sensor = ceudev->sensor;
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct ceu_mbus_fmt *mbus_fmt = &ceu_sd->mbus_fmt;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
 	bool yuyv_bus_fmt = false;

-	struct v4l2_subdev_mbus_code_enum mbus_fmt = {
+	struct v4l2_subdev_mbus_code_enum sd_mbus_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.index = 0,
 	};

 	/* Find out if sensor can produce any permutation of 8-bits yuyv */
 	while (!yuyv_bus_fmt &&
-	       !v4l2_subdev_call(sensor, pad, enum_mbus_code,
-				 NULL, &mbus_fmt)) {
-		switch (mbus_fmt.code) {
+	       !v4l2_subdev_call(v4l2_sd, pad, enum_mbus_code,
+				 NULL, &sd_mbus_fmt)) {
+		switch (sd_mbus_fmt.code) {
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		case MEDIA_BUS_FMT_YVYU8_2X8:
 		case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -1037,37 +1064,37 @@ static int ceu_init_formats(struct ceu_device *ceudev)
 	if (!yuyv_bus_fmt)
 		return -ENXIO;

-	/*
-	 * Save the first encountered YUYV format as "sensor_fmt" and use it
+	/*
+	 * Save the first encountered YUYV format as "mbus_fmt" and use it
 	 * to output all planar YUV422 and YUV420 (NV*) formats to memory.
 	 */
-	sensor_fmt->mbus_code	= mbus_fmt.code;
-	sensor_fmt->bps		= 8;
+	mbus_fmt->mbus_code	= sd_mbus_fmt.code;
+	mbus_fmt->bps		= 8;

 	/* Annotate the selected bus format components ordering */
-	switch (mbus_fmt.code) {
+	switch (sd_mbus_fmt.code) {
 	case MEDIA_BUS_FMT_YUYV8_2X8:
-		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YUYV;
-		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YVYU;
-		sensor_fmt->swapped		= false;
+		mbus_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YUYV;
+		mbus_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YVYU;
+		mbus_fmt->swapped		= false;
 		break;

 	case MEDIA_BUS_FMT_YVYU8_2X8:
-		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YVYU;
-		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YUYV;
-		sensor_fmt->swapped		= true;
+		mbus_fmt->fmt_order		= CEU_CAMCR_DTARY_8_YVYU;
+		mbus_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_YUYV;
+		mbus_fmt->swapped		= true;
 		break;

 	case MEDIA_BUS_FMT_UYVY8_2X8:
-		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_UYVY;
-		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_VYUY;
-		sensor_fmt->swapped		= false;
+		mbus_fmt->fmt_order		= CEU_CAMCR_DTARY_8_UYVY;
+		mbus_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_VYUY;
+		mbus_fmt->swapped		= false;
 		break;

 	case MEDIA_BUS_FMT_VYUY8_2X8:
-		sensor_fmt->fmt_order		= CEU_CAMCR_DTARY_8_VYUY;
-		sensor_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_UYVY;
-		sensor_fmt->swapped		= true;
+		mbus_fmt->fmt_order		= CEU_CAMCR_DTARY_8_VYUY;
+		mbus_fmt->fmt_order_swap	= CEU_CAMCR_DTARY_8_UYVY;
+		mbus_fmt->swapped		= true;
 		break;
 	}

@@ -1088,9 +1115,9 @@ static int ceu_init_formats(struct ceu_device *ceudev)
 static int ceu_runtime_suspend(struct device *dev)
 {
 	struct ceu_device *ceudev = dev_get_drvdata(dev);
-	struct v4l2_subdev *sensor = ceudev->sensor;
+	struct v4l2_subdev *v4l2_sd = ceudev->subdev->v4l2_subdev;

-	v4l2_subdev_call(sensor, core, s_power, 0);
+	v4l2_subdev_call(v4l2_sd, core, s_power, 0);

 	ceu_write(ceudev, CEU_CEIER, 0);
 	ceu_soft_reset(ceudev);
@@ -1104,9 +1131,9 @@ static int ceu_runtime_suspend(struct device *dev)
 static int ceu_runtime_resume(struct device *dev)
 {
 	struct ceu_device *ceudev = dev_get_drvdata(dev);
-	struct v4l2_subdev *sensor = ceudev->sensor;
+	struct v4l2_subdev *v4l2_sd = ceudev->subdev->v4l2_subdev;

-	v4l2_subdev_call(sensor, core, s_power, 1);
+	v4l2_subdev_call(v4l2_sd, core, s_power, 1);

 	ceu_soft_reset(ceudev);

@@ -1220,52 +1247,82 @@ static int ceu_enum_input(struct file *file, void *priv,

 static int ceu_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	*i = 0;
+	struct ceu_device *ceudev = video_drvdata(file);
+
+	*i = ceudev->subdev_index;

 	return 0;
 }

 static int ceu_s_input(struct file *file, void *priv, unsigned int i)
 {
-	if (i > 0)
+	struct ceu_device *ceudev = video_drvdata(file);
+	struct ceu_subdev *ceu_sd_old;
+	int ret;
+
+	if (i >= ceudev->num_subdevs)
 		return -EINVAL;

+	ceu_sd_old	= ceudev->subdev;
+	ceudev->subdev	= &ceudev->subdevs[i];
+
+	/*
+	 * This is enough to make sure we can generate all available formats,
+	 * as long as we only support planar YUV422/YUV420 as memory output
+	 * formats.
+	 */
+	ret = ceu_init_formats(ceudev);
+	if (ret) {
+		ceudev->subdev = ceu_sd_old;
+		return -EINVAL;
+	}
+
+	/* now that we're sure we can use the sensor, power off the old one */
+	v4l2_subdev_call(ceu_sd_old->v4l2_subdev, core, s_power, 0);
+	v4l2_subdev_call(ceudev->subdev->v4l2_subdev, core, s_power, 1);
+
+	ceudev->subdev_index = i;
+
 	return 0;
 }

 static int ceu_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
+	struct v4l2_subdev *v4l2_subdev = ceudev->subdev->v4l2_subdev;

 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;

-	return v4l2_subdev_call(ceudev->sensor, video, g_parm, a);
+	return v4l2_subdev_call(v4l2_subdev, video, g_parm, a);
 }

 static int ceu_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
+	struct v4l2_subdev *v4l2_subdev = ceudev->subdev->v4l2_subdev;

 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;

-	return v4l2_subdev_call(ceudev->sensor, video, s_parm, a);
+	return v4l2_subdev_call(v4l2_subdev, video, s_parm, a);
 }

 static int ceu_enum_framesizes(struct file *file, void *fh,
 			       struct v4l2_frmsizeenum *fsize)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
 	int ret;

 	struct v4l2_subdev_frame_size_enum fse = {
-		.code	= ceudev->sensor_fmt.mbus_code,
+		.code	= ceu_sd->mbus_fmt.mbus_code,
 		.index	= fsize->index,
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 	};

-	ret = v4l2_subdev_call(ceudev->sensor, pad, enum_frame_size,
+	ret = v4l2_subdev_call(v4l2_sd, pad, enum_frame_size,
 			       NULL, &fse);
 	if (ret)
 		return ret;
@@ -1281,17 +1338,19 @@ static int ceu_enum_frameintervals(struct file *file, void *fh,
 				    struct v4l2_frmivalenum *fival)
 {
 	struct ceu_device *ceudev = video_drvdata(file);
+	struct ceu_subdev *ceu_sd = ceudev->subdev;
+	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_subdev;
 	int ret;

 	struct v4l2_subdev_frame_interval_enum fie = {
-		.code	= ceudev->sensor_fmt.mbus_code,
+		.code	= ceu_sd->mbus_fmt.mbus_code,
 		.index = fival->index,
 		.width = fival->width,
 		.height = fival->height,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};

-	ret = v4l2_subdev_call(ceudev->sensor, pad, enum_frame_interval, NULL,
+	ret = v4l2_subdev_call(v4l2_sd, pad, enum_frame_interval, NULL,
 			       &fie);
 	if (ret)
 		return ret;
@@ -1340,14 +1399,41 @@ void ceu_vdev_release(struct video_device *vdev)
 	kfree(ceudev);
 }

+/**
+ * ceu_sensor_bound() - Set v4l2_subdev and select primary sensor
+ */
 static int ceu_sensor_bound(struct v4l2_async_notifier *notifier,
-			    struct v4l2_subdev *subdev,
+			    struct v4l2_subdev *v4l2_sd,
 			    struct v4l2_async_subdev *asd)
 {
 	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
 	struct ceu_device *ceudev = v4l2_to_ceu(v4l2_dev);
+	struct ceu_subdev *ceu_sd = to_ceu_subdev(notifier);
+
+	if (video_is_registered(&ceudev->vdev)) {
+		v4l2_err(&ceudev->v4l2_dev, "only supports one sub-device.\n");
+		return -EBUSY;
+	}
+
+	if (ceu_sd->mbus_flags | CEU_FLAG_PRIMARY_SENS &&
+	    ceudev->subdev == NULL) {
+		ceudev->subdev_index = ceudev->num_subdevs;
+		ceudev->subdev = ceu_sd;
+	}
+
+	ceudev->num_subdevs++;
+	ceu_sd->v4l2_subdev = v4l2_sd;
+
+	return 0;
+}
+
+static int ceu_sensor_complete(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
+	struct ceu_device *ceudev = v4l2_to_ceu(v4l2_dev);
 	struct video_device *vdev = &ceudev->vdev;
 	struct vb2_queue *q = &ceudev->vb2_vq;
+	struct v4l2_subdev *v4l2_sd;
 	int ret;

 	/* Initialize vb2 queue */
@@ -1365,8 +1451,15 @@ static int ceu_sensor_bound(struct v4l2_async_notifier *notifier,
 	if (ret)
 		return ret;

-	/* Initialize formats and set default format on sensor */
-	ceudev->sensor = subdev;
+	/*
+	 * Make sure at least one sensor is primary and use it to initialize
+	 * ceu formats
+	 */
+	if (ceudev->subdev == NULL)
+		ceudev->subdev = list_first_entry(&ceudev->subdev_list,
+						  struct ceu_subdev, list);
+	v4l2_sd = ceudev->subdev->v4l2_subdev;
+
 	ret = ceu_init_formats(ceudev);
 	if (ret)
 		return ret;
@@ -1380,7 +1473,7 @@ static int ceu_sensor_bound(struct v4l2_async_notifier *notifier,
 	vdev->v4l2_dev		= v4l2_dev;
 	vdev->lock		= &ceudev->mlock;
 	vdev->queue		= &ceudev->vb2_vq;
-	vdev->ctrl_handler	= subdev->ctrl_handler;
+	vdev->ctrl_handler	= v4l2_sd->ctrl_handler;
 	vdev->fops		= &ceu_fops;
 	vdev->ioctl_ops		= &ceu_ioctl_ops;
 	vdev->release		= ceu_vdev_release;
@@ -1394,12 +1487,56 @@ static int ceu_sensor_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 	}

+	dev_info(ceudev->dev, "Video device registered\n");
+
+	return 0;
+}
+
+/**
+ * Parse platform data to collect bus flags and async sensors description
+ */
+static int ceu_parse_platform_data(struct ceu_device *ceudev, void *pdata)
+{
+	struct ceu_async_subdev *async_sd;
+	struct ceu_info *info = pdata;
+	struct ceu_subdev *ceu_sd;
+	unsigned int i;
+
+	ceudev->pdata	= pdata;
+	ceudev->subdev	= NULL;
+	ceudev->subdev_index = 0;
+	ceudev->num_subdevs = 0;
+	ceudev->num_subdevs = info->num_subdevs;
+	ceudev->subdevs = devm_kcalloc(ceudev->dev, info->num_subdevs,
+				       sizeof(*ceudev->subdevs),
+				       GFP_KERNEL);
+	if (!ceudev->subdevs)
+		return -ENOMEM;
+
+	for (i = 0; i < info->num_subdevs; i++) {
+		ceu_sd = &ceudev->subdevs[i];
+		async_sd = &info->subdevs[i];
+
+		ceu_sd->asd = devm_kmalloc(ceudev->dev, sizeof(*ceu_sd->asd),
+					   GFP_KERNEL);
+		if (!ceu_sd)
+			return -ENOMEM;
+
+		ceu_sd->mbus_flags	= async_sd->flags;
+		ceu_sd->asd->match_type	= V4L2_ASYNC_MATCH_I2C;
+		ceu_sd->asd->match.i2c.adapter_id = async_sd->i2c_adapter_id;
+		ceu_sd->asd->match.i2c.address = async_sd->i2c_address;
+
+		list_add_tail(&ceu_sd->list, &ceudev->subdev_list);
+	}
+
 	return 0;
 }

 static int ceu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct ceu_subdev *ceu_sd;
 	struct ceu_device *ceudev;
 	struct resource *res;
 	void __iomem *base;
@@ -1415,6 +1552,7 @@ static int ceu_probe(struct platform_device *pdev)
 	ceudev->dev = dev;

 	INIT_LIST_HEAD(&ceudev->capture);
+	INIT_LIST_HEAD(&ceudev->subdev_list);
 	spin_lock_init(&ceudev->lock);
 	mutex_init(&ceudev->mlock);

@@ -1440,13 +1578,12 @@ static int ceu_probe(struct platform_device *pdev)
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		/* TODO: implement OF parsing */
 	} else if (dev->platform_data) {
-		ceudev->pdata = dev->platform_data;
-		ceudev->mbus_flags = ceudev->pdata->flags;
-		ceudev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
-		ceudev->asd.match.i2c.adapter_id =
-			ceudev->pdata->sensor_i2c_adapter_id;
-		ceudev->asd.match.i2c.address =
-			ceudev->pdata->sensor_i2c_address;
+		ret = ceu_parse_platform_data(ceudev, dev->platform_data);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"CEU unable to parse platform data\n");
+			return ret;
+		}
 	} else {
 		dev_err(&pdev->dev, "CEU platform data not set.\n");
 		return -EINVAL;
@@ -1459,20 +1596,27 @@ static int ceu_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_pm_disable;

-	ceudev->asds[0]			= &ceudev->asd;
-	ceudev->notifier.v4l2_dev	= &ceudev->v4l2_dev;
-	ceudev->notifier.subdevs	= ceudev->asds;
-	ceudev->notifier.num_subdevs	= 1;
-	ceudev->notifier.bound		= ceu_sensor_bound;
-	ret = v4l2_async_notifier_register(&ceudev->v4l2_dev,
-					   &ceudev->notifier);
-	if (ret)
-		goto error_v4l2_unregister;
+	list_for_each_entry(ceu_sd, &ceudev->subdev_list, list) {
+		ceu_sd->notifier.v4l2_dev	= &ceudev->v4l2_dev;
+		ceu_sd->notifier.subdevs	= &ceu_sd->asd;
+		ceu_sd->notifier.num_subdevs	= 1;
+		ceu_sd->notifier.bound		= ceu_sensor_bound;
+		ceu_sd->notifier.complete	= ceu_sensor_complete;
+		ret = v4l2_async_notifier_register(&ceudev->v4l2_dev,
+						   &ceu_sd->notifier);
+		if (ret)
+			goto error_v4l2_unregister_notifiers;
+
+	}

 	return 0;

-error_v4l2_unregister:
+error_v4l2_unregister_notifiers:
+	list_for_each_entry(ceu_sd, &ceudev->subdev_list, list)
+		v4l2_async_unregister_subdev(ceu_sd->v4l2_subdev);
+
 	v4l2_device_unregister(&ceudev->v4l2_dev);
+
 error_pm_disable:
 	pm_runtime_disable(dev);

@@ -1482,10 +1626,13 @@ static int ceu_probe(struct platform_device *pdev)
 static int ceu_remove(struct platform_device *pdev)
 {
 	struct ceu_device *ceudev = platform_get_drvdata(pdev);
+	struct ceu_subdev *ceu_sd;

 	pm_runtime_disable(ceudev->dev);

-	v4l2_async_notifier_unregister(&ceudev->notifier);
+	list_for_each_entry(ceu_sd, &ceudev->subdev_list, list)
+		v4l2_async_unregister_subdev(ceu_sd->v4l2_subdev);
+
 	v4l2_device_unregister(&ceudev->v4l2_dev);

 	video_unregister_device(&ceudev->vdev);
--
2.7.4
