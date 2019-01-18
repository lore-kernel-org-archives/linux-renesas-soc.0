Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E9CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0601820855
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 10:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfARKqN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 05:46:13 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:45284 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfARKqN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 05:46:13 -0500
Received: by mail-ua1-f68.google.com with SMTP id e16so4506880uam.12;
        Fri, 18 Jan 2019 02:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zs6rugYsYP5cxsQeluCly3PcVOWANFwmGqOOvS/2LKQ=;
        b=nMK9dvttjYew3tHxsV3CsEm3IuiDER0HawXKKY3dQQ/TQAMDpkLtukL4BrKsjdlz6r
         UfrT9+B/0s94/sXwYMeDTcRtJ0OXta5odgLAyzJ4ZCHyhQzSjDhSU8AXlJxrRgn9mIlV
         ImHgEOd526ruwPA3LiGPB05nHA4/oM87uGxeCEZwz1msZz473M4KsCLq1vhARCjMARse
         wjvOlJuPbVNQBLThtORbf9MKxvKenm0aqvjd5HvYNr0JHw0Q2w9H84U+ocxb7D9XKBx0
         W0mjM1lYy+AHfTJts/oKWVI2H3yb7vaPsVYCYBmNdzbJtJ5E3VO+aSYfLCo+CP2IvwyS
         ac2Q==
X-Gm-Message-State: AJcUukfPsPisOPFITEyb77U+ftZgocWEps1IwxS7tTT8PmV+6rAOWd2b
        2vMAlex+V+ha0E/ZJhqA/E3xYzEC1RkiEA4tbIM=
X-Google-Smtp-Source: ALg8bN50Q2BO6TTgUo/16jY5pC1mZrACejJcgqP8zZh0TvlYUUqyexTNhUa+N/x4k+cPZRGgMN8jUA10LQ8ztpE+3Ug=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr7186823uae.75.1547808372458;
 Fri, 18 Jan 2019 02:46:12 -0800 (PST)
MIME-Version: 1.0
References: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 11:46:00 +0100
Message-ID: <CAMuHMdUGpK4Fkq2VuQWZFbCmxonX3rUWZias=-5Yug5gSb5bcg@mail.gmail.com>
Subject: Re: [v2 PATCH 1/2] spi: sh-msiof: fix *info pointer in request_dma()
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

On Fri, Jan 18, 2019 at 10:30 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> sh_msiof_spi_info *info struct pointer was initialized in the probe() function
> no need to get back and keep consistency.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
