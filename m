Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36631 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752499AbeAOIMF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:12:05 -0500
MIME-Version: 1.0
In-Reply-To: <20180114175159.604307495@cogentembedded.com>
References: <20180114175159.604307495@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2018 09:12:04 +0100
Message-ID: <CAMuHMdUFhW7LVtVyQ8hFT+8+Us8WV7W2n9B9Zac=yCRNKv3+5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] sh_eth: gather all TSU init code in one place
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jan 14, 2018 at 6:47 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The  sh_eth_cpu_data::chip_reset() method  always resets using ARSTR and
> this register is always located at the start of the  TSU register region.
> Therefore, we can  only call  this method if we know TSU is there and thus
> simplify  the probing code a  bit...
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
