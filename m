Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38404 "EHLO
	mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbcFUIqR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 04:46:17 -0400
Received: by mail-it0-f43.google.com with SMTP id h190so9200166ith.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2016 01:45:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wpljs1rw.wl%kuninori.morimoto.gx@renesas.com>
References: <87wpljs1rw.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2016 09:08:54 +0200
Message-ID: <CAMuHMdU8gKsD4nDjEaXZeVnv435rCvCHO9z7uNHSy6x9R=hrnQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: use PINMUX_SINGLE() for I2C
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 21, 2016 at 4:46 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now we have PINMUX_SINGLE(). Let's use it instead of PINMUX_IPSR_NOGP()
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
