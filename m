Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42781 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbeLCJgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 04:36:55 -0500
Received: by mail-oi1-f196.google.com with SMTP id w13so10285498oiw.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Dec 2018 01:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 3 Dec 2018 10:36:29 +0100
Message-ID: <CAMpxmJV++wAmkF28CK9vO5Zia7Sd9zVyAw+Y_C=qci_0oWHLog@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: Deduplicate the bank_size
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        marek.vasut+renesas@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

niedz., 2 gru 2018 o 20:36 Marek Vasut <marek.vasut@gmail.com> napisa=C5=82=
(a):
>
> The bank_size =3D fls(...) code was duplicated in the driver 5 times,
> pull it into separate function.
>

Shouldn't it be bank_shift in the commit message?

Bart

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 023a32cfac42..31e3b1b52330 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -159,11 +159,16 @@ struct pca953x_chip {
>         int (*read_regs)(struct pca953x_chip *, int, u8 *);
>  };
>
> +static int pca953x_bank_shift(struct pca953x_chip *chip)
> +{
> +       return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +}
> +
>  static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *=
val,
>                                 int off)
>  {
>         int ret;
> -       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int bank_shift =3D pca953x_bank_shift(chip);
>         int offset =3D off / BANK_SZ;
>
>         ret =3D i2c_smbus_read_byte_data(chip->client,
> @@ -182,7 +187,7 @@ static int pca953x_write_single(struct pca953x_chip *=
chip, int reg, u32 val,
>                                 int off)
>  {
>         int ret;
> -       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int bank_shift =3D pca953x_bank_shift(chip);
>         int offset =3D off / BANK_SZ;
>
>         ret =3D i2c_smbus_write_byte_data(chip->client,
> @@ -221,7 +226,7 @@ static int pca957x_write_regs_16(struct pca953x_chip =
*chip, int reg, u8 *val)
>
>  static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 =
*val)
>  {
> -       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int bank_shift =3D pca953x_bank_shift(chip);
>         int addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
>         int pinctrl =3D (reg & PCAL_PINCTRL_MASK) << 1;
>
> @@ -265,7 +270,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *=
chip, int reg, u8 *val)
>
>  static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *=
val)
>  {
> -       int bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int bank_shift =3D pca953x_bank_shift(chip);
>         int addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
>         int pinctrl =3D (reg & PCAL_PINCTRL_MASK) << 1;
>
> @@ -402,13 +407,12 @@ static void pca953x_gpio_set_multiple(struct gpio_c=
hip *gc,
>                                       unsigned long *mask, unsigned long =
*bits)
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> +       int bank_shift =3D pca953x_bank_shift(chip);
>         unsigned int bank_mask, bank_val;
> -       int bank_shift, bank;
> +       int bank;
>         u8 reg_val[MAX_BANK];
>         int ret;
>
> -       bank_shift =3D fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> -
>         mutex_lock(&chip->i2c_lock);
>         memcpy(reg_val, chip->reg_output, NBANK(chip));
>         for (bank =3D 0; bank < NBANK(chip); bank++) {
> --
> 2.18.0
>
