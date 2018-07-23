Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:37479 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389094AbeGWNgC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:36:02 -0400
Received: by mail-oi0-f65.google.com with SMTP id k81-v6so785725oib.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 05:35:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU9mkaFe_-n2sS6u1Qy4pbczQXWjmBAKtdw90p_-5HiYA@mail.gmail.com>
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
 <1531856883-19645-2-git-send-email-ykaneko0929@gmail.com> <CAMuHMdU9mkaFe_-n2sS6u1Qy4pbczQXWjmBAKtdw90p_-5HiYA@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 23 Jul 2018 21:35:01 +0900
Message-ID: <CAH1o70+UEUtaoZT4CiDtC0YNh34Zvmjhcch1=7tYOaS6ofkpSA@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/7] arm64: dts: renesas: r8a77965: Add Audio-DMAC
 device nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

Thank you for your review.
I will correct the sort order of the audma nodes and  a typo of the commit log.

Best regards,
Kaneko

2018-07-18 18:06 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> On Tue, Jul 17, 2018 at 9:48 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch adds Audio-DMAC{0,1} device nodes for the R8A77965 SoC.
>>
>> Based on a similar patch of the R8A7796 device tree
>> by uninori Morimoto <kuninori.morimoto.gx@renesas.com>.
>
> Kuninori
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
