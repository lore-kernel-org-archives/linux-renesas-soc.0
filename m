Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:45329 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751997AbdJDNr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 09:47:56 -0400
Received: by mail-wm0-f65.google.com with SMTP id q124so23036345wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Oct 2017 06:47:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <877ewcq3qs.wl%kuninori.morimoto.gx@renesas.com>
References: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
 <87a819ou2c.wl%kuninori.morimoto.gx@renesas.com> <877ewcq3qs.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Oct 2017 15:47:54 +0200
Message-ID: <CAMuHMdV1RBqTYuKxnt=tPxNkEALYgrTrfnBr+oKE51FBSq7v=g@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] pinctrl: sh-pfc: r8a77995: add Audio clock pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Oct 3, 2017 at 6:09 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
> (snip)
>> +static const char * const audio_clk_groups[] = {
>> +     "audio_clka",
>> +     "audio_clkb",
>> +     "audio_clkout",
>> +     "audio_clkout1",
>> +};
>
> Oops, we want to have this ?
>
>  - audio_clka
>  - audio_clkb
>  + audio_clk_a
>  + audio_clk_b

It's debatable.
The datasheet uses "CLKA" and "CLKOUT", while the pinctrl drivers tend
to use "clk_a" (with underscore) and "clkout" (without underscore).

Except for r8a7794, which uses the "clka" form. Oops...
As this is DT ABI, we cannot easily change it. But if you want, we can add
aliases.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
