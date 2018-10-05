Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41072 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbeJENwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 09:52:01 -0400
MIME-Version: 1.0
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com> <65ec6fcf-931a-a807-af1b-f204c03344f0@cogentembedded.com>
In-Reply-To: <65ec6fcf-931a-a807-af1b-f204c03344f0@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Oct 2018 08:54:31 +0200
Message-ID: <CAMuHMdXA1A94riOZqxo2=6vOdW9vWT5+S+fhvaz6fW1t80D=EQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal: rcar_thermal: add R8A77970 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 4, 2018 at 11:03 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the R-Car V3M (R8A77970) SoC support to the R-Car gen2 thermal driver.
> The hardware is the same as in the R-Car D3 (R8A77995) plus the CIVM status
> register (we don't use).
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
