Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33952 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753248AbdAZKQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:16:00 -0500
Received: by mail-io0-f195.google.com with SMTP id c80so4672849iod.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 02:16:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1485420750-12701-6-git-send-email-horms+renesas@verge.net.au>
References: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au> <1485420750-12701-6-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 11:15:59 +0100
Message-ID: <CAMuHMdWmZ=M7jey2AbKXZU+oJLYLGUq19caxZDVaHs=gK+zd9A@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: r8a7795-salvator-x: Enable I2C for DVFS device
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 9:52 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
>
> This patch enables I2C for DVFS device for for Salvator-X board on
> R8A7795 SoC.
>
> Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
