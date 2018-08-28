Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:39695 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbeH1LUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 07:20:32 -0400
Received: by mail-vk0-f66.google.com with SMTP id e139-v6so293487vkf.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Aug 2018 00:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <1535431039-2749-1-git-send-email-na-hoan@jinso.co.jp> <1535431039-2749-3-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535431039-2749-3-git-send-email-na-hoan@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 09:30:01 +0200
Message-ID: <CAMuHMdV8OLKGGJ6-moD9ndNUDMxxUidxDHXZNuyPeXLPW3dfSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77965: add Audio SSI pin support
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 6:37 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Add Audio SSI pin support for r8a77965
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
