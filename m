Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48360 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750934AbdEBJtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 05:49:12 -0400
Date: Tue, 2 May 2017 11:48:42 +0200
From: jmondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Message-ID: <20170502094842.GC5814@w540>
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
>

[snip]

> > +	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
>
> devm_kzalloc() is harmful here. You're embedding a struct video_device instead
> struct sh_ceu_dev, and the video device can outlive the platform driver
> remove() call if the device node is kept open by userspace when the device is
> removed. You should use kzalloc() and implement a .release callback for the
> video_device to kfree() the memory.
>

Does this apply to video_unregister_device() as well?
Should I keep it registered after platform driver removal?

Other drivers (eg atmel-isc and pxa_camera) unregister the video
device in their sensor unbind callbacks.
As video device has pointer to fops embedded, if we unregister it at
sensor unbind time, does the ipotetical application having an open
reference to the device node lose the ability to properly close it?

Thanks
   j

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
