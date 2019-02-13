Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09364C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 16:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C771B222CF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 16:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="SwjcdwqV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404407AbfBMQpk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 11:45:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40980 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404459AbfBMQpk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 11:45:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id e27so2289080lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 08:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+iQK6xMznedPmtaQAGtxdRGEA2GFoa7d6/oGI0cmz30=;
        b=SwjcdwqV1V2aMDcvZ51GMbKW8O/AMbLevqvm8fif9cLEytTMTpHAaFNamU20T7PzQV
         QuV7dte71C8v+fILzmzxfvtwhYk3THB3EpUTCKgQ+ADeM3yHtg+o96PKYpn5A+zNC+Zf
         c82u3kGJQpFKX7C5h9JMXaOkmfSROLMXUdkCzU9yAiOzUVcqzxR0RCfXmh3mjozWku0B
         kRKljKVnBHICmqqXeaoDIx67hoA46CFqRmZPUOhmRQuqp/3WeDckR/S2cf9AU+WRvklR
         g4f9EzFYYeok5Xp5bH+y6Nc95D4jl1B9RgnJntWH09oZpAHXEK/3+wmLt7vKT1C9RMqk
         juYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+iQK6xMznedPmtaQAGtxdRGEA2GFoa7d6/oGI0cmz30=;
        b=MPDvSHl1L89kcjzI8rTF8aBDOyKziMvrTFwj0vLlyMAIvpViZMSH3HzMGeBveEVKcN
         bhhBCIneb1ARQ2ZOhnSlrY8bue+TqwO708FSMBq7FMY58mwHO0a0C5gN7fPxuz3d+jZI
         Vfuchl76HxhxOAIP84uF+v+IpKt6dcY8UcuLhHUuFG7cRnKD7efX190kvq9/eD1yW/c5
         vRsI7F4kAv0XibRKebfxPtmte9DrcG+CES03op9Y8xCmnT4bv6IwG4pAOT2GuMiQ/MiG
         IHJ8pu6QGSjAAghHP1l1sUBYu3OnFizGYtAv7dKaljzWi6nc30dqXiAhSHcLVBxnwHfw
         OIZA==
X-Gm-Message-State: AHQUAuZQhfAbiVv9jyr+W2a2/upFNRIRBMo/7KXC+FVIuDv46k0p4XgO
        dSR/akN9VAF5zmK+dDN5c6WjBA==
X-Google-Smtp-Source: AHgI3IZDPSdmjM9NDGM3GIoKmigZFmG/i7fD8Qo+tzeWLeBz/mKeMtVktQa9aRPdSwqIJHP0p2PiDQ==
X-Received: by 2002:ac2:50c8:: with SMTP id h8mr938093lfm.35.1550076337366;
        Wed, 13 Feb 2019 08:45:37 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id d24-v6sm3483633ljg.2.2019.02.13.08.45.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 08:45:36 -0800 (PST)
Date:   Wed, 13 Feb 2019 17:45:36 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: pcf857x: Simpify wake-up handling
Message-ID: <20190213164536.GA31263@bigcity.dyn.berto.se>
References: <20190213131409.26607-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190213131409.26607-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2019-02-13 14:14:09 +0100, Geert Uytterhoeven wrote:
> Unlike gpio_rcar_irq_set_wake(), where this solution was based on,

s/where/which/ ?

> pcf857x_irq_set_wake() does not need to do anything else than calling
> irq_set_irq_wake() for the upstream interrupt controller.  Hence there
> is no reason for making this call conditional, and no longer a need for
> keeping a copy of the interrupt number that also serves as a flag.
> 
> Just propagate irq_set_irq_wake() to the upstream interrupt controller,
> using the original interrupt number.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This change makes sens to me,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> I can no longer reproduce the issue fixed by commit ffb8e44bd7617ede
> ("gpio: pcf857x: Check for irq_set_irq_wake() failures") on current
> kernels: if .irq_set_wake() fails, system suspend is aborted, and the
> imbalance on resume never happens.
> 
> Looking at old logs, the system used to continue suspending, leading to
> the imbalance.  Presumably I could run git bisect to find out when that
> was changed, but that would require downgrading my cross-compiler (Linux
> v4.1-rc3 didn't support building using gcc-7)...
> ---
>  drivers/gpio/gpio-pcf857x.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index 68a35b65925aca76..c9b650f617fa687c 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -89,7 +89,6 @@ struct pcf857x {
>  	struct mutex		lock;		/* protect 'out' */
>  	unsigned		out;		/* software latch */
>  	unsigned		status;		/* current status */
> -	unsigned int		irq_parent;
>  	unsigned		irq_enabled;	/* enabled irqs */
>  
>  	int (*write)(struct i2c_client *client, unsigned data);
> @@ -211,18 +210,7 @@ static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
>  {
>  	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
>  
> -	int error = 0;
> -
> -	if (gpio->irq_parent) {
> -		error = irq_set_irq_wake(gpio->irq_parent, on);
> -		if (error) {
> -			dev_dbg(&gpio->client->dev,
> -				"irq %u doesn't support irq_set_wake\n",
> -				gpio->irq_parent);
> -			gpio->irq_parent = 0;
> -		}
> -	}
> -	return error;
> +	return irq_set_irq_wake(gpio->client->irq, on);
>  }
>  
>  static void pcf857x_irq_enable(struct irq_data *data)
> @@ -392,7 +380,6 @@ static int pcf857x_probe(struct i2c_client *client,
>  
>  		gpiochip_set_nested_irqchip(&gpio->chip, &gpio->irqchip,
>  					    client->irq);
> -		gpio->irq_parent = client->irq;
>  	}
>  
>  	/* Let platform code set up the GPIOs and their users.
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
