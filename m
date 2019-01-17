Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94550C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6ABA520657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfAQKlR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:41:17 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39633 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfAQKlR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:41:17 -0500
Received: by mail-vs1-f68.google.com with SMTP id h78so5920298vsi.6;
        Thu, 17 Jan 2019 02:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkvavIs6fkhX4EKOcLyBxe/8d3IYd0jlhB5P/kanATk=;
        b=j/u1dfXZvTGdKtMmo2D8cFcYgWZE5BqR+3lHSzfULxMcihoeJ60GDN9p6OlOj0LrbN
         cnfVrdLpFbG9Zfonw8aURSdoKwD1CTFYZqdweOc6zszsfaM6Kl4GxkOUD7pTtMN34BL1
         wQKApODh2pYBWv3PHTVF0605b1hifzh6xsE4MhP1t50JgKML3Jb43sLhWjuahBmubFN0
         BWvnEUITEcnJ2z0AZfJlevbRar1Y/i84zcDiRt30Vx+xczXFzFr2OcJKQlhwRCf4FXuB
         Dl+z4xYd98CBE9u7U5X9tiVSQpWXufDdaza1/IgkLPKJcbxcdBSjVVqDaddLq69P8HHk
         j51Q==
X-Gm-Message-State: AJcUukdaMs/WQ5zyZDC8GhnQAjfuyaSPRvTlcn+4z00lx29A9u61XpDB
        R2sVA4IZd3SzckesQGtFEMlXATC1Z0fz2wGCqbciEA==
X-Google-Smtp-Source: ALg8bN6jgyKq916+TCYgyt/vbxbdFawOQMBGNDdrO/jyjrJJDlNGKr26ABXCKTBlAebOoKqtVREFmewPk1DtDjaXt7I=
X-Received: by 2002:a67:d119:: with SMTP id u25mr5193402vsi.63.1547721676624;
 Thu, 17 Jan 2019 02:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-8-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:41:05 +0100
Message-ID: <CAMuHMdVj49y3b+WqyTfNV2sc0WTneFaO4zZSA6WfkZDrqgD=eA@mail.gmail.com>
Subject: Re: [RFC/RFT 7/7] i2c: sh_mobile: update copyright and comments
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 17, 2019 at 1:35 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Update copyright years and add Renesas to it. Add/update comments to
> make driver easier to understand.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -2,8 +2,8 @@
>  /*
>   * SuperH Mobile I2C Controller
>   *
> - * Copyright (C) 2014 Wolfram Sang <wsa@sang-engineering.com>
> - *
> + * Copyright (C) 2014-19 Renesas Electronics Corporation

Why this addition?

> + * Copyright (C) 2014-19 Wolfram Sang <wsa@sang-engineering.com>
>   * Copyright (C) 2008 Magnus Damm
>   *
>   * Portions of the code based on out-of-tree driver i2c-sh7343.c
> @@ -373,6 +373,7 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
>         unsigned char data;
>         int real_pos;
>
> +       /* switch from TX (address) to RX (data) adds two interrupts */

Perhaps this change can be moved into patch 6/7?

>         real_pos = pd->pos - 2;
>
>         if (pd->pos == -1) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
