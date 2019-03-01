Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71075C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 12:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4882C20818
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 12:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387746AbfCAMDX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 07:03:23 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:45053 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfCAMDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 07:03:23 -0500
Received: by mail-vk1-f195.google.com with SMTP id w85so3672325vkw.11;
        Fri, 01 Mar 2019 04:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GTk5UQJosqF2YVdltfzs588RE2dXSaeQSa0UDl0w82c=;
        b=fqa8+bP5YlwWGU4/WHSBhbLRBOMpn7OV9BKh7BBPE1lwUzjhRzmu4TRFksCxf9tQfq
         7K6F5GFp8IY/292q4QeJdYWzJEPiVFpUNbLZm7u0b1+bDRtbTIM+9qfOsUjO9H03kQh7
         LgvQSeZxfjsHqGoHSSV+opA8FFIZI7MNUmg2Oy32ESBRgUw3Sp1bUSGwQ2TUta0/GTX+
         lhzgi8ulZOF3y6nHD/E75xFq3XWkkX1I4qF1S5grZTlIDtB37UA2InNOUKSJUZ5VLqfI
         S9Rn9DXNqvA5wbqZosmHKEcwi/YfFhrQmOkHge/l0barHTmDlsPBnPd8gABQJuaNZjId
         nuVw==
X-Gm-Message-State: APjAAAUK881Fdx7KhJHXzzjhJ6ce7shLKhL+HH14KNHbjymXu63SUBt3
        xto8oxtJdNB1KiXqWSkK/FspyPqPqASTV67z/O4=
X-Google-Smtp-Source: APXvYqycbAp/20pKQuigc7YAmYRbzn2p/R5/nTi9JuRfiw7DX2npgEPDe6N95mQdLAdDHXvY1NSuy8Sdi4KKTzGSHys=
X-Received: by 2002:a1f:711:: with SMTP id 17mr2644600vkh.65.1551441802432;
 Fri, 01 Mar 2019 04:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20190228110215.1657-1-geert+renesas@glider.be> <20190301114313.veihv2buhhhknxsa@ninjato>
In-Reply-To: <20190301114313.veihv2buhhhknxsa@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 13:03:09 +0100
Message-ID: <CAMuHMdXV_zNi0sM0MkAkb_4bUd8w6rMZPTq4DFqQ7KKcU1eWYg@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Add reset of registers before starting transfer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Mar 1, 2019 at 12:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > +     for (k = 100; k > 0; k--) {
> > +             if (!(sh_msiof_read(p, CTR) & mask))
> > +                     break;
> > +
> > +             udelay(1);
> > +     }
>
> Why no reuse of sh_msiof_modify_ctr_wait? And can't we maybe even use
> readl_poll_timeout() here since we know the register is fixed to CTR?

Thanks, that looks like a good improvement. Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
