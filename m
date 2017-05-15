Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35132 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933490AbdEOJAK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 05:00:10 -0400
Received: by mail-it0-f68.google.com with SMTP id 67so11330655itx.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2017 02:00:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8760h3j7kt.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com>
 <87lgq39bt4.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWL+eXnrQggiY6PxW5ryOVb9X_8D_5_NFgq5h1vgH+qCw@mail.gmail.com>
 <8760h3j7kt.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2017 11:00:03 +0200
Message-ID: <CAMuHMdWzwiZXhwuubQ5A+rmtBur26-Qs=LBMhkcZ51xPvoQ3Nw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: sh-pfc: r8a7796: add Audio SSI pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, May 15, 2017 at 2:23 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > +static const unsigned int ssi34_ctrl_pins[] = {
>> > +       /* SCK, WS */
>> > +       RCAR_GP_PIN(6, 5), RCAR_GP_PIN(6, 6),
>> > +};
>> > +static const unsigned int ssi34_ctrl_mux[] = {
>> > +       SSI_SCK34_MARK, SSI_WS34_MARK,
>> > +};
>>
>> I'm a bit confused by this group: in the R-Car M3 Pin Function Rev. 0.54
>> sheet, these are named SCK349 resp. WS349. According to the history, the
>> change from {SCK,WS}34 to {SCK,WS}349 was made at the same time as the
>> change from {SCK,WS}0129 to {SCK,WS}01239.
>> However, the former change is not reflected in the PFC section of the
>> Hardware User's Manual.
>>
>> So which is correct: {SCK,WS}34 or {SCK,WS}349?
>>
>> Can you please enlighten me?
>
> It seems
> SSI_SCK 0129 -> 01239 was happen on v0.51 timing,
> SSI_SCK 34   -> 349   was happen on v0.54 timing.

In the pin function spreadsheets, the changes were made together, in June 2016.

> r8a7795 is still using old (= 34) naming now.

Does this affect H3 ES1.0, too?
My main worry there is that the name "ssi34_ctrl" is part of the DT ABI,
so we have to keep that as an alias for "ssi349_ctrl".

> I can adjust it both r8a7795/6.
> Do you want to v3 patch for r8a7796 ?
> or incremental patch is OK with r8a7795 ?

As long as I haven't sent a pull request for sh-pfc-for-v4.13, it can still be
fixed incrementally.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
