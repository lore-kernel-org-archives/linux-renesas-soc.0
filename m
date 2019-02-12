Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB710C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A7062186A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t4NHeFhL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfBLOfa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 09:35:30 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38474 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729528AbfBLOfa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 09:35:30 -0500
Received: by mail-ot1-f66.google.com with SMTP id m1so4722527otf.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Feb 2019 06:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CPX9OAcUsPK24kBxydGkmqfxgoh4s7OnFGV7n+XAerI=;
        b=t4NHeFhL5jA0IIOIdWD4r1rSKzTrKZ5CD0oDbUcMlejDpklvepXF1e70pAS9zgYTtq
         0pahLmMx5ZKosk9Rdppk/B+sY3WIHCYUpa/PMBOqvoSgDnLsOa5dWTZV2q9sbgCQrb8G
         Aw9t2qiYAmnUjewlR3istU9sE3dxgzHgphmtrOUe7fz63W9F6KRCoa1G66HUrSgexvNj
         b5BGKlYJez7L1oHoyefZg9GgrYJ1mT7oWevIk9pBXfKZMScJsRcXpcl4Orc6o+w1G47f
         yHgOT7ptteEzcdRyF4gm5XShefqc3bW1cB2FtUo2HTvBsdmU/v4o5kzIhZaxnPVE12HP
         b88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CPX9OAcUsPK24kBxydGkmqfxgoh4s7OnFGV7n+XAerI=;
        b=aMIt0UeDr/MgYtZRbnJq9n8qum4/zjb1DmK8zbo22Rpy0P8kLpsC2gJRqbBDab5Dhx
         eJ5ymAYK6jOVksPvVoLnGvOw3iBwilRd2ItoEzRbyCYJY+OC3k36anA7EIR1ZpdfhHH1
         A4Ux6KZZP59Mw62X7GbFwTSUaO+IG3jNlWDySpZSQC1LXu9eR3/OX91tctu+DvUDlU1z
         ko2++Jg2mRTywCO+eTAI9VocPtQotKFhWkgipz4wLGvjYEsGO/uj++myMeCK7bKKkwTg
         q35WNSGZUlxSvR9YvoojEPvkgo9NMmlRyjLC692thAN0lHfKKoBaT3gpem3tPOE9e01h
         L60g==
X-Gm-Message-State: AHQUAub7+nic0get1StQKbZQWyregIwNujMutjXCzai30mBDbOel7NZL
        Yp3k1S2QNaDHGY1W/s8xG9K9OYk/MPejNv+8IEZbgInf+YY=
X-Google-Smtp-Source: AHgI3IavRgL03tGqRzjcGE03IDBmj06Wwir2qRWfhZsayu32jXDXFHjK/C1BJIQS5KmgvybcmDrhKx7rlbq6GSfP/fw=
X-Received: by 2002:a9d:6191:: with SMTP id g17mr4210900otk.56.1549982129260;
 Tue, 12 Feb 2019 06:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20190212141715.3966-1-geert+renesas@glider.be>
In-Reply-To: <20190212141715.3966-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 Feb 2019 15:35:18 +0100
Message-ID: <CAMpxmJWcSkCBf+vcOg=ksjeSxvo7N+WQ2gNqxPe5BW01vPFH8w@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add wake-up support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

wt., 12 lut 2019 o 15:17 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
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
>         chip->irq_mask[d->hwirq / BANK_SZ] |=3D 1 << (d->hwirq % BANK_SZ)=
;
>  }
>
> +static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> +       int error =3D 0;
> +
> +       if (chip->irq_parent) {
> +               error =3D irq_set_irq_wake(chip->irq_parent, on);
> +               if (error) {
> +                       dev_dbg(&chip->client->dev,
> +                               "irq %u doesn't support irq_set_wake\n",
> +                               chip->irq_parent);
> +                       chip->irq_parent =3D 0;
> +               }
> +       }
> +       return error;
> +}
> +
>  static void pca953x_irq_bus_lock(struct irq_data *d)
>  {
>         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> @@ -732,6 +751,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p,
>         irq_chip->name =3D dev_name(&chip->client->dev);
>         irq_chip->irq_mask =3D pca953x_irq_mask;
>         irq_chip->irq_unmask =3D pca953x_irq_unmask;
> +       irq_chip->irq_set_wake =3D pca953x_irq_set_wake;

Is it possible to assign this callback conditionally depending on
client->irq and avoid the if (chip->irq_parent) in
pca953x_irq_set_wake()?

Bart

>         irq_chip->irq_bus_lock =3D pca953x_irq_bus_lock;
>         irq_chip->irq_bus_sync_unlock =3D pca953x_irq_bus_sync_unlock;
>         irq_chip->irq_set_type =3D pca953x_irq_set_type;
> @@ -747,6 +767,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p,
>         }
>
>         gpiochip_set_nested_irqchip(&chip->gpio_chip, irq_chip, client->i=
rq);
> +       chip->irq_parent =3D client->irq;
>
>         return 0;
>  }
> --
> 2.17.1
>
