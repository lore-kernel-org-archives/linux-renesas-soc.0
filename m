Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A730CC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 17:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77F0D20838
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 17:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="BC+3oz0N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392923AbfBMR1l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:27:41 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43466 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390484AbfBMR1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 12:27:40 -0500
Received: by mail-lj1-f196.google.com with SMTP id z20so1706754ljj.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XwhHYrO1omjgzueimQUEcVVscrx6tTHMKUiuhys5oqk=;
        b=BC+3oz0N8NJSfUeAsgWuHQvDVHvenSLYNUwzw2Mk79uj+ZYADWerWALo42FD7/S+LA
         qyBR/jVUeiCd3SWpeAKZ2QrWrHOxzNZS4IcAnDSoQOpv/IZHkO+ragY16DjpzBgtYleG
         s+yRzC566Rvgs7hR8HfBhqELd2uuIAFex5BIoJVMmdydsciHrFREjIyAArNKCos50aNn
         MG9JG8k8m+PsFkpHkxdLt4sGOBNa7/TkUbnVf5gu81RGjHfsOixxDK21QoFTFEqT+BVP
         6TvZmJFcvbVgU6LxuSZqc8gzUN7Dun1FDK9As8x4Zs0wVm4sRJ+6Z/bRLMOw0D1rxS/I
         wIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XwhHYrO1omjgzueimQUEcVVscrx6tTHMKUiuhys5oqk=;
        b=iiCJo+GwA80BtQjXxheGKMZ4TRjitThylkDg7946trqbuTbZDANndDB1dWsGhkJfO1
         iD0rpkso3MGuo4Ph7fOrA8r5/lZ0kaX/Ysk+q+sky29gkU0/nbZY+dd00vZito61gBCN
         L167asGefg3kjWPCDVE2ASJnP3zy/zg6/tbueaZFrSmpa8dwW47XJ1FVgrF7qjngJuKT
         A5v0FJbj5Rs8RwxwksAWelzvcol0KP8TAXSC+KE9ZxKUwNkuUfkZdDjrhBrBkm1lKVTI
         OynjLgvovDtMGOCvYz+rP/iJn7zidvE7hpWyW827TYSBztyhok51JdA44vCTD/sV9sGk
         XGsg==
X-Gm-Message-State: AHQUAuZvyh7VARKk789aHfBmDNpzHrcUbDULYOEorAiAMALIosAhNWq7
        qo9okDtcvJMFX8hylVKRxCOtkA==
X-Google-Smtp-Source: AHgI3IY2OLfVXgi+pbQ2yG8RnIAsK+0A56t/J84KdnkDEoH5dzGdCIsLea+2SFLpSn+221f+L1i6vQ==
X-Received: by 2002:a2e:94ce:: with SMTP id r14-v6mr1005269ljh.34.1550078858874;
        Wed, 13 Feb 2019 09:27:38 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id q123-v6sm3551453ljb.60.2019.02.13.09.27.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 09:27:38 -0800 (PST)
Date:   Wed, 13 Feb 2019 18:27:37 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] gpio: pca953x: Add wake-up support
Message-ID: <20190213172737.GB31263@bigcity.dyn.berto.se>
References: <20190213131503.26801-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190213131503.26801-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch,

On 2019-02-13 14:15:03 +0100, Geert Uytterhoeven wrote:
> Implement the irq_set_wake() method in the (optional) irq_chip of the
> GPIO expander, and propagate wake-up settings to the upstream interrupt
> controller.  This allows GPIOs connected to a PCA953X GPIO expander to
> serve as wake-up sources.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tested with a PCA9654 and gpio-keys on an R-Car Ebisu-4D board.
> 
> v2:
>   - Just propagate irq_set_irq_wake().  As pca953x_irq_set_wake()
>     doesn't need to do anything else, there's no reason for making it
>     conditional.
> ---
>  drivers/gpio/gpio-pca953x.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index de52f63863dbe59b..86c00a3980c47c3b 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -513,6 +513,14 @@ static void pca953x_irq_unmask(struct irq_data *d)
>  	chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
>  }
>  
> +static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct pca953x_chip *chip = gpiochip_get_data(gc);
> +
> +	return irq_set_irq_wake(chip->client->irq, on);
> +}
> +
>  static void pca953x_irq_bus_lock(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -732,6 +740,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>  	irq_chip->name = dev_name(&chip->client->dev);
>  	irq_chip->irq_mask = pca953x_irq_mask;
>  	irq_chip->irq_unmask = pca953x_irq_unmask;
> +	irq_chip->irq_set_wake = pca953x_irq_set_wake;
>  	irq_chip->irq_bus_lock = pca953x_irq_bus_lock;
>  	irq_chip->irq_bus_sync_unlock = pca953x_irq_bus_sync_unlock;
>  	irq_chip->irq_set_type = pca953x_irq_set_type;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
