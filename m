Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33037 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932309AbdEOJRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 05:17:41 -0400
Received: by mail-io0-f195.google.com with SMTP id m4so11046969ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2017 02:17:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tw4mh4qu.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com>
 <87lgq39bt4.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWL+eXnrQggiY6PxW5ryOVb9X_8D_5_NFgq5h1vgH+qCw@mail.gmail.com>
 <8760h3j7kt.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdWzwiZXhwuubQ5A+rmtBur26-Qs=LBMhkcZ51xPvoQ3Nw@mail.gmail.com>
 <87tw4mh4qu.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2017 11:17:39 +0200
Message-ID: <CAMuHMdXFUb3Wx4CM_BMTqdz4Ypcgg=2Y2r1iqU3J4YSVD0jD5A@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: sh-pfc: r8a7796: add Audio SSI pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, May 15, 2017 at 11:07 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > r8a7795 is still using old (= 34) naming now.
>>
>> Does this affect H3 ES1.0, too?
>> My main worry there is that the name "ssi34_ctrl" is part of the DT ABI,
>> so we have to keep that as an alias for "ssi349_ctrl".
>
> I think this is from Gen3, not ESx.
> And no-one is using SSI34 on upstream code.
> Should we care about out-of-tree user ?

Probably not, especially for H3 ES1.x.

>> > I can adjust it both r8a7795/6.
>> > Do you want to v3 patch for r8a7796 ?
>> > or incremental patch is OK with r8a7795 ?
>>
>> As long as I haven't sent a pull request for sh-pfc-for-v4.13, it can still be
>> fixed incrementally.
>
> OK. will do in v3

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
