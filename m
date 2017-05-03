Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44023 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbdECJwk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2017 05:52:40 -0400
Date: Wed, 3 May 2017 11:52:36 +0200
From: jmondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Message-ID: <20170503095236.GD5814@w540>
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

On Thu, Apr 27, 2017 at 02:47:14PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.

[snip]

> > +/**
> > + * Collect formats supported by CEU and sensor subdevice
> > + */
> > +static int sh_ceu_init_active_formats(struct sh_ceu_dev *pcdev)
> > +{
> > +	struct v4l2_subdev *sensor = pcdev->sensor;
> > +	struct sh_ceu_fmt *active_fmts;
> > +	unsigned int n_active_fmts;
> > +	struct sh_ceu_fmt *fmt;
> > +	unsigned int i;
> > +
> > +	struct v4l2_subdev_mbus_code_enum mbus_code = {
> > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +		.index = 0,
> > +	};
> > +
> > +	/* Count how may formats are supported by CEU and sensor subdevice */
> > +	n_active_fmts = 0;
> > +	while (!v4l2_subdev_call(sensor, pad, enum_mbus_code,
> > +				 NULL, &mbus_code)) {
> > +		mbus_code.index++;
> > +
> > +		fmt = get_ceu_fmt_from_mbus(mbus_code.code);
>
> This is not correct. You will get one one pixel format per media bus format
> supported by the sensor. The CEU supports
>
> 1. converting packed YUV 4:2:2 (YUYV) to YUV 4:2:2 planar (CAMCR.JPG = 00) or
> capturing raw data (CAMCR.JPG = 01)
>
> 2. outputting YUV 4:2:2 planar to memory (CDOCR.CDS = 1) or downsampling it to
> YUV 4:2:0 planar (CDOCR.CDS = 0)
>
> 3. swapping bytes, words and long words at the output (CDOCR.COLS, CDOCR.COWS
> and CDOCR.COBS fields)
>
> This effectively allows to
>
> - capture the raw data produced by the sensor
> - capture YUV images produced by the sensor in packed YUV 4:2:2 format, from
> any Y/U/V order to any Y/U/V order
> - capture YUV images produced by the sensor in planar YUV 4:2:2 or planar YUV
> 4:2:0, from any Y/U/V order to any Y/U/V order
>
> The list of formats you create needs to reflect that. This means that
>
> - if the sensor can produce a packed YUV 4:2:2 format, the CEU will be able to
> output YUYV, UYVY, YVYU, VYUY, NV12, NV21, NV16 and NV16
>
> - for every non-YUV format produced by the sensor, the CEU will be able to
> output raw data
>
> The former is easy. You just need to list the formats produced by the sensor,
> and if one of them is packed YUV 4:2:2, flag that in the sh_ceu_dev structure,
> and allow all the above output YUV formats. You don't need to create an
> instance-specific list of those formats in the sh_ceu_dev structure, as they
> will be either all available or all non-available.
>
> The latter is a bit more complex, you need a list of media bus code to pixel
> format in the driver. I'd recommend counting the non-YUV packed formats
> produced by the sensor, allocating an array of sh_ceu_fmt pointers with that
> number of entries, and make each entry point to the corresponding entry in the
> global sh_ceu_fmts array. The global sh_ceu_fmts needs to be extended with
> common sensor formats (raw Bayer and JPEG come to mind).
>
> If all sensors currently used with the CEU can produce packed YUV, you could
> implement YUV support only to start with, leaving raw capture support for
> later.

Ok, thanks for explaining.

I have a proposal here, as the original driver only supported "image
fetch mode" (ie. It accepts data in YUYV with components ordering arbitrary
swapped) as a first step we may want to replicate this, ignoring data
synch fetch mode (Chris, you have a driver for this you are already
using in your BSP so I guess it's less urgent to support it, right?).

Also, regarding output memory format I am sure we can produce planar formats
as NV12/21 and NV16/61, but I'm not sure I have found a way to output
packed YUVY (and its permutations) to memory, if not considering it a
binary format, as thus using data synch fetch mode.

So, as a first step my proposal is the following one:
Accept any YUYV bus format from sensor, and support planar ones as memory output
formats with down-sampling support (NV12/21 and NV16/61 then).

The way I am building the supported format list is indeed wrong, and
as you suggested I should just try to make sure the sensor can output
a YUV422 bus format. From there I can output planar memory formats.

One last thing, I am not that sure how I can produce NV21/61 from
bus formats that do not already present the CbCr components in the
desired order (which is Cr then Cb for NV61/21)
Eg. Can I produce NV21 from YUYV though byte/word/long word swapping
(CDOCR.COLS/CDOCR.COWS/CDOCR.COBS) ? Won't I be swapping the luminance
components as well (see figure 46.45 in RZ/A1H TRM).

If I cannot do that, I should restrict swapped planar format
availability based on the ability of the sensor to produce
chrominance components in the desired order
(Eg. If the sensor does not support producing YVYU I cannot produce
NV21 or NV61). Is this ok?

Thanks
 j
>
> > +		if (!fmt)
> > +			continue;
> > +
> > +		fmt->active = 1;
> > +		n_active_fmts++;
> > +	}
> > +
> > +	if (n_active_fmts == 0)
> > +		return -ENXIO;
> > +
> > +	pcdev->n_active_fmts = n_active_fmts;
> > +	pcdev->active_fmts = devm_kcalloc(&pcdev->vdev.dev, n_active_fmts,
> > +					  sizeof(*pcdev->active_fmts),
> > +					  GFP_KERNEL);
>
> See my comment about devm_kzalloc() in the probe() function. This one might be
> harmless, but you'd then need to prove that (and explain the proof in a
> comment).
>
> > +	if (!pcdev->active_fmts)
> > +		return -ENOMEM;
> > +
> > +	active_fmts = pcdev->active_fmts[0];
> > +	fmt = &sh_ceu_fmts[0];
> > +	for (i = 0; i < N_SH_CEU_FMT; i++, fmt++) {
>
> Just use ARRAY_SIZE() directly, it's clearer.
>
> > +		if (!fmt->active)
> > +			continue;
> > +
> > +		active_fmts = fmt;
> > +		active_fmts++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_set_default_fmt(struct sh_ceu_dev *pcdev)
> > +{
> > +	int ret;
> > +	struct v4l2_format v4l2_fmt = {
> > +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> > +		.fmt.pix = {
> > +			.width		= VGA_WIDTH,
> > +			.height		= VGA_HEIGHT,
> > +			.field		= V4L2_FIELD_NONE,
> > +			.pixelformat	= pcdev->active_fmts[0]->fourcc,
> > +		},
> > +	};
> > +
> > +	ret = sh_ceu_try_fmt(pcdev, &v4l2_fmt, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pcdev->current_fmt = pcdev->active_fmts[0];
> > +	pcdev->v4l2_fmt = v4l2_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * ------------------------------------------------------------------------
> > + *  File Operations
> > + */
> > +static int sh_ceu_open(struct file *file)
> > +{
> > +	struct sh_ceu_dev *pcdev = video_drvdata(file);
> > +	struct v4l2_subdev *sensor = pcdev->sensor;
> > +	int ret;
> > +
> > +	mutex_lock(&pcdev->mlock);
> > +	ret = v4l2_fh_open(file);
>
> This function doesn't need to be called under a lock, you can move the
> mutex_lock() further down.
>
> > +	if (ret)
> > +		goto out;
> > +
> > +	sh_ceu_clock_start(pcdev);
> > +	ret = v4l2_subdev_call(sensor, core, s_power, 1);
> > +	if (ret && ret != -ENOIOCTLCMD) {
> > +		v4l2_fh_release(file);
> > +		goto out;
> > +	}
> > +
> > +	ret = sh_ceu_set_fmt(pcdev, &pcdev->v4l2_fmt);
>
> There's no need for a complete set format at open() time if you move the
> subdev set_fmt call to start_streaming() as explained above.
>
> > +	if (ret) {
> > +		v4l2_subdev_call(sensor, core, s_power, 0);
> > +		v4l2_fh_release(file);
> > +	}
> > +
> > +out:
> > +	mutex_unlock(&pcdev->mlock);
> > +	return ret;
> > +}
> > +
> > +static int sh_ceu_release(struct file *file)
> > +{
> > +	struct sh_ceu_dev *pcdev = video_drvdata(file);
> > +	struct v4l2_subdev *sensor = pcdev->sensor;
> > +	int ret;
> > +
> > +	mutex_lock(&pcdev->mlock);
> > +
> > +	ret = _vb2_fop_release(file, NULL);
> > +	v4l2_subdev_call(sensor, core, s_power, 0);
> > +	sh_ceu_clock_stop(pcdev);
> > +	v4l2_fh_release(file);
> > +
> > +	mutex_unlock(&pcdev->mlock);
>
> This is both wrong and over-complicated. Wrong, because if two applications
> have the device node open, one of them streaming video, and the other one
> closes the device node, streaming will stop. You don't want that :-)
>
> There are multiple ways to handle this. You can either drop this callback
> completely and use vb2_fop_release() instead. In that case, power to the
> sensor will need to be turned off from the vb2 stop_streaming() callback, and
> consequently will need to be turned on from the vb2 start_streaming()
> callback. Depending on how the sensor driver is implemented, this could cause
> issues when accessing controls if the sensor driver tries to access the
> hardware while it is powered off.
>
> Another option is to copy _vb2_fop_release() and add the driver-specific code.
> Something like the following should do.
>
> 	mutex_lock(&pcdev->mlock);
>
> 	v4l2_subdev_call(sensor, core, s_power, 0);
>
>         if (file->private_data == vdev->queue->owner) {
> 		sh_ceu_clock_stop(pcdev);
>
>                 vb2_queue_release(vdev->queue);
>                 vdev->queue->owner = NULL;
>         }
>         mutex_unlock(&pcdev->mlock);
>
> 	return v4l2_fh_release(file);
>
> (The subdev s_power call is outside of the check as power handling should be
> reference-counted by subdevs.)
>
> However, if we make the driver a bit more runtime-pm centric as proposed above
> in my comments about the sh_ceu_clock_start() and sh_ceu_clock_stop()
> functions, runtime PM will handle reference counting for you. In that case you
> could move the sensor s_power() calls from open() and release() to the runtime
> PM handlers, and code this function as
>
> 	vb2_fop_release();
> 	pm_runtime_put();
> 	return 0;
>
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_file_operations sh_ceu_fops = {
> > +	.owner			= THIS_MODULE,
> > +	.open			= sh_ceu_open,
> > +	.release		= sh_ceu_release,
> > +	.unlocked_ioctl		= video_ioctl2,
> > +	.read			= vb2_fop_read,
> > +	.mmap			= vb2_fop_mmap,
> > +	.poll			= vb2_fop_poll,
> > +};
> > +
> > +/**
> > + * ------------------------------------------------------------------------
> > + *  Video Device IOCTLs
> > + */
> > +static int sh_ceu_querycap(struct file *file, void *priv,
> > +			   struct v4l2_capability *cap)
> > +{
> > +	strlcpy(cap->card, "SuperH_Mobile_CEU", sizeof(cap->card));
> > +	strlcpy(cap->driver, "sh_mobile_ceu", sizeof(cap->driver));
> > +	strlcpy(cap->bus_info, "platform:sh_mobile_ceu", sizeof(cap-
> >bus_info));
>
> Should this all be renamed to remove the reference to SH Mobile ?
>
> > +	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > +	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>
> As you already set the video_device.device_caps field you can remove those two
> lines.
>
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_enum_fmt_vid_cap(struct file *file, void *priv,
> > +				   struct v4l2_fmtdesc *f)
> > +{
> > +	struct sh_ceu_dev *pcdev = video_drvdata(file);
> > +	struct sh_ceu_fmt *fmt;
> > +
> > +	if (f->index >= pcdev->n_active_fmts)
> > +		return -EINVAL;
> > +
> > +	fmt = pcdev->active_fmts[f->index];
> > +	strncpy(f->description, fmt->name, strlen(fmt->name));
>
> Descriptions are filled automatically by the core, you can remove them.
>
> > +	f->pixelformat = fmt->fourcc;
> > +
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_try_fmt_vid_cap(struct file *file, void *priv,
> > +				  struct v4l2_format *f)
> > +{
> > +	struct sh_ceu_dev *pcdev = video_drvdata(file);
> > +
> > +	return sh_ceu_try_fmt(pcdev, f, NULL);
> > +}
> > +
> > +static int sh_ceu_s_fmt_vid_cap(struct file *file, void *priv,
> > +				struct v4l2_format *f)
> > +{
> > +	struct sh_ceu_dev *pcdev = video_drvdata(file);
> > +
> > +	if (vb2_is_streaming(&pcdev->vb2_vq))
> > +		return -EBUSY;
> > +
> > +	return sh_ceu_set_fmt(pcdev, f);
>
> You can merge the two functions as, as explained above, sh_ceu_s_fmt_vid_cap()
> must not be called at open() time.
>
> > +}
> > +
> > +static int sh_ceu_enum_input(struct file *file, void *priv,
> > +			   struct v4l2_input *inp)
> > +{
> > +	if (inp->index != 0)
> > +		return -EINVAL;
> > +
> > +	inp->type = V4L2_INPUT_TYPE_CAMERA;
> > +	inp->std = 0;
> > +	strcpy(inp->name, "Camera");
> > +
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_g_input(struct file *file, void *priv, unsigned int *i)
> > +{
> > +	*i = 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int sh_ceu_s_input(struct file *file, void *priv, unsigned int i)
> > +{
> > +	if (i > 0)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
>
> I really think the the get and set input ioctls should not be implemented by
> devices that have a single input, but it seems that opinion isn't shared
> widely :-/
>
> > +static const struct v4l2_ioctl_ops sh_ceu_ioctl_ops = {
> > +	.vidioc_querycap		= sh_ceu_querycap,
> > +
> > +	.vidioc_enum_fmt_vid_cap	= sh_ceu_enum_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap		= sh_ceu_try_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap		= sh_ceu_s_fmt_vid_cap,
> > +
> > +	.vidioc_enum_input		= sh_ceu_enum_input,
> > +	.vidioc_g_input			= sh_ceu_g_input,
> > +	.vidioc_s_input			= sh_ceu_s_input,
> > +
> > +	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
> > +	.vidioc_querybuf		= vb2_ioctl_querybuf,
> > +	.vidioc_qbuf			= vb2_ioctl_qbuf,
> > +	.vidioc_expbuf			= vb2_ioctl_expbuf,
> > +	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
> > +	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
> > +	.vidioc_streamon		= vb2_ioctl_streamon,
> > +	.vidioc_streamoff		= vb2_ioctl_streamoff,
> > +
> > +	/* TODO
> > +	.vidioc_g_parm			=
> > +	.vidioc_s_parm			=
> > +	.vidioc_enum_framesizes		=
> > +	.vidioc_enum_frameintervals	=
> > +	*/
>
> Please implement them :-)
>
> > +};
> > +
> > +static int sh_ceu_init_videobuf(struct sh_ceu_dev *pcdev,
> > +				struct vb2_queue *q)
> > +{
> > +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +	q->io_modes = VB2_MMAP | VB2_USERPTR;
> > +	q->drv_priv = pcdev;
> > +	q->ops = &sh_ceu_videobuf_ops;
> > +	q->mem_ops = &vb2_dma_contig_memops;
> > +	q->buf_struct_size = sizeof(struct sh_ceu_buffer);
> > +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +	q->lock = &pcdev->mlock;
> > +	q->dev = pcdev->v4l2_dev.dev;
> > +
> > +	return vb2_queue_init(q);
> > +}
> > +
> > +static int sh_ceu_sensor_bound(struct v4l2_async_notifier *notifier,
> > +			       struct v4l2_subdev *subdev,
> > +			       struct v4l2_async_subdev *asd)
> > +{
> > +	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
> > +	struct sh_ceu_dev *pcdev = v4l2_dev_to_ceu_dev(v4l2_dev);
> > +	struct video_device *vdev = &pcdev->vdev;
> > +	int err;
> > +
> > +	/* Init videobuf queue operations */
> > +	err = sh_ceu_init_videobuf(pcdev, &pcdev->vb2_vq);
>
> I would inline the function here as it's small and linear, but that's up to
> you.
>
> > +	if (err)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&pcdev->mlock);
>
> What does the mutex protect against exactly ?
>
> > +
> > +	/* Initialize formats and set format on sensor */
> > +	pcdev->sensor = subdev;
> > +	err = sh_ceu_init_active_formats(pcdev);
> > +	if (err)
> > +		return err;
> > +
> > +	err = sh_ceu_set_default_fmt(pcdev);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Register the video device */
> > +	strncpy(vdev->name, "sh_ceu", strlen("sh_ceu"));
> > +	vdev->minor		= -1;
>
> No need to set this field explicitly.
>
> > +	vdev->v4l2_dev		= v4l2_dev;
> > +	vdev->lock		= &pcdev->mlock;
> > +	vdev->queue		= &pcdev->vb2_vq;
> > +	vdev->ctrl_handler	= subdev->ctrl_handler;
>
> Why did you drop support for CEU controls ? :-(
>
> > +	vdev->fops		= &sh_ceu_fops;
> > +	vdev->ioctl_ops		= &sh_ceu_ioctl_ops;
> > +	vdev->release		= video_device_release_empty;
>
> You need to implement a release callback as explained below.
>
> > +	vdev->device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > +	video_set_drvdata(vdev, pcdev);
> > +
> > +	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> > +	if (err < 0) {
> > +		mutex_unlock(&pcdev->mlock);
> > +		v4l2_err(vdev->v4l2_dev,
> > +			 "video_register_device failed: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	mutex_unlock(&pcdev->mlock);
> > +	return 0;
> > +}
> > +
> > +static void sh_ceu_sensor_unbind(struct v4l2_async_notifier *notifier,
> > +				 struct v4l2_subdev *subdev,
> > +				 struct v4l2_async_subdev *asd)
> > +{
> > +	/* TODO */
> > +
> > +	return;
>
> The unbind callback is optional, you can remove it if it's empty.
>
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
> > +	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
>
> devm_kzalloc() is harmful here. You're embedding a struct video_device instead
> struct sh_ceu_dev, and the video device can outlive the platform driver
> remove() call if the device node is kept open by userspace when the device is
> removed. You should use kzalloc() and implement a .release callback for the
> video_device to kfree() the memory.
>
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
> > +
> > +		pcdev->video_limit = resource_size(res);
>
> You can get rid of this, we now have CMA that can be used unconditionally to
> allocate physically contiguous memory. Don't forget to remove the
> corresponding resource from SH board code that instantiate CEU devices.
>
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
