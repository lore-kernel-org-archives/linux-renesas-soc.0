Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33688 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbcFUHkp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 03:40:45 -0400
Received: by mail-it0-f67.google.com with SMTP id y93so374000ita.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2016 00:40:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vb13rp5r.wl%kuninori.morimoto.gx@renesas.com>
References: <87wpljs1rw.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdU8gKsD4nDjEaXZeVnv435rCvCHO9z7uNHSy6x9R=hrnQ@mail.gmail.com> <87vb13rp5r.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2016 09:22:11 +0200
Message-ID: <CAMuHMdViL8uT7GPiuU5US8V6JUU3EyAQ=B3Bt4ON9KXnsmA5-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: use PINMUX_SINGLE() for I2C
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Jun 21, 2016 at 9:19 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> >
>> > Now we have PINMUX_SINGLE(). Let's use it instead of PINMUX_IPSR_NOGP()
>> >
>> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Oops, I didn't Cc to gpio ML
> I will send this patch again (with Geert's Reviewed-by)

No problem, it's trivial, and it will go through my sh-pfc-for-v4.8 anyway...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
