Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:46031 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdLNKXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 05:23:53 -0500
MIME-Version: 1.0
In-Reply-To: <1513242521-11236-2-git-send-email-chris.paterson2@renesas.com>
References: <1513242521-11236-1-git-send-email-chris.paterson2@renesas.com> <1513242521-11236-2-git-send-email-chris.paterson2@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2017 11:23:51 +0100
Message-ID: <CAMuHMdUp8SRe9-KhHA5CVTEJ_fvbdSj+-H0Ab76+DPVYVDEtxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: r8a7790: Correct critical CPU temperature
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 14, 2017 at 10:08 AM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> The R-Car H2 hardware manual states that Tc =3D =E2=80=9340=C2=B0C to +10=
5=C2=B0C. The
> thermal sensor has an accuracy of =C2=B15=C2=B0C and there can be a tempe=
rature
> difference of 1 or 2 degrees between Tjmax and the thermal sensor due
> to the location of the latter.
>
> This means that 95=C2=B0C is a safer value to use.
>
> Fixes: a8b805f3606f7af7 ("ARM: dts: r8a7790: enable to use thermal-zone")
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
