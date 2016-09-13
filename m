Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1467278944-17042-1-git-send-email-kieran@bingham.xyz>
References: <1467278944-17042-1-git-send-email-kieran@bingham.xyz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Sep 2016 14:21:15 +0200
Message-ID: <CAMuHMdUuG9S7+JggruNrPWEqfTs1eKkPf0cGWZZOYC+vwvK72Q@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] FDP1 Fine Display Processor support
To: Kieran Bingham <kieran@bingham.xyz>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Thu, Jun 30, 2016 at 11:29 AM, Kieran Bingham <kieran@bingham.xyz> wrote:
> The following changes since commit f50e3d0720c0f27476153c2c7129b18639228d1b:
>
>   Merge branch 'drm/next/dt' into for/renesas-drivers (2016-06-21 18:01:05 +0300)
>
> are available in the git repository at:
>
>   https://github.com/kbingham/linux.git renesas/fdp1

I've dropped (a rebased version of) the above branch from today's
renesas-drivers release due to a build failure (V4L2_YCBCR_ENC_SYCC
undeclared).

Thanks for your understanding.



-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
