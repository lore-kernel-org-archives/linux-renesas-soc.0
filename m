Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:39830 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbeH3L75 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 07:59:57 -0400
Received: by mail-ua1-f68.google.com with SMTP id g18-v6so4938415uam.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 00:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <1535535207-2800-1-git-send-email-na-hoan@jinso.co.jp> <1535535207-2800-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535535207-2800-2-git-send-email-na-hoan@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 09:58:51 +0200
Message-ID: <CAMuHMdVQZnUQg+QaBYLe35nO4gJcth9-PVWg6GhFWk1B2_q0Qw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: salvator-common: Add PWM-2 channel
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

On Wed, Aug 29, 2018 at 11:33 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Add PWM-2 channel(CN28 - pin30) support for Salvator-X

Thanks for your patch!

Please explain why this is useful. Usually we do not enable random functionality
on expansion connectors.

In this case, this even has an (undocumented) impact on on-board devices,
as the signal is also connected to the BD9571MWV PMIC.
(Perhaps that was the actual intention of this patch? ;-) If yes,
please explain)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
