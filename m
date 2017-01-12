Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36838 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbdALLXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 06:23:11 -0500
MIME-Version: 1.0
In-Reply-To: <20170112111711.GF25542@bigcity.dyn.berto.se>
References: <1478182564-18762-1-git-send-email-horms+renesas@verge.net.au>
 <1478182564-18762-7-git-send-email-horms+renesas@verge.net.au>
 <20170110210848.GA25542@bigcity.dyn.berto.se> <20170110223043.GA2710@katana>
 <20170111083541.GB25542@bigcity.dyn.berto.se> <20170111150521.GA1486@katana>
 <20170111155723.GE25542@bigcity.dyn.berto.se> <CAMuHMdV5pY+nRC8yd4iVmEJAZkcBgWC2-wDr6UgpmxZSsoPHcA@mail.gmail.com>
 <20170111173432.GB1486@katana> <20170112111711.GF25542@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jan 2017 12:23:09 +0100
Message-ID: <CAMuHMdW4r1gmJDgFxcHNNys70xipMb7BKsv_7ZZNPQAX+SV6pQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] mmc: sh_mobile_sdhi: Add tuning support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 12, 2017 at 12:17 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2017-01-11 18:34:32 +0100, Wolfram Sang wrote:
>> > I also have a koelsch, so no need to take one on a plane ;-)
>>
>> I thought yours was so heavily hooked up that it was a bit cumbersome to
>> bring it somewhere. Happy to be wrong here :)
>
> To be super clear, Geert you can bring your Koelsch and Wolfram you only
> want to do testing on one Koelsch board and not as many as you can get
> your hands on?
>
> If so I be happy to leave my board at home and not have to take it on
> the plane, please confirm so there are no misunderstandings :-)

I'll bring my Koelsch.

AFAIK, Wolfram is interested in "as many SD cards", not "as many Koelsch
boards".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
