Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A47C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C34E2184E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbfBRJR3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 04:17:29 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:37759 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfBRJR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 04:17:29 -0500
Received: by mail-ua1-f67.google.com with SMTP id v26so5587313uap.4;
        Mon, 18 Feb 2019 01:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1GbkbC+bM5IK/UD8NKAzp6jV9tHiKOfNmDikXEIekRE=;
        b=M0TOjsrztARVbEFBG5AXTwofcdYddEmzL8mErDXHHlbGZIzoBuAbFILWU+TVUHXAeL
         i+3g0xUgJO7sgl0C0h8io8vhg9ulenF7qy9nihmO4Y7zNq+1JxP5M3GAxa8qXMjtOzKX
         XXoN1fePvJI2KAFzVzM6FaJrlLVc5EbcsGDVwzXbW+k0Smd7MOaz/OkMFy4/Kgv7qgNI
         +4B5Et3bdCbOWIcA8JWMb5JA0Xehs82iL1ibYfquKiVOypYg2GEKnxrT7/hXr33yQatW
         j3/X8xsDPPTyCx+EVcjHH/96PMzJGWMvnsV8Wt/SyV2OBsJYCAHRTvPDe5hN6xwbu+Kq
         guKw==
X-Gm-Message-State: AHQUAuZLQjmU48ZMUEiNY1oaCgyFf6T5pS32Q8u9ilm0y6uxH2/hmHva
        Jdsu7lgAdA8jXBOT+6JJL9mDuavdtmKeHfjuYb7mCADy
X-Google-Smtp-Source: AHgI3IbdEQrIriNOJmyuRUOEv9yb5ey1b+cls2i9Wi1yLB/1A0vXNVfQFTRCrCir0dDmZQcSbxC2buHTXPXRG1KDdwM=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr4245836uab.75.1550481447585;
 Mon, 18 Feb 2019 01:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com> <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 10:17:16 +0100
Message-ID: <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration' injector
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Feb 17, 2019 at 1:41 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a fault injector simulating 'arbitration lost' from multi-master
> setups. Read the docs for its usage.
>
> A helper function for future fault injectors using SCL interrupts is
> created to achieve this.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since RFC:
>
> * user supplied value is now duration of interference instead of number of
>   interferences
> * refactored code to suppy a resusable helper function to install SCL interrupt
>   handlers
> * added error checks to interrupt number
> * slightly renamed the SCL interrupt when registering

Thanks for the update!

> --- a/Documentation/i2c/gpio-fault-injection
> +++ b/Documentation/i2c/gpio-fault-injection
> @@ -83,3 +83,28 @@ This is why bus recovery (up to 9 clock pulses) must either check SDA or send
>  additional STOP conditions to ensure the bus has been released. Otherwise
>  random data will be written to a device!
>
> +Lost arbitration
> +================
> +
> +Here, we want to simulate the condition where the master under tests loses the

test

> +bus arbitration against another master in a multi-master setup.
> +
> +"lose_arbitration"
> +------------------
> +
> +This file is write only and you need to write the duration of the arbitration
> +interference (in us). The calling process will then sleep and wait for the

µs

We do UTF-8 in documentation, don't we?

> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c

> @@ -162,6 +167,67 @@ static int fops_incomplete_write_byte_set(void *data, u64 addr)
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomplete_write_byte_set, "%llu\n");
>
> +static int i2c_gpio_fi_act_on_scl_irq(struct i2c_gpio_private_data *priv,
> +                                      irqreturn_t handler(int, void*))
> +{
> +       int ret, irq = gpiod_to_irq(priv->scl);
> +
> +       if (irq < 0)
> +               return irq;
> +
> +       i2c_lock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       ret = gpiod_direction_input(priv->scl);
> +       if (ret)
> +               goto unlock;
> +
> +       reinit_completion(&priv->scl_irq_completion);
> +
> +       ret = request_irq(irq, handler, IRQF_TRIGGER_FALLING,
> +                         "i2c_gpio_fault_injector_scl_irq", priv);
> +       if (ret)
> +               goto output;
> +
> +       wait_for_completion_interruptible(&priv->scl_irq_completion);

Error checking/propagation (-ERESTARTSYS)?

> +
> +       free_irq(irq, priv);
> + output:
> +       ret = gpiod_direction_output(priv->scl, 1);

This may overwrite the error code returned by request_irq().

> + unlock:
> +       i2c_unlock_bus(&priv->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +       return ret;
> +}
> +
> +static irqreturn_t lose_arbitration_irq(int irq, void *dev_id)
> +{
> +       struct i2c_gpio_private_data *priv = dev_id;
> +
> +       setsda(&priv->bit_data, 0);
> +       udelay(priv->scl_irq_data);

On 32-bit, u64 scl_irq_data is truncated...

> +       setsda(&priv->bit_data, 1);
> +
> +       complete(&priv->scl_irq_completion);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int fops_lose_arbitration_set(void *data, u64 duration)
> +{
> +       struct i2c_gpio_private_data *priv = data;
> +
> +       priv->scl_irq_data = duration;

... since calling udelay() with large numbers can be dangerous, perhaps you
want to limit it to say 100 ms max anyway?

> +       /*
> +        * Interrupt on falling SCL. This ensures that the master under test has
> +        * really started the transfer. Interrupt on falling SDA did only
> +        * exercise 'bus busy' detection on some HW but not 'arbitration lost'.
> +        * Note that the interrupt latency may cause the first bits to be
> +        * transmitted correctly.
> +        */
> +       return i2c_gpio_fi_act_on_scl_irq(priv, lose_arbitration_irq);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
