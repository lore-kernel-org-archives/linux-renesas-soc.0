Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:35296 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752109AbdHNKNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 06:13:07 -0400
Received: by mail-pg0-f51.google.com with SMTP id v189so44397516pgd.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 03:13:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 12:13:06 +0200
Message-ID: <CAMuHMdVshuf-DytMkP=kXGBey4tuESAt8-1hb63T1g1uJuB0Fg@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: dts: renesas: add VIN, CSI-2 and ADV7482 nodes
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Sun, Jul 30, 2017 at 10:56 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This is a RFC for how I imagine the final DT for the video capture nodes
> will look. Since the DT file layout changed recently I wanted to post a
> RFC before I include these in my for-renesas-drivers branch.
>
> These are not intended for Simons tree, the DT bindings are not accepted
> upstream. checkpatch will warn about missing compat strings if not run
> ontop a tree which contains the driver patches for Gen3 VIN, CSI-2 and
> ADV7482.
>
> Please review and give some feedback if you don't think this should be
> included in renesas-drivers :-)

Preliminary general comment: "resets" properties are missing.

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
