Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39628 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750912AbdEBKyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:54:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jmondi <jacopo@jmondi.org>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Date: Tue, 02 May 2017 13:55:26 +0300
Message-ID: <4515454.8H6ibpuTk9@avalon>
In-Reply-To: <20170501143736.GA5814@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org> <2468637.9LR39KYxFA@avalon> <20170501143736.GA5814@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Monday 01 May 2017 16:37:54 jmondi wrote:
> On Thu, Apr 27, 2017 at 02:47:14PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> > 
> > This is a partial review, as some of the comments will result in large
> > changes that would make review of some of the current code pointless.
> > There is however enough comments to keep you busy for a bit :-)
> 
> Indeed
> 
> > By the way, you might want to keep your development history in a private
> > git branch, in order to bisect issues when you'll finally be able to test
> > the driver on real hardware. Otherwise we'll end up at v7, the driver
> > won't work, and you will have no idea why.
> 
> As many of your comments are on existing code that I blindly took from
> the existing driver, I decided to start fresh with a new driver from
> scratch. Next patches I will send will be based on your comments on this
> series, and I take the opportunity to ask some questions on some
> parts of code that were already in the driver and I'm failing to fully
> understand.

Please try to keep the structure of the driver you posted if possible, 
otherwise I'll have to review completely new code, which will be more time 
consuming.

> To speed things up, I'm going to reply/make questions on code as I'm
> rewriting it, so let's start from the bottom of the driver.
> 
> > On Thursday 27 Apr 2017 10:42:27 Jacopo Mondi wrote:
> > > Add driver for SH Mobile CEU driver, based on
> > > drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
> > > 
> > > The original driver was based on soc-camera framework.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > > 
> > >  drivers/media/platform/Kconfig         |    9 +
> > >  drivers/media/platform/Makefile        |    2 +
> > >  drivers/media/platform/sh_ceu_camera.c | 1597 +++++++++++++++++++++++++
> > >  3 files changed, 1608 insertions(+)
> > >  create mode 100644 drivers/media/platform/sh_ceu_camera.c

[snip]

> > > diff --git a/drivers/media/platform/Makefile
> > > b/drivers/media/platform/Makefile index 349ddf6..a2b9aa6 100644
> > > --- a/drivers/media/platform/Makefile
> > > +++ b/drivers/media/platform/Makefile
> > > @@ -25,6 +25,8 @@
> > >  obj-$(CONFIG_VIDEO_CODA) 		+= coda/
> > > 
> > >  obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o
> > > +obj-$(CONFIG_VIDEO_SH_MOBILE_CEU)		+= sh_ceu_camera.o
> > > +
> 
> This will be renamed in "ceu_camera.c" as well

How about renesas-ceu.c ?

> > >  obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
> > >  obj-$(CONFIG_VIDEO_S3C_CAMIF) 		+= s3c-camif/
> > > 
> > > diff --git a/drivers/media/platform/sh_ceu_camera.c
> > > b/drivers/media/platform/sh_ceu_camera.c new file mode 100644
> > > index 0000000..07fe0e7
> > > --- /dev/null
> > > +++ b/drivers/media/platform/sh_ceu_camera.c

[snip]

> > > +struct sh_ceu_dev {
> > > +	struct video_device vdev;
> > > +	struct v4l2_device  v4l2_dev;
> > > +
> > > +	struct v4l2_subdev *sensor;
> > > +
> > > +	struct v4l2_async_notifier notifier;
> > > +
> > > +	struct v4l2_async_subdev asd;
> > > +	struct v4l2_async_subdev *asds[1];
> > > +
> > > +	struct vb2_queue vb2_vq;
> > > +
> > > +	struct mutex mlock;
> > 
> > You need to document what this lock protects.
> > 
> > > +
> > > +	unsigned int irq;
> > > +	void __iomem *base;
> > > +	size_t video_limit;
> > > +	size_t buf_total;
> > > +
> > > +	spinlock_t lock;		/* Protects video buffer lists */
> > 
> > Please list which field(s) the lock protects explicitly.
> > 
> > > +	struct list_head capture;
> > > +	struct vb2_v4l2_buffer *active;
> > > +
> > > +	enum v4l2_field field;
> > > +	struct v4l2_format v4l2_fmt;
> > 
> > v4l2_format is quite a big structure, and you don't need most of it. I
> > would store v4l2_pix_format only.
> > 
> > > +	unsigned int n_active_fmts;
> > > +	struct sh_ceu_fmt **active_fmts;
> > > +	struct sh_ceu_fmt *current_fmt;
> > 
> > These two should be const.
> 
> Why both of them? I understand the list of active formats is built
> during driver initilization, but the "current_fmt" is set during
> "set_fmt" and can change at run time, right?

Please see Geert's reply on this.

> > > +
> > > +	struct sh_ceu_info *pdata;
> > > +	struct completion complete;
> > > +
> > > +	u32 cflcr;
> > > +
> > > +	/* static max sizes either from platform data or default */
> > > +	int max_width;
> > > +	int max_height;
> > 
> > No platform sets non-default max_width or max_height values, just replace
> > them with #define's.
> 
> yup
> 
> > > +
> > > +	int sequence;
> > > +	unsigned long flags;
> > > +
> > > +	unsigned int image_mode:1;
> > > +	unsigned int is_16bit:1;
> > > +	unsigned int frozen:1;
> > > +};

