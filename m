Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:45602 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932838AbeCIWYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 17:24:40 -0500
Received: by mail-qt0-f171.google.com with SMTP id v90so12737059qte.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 14:24:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180309215843.GL2205@bigcity.dyn.berto.se>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
 <CAO3366yvjPm+kqbG0Do6dE5H0_s98_hOzhj=aaVyJUsJCF18TA@mail.gmail.com>
 <CAMuHMdV3HLoRdW1WLk_s6V9bfG5T8Xq2GzOEpKGHY=3MbCeZVw@mail.gmail.com>
 <CAMuHMdXPxS7ok2fYqtqT_X=kBctPfZHbAqgFSc5eBbGyOJFH0w@mail.gmail.com>
 <CAMuHMdV6dPcDUjA2oRCJMuuD_KsHwq=GS=1sSxDxOYoU3wYnfg@mail.gmail.com> <20180309215843.GL2205@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Mar 2018 23:24:37 +0100
Message-ID: <CAMuHMdWOKmRc=0Qxph-XdZd-f+t+vmFTMFY=6VZfVLhnfLYOsw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups
 and functions
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Fri, Mar 9, 2018 at 10:58 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-03-09 13:33:03 +0100, Geert Uytterhoeven wrote:
>> P.S. Apparently R-Car Gen2 and Gen3 also support 8-bit YCbCr input data
>>      on the DATA8-15 pins, for which we don't have pin groups yet.
>>      Niklas: is this mode supported by the VIN driver?
>
> * Gen2
> I can't find DATA12-15 in the datasheet I have, where did you find them?
> I'm looking at Tables 26.3, 26.4 and 26.5 on v1.0 of the Gen2 datasheet.
> But yes on Gen2 the VIN driver supports capturing from these data pins.

Sorry, on Gen2 (all but V2H, to make matters more complicated), the DATA pi=
ns
are not numbered from 0 to 23, but split in 3 blocks of 8 pins, matching R,=
 G,
and B blocks. But apart from the numbering, the formats are mostly the same=
 (4
bit width is the exception, and supported on Gen2 only).

What I meant is the third mode in e.g. Table 26.5, "ITU-R BT.601/BT.709/BT.=
656
8-bit YCbCr-422 (VnDMR2/YDS =3D 1)", which uses VI0_G[7:0] instead of VIO_B=
[7:0]
for transfering 8-bit YCbCr data. Apparently the PFC driver doesn't have a =
pin
group for that combo.

(I have v2.00 of the datasheet, but the table looks identical in v1.0).

> * Gen3
> Currently CSI-2 are the only supported input method for the Gen3
> patches. It would be possible with a small hack to run the Gen2 driver
> on Gen3 and have it try and use the DATA pins, but this is not tested as
> prior to V3M we had no device to test this on as the DATA pins where all
> routed to EXIO connectors.
>
> There have been some talks about adding support for this to the driver,
> I know Jacopo posted a patch-set a while ago for this but I have not
> tested it. Looking at the Gen3 Table 26.8.1 it sure looks like all
> DATA lines DATA0-23 could be used on some SoCs to capture 24 bit RGB and
> YCbCr.

My question was about the second mode in the table, which is the same one
as the third mode on Gen2.

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
