Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C01C7EE23
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  1 Jun 2023 21:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjFAVku (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 1 Jun 2023 17:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbjFAVks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2023 17:40:48 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Jun 2023 14:40:29 PDT
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC79E4A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 14:40:29 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id c73ded7f-00c4-11ee-b972-005056bdfda7;
        Fri, 02 Jun 2023 00:39:25 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 2 Jun 2023 00:39:25 +0300
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <ZHkQDTvk6I2q-9CF@surfacebook>
References: <20220329091126.4730-1-wsa+renesas@sang-engineering.com>
 <20220329091126.4730-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329091126.4730-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Tue, Mar 29, 2022 at 11:11:26AM +0200, Wolfram Sang kirjoitti:
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

One note since I have done recent review and realize one issue with debugfs.

...

> +	priv->debug_dir = debugfs_create_dir(devname, gpio_la_poll_debug_dir);

If this fails with NULL...

> +	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
> +	debugfs_create_ulong("delay_ns", 0600, priv->debug_dir, &priv->delay_ns);
> +	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->acq_delay);
> +	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
> +	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
> +	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);

...and any of these is not, we will end up with the file in a root folder of debugfs...

> +	dev_info(dev, "initialized");

...

> +static int gpio_la_poll_remove(struct platform_device *pdev)
> +{
> +	struct gpio_la_poll_priv *priv = platform_get_drvdata(pdev);
> +
> +	mutex_lock(&priv->lock);
> +	debugfs_remove_recursive(priv->debug_dir);

...and this one won't remove it.

> +	mutex_unlock(&priv->lock);
> +	mutex_destroy(&priv->lock);
> +
> +	return 0;
> +}

...

However, I haven't checked if it's pure theoretical issue with the current code
base of debugfs or a potential problem. Easy fix is to check an error code and
skip the files creation. Not sure if driver will be useful in that case.

-- 
With Best Regards,
Andy Shevchenko


