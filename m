Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:36432 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdIMHr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 03:47:56 -0400
MIME-Version: 1.0
In-Reply-To: <bac7196cecbb43159feaaf1fc1605767@AUSX13MPC101.AMER.DELL.COM>
References: <bac7196cecbb43159feaaf1fc1605767@AUSX13MPC101.AMER.DELL.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 09:47:55 +0200
Message-ID: <CAMuHMdWVRfdOeWGdCS=OZ9t1mOuZqXpxN3xidG=q18vCtuKAgA@mail.gmail.com>
Subject: Re: sh: sh7758 User land programs crash with SIGBUS.
To: Prashanth.Giri@dell.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC linux-sh

On Wed, Sep 13, 2017 at 12:00 AM,  <Prashanth.Giri@dell.com> wrote:
> Hi,
>
> I am trying to port from 3.4.11 kernel to 3.10.107 based on my sh7757/58 =
processor hardware and running into some odd behavior with user land applic=
ations. I pretty much got the kernel up and running but some of the applica=
tions in user land won't launch and are crashing with the below messages in=
 dmesg.
>
> <5>Fixing up unaligned userspace access in "aim" pid=3D28533 pc=3D0x3b142=
492 ins=3D0x6252
> <5>Sending SIGBUS to "aim" pid=3D28533 due to unaligned access (PC 3b1424=
92 PR 296167e4) ins=3D0x6252
> <5>Sending SIGBUS to "pm" pid=3D28741 due to unaligned access (PC 58b2e40=
9 PR 297b0118) ins=3D0x8dc1
> <5>Sending SIGBUS to "pm" pid=3D28741 due to unaligned access (PC 3b14249=
2 PR 296ce7e4) ins=3D0x6252
>
> Some of the older posts in the mailing lists pointed out to I/D cache iss=
ues, I tried disabling the cache altogether in a hope to root cause the iss=
ue, but still got the same responses. For some reason I believe the loader =
is loading these programs into odd addresses. I am clueless as to where to =
look for the possible issue. Is there any obvious settings that I am missin=
g from the board/cpu setup ?
>
> Any expert help and guidance is really appreciated.
>
> Thanks,
> Prashanth