[snip]

> > > +}
> > > +static int sh_ceu_probe(struct platform_device *pdev)
> > > +{
> > > +	struct sh_ceu_dev *pcdev;
> > > +	struct resource *res;
> > > +	void __iomem *base;
> > > +	unsigned int irq;
> > > +	int err;
> > > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > 
> > I would move this right before the devm_ioremap_resource() call.
> > 
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (!res || (int)irq <= 0) {
> > > +		dev_err(&pdev->dev, "Not enough CEU platform resources.\n");
> > > +		return -ENODEV;
> > > +	}
> > 
> > Similarly, I'd move this right before devm_request_irq().
> 
> Looks better, yes
> 
> > > +	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
> > 
> > devm_kzalloc() is harmful here. You're embedding a struct video_device
> > instead struct sh_ceu_dev, and the video device can outlive the platform
> > driver remove() call if the device node is kept open by userspace when
> > the device is removed. You should use kzalloc() and implement a .release
> > callback for the video_device to kfree() the memory.
> 
> Just to make sure: you're referring to vdev->release callback, right?

Correct.

> When does the video device get "released"? is it reference counted?

It's reference-counted and released when the last reference is dropped. This 
can be either synchronously from video_unregister_device(), or, if the device 
node is kept open by an application, when the last file handle is closed. You 
must thus make sure not to access the structure in any way in the remove() 
handler after video_unregister_device() returns.

The struct v4l2_file_operations release() operation handler is called as part 
of the close() syscall. If the device node is kept open when the video_device 
is unregistered, that operation can thus be called after 
video_unregister_device() returns, and thanks to the video_device refcounting 
can still access memory allocated for the driver's private data structure.

> > Note that devm_ioremap_resource() and devm_request_irq() are fine as the
> > MMIO and interrupts must not be used after the remove() function returns.
> > 
> > > +	if (!pcdev) {
> > > +		dev_err(&pdev->dev, "Could not allocate pcdev\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	mutex_init(&pcdev->mlock);
> > > +	INIT_LIST_HEAD(&pcdev->capture);
> > > +	spin_lock_init(&pcdev->lock);
> > > +	init_completion(&pcdev->complete);
> > > +
> > > +	pcdev->pdata = pdev->dev.platform_data;
> > > +	if (pdev->dev.of_node && !pcdev->pdata) {
> > 
> > If there's an OF node there's no platform data, you can this code this as
> > 
> > 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
> > 		...
> > 	} else if (pcdev->pdata) {
> > 		...
> > 	} else {
> > 		...
> > 	}
> > 
> > The IS_ENABLED(CONFIG_OF) will make sure the code is not compiled in for
> > non- OF platforms.
> > 
> > > +		/* TODO: implement OF parsing */
> > > +	} else if (pcdev->pdata && !pdev->dev.of_node) {
> > > +		/* TODO: implement per-device bus flags */
> > 
> > Is this needed ? I don't expect any new feature to be implemented for
> > non-OF platforms.
> > 
> > > +		pcdev->max_width = pcdev->pdata->max_width;
> > > +		pcdev->max_height = pcdev->pdata->max_height;
> > > +		pcdev->flags = pcdev->pdata->flags;
> > > +		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
> > > +		pcdev->asd.match.i2c.adapter_id =
> > > +			pcdev->pdata->sensor_i2c_adapter_id;
> > > +		pcdev->asd.match.i2c.address = pcdev->pdata->
> > > sensor_i2c_address;
> > > +	} else {
> > > +		dev_err(&pdev->dev, "CEU platform data not set.\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	pcdev->field = V4L2_FIELD_NONE;
> > > +
> > > +	if (!pcdev->max_width)
> > > +		pcdev->max_width = 2560;
> > > +	if (!pcdev->max_height)
> > > +		pcdev->max_height = 1920;
> > > +
> > > +	base = devm_ioremap_resource(&pdev->dev, res);
> > > +	if (IS_ERR(base))
> > > +		return PTR_ERR(base);
> > > +
> > > +	pcdev->irq = irq;
> > > +	pcdev->base = base;
> > > +	pcdev->video_limit = 0; /* only enabled if second resource exists */
> > > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +	if (res) {
> > > +		err = dma_declare_coherent_memory(&pdev->dev, res->start,
> > > +						  res->start,
> > > +						  resource_size(res),
> > > +						  DMA_MEMORY_MAP |
> > > +						  DMA_MEMORY_EXCLUSIVE);
> > > +		if (!err) {
> > > +			dev_err(&pdev->dev, "Unable to declare CEU memory.
> > > \n");
> > > +			return -ENXIO;
> > > +		}
> 
> I'm not sure I got this piece of code.
> Seems like the second MEM resource is optional, but if it is not provided
> then in "sh_ceu_videobuf_setup" the driver does not set the "count"
> number of buffers..
> 
> If the second resource is not provided, where is DMA-able memory
> reserved? Also, I have found this is the only driver using
> "dma_declare_coherent_memory" in whole drivers/media/platform
> directory. Why we cannot use dma_alloc_coherent? (my understanding is
> also that a call to that function should be made after a coherent dma
> area has been declared but I haven't found it.. maybe it's just me
> failing to understand DMA-API)

dma_alloc_coherent() allocates memory from different pools. One of them is the 
device's DMA coherent memory pool, which is populated by 
dma_declare_coherent_memory(). If the second memory resource exists, the 
driver assumes that board code has reserved the corresponding memory block for 
the CEU's exclusive usage, and will populate the CEU's coherent memory pool 
with it. videobuf2-dma-contig will then, when allocating the buffers with 
dma_alloc_coherent(), allocate from that piece of memory.

The CEU requires a large piece of physically contiguous memory, which was hard 
to allocate without reserving it at boot time before CMA was available in the 
kernel. Now that it is, this mechanism is pointless and can be removed.

> EDIT: see below comments, probably you can ignore this questions...
> 
> > > +
> > > +		pcdev->video_limit = resource_size(res);
> > 
> > You can get rid of this, we now have CMA that can be used unconditionally
> > to allocate physically contiguous memory. Don't forget to remove the
> > corresponding resource from SH board code that instantiate CEU devices.
> 
> I guess this comment applies not only to this last line but to the
> whole block I've previously commented. If so, ignore my previous
> questions...

Correct.

> > > +	}
> > > +
> > > +	/* request irq */
> > 
> > I'm not sure the comment is really valuable :-)
> > 
> > > +	err = devm_request_irq(&pdev->dev, pcdev->irq, sh_ceu_irq,
> > > +			       0, dev_name(&pdev->dev), pcdev);
> > > +	if (err) {
> > > +		dev_err(&pdev->dev, "Unable to register CEU interrupt.\n");
> > > +		goto exit_release_mem;
> > > +	}
> > > +
> > > +	pm_suspend_ignore_children(&pdev->dev, true);
> > > +	pm_runtime_enable(&pdev->dev);
> > > +	pm_runtime_resume(&pdev->dev);
> > > +
> > > +	dev_set_drvdata(&pdev->dev, pcdev);
> > > +	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
> > > +	if (err)
> > > +		goto exit_free_clk;
> > > +
> > > +	pcdev->asds[0] = &pcdev->asd;
> > > +	pcdev->notifier.v4l2_dev = &pcdev->v4l2_dev;
> > > +	pcdev->notifier.subdevs = pcdev->asds;
> > > +	pcdev->notifier.num_subdevs = 1;
> > > +	pcdev->notifier.bound = sh_ceu_sensor_bound;
> > > +	pcdev->notifier.unbind = sh_ceu_sensor_unbind;
> > > +
> > > +	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev-
> > >
> > >notifier);
> > >
> > > +	if (err)
> > > +		goto exit_free_clk;
> > > +
> > > +	return 0;
> > > +
> > > +exit_free_clk:
> >
> > I'd call the label error_pm_runtime, as it's not specific to clocks
> > anymore. error is always a better prefix than exit in my opinion, as exit
> > could indicate early exit in a non-error case. And this being said, if
> > you remove the second MEM resource, you can drop the exit_release_mem()
> > label, so this one could just be called error.
> 
> I guess this confirms me I should move to use dma_alloc_coherent() and
> related APIs

videobuf2-dma-contig handles that for you (and uses dma_alloc_coherent()), you 
don't need to allocate memory manually.

> > > +	pm_runtime_disable(&pdev->dev);
> > > +exit_release_mem:
> > > +	if (platform_get_resource(pdev, IORESOURCE_MEM, 1))
> > > +		dma_release_declared_memory(&pdev->dev);
> > > +	return err;
> > > +}

-- 
Regards,

Laurent Pinchart
