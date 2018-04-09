Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:42294 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbeDIInd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 04:43:33 -0400
Received: by mail-qt0-f196.google.com with SMTP id j3so8290576qtn.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Apr 2018 01:43:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180408164035.GD12256@bigcity.dyn.berto.se>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180406191438.3630-3-laurent.pinchart+renesas@ideasonboard.com> <20180408164035.GD12256@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Apr 2018 10:43:31 +0200
Message-ID: <CAMuHMdXEUWsBqiut-ghs+U4Q3MF=B68_1koLyxFy3MWXWZujkQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] ARM: dts: r8a7791: Convert to new LVDS DT bindings
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 8, 2018 at 6:40 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-04-06 22:14:37 +0300, Laurent Pinchart wrote:
>> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
>> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
>> @@ -470,8 +470,7 @@
>>
>>       clocks =3D <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 7=
26>,
>>                <&x13_clk>, <&x2_clk>;
>
> I think you forgot to delete <&cpg CPG_MOD 726> from the clocks, with
> that fixed:
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
>
>> -     clock-names =3D "du.0", "du.1", "lvds.0",
>> -                   "dclkin.0", "dclkin.1";
>> +     clock-names =3D "du.0", "du.1", "dclkin.0", "dclkin.1";

Obviously we need a check in dtc for matching the lengths of the clocks and
clock-names (etc.) properties.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
