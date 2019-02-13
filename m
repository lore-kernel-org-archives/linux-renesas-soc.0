Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A899C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A1FF222BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gNdz4lbA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732170AbfBMJpM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:45:12 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38489 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfBMJpL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 04:45:11 -0500
Received: by mail-lj1-f193.google.com with SMTP id j19so627178ljg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 01:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBI7PDWfGY9Hx7vVNev8Q9U4lCVp9g/pYuVwGAyz5yM=;
        b=gNdz4lbAjrvDAya06SGq3A9/Lu8TIOTyUE4M2UKuzQhw8crK+MgbXLpgdE3vz9u7Ih
         chpLuDxwDyOph00JD4Dnfttbj4r9rXmKaW567t7UxhLpjO1kpnnN6lkO/9s8RewuYqBR
         NCF9wO9EK4GlDuhspY/Merm3DH1DsFJCtEFwRwQfV1/uc29JEbi03YqPGK+RY5aryyCw
         szFq5cq/vxEMryALIxHtiCXJqs1p+XJOrrOWCVKbjGE2+jA3Zdt3ewxpEqEt9ekwxj/C
         y3gzO/hSXATczZylX8ugoGi+7dKj9Il3uAadaEM30dnYD1V4lEz7/TTDg2SyttrlpemS
         Sy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBI7PDWfGY9Hx7vVNev8Q9U4lCVp9g/pYuVwGAyz5yM=;
        b=ISZVTvstKbyNMQcJNmzuQif3FEl+t/OI+qhG+inEBFrI1a0uVdNAZ4AWBSEusAAXFu
         8AXCZWs2GZssjqr7YCkPHzIhhiviwGRuWKhjLNa34D7MJPa4GJyOBGGKxoo5VUIoPsJl
         oNpdsJAs+pVFWRlmg4PgR4L+GfOyz2rsjbC7U1VvSRdXXbO0hSnFWDhNoUXPdlWOl8XZ
         qM+lmt1SPLMoG0AjDUV+44IwwRSb1deUhdDGjrpWxrv5K1AMIFamjui9U5PsK+HEvqxQ
         b/j2JIkdBNjI5MLq0e45FCzsqXA1/jmmMdPYpDuDTxSmIefcq6tr/OFc88EteEONHs+4
         rTNQ==
X-Gm-Message-State: AHQUAubNHD+TEBh6nEryEPEnsxH6rjZKXfhPHEbMg/8SxrEKglMnYJfW
        SuYf4pa6gn5C1v6wfdQXyHQhIbeK4SwNvkvrxDr3DA==
X-Google-Smtp-Source: AHgI3Ib84QBXf7y+2/IsSTslK5mNqrSvrfUBHeD+5E3HQijwtckM9PKk1If0oIYeOgNbZ8KoJWFncmLUVntrWn7UWaU=
X-Received: by 2002:a2e:131a:: with SMTP id 26-v6mr4828848ljt.107.1550051109803;
 Wed, 13 Feb 2019 01:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20190212141715.3966-1-geert+renesas@glider.be>
In-Reply-To: <20190212141715.3966-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Feb 2019 10:44:57 +0100
Message-ID: <CACRpkdZ60MEv8t2WZkDzv8pbLoYbPmcKJdFmSBABGkmk+SSKGg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add wake-up support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Top-posting to Thomas Petazzoni, he's been working on this driver
recently and is also on top of thing when it comes to wakeup.

Thomas, it would be great if you can take a look at this.

Yours,
Linus Walleij

On Tue, Feb 12, 2019 at 3:17 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Implement the irq_set_wake() method in the (optional) irq_chip of the
> GPIO expander, and propagate wake-up settings to the upstream interrupt
> controller.  This allows GPIOs connected to a PCA953X GPIO expander to
> serve as wake-up sources.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested with a PCA9654 and gpio-keys on an R-Car Ebisu-4D board.
> ---
>  drivers/gpio/gpio-pca953x.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index de52f63863dbe59b..8dfb8e326b9d12ca 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -151,6 +151,7 @@ struct pca953x_chip {
>         u8 irq_trig_raise[MAX_BANK];
>         u8 irq_trig_fall[MAX_BANK];
>         struct irq_chip irq_chip;
> +       unsigned int irq_parent;
>  #endif
>
>         struct i2c_client *client;
> @@ -513,6 +514,24 @@ static void pca953x_irq_unmask(struct irq_data *d)
>         chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
>  }
>
> +static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct pca953x_chip *chip = gpiochip_get_data(gc);
> +       int error = 0;
> +
> +       if (chip->irq_parent) {
> +               error = irq_set_irq_wake(chip->irq_parent, on);
> +               if (error) {
> +                       dev_dbg(&chip->client->dev,
> +                               "irq %u doesn't support irq_set_wake\n",
> +                               chip->irq_parent);
> +                       chip->irq_parent = 0;
> +               }
> +       }
> +       return error;
> +}
> +
>  static void pca953x_irq_bus_lock(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -732,6 +751,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>         irq_chip->name = dev_name(&chip->client->dev);
>         irq_chip->irq_mask = pca953x_irq_mask;
>         irq_chip->irq_unmask = pca953x_irq_unmask;
> +       irq_chip->irq_set_wake = pca953x_irq_set_wake;
>         irq_chip->irq_bus_lock = pca953x_irq_bus_lock;
>         irq_chip->irq_bus_sync_unlock = pca953x_irq_bus_sync_unlock;
>         irq_chip->irq_set_type = pca953x_irq_set_type;
> @@ -747,6 +767,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
>         }
>
>         gpiochip_set_nested_irqchip(&chip->gpio_chip, irq_chip, client->irq);
> +       chip->irq_parent = client->irq;
>
>         return 0;
>  }
> --
> 2.17.1
>
