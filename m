Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <pull.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758696.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <pull.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758696.git-series.kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 11:03:16 +0100
Message-ID: <CAMuHMdVVVAq43sDcOuHhtDrbJrSRLmk3oLHuqkASWHNi1kZ85A@mail.gmail.com>
Subject: Re: [GIT PULL] v4l: vsp1: Partition phase developments
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Feb 10, 2017 at 9:36 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The following changes since commit 0c3b6ad6a559391f367879fd4be6d2d85625bd5a:
>
>   v4l: vsp1: Remove redundant context variables (Tue,  1 Nov 2016 15:01:02 +0000)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git refs/tags/vsp1/pa-phases-2017-02-10

s/https/git/ is faster ;-)

> for you to fetch changes up to 19c6a7d542809dc814b5dfb11ba8ab737eab56f9:
>
>   v4l: vsp1: Implement left edge partition algorithm overlap (Thu,  9 Feb 2017 22:08:34 +0000)
>
> This work further continues my developments on the partition algorithm
> for the VSP UDS and SRU components.

Thank you, scheduled for inclusion in next renesas-drivers release
(probably renesas-drivers-2017-02-21-v4.10).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
