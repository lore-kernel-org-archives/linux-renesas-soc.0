Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34091 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046054AbdDWUgJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 16:36:09 -0400
Received: by mail-it0-f68.google.com with SMTP id c26so3541790itd.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Apr 2017 13:36:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <149269961740.23335.7950127209713140684.sendpatchset@little-apple>
References: <149269961740.23335.7950127209713140684.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 23 Apr 2017 22:36:07 +0200
Message-ID: <CAMuHMdVg3wAPop9_=-8smP2YgJRYQNmjnuP7aGeHWTCprMJYFA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: blanche: Add support for HSCIF0 on CN5
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Apr 20, 2017 at 4:46 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> r8a7792 Blanche has depending on dip switch and jumper settings
> either HSCIF0 or CAN0 exposed on the on-board CN5 connector.
>
> This patch adds HSCIF0 to the Blanche dts as serial2.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  Currently the r8a7792 PFC is lacking support for HSCIF devices
>  so the PFC driver needs to be updated to avoid error messages
>  on the boot console.

Indeed. So while you enhance hardware description, software support is
still lacking.

Care to submit a PFC patch?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
