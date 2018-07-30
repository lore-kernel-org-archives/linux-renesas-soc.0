Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:33358 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbeG3KsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 06:48:20 -0400
Received: by mail-ua0-f196.google.com with SMTP id i4-v6so7355804uak.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 02:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <1532551300-14943-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1532551300-14943-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 11:14:05 +0200
Message-ID: <CAMuHMdWN-O7vo_FfciDsjFeZ-1eBP-o0LTjeRV=HPrPk5_U6hQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77965: Add OPPs table for cpu devices
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Wed, Jul 25, 2018 at 10:42 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> This patch adds OPPs table for CA57{0,1} cpu devices
>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Syntax looks good, but I cannot review the actual values.
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
