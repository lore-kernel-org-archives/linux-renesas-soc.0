Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EB9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14EAE20851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfAQKLW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:11:22 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40856 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfAQKLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:11:22 -0500
Received: by mail-vs1-f68.google.com with SMTP id z3so5868422vsf.7;
        Thu, 17 Jan 2019 02:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvAHjA8p/8CH8yE/HN2SwLb2jOHjGu7RgDzgV1othSI=;
        b=GRApY0jux11eNp2DvQS+BTUwLJwcPMwJ4ck1auuHVQ1yE5H4g9Fxd0WDsFuDmcUHgl
         s39d1AC76wcMRt+CH6P1jGBBQpYZo6cupjHDB2pK1QLKV8nHQ2YUIWvTTzN/kTjI6xlH
         MmORrhOvEiCof1oEt38xZxziEPD/H+fOMGv8lPIH6kEby9PO+1Ql+vhn/ZvMxduoZrxG
         Xfu6tZgkLQGehJMcbYMWDjH28dnRinwwZQ5SlEYFw1tWpeYZw1nHaOe523Ee/mANHYmx
         TDtLARMrZXWHXHBLqX/znW/zSfZz7blJbPt26GviCK724Qa1wIEhQveHBqaVKBZIgYg+
         xlfg==
X-Gm-Message-State: AJcUukexZS9Nn9+V9oc3g/5wFdU6uZat0+5MfLxR9x+OoLCnKusajDTg
        PWqiCKWBK4CiLsiaF0hfCegTWkZeywYBMim+e2gBpw==
X-Google-Smtp-Source: ALg8bN5hJFMJqo6DwBljS6oDsW+JFi4uEDuMpJq3nNauuPGS1zvy+rXSt0kpXu4TtyHm4ylfC41K9vPfGJZzDql6ojw=
X-Received: by 2002:a67:f43:: with SMTP id 64mr5593402vsp.166.1547719881507;
 Thu, 17 Jan 2019 02:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:11:09 +0100
Message-ID: <CAMuHMdVMQp9YOTc-WDSLkTdeYppHMO0sTBF3fkkxn-VvBUbZUw@mail.gmail.com>
Subject: Re: [RFC/RFT 1/7] i2c: sh_mobile: simplify sending address for RX
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 17, 2019 at 1:36 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> pd->pos won't be smaller than -1, so we can simplify the logic.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -392,13 +392,9 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
>         int real_pos;
>
>         do {
> -               if (pd->pos <= -1) {

If this condition is never true, shouldn't the block just be removed instead?

> +               if (sh_mobile_i2c_is_first_byte(pd)) {
>                         sh_mobile_i2c_get_data(pd, &data);
> -
> -                       if (sh_mobile_i2c_is_first_byte(pd))
> -                               i2c_op(pd, OP_TX_FIRST, data);
> -                       else
> -                               i2c_op(pd, OP_TX, data);
> +                       i2c_op(pd, OP_TX_FIRST, data);
>                         break;
>                 }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
