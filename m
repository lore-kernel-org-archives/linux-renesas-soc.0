Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <SG2PR0401MB12968BF4EE08B2461319813FD8C50@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB12968BF4EE08B2461319813FD8C50@SG2PR0401MB1296.apcprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2016 08:55:43 +0200
Message-ID: <CAMuHMdX4Y4mUizr7A10S-_jSr9ygrNMbunAgiBdwcOn5e8McjA@mail.gmail.com>
Subject: Re: Kernel Configure R-Car ATL Board(E2)
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On Tue, Oct 4, 2016 at 6:14 AM, Jithin T Raj <jithin.t@tataelxsi.co.in> wro=
te:
>    I have downloaded source tree 4.7.5..Now I am trying to build kernel f=
or ALT Board(R-Car E2)..
> Before that i would like to ask something..here I can't see configuration=
 for ALT in /arch/arm/configs/..But multi_v7_defconfig and multi_v5_defconf=
ig is there..I am a newbi in this filed..can you please tell me how I can c=
onfigure this board using menuconfig or any other way is there?
> I am doing cross compiling..If that board is configured then only I can p=
roceed with building no?

multi_v5_defconfig is for ARM v5 processors, and not suitable for R-Car Gen=
2.
multi_v7_defconfig may work (the kernel image may be too big to boot on ALT=
,
it's been a while I tried it).

However, there's also shmobile_defconfig, which has all needed options for =
all
supported Renesas ARM SoCs and boards.
See also http://elinux.org/R-Car/Boards/Alt

BTW, which config did you use for Koelsch? ALT and Koelsch are very similar=
,
just changing all R8A7791-related options to R8A7794 should give you a work=
ing
kernel.

Good luck!

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
