Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:40619 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933717AbeBMIst (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 03:48:49 -0500
Received: by mail-qk0-f196.google.com with SMTP id e20so21661848qkm.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 00:48:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180213084026.hzsm65mxiwncydnh@verge.net.au>
References: <20180212201248.GH7666@bigcity.dyn.berto.se> <20180212224036.GC25611@bigcity.dyn.berto.se>
 <20180213084026.hzsm65mxiwncydnh@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Feb 2018 09:48:48 +0100
Message-ID: <CAMuHMdVWnSBoOdOruiqNjrJc-9k3XfG5fk98QP_-PfjMZzXijg@mail.gmail.com>
Subject: Re: Warning for possible circular locking dependecy on v4.16-rc1
To: Simon Horman <horms@verge.net.au>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 13, 2018 at 9:40 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Feb 12, 2018 at 11:40:36PM +0100, Niklas S=C3=B6derlund wrote:
>> Hi again,
>>
>> On 2018-02-12 21:12:48 +0100, Niklas S=C3=B6derlund wrote:
>> > Hi Geert,
>> >
>> > When doing some testing on v4.16-rc1 I ran across this warning a coupl=
e
>> > of times. I was using the renesas_config from the current master branc=
h
>> > of renesas-drivers at the time. It do not hit every time but in my
>> > limited testing I would say ~50%.
>>
>> I forgot to mention this was on H3 ES2.0.
>
> FWIIW, I have also observed this (once so far).

Is this the same false positive as:
https://lkml.org/lkml/2018/1/17/34
https://www.spinics.net/lists/linux-samsung-soc/msg61425.html

?

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
