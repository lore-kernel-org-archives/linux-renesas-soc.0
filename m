Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:44000 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755291AbeCSKXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 06:23:17 -0400
Received: by mail-qt0-f171.google.com with SMTP id s48so17321219qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 03:23:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWOKmRc=0Qxph-XdZd-f+t+vmFTMFY=6VZfVLhnfLYOsw@mail.gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
 <CAO3366yvjPm+kqbG0Do6dE5H0_s98_hOzhj=aaVyJUsJCF18TA@mail.gmail.com>
 <CAMuHMdV3HLoRdW1WLk_s6V9bfG5T8Xq2GzOEpKGHY=3MbCeZVw@mail.gmail.com>
 <CAMuHMdXPxS7ok2fYqtqT_X=kBctPfZHbAqgFSc5eBbGyOJFH0w@mail.gmail.com>
 <CAMuHMdV6dPcDUjA2oRCJMuuD_KsHwq=GS=1sSxDxOYoU3wYnfg@mail.gmail.com>
 <20180309215843.GL2205@bigcity.dyn.berto.se> <CAMuHMdWOKmRc=0Qxph-XdZd-f+t+vmFTMFY=6VZfVLhnfLYOsw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Mar 2018 11:23:15 +0100
Message-ID: <CAMuHMdW4Z4Pv0nCwTi4m3kMAVaZ-hA0xkieotCp6yz2-d7PTYg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups
 and functions
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Uli,

On Fri, Mar 9, 2018 at 11:24 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Mar 9, 2018 at 10:58 PM, Niklas S=C3=B6derlund
> <niklas.soderlund@ragnatech.se> wrote:
>> On 2018-03-09 13:33:03 +0100, Geert Uytterhoeven wrote:
>>> P.S. Apparently R-Car Gen2 and Gen3 also support 8-bit YCbCr input data
>>>      on the DATA8-15 pins, for which we don't have pin groups yet.
>>>      Niklas: is this mode supported by the VIN driver?
>>
>> * Gen2
>> I can't find DATA12-15 in the datasheet I have, where did you find them?
>> I'm looking at Tables 26.3, 26.4 and 26.5 on v1.0 of the Gen2 datasheet.
>> But yes on Gen2 the VIN driver supports capturing from these data pins.
>
> Sorry, on Gen2 (all but V2H, to make matters more complicated), the DATA =
pins
> are not numbered from 0 to 23, but split in 3 blocks of 8 pins, matching =
R, G,
> and B blocks. But apart from the numbering, the formats are mostly the sa=
me (4
> bit width is the exception, and supported on Gen2 only).
>
> What I meant is the third mode in e.g. Table 26.5, "ITU-R BT.601/BT.709/B=
T.656
> 8-bit YCbCr-422 (VnDMR2/YDS =3D 1)", which uses VI0_G[7:0] instead of VIO=
_B[7:0]
> for transfering 8-bit YCbCr data. Apparently the PFC driver doesn't have =
a pin
> group for that combo.

Apparently the BSP has support for using the upper 8 MSB of the 16-bit
interface, and calls the pin group "data8_sft8".

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
