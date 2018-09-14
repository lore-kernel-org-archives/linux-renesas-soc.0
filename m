Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:37864 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbeINRRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 13:17:25 -0400
Received: by mail-ua1-f67.google.com with SMTP id y10-v6so6928680uao.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 05:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com> <7d32fc9c-903d-1cb3-fdd7-d9165e0016ac@cogentembedded.com>
In-Reply-To: <7d32fc9c-903d-1cb3-fdd7-d9165e0016ac@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Sep 2018 14:03:02 +0200
Message-ID: <CAMuHMdW9P5+hkt_9V7TAHTgoNEDiMU=2wSaOx-05B8-jf+7dcg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource: sh_cmt: add R-Car gen3 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 10:17 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for the R-Car gen3 CMT types 0/1 -- they seem to be the same
> CMT types 0/1 as in R-Car gen2 SoCs.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
