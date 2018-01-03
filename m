Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:41075 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751133AbeACOHF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 09:07:05 -0500
Received: by mail-qt0-f195.google.com with SMTP id i40so2182444qti.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jan 2018 06:07:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180103124105.1999-4-horms+renesas@verge.net.au>
References: <20180103124105.1999-1-horms+renesas@verge.net.au> <20180103124105.1999-4-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2018 15:07:04 +0100
Message-ID: <CAMuHMdWciOeHb22xaZcuCA_W-Bu1+s+51zDPRGhiyWzGZFTsMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: r8a7796: Add OPPs table for
 cpu devices
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 3, 2018 at 1:41 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Dien Pham <dien.pham.ry@rvc.renesas.com>
>
> Define OOP tables for all CPUs.
> This allows CPUFreq to function.
>
> Based in part on work by Hien Dang.
>
> Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Looks good and matches the bindings.
I cannot verify the operating point tuples, though.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
