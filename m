Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36118 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbeLCJho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 04:37:44 -0500
Received: by mail-oi1-f193.google.com with SMTP id x23so10309200oix.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Dec 2018 01:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com> <20181202193553.29704-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-2-marek.vasut+renesas@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 3 Dec 2018 10:37:18 +0100
Message-ID: <CAMpxmJW=dSmisZ9=V_ymJiX1t9mQ0zohopp4L1JkqoX740d1tw@mail.gmail.com>
Subject: Re: [PATCH 02/14] gpio: pca953x: Fix AI overflow on PCAL6524
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
> The PCAL_PINCTRL_MASK is too large. The extended register block on
> PCAL6524, which is the largest chip with this block, has the block
> limited to address range 0x40..0x7f. This is because the bit 7 in
> the command register is used for the Address Increment functionality.
>
> Trim the mask to 0x60 to match the datasheet and to prevent accidental
> overwrite of the AI bit.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 31e3b1b52330..4e9c79ca69c5 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -58,7 +58,7 @@
>  #define PCA_GPIO_MASK          0x00FF
>
>  #define PCAL_GPIO_MASK         0x1f
> -#define PCAL_PINCTRL_MASK      0xe0
> +#define PCAL_PINCTRL_MASK      0x60
>
>  #define PCA_INT                        0x0100
>  #define PCA_PCAL               0x0200
> --
> 2.18.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
