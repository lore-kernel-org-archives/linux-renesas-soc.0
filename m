Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34541 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751777AbdEPIt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 04:49:57 -0400
Received: by mail-io0-f194.google.com with SMTP id 12so13800239iol.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2017 01:49:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fug5w62r.wl%kuninori.morimoto.gx@renesas.com>
References: <87fug5w62r.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 10:49:55 +0200
Message-ID: <CAMuHMdVb49h5RFLxu9uAk8Qaqpw1=JMo+oE-2fZmgxvfXvhugw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7795-es1: SSI_{WS/SCK}34 -> SSI_{WS/SCK}349
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 16, 2017 at 10:42 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> R-Car Gen3 is using SSI_{WS/SCK}349 instead of SSI_{WS/SCK}34.
> But, current code is based on old datasheet which had typo.
> This patch fixes this typo.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
