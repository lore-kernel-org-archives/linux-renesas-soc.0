Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:55354 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754604AbdJJHKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 03:10:46 -0400
Received: by mail-wm0-f45.google.com with SMTP id u138so2290016wmu.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2017 00:10:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tvz7zdyn.wl%kuninori.morimoto.gx@renesas.com>
References: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
 <87a819ou2c.wl%kuninori.morimoto.gx@renesas.com> <877ewcq3qs.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV1RBqTYuKxnt=tPxNkEALYgrTrfnBr+oKE51FBSq7v=g@mail.gmail.com>
 <87lgkj27pt.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdXM5YFWdGD6VXSQy0GuDP=ccT9UFEbO-bOOXDRx7cuXSA@mail.gmail.com>
 <87tvz7zdyn.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2017 09:10:44 +0200
Message-ID: <CAMuHMdX_pt3-M=Pd6uJNCpcs-a1aa0AY6_ar-o4mJE0qrckMZA@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] pinctrl: sh-pfc: r8a77995: add Audio clock pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Oct 10, 2017 at 9:06 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> >> >  - audio_clka
>> >> >  - audio_clkb
>> >> >  + audio_clk_a
>> >> >  + audio_clk_b
>> >>
>> >> It's debatable.
>> >> The datasheet uses "CLKA" and "CLKOUT", while the pinctrl drivers tend
>> >> to use "clk_a" (with underscore) and "clkout" (without underscore).
>> >>
>> >> Except for r8a7794, which uses the "clka" form. Oops...
>> >> As this is DT ABI, we cannot easily change it. But if you want, we can add
>> >> aliases.
>> >
>> > I have no strong opinion about this "clka" vs "clk_a".
>> > I will do nothing if you are OK on this current patch (= "clka"),
>> > I will post v2 patch if you say "clk_a" is good.
>>
>> I think it's best to follow what's done in the other R-Car Gen3 SoCs.
>> Else we may end up in trouble if a board shows up that can support both
>> R-Car D3 and another R-Car Gen3 SoC (cfr. Salvator-X(S) and ULCB
>> with R-Car H3 and M3-W).
>
> Yeah agree.
> But unfortunately, both "clka" / "clk_a" are already used, right ?
> I think we want to have "clk_a" ?

Yes. "clk_a" is what used on all R-Car SoCs, except for R-Car E2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
