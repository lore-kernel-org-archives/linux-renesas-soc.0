Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F44CC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 10:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA9D920821
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 10:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfBKKbL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 05:31:11 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42461 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfBKKbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 05:31:11 -0500
Received: by mail-vs1-f66.google.com with SMTP id b20so4608350vsl.9;
        Mon, 11 Feb 2019 02:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8hzkUuUYm4bpoUBWAE84O4MRCSCFmY5QbPjsIftaPvo=;
        b=qTKBzxQdZAWfhRqcu7vkBmO1urUsKA5VXxAJLdlIogm9u6PUsqJmfoAwDzNTW7/xPY
         6mdptSMF6Cqj4RsN9fpA5r1OsyfwpZ2DKGkDh9E+HjAk+m2zC5+uSHTppPWNVHWsul8v
         dw8+WvAvjwCnnx5DwYEY7WFXZ0fifmlLns3jMFLATZEhYms9m47qStahVsg2JF/gCaHu
         wbRVkFYRBwemH9JZDRrGbkowrHsB7IXRD2uPOcSMOWKx3xJRq6yyWkNTWT2C3nGUEdLv
         LHP8W7R7SjFeRdd+9dPFZEo0jQvBcn0E4QcPivd4qD3fXwB33NCR4OMw+CwKxeg6dmEc
         YPwg==
X-Gm-Message-State: AHQUAua0df/2Rtx4bMqO9/UqF96Y42/QH0QFVFv2YnkgAYpzW3EV0PxU
        FgoCRe9fYRVhb/RI6VTD3AK4yV7zj3+oFJzBvpK49gt4
X-Google-Smtp-Source: AHgI3Ia7LeB2ljB1/6EWe2B9GRHcL45bk5IBSj5PdFmWhj549cZveB/57o5oBT+FuO531sUstL4PgvwwdYRyfe1XEmA=
X-Received: by 2002:a67:541:: with SMTP id 62mr525060vsf.11.1549881069622;
 Mon, 11 Feb 2019 02:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Feb 2019 11:30:56 +0100
Message-ID: <CAMuHMdX=HVBYwRT8otZVs0WaOnjLLWrH8RQZyXCH8_Ro11Muaw@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration' injector
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Jan 21, 2019 at 3:29 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Here is a fault injector simulating 'arbitration lost' from multi-master
> setups. Read the docs for its usage.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, looks like a valuable injector case!

> This is the most reliable result I came up with so far for simulating lost
> arbitration (after playing a lot with falling SDA as trigger first, but SCL
> seems the way to go). Works fine with the i2c-sh_mobile driver on a Renesas

Using SCL as the trigger makes most sense to me, too.

> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c

> @@ -162,6 +165,59 @@ static int fops_incomplete_write_byte_set(void *data, u64 addr)
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_incomplete_write_byte, NULL, fops_incomplete_write_byte_set, "%llu\n");
>
> +static irqreturn_t lose_arbitration_irq(int irq, void *dev_id)
> +{
> +       struct i2c_gpio_private_data *priv = dev_id;
> +
> +       setsda(&priv->bit_data, 0);
> +       udelay(200);

Please add a #define for this value.

> +       setsda(&priv->bit_data, 1);
> +
> +       complete(&priv->irq_happened);
> +       return IRQ_HANDLED;
> +}
> +
> +static int fops_lose_arbitration_set(void *data, u64 num_faults)
> +{
> +       struct i2c_gpio_private_data *priv = data;
> +       int irq = gpiod_to_irq(priv->scl);

As request_irq() takes an unsigned int irq, please check for a negative error
code here.

> +       int ret, i;

u64 i;

Yes, 64-bit values may be a bit excessive, but that's what the caller is
passing, and truncating to int may cause unexpected behavior.

> +       ret = request_irq(irq, lose_arbitration_irq, IRQF_TRIGGER_FALLING,
> +                         "i2c-gpio-fi", priv);

"i2c-gpio-fault-injection"?

> +       if (ret)
> +               goto output;
> +
> +       for (i = 0; i < num_faults; i++) {
> +               ret = wait_for_completion_interruptible(&priv->irq_happened);
> +               if (ret)
> +                       break;
> +               reinit_completion(&priv->irq_happened);

The reinitialization may race with the interrupt handler. Probably you don't
care, though, as all of this is "best effort" anyway.

Perhaps you can do the counting in the interrupt handler instead, and only
trigger completion after the wanted number of lost arbitrations has been
performed?


> +DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitration_set, "%llu\n");

I think you can drop the format if you don't provide a "get" method.
Or just implement the "get" method, too ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
