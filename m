Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:38310 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbeLJVET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 16:04:19 -0500
Received: by mail-io1-f67.google.com with SMTP id l14so9972093ioj.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 13:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20181210210310.12677-1-wsa+renesas@sang-engineering.com> <20181210210310.12677-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181210210310.12677-4-wsa+renesas@sang-engineering.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 10 Dec 2018 22:04:06 +0100
Message-ID: <CAKv+Gu9uGxTjBhAD3WyQBohhZ=bswXOoo4waTetArrS601_LJQ@mail.gmail.com>
Subject: Re: [RFC/RFT 03/10] i2c: synquacer: remove unused is_suspended flag
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-pm <linux-pm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 10 Dec 2018 at 22:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This flag was defined and checked but never set a value. Remove it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 2184b7c3580e..d18b0941b71a 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -144,8 +144,6 @@ struct synquacer_i2c {
>         u32                     timeout_ms;
>         enum i2c_state          state;
>         struct i2c_adapter      adapter;
> -
> -       bool                    is_suspended;
>  };
>
>  static inline int is_lastmsg(struct synquacer_i2c *i2c)
> @@ -316,9 +314,6 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
>         unsigned long timeout;
>         int ret;
>
> -       if (i2c->is_suspended)
> -               return -EBUSY;
> -
>         synquacer_i2c_hw_init(i2c);
>         bsr = readb(i2c->base + SYNQUACER_I2C_REG_BSR);
>         if (bsr & SYNQUACER_I2C_BSR_BB) {
> --
> 2.11.0
>
