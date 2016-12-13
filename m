Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34361 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750988AbcLMKsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 05:48:36 -0500
MIME-Version: 1.0
In-Reply-To: <20161212195128.16633-2-wsa+renesas@sang-engineering.com>
References: <20161212195128.16633-1-wsa+renesas@sang-engineering.com> <20161212195128.16633-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Dec 2016 11:48:34 +0100
Message-ID: <CAMuHMdWQQvA9bOdY-Yf_-eJvNRiMrEdqr_K7GCxsf_KeWdBxbw@mail.gmail.com>
Subject: Re: [PATCH 1/9] mmc: sh_mobile_sdhi: simplify accessing DT data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 8:51 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> By using the helper of_device_get_match_data(), we can skip some
> checking and make the code simpler.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
