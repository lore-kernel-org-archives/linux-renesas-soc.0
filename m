Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F40C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C62E20854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gd9zguF1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfCOMFX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:05:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35771 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbfCOMFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:05:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CEB7325B76D;
        Fri, 15 Mar 2019 23:05:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552651520; bh=FeY1+D6VCiKDVsu+1Nuktgf4o7xWiszD0SjRn2xb1ow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gd9zguF1VrExVRD0N3PIlJQMXtayvpWiNZqaE8DIvRJsd9Y+VGLjZdvgew2uhIFPk
         +WE3r8WW/DujYjZXDxVSb8n4q7pQMJSpFvU81aYcRRZEGw4ynHwo/vu0YulNovYbk5
         S4oV3Ys7Mz2R79/5AoHPr1NHJ0gdzq01DBMb78Yw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 17F9A9403F2; Fri, 15 Mar 2019 13:05:18 +0100 (CET)
Date:   Fri, 15 Mar 2019 13:05:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Message-ID: <20190315120517.dlg5dfurvmetrlbg@verge.net.au>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 05:55:25PM +0100, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> i2c_new_dummy is typically called from the probe function of the
> driver for the primary i2c client. It requires calls to
> i2c_unregister_device in the error path of the probe function and
> in the remove function.
> This can be simplified by introducing a device-managed version.
> 
> Note the changed error case return value type:
> i2c_new_dummy returns NULL whilst devm_new_i2c_dummy returns an ERR_PTR.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/driver-model/devres.txt |  3 +++
>  drivers/i2c/i2c-core-base.c           | 44 +++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h                   |  3 +++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
> index b277cafce71e..e36dc8041857 100644
> --- a/Documentation/driver-model/devres.txt
> +++ b/Documentation/driver-model/devres.txt
> @@ -266,6 +266,9 @@ GPIO
>    devm_gpio_request_one()
>    devm_gpio_free()
>  
> +I2C
> +  devm_i2c_new_dummy_errptr()
> +
>  IIO
>    devm_iio_device_alloc()
>    devm_iio_device_free()
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index bbca2e8bb019..7f20c6b8857f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -921,6 +921,50 @@ struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy);
>  
> +struct i2c_dummy_devres {
> +	struct i2c_client *client;
> +};
> +
> +static void devm_i2c_release_dummy(struct device *dev, void *res)
> +{
> +	struct i2c_dummy_devres *this = res;
> +
> +	i2c_unregister_device(this->client);
> +}
> +
> +/**
> + * devm_i2c_new_dummy_errptr - return a new i2c device bound to a dummy driver
> + * @dev: device the managed resource is bound to
> + * @adapter: the adapter managing the device
> + * @address: seven bit address to be used
> + * Context: can sleep
> + *
> + * This is the device-managed version of @i2c_new_dummy. It returns the new i2c
> + * client or an ERR_PTR in case of an error.
> + */
> +struct i2c_client *devm_i2c_new_dummy_errptr(struct device *dev,
> +					     struct i2c_adapter *adapter,
> +					     u16 address)
> +{
> +	struct i2c_dummy_devres *dr;
> +	struct i2c_client *client;
> +
> +	dr = devres_alloc(devm_i2c_release_dummy, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	client = i2c_new_dummy_errptr(adapter, address);
> +	if (IS_ERR(client)) {
> +		devres_free(dr);
> +	} else {
> +		dr->client = client;
> +		devres_add(dev, dr);
> +	}
> +
> +	return client;
> +}
> +EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_errptr);
> +
>  /**
>   * i2c_new_secondary_device - Helper to get the instantiated secondary address
>   * and create the associated device
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 383510b4f083..93075c2ad9dc 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -470,6 +470,9 @@ extern struct i2c_client *
>  i2c_new_dummy(struct i2c_adapter *adap, u16 address);
>  
>  extern struct i2c_client *
> +devm_i2c_new_dummy_errptr(struct device *dev, struct i2c_adapter *adap, u16 address);
> +
> +extern struct i2c_client *
>  i2c_new_secondary_device(struct i2c_client *client,
>  				const char *name,
>  				u16 default_addr);
> -- 
> 2.11.0
> 
