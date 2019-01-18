Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 13:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26C3E20652
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 13:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfARNSh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 08:18:37 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33039 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfARNSh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 08:18:37 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so8394646vsc.0;
        Fri, 18 Jan 2019 05:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdS38rJQZjwRkUl4kj29m8UAC96x9WdCcFyfcp7MCig=;
        b=t7CrKOf63HJJcfIO94RhIOrK6ASUqtPLggfCEL3DlzGqDN6EeiAt/bZR9cZ1tZN/G1
         QlhDF7qIv+pWjXHGC/F/RO2S7liAMHPSBsHlnPY5pfDnFS5mF0MvUDPFvAUAImhCOMPD
         oeZtyMa6aJM0Iqpn3001XKh+AV8dxEltkQ3IeADYNOc5BOcM8RY6RmwGBcl9xi5iMVB7
         WHihSH+9wHsMuwimIhrrki3pTuKPXN03Drf2BGtQH1Z0xwnclg9Je8Wy77LhbNORRJ9p
         FvZd77r8EfbXab0N7aJBgXC/SnyO/HBrrWL3Dz+KVPthQw0N1eJP8MYSbqX1KwY/Y6xK
         DIgg==
X-Gm-Message-State: AJcUukd6CzYBfMZwfhCUyDwtCX31S+RS77oGQjmN+CqX27db8mhn1lv6
        imv1JL+xdNUQcB5P/DhGHuPz2UnbofTXq49I1dI=
X-Google-Smtp-Source: ALg8bN7VH3wDzQe2ZEjxih6hRKX4KEnUe7Uu0a6qf2vUoq6wIa32A9JbobwQbgC68czSex8dKhio9Gh9PZ8AvdaiJh0=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr7874243vsm.152.1547817516154;
 Fri, 18 Jan 2019 05:18:36 -0800 (PST)
MIME-Version: 1.0
References: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp> <1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 14:18:24 +0100
Message-ID: <CAMuHMdVWyVLeRWSf4rBnk54sj+oAQAuWVwB6eKc9Hi8DBQ9c=A@mail.gmail.com>
Subject: Re: [v2 PATCH 2/2] spi: sh-msiof: Use DMA if possible
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan-san,

On Fri, Jan 18, 2019 at 10:30 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> Currently, this driver only supports feature for DMA 32-bits.
> In this case, only if the data length is divisible by 4 to use
> DMA, otherwise PIO will be used. This patch will suggest use
> the DMA 32-bits with 4bytes of words, then the remaining data
> will be transmitted by PIO mode.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for the update!

DMA is now used for the first part, and PIO for the remainder.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
