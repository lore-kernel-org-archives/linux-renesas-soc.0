Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:21366 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752254AbcKHCGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 21:06:50 -0500
Message-ID: <58211988.2070801@jinso.co.jp>
Date: Tue, 08 Nov 2016 09:17:12 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?RHVuZ++8muS6ug==?= =?UTF-8?B?44K9?=
        <nv-dung@jinso.co.jp>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>
Subject: Re: [PATCH] ARM: spi: rewrites the name of the function.
References: <1478480410-6320-1-git-send-email-cm-hiep@jinso.co.jp> <CAMuHMdVMgsBO6ou4wYSp3pmBWDy_ZCoWaZFN+Zpq9dryRsSANw@mail.gmail.com>
In-Reply-To: <CAMuHMdVMgsBO6ou4wYSp3pmBWDy_ZCoWaZFN+Zpq9dryRsSANw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your comment.

On 11/07/2016 07:25 PM, Geert Uytterhoeven wrote:
> Hi Hiep,
>
> On Mon, Nov 7, 2016 at 2:00 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp> wrote:
>> From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
>>
>> This patch rewrites the name of rspi_pio_transfer_in_or_out
>> function.
>>
>> Signed-off-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> But you want to use proper prefixes matching the style of the subsystem,
> to avoid Mark's canned message reply system.
>
> Always use e.g. "git log --oneline drivers/spi/spi-rspi.c" to find out...
Thanks, I will make matching the style of the subsystem.

Jinzai Solution.
Hiep.

> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
