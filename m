Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34238 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdEPHPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 03:15:33 -0400
Received: by mail-it0-f65.google.com with SMTP id d68so3677178ita.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2017 00:15:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87inl1y4v5.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com>
 <87lgq39bt4.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWL+eXnrQggiY6PxW5ryOVb9X_8D_5_NFgq5h1vgH+qCw@mail.gmail.com>
 <8760h3j7kt.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWzwiZXhwuubQ5A+rmtBur26-Qs=LBMhkcZ51xPvoQ3Nw@mail.gmail.com>
 <87tw4mh4qu.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdXFUb3Wx4CM_BMTqdz4Ypcgg=2Y2r1iqU3J4YSVD0jD5A@mail.gmail.com>
 <87inl1y4v5.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 09:15:31 +0200
Message-ID: <CAMuHMdUFUqW4c6gNA=a=dyw56xtwpgTFOA9BKHkwFK1K3joJHQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: sh-pfc: r8a7796: add Audio SSI pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, May 16, 2017 at 3:25 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> >> Does this affect H3 ES1.0, too?
>> >> My main worry there is that the name "ssi34_ctrl" is part of the DT ABI,
>> >> so we have to keep that as an alias for "ssi349_ctrl".
>> >
>> > I think this is from Gen3, not ESx.
>> > And no-one is using SSI34 on upstream code.
>> > Should we care about out-of-tree user ?
>>
>> Probably not, especially for H3 ES1.x.
>
> Sorry, I didn't explain.
> This is from Gen3, and ES1.x version datasheet has typo.
> But datasheet team no more update for it.
>
> For example on v0.5 datasheet (= for ES1.x)
>
>         6. Pin Function Controller (PFC)
>         6.2.2  GPIO/Peripheral Function Select Register (GPSR0-7)
>
> This has SSI_xxx_0129 (= this is typo), but
>
>         41. Serial Sound Interface Unit (SSIU)
>         41.1.3 External Pins
>
> This has SSI_xxx_01239

OK.

> Can you agree about SSI_xxx_01239 / SSI_349 are from Gen3, not ES1.x ?

Yes, I agree.

>> > OK. will do in v3
>>
>> OK, thanks!
>
> Oops, sorry, not v3, but incremental patch.
> I will post this patch (= fixup SSI_349) if I could find my posted patches
> on your sh-pfc-for-v4.13.

Oops,I thought I had pushed {clk-renesas,sh-pfc}-for-v4.13 yesterday, but
apparently I got interrupted. Done. But kernel.org mirroring seems to be slow
(latest are based on v4.12-rc1, not v4.11-rc1).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
