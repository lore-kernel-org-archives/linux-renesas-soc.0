Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36943 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751361AbdH2Joy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 05:44:54 -0400
Received: by mail-pf0-f195.google.com with SMTP id a2so2009798pfj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 02:44:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
 <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com> <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Aug 2017 11:44:53 +0200
Message-ID: <CAMuHMdXzuUzGnUkMfMdMcV5fCcsLn5uP4XQUkh9tfzAsfo0_ww@mail.gmail.com>
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Tue, Aug 29, 2017 at 11:15 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> But ZG and with this module clock #112 is still missing, no?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=aa7b99b06d280e4151e
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043

The ZG bits in the FRQCRB register are documented to exist on R-Car D3
only.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
