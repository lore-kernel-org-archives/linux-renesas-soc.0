Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35276 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754775AbcL0NDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 08:03:18 -0500
Received: by mail-io0-f193.google.com with SMTP id f73so40686538ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 05:02:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <adc3b16c-b663-ce65-b06f-e9ff76eb5dd5@jinso.co.jp>
References: <1482814415969201000053a8@nat.cybozu.com> <adc3b16c-b663-ce65-b06f-e9ff76eb5dd5@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Dec 2016 14:02:20 +0100
Message-ID: <CAMuHMdUXqU=O7Q=omkWC3KkgGA06LqFRWejObgvt9jY47sybEA@mail.gmail.com>
Subject: Re: The failure summary report of GEN3 for linux stable v4.9
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

On Tue, Dec 27, 2016 at 11:35 AM, Hoan Nguyen An <na-hoan@jinso.co.jp> wrote:
> My name is Hoan from Jinzai Solution.
> We have tested the linux stable v4.9 for Gen3 Salvator-X (H3)
>
> So we would like to report the summary of the failure.

> 1 PM: It is not working, can't return to the system. NG New issue

> root@linaro-nano:~# echo mem > /sys/power/state
> [  221.280712] PM: Syncing filesystems ... done.
> [  221.286474] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [  221.295013] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  221.303691] Suspending console(s) (use no_console_suspend to debug)

Are you using R-Car H3 ES1.0?
AFAIK, tbe newer firmware supports system suspend/resume on H3 ES1.1 only,
and only when following the right procedure involving i2cset.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
