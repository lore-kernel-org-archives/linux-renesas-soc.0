Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:32896 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754324AbcI2Nkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 09:40:43 -0400
Received: by mail-it0-f68.google.com with SMTP id x192so4831738itb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2016 06:40:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57ECF4EA.4010704@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp>
 <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com> <57ECF4EA.4010704@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Sep 2016 15:40:41 +0200
Message-ID: <CAMuHMdUw_k_SLUO1r5v12Cun40cfJCfA7Em4e-zupEDsxcEdhw@mail.gmail.com>
Subject: Re: GEN2:Lager: Only 1 core works when turning off the SW8-PIN4
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hiep,

On Thu, Sep 29, 2016 at 1:03 PM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
> I'd like to report the issue of the CPU operation.
> We tested and found it on Lager board at linux-v4.8-rcx.
>
> The test procedure is the following:
>
> Confirmation command:
>
> # cat /proc/interrupts
> CPU0
> 19: 2509 GIC-0 27 Level arch_timer
> 21: 0 GIC-0 36 Level e6050000.gpio
> 22: 0 GIC-0 37 Level e6051000.gpio
> 23: 0 GIC-0 38 Level e6052000.gpio
> 24: 0 GIC-0 39 Level e6053000.gpio
> 25: 0 GIC-0 40 Level e6054000.gpio
> 26: 0 GIC-0 41 Level e6055000.gpio
> 27: 23 GIC-0 101 Level e61f0000.thermal
> =E2=80=A6=E2=80=9D
>
> This issue appears when we changed the SW8-PIN4 of Lager board.
>
> SW8-PIN4: ON
>
> + At linux-v4.7: OK (4 cores work together normally).
> + At linux-v4.8-rc2: OK (4 cores work together normally).
>
> SW8-PIN4: OFF
>
> + At linux-v4.7: -> OK(4 cores work together normally).
> + At linux-v4.8-rc2: -> NG(Only 1 core works).

And the kernel prints "Unable to boot CPU%u when MD21 is set", right?

> We tried to find out the issued patch and we realize that it happens from
> the following patch:
> " 043248c Merge tag 'armsoc-dt' of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc"

The issue you're seeing is due to a combination of commits 5f3bca0db8ac01a7
("ARM: shmobile: apmu: Add APMU DT support via Enable method") and
dc378795156d980c ("ARM: dts: r8a7790: Add APMU nodes").

When debug mode is enabled (SW8-4 =3D OFF), trying to boot secondary CPUs m=
ay
lock up the system after a cold boot, depending of boot load version.  Henc=
e
we explicitly prohibit that. BTW, this has been the case on Koelsch since c=
ommit
277efd30cfc72ec2 ("ARM: shmobile: Check r8a7791 MD21 at SMP boot").

Now, does series "[PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting
secondary CPU cores in debug mode" (included in all renesas-drivers release=
s
during September) fix it for you?

Thanks!

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
