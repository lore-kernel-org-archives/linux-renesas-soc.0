Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:36110 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934502AbcLMRLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 12:11:39 -0500
Received: by mail-wj0-f196.google.com with SMTP id j10so17424948wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2016 09:11:38 -0800 (PST)
Date: Tue, 13 Dec 2016 18:11:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm: shmobile: Perform initialization/cleanup at
 probe/remove time
Message-ID: <20161213171134.xg7ihewey7aa7gej@phenom.ffwll.local>
References: <20161213084300.5kvq6ymgrkqldf3t@phenom.ffwll.local>
 <1481633988-31267-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481633988-31267-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 13, 2016 at 02:59:48PM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The drm driver .load() operation is prone to race conditions as it
> initializes the driver after registering the device nodes. Its usage is
> deprecated, inline it in the probe function and call drm_dev_alloc() and
> drm_dev_register() explicitly.
> 
> For consistency inline the .unload() handler in the remove function as
> well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> Changes since v1:
> 
> - Removed manual the drm_connector_register() that caused sysfs-related
>   warnings

Hm, what did go boom there? We should catch multiple calls to
drm_connector_register ...
-Daniel

> 
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c |   7 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c  | 206 +++++++++++++++---------------
>  2 files changed, 104 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index dddbdd62bed0..20bd060bc5a8 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -692,13 +692,10 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  		return ret;
>  
>  	drm_connector_helper_add(connector, &connector_helper_funcs);
> -	ret = drm_connector_register(connector);
> -	if (ret < 0)
> -		goto err_cleanup;
>  
>  	ret = shmob_drm_backlight_init(&sdev->connector);
>  	if (ret < 0)
> -		goto err_sysfs;
> +		goto err_cleanup;
>  
>  	ret = drm_mode_connector_attach_encoder(connector, encoder);
>  	if (ret < 0)
> @@ -712,8 +709,6 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  
>  err_backlight:
>  	shmob_drm_backlight_exit(&sdev->connector);
> -err_sysfs:
> -	drm_connector_unregister(connector);
>  err_cleanup:
>  	drm_connector_cleanup(connector);
>  	return ret;
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 38dd55f4af81..ec7a5eb809a2 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -104,102 +104,6 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
>   * DRM operations
>   */
>  
> -static int shmob_drm_unload(struct drm_device *dev)
> -{
> -	drm_kms_helper_poll_fini(dev);
> -	drm_mode_config_cleanup(dev);
> -	drm_vblank_cleanup(dev);
> -	drm_irq_uninstall(dev);
> -
> -	dev->dev_private = NULL;
> -
> -	return 0;
> -}
> -
> -static int shmob_drm_load(struct drm_device *dev, unsigned long flags)
> -{
> -	struct shmob_drm_platform_data *pdata = dev->dev->platform_data;
> -	struct platform_device *pdev = dev->platformdev;
> -	struct shmob_drm_device *sdev;
> -	struct resource *res;
> -	unsigned int i;
> -	int ret;
> -
> -	if (pdata == NULL) {
> -		dev_err(dev->dev, "no platform data\n");
> -		return -EINVAL;
> -	}
> -
> -	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
> -	if (sdev == NULL) {
> -		dev_err(dev->dev, "failed to allocate private data\n");
> -		return -ENOMEM;
> -	}
> -
> -	sdev->dev = &pdev->dev;
> -	sdev->pdata = pdata;
> -	spin_lock_init(&sdev->irq_lock);
> -
> -	sdev->ddev = dev;
> -	dev->dev_private = sdev;
> -
> -	/* I/O resources and clocks */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res == NULL) {
> -		dev_err(&pdev->dev, "failed to get memory resource\n");
> -		return -EINVAL;
> -	}
> -
> -	sdev->mmio = devm_ioremap_nocache(&pdev->dev, res->start,
> -					  resource_size(res));
> -	if (sdev->mmio == NULL) {
> -		dev_err(&pdev->dev, "failed to remap memory resource\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = shmob_drm_init_interface(sdev);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = shmob_drm_modeset_init(sdev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to initialize mode setting\n");
> -		return ret;
> -	}
> -
> -	for (i = 0; i < 4; ++i) {
> -		ret = shmob_drm_plane_create(sdev, i);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to create plane %u\n", i);
> -			goto done;
> -		}
> -	}
> -
> -	ret = drm_vblank_init(dev, 1);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to initialize vblank\n");
> -		goto done;
> -	}
> -
> -	ret = drm_irq_install(dev, platform_get_irq(dev->platformdev, 0));
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to install IRQ handler\n");
> -		goto done;
> -	}
> -
> -	platform_set_drvdata(pdev, sdev);
> -
> -done:
> -	if (ret)
> -		shmob_drm_unload(dev);
> -
> -	return ret;
> -}
> -
>  static irqreturn_t shmob_drm_irq(int irq, void *arg)
>  {
>  	struct drm_device *dev = arg;
> @@ -255,8 +159,6 @@ static const struct file_operations shmob_drm_fops = {
>  static struct drm_driver shmob_drm_driver = {
>  	.driver_features	= DRIVER_HAVE_IRQ | DRIVER_GEM | DRIVER_MODESET
>  				| DRIVER_PRIME,
> -	.load			= shmob_drm_load,
> -	.unload			= shmob_drm_unload,
>  	.irq_handler		= shmob_drm_irq,
>  	.get_vblank_counter	= drm_vblank_no_hw_counter,
>  	.enable_vblank		= shmob_drm_enable_vblank,
> @@ -319,18 +221,116 @@ static const struct dev_pm_ops shmob_drm_pm_ops = {
>   * Platform driver
>   */
>  
> -static int shmob_drm_probe(struct platform_device *pdev)
> +static int shmob_drm_remove(struct platform_device *pdev)
>  {
> -	return drm_platform_init(&shmob_drm_driver, pdev);
> +	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
> +	struct drm_device *ddev = sdev->ddev;
> +
> +	drm_dev_unregister(ddev);
> +	drm_kms_helper_poll_fini(ddev);
> +	drm_mode_config_cleanup(ddev);
> +	drm_irq_uninstall(ddev);
> +	drm_dev_unref(ddev);
> +
> +	return 0;
>  }
>  
> -static int shmob_drm_remove(struct platform_device *pdev)
> +static int shmob_drm_probe(struct platform_device *pdev)
>  {
> -	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
> +	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
> +	struct shmob_drm_device *sdev;
> +	struct drm_device *ddev;
> +	struct resource *res;
> +	unsigned int i;
> +	int ret;
> +
> +	if (pdata == NULL) {
> +		dev_err(&pdev->dev, "no platform data\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Allocate and initialize the driver private data, I/O resources and
> +	 * clocks.
> +	 */
> +	sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev), GFP_KERNEL);
> +	if (sdev == NULL)
> +		return -ENOMEM;
> +
> +	sdev->dev = &pdev->dev;
> +	sdev->pdata = pdata;
> +	spin_lock_init(&sdev->irq_lock);
> +
> +	platform_set_drvdata(pdev, sdev);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
> +	if (sdev->mmio == NULL)
> +		return -ENOMEM;
> +
> +	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
> +	if (ret < 0)
> +		return ret;
>  
> -	drm_put_dev(sdev->ddev);
> +	ret = shmob_drm_init_interface(sdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Allocate and initialize the DRM device. */
> +	ddev = drm_dev_alloc(&shmob_drm_driver, &pdev->dev);
> +	if (IS_ERR(ddev))
> +		return PTR_ERR(ddev);
> +
> +	sdev->ddev = ddev;
> +	ddev->dev_private = sdev;
> +
> +	ret = shmob_drm_modeset_init(sdev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to initialize mode setting\n");
> +		goto err_free_drm_dev;
> +	}
> +
> +	for (i = 0; i < 4; ++i) {
> +		ret = shmob_drm_plane_create(sdev, i);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to create plane %u\n", i);
> +			goto err_modeset_cleanup;
> +		}
> +	}
> +
> +	ret = drm_vblank_init(ddev, 1);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to initialize vblank\n");
> +		goto err_modeset_cleanup;
> +	}
> +
> +	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to install IRQ handler\n");
> +		goto err_vblank_cleanup;
> +	}
> +
> +	/*
> +	 * Register the DRM device with the core and the connectors with
> +	 * sysfs.
> +	 */
> +	ret = drm_dev_register(ddev, 0);
> +	if (ret < 0)
> +		goto err_irq_uninstall;
>  
>  	return 0;
> +
> +err_irq_uninstall:
> +	drm_irq_uninstall(ddev);
> +err_vblank_cleanup:
> +	drm_vblank_cleanup(ddev);
> +err_modeset_cleanup:
> +	drm_kms_helper_poll_fini(ddev);
> +	drm_mode_config_cleanup(ddev);
> +err_free_drm_dev:
> +	drm_dev_unref(ddev);
> +
> +	return ret;
>  }
>  
>  static struct platform_driver shmob_drm_platform_driver = {
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
