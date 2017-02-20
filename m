Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <7cc4fc1a-cd4b-a3ac-7450-48deffd30d27@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1480627909-19207-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <4992539.3i9E3kRg7r@avalon> <7cc4fc1a-cd4b-a3ac-7450-48deffd30d27@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Feb 2017 21:45:34 +0100
Message-ID: <CAMuHMdW658tmHBgU9az=YW3CLnB=+=jRFwV-8ChYiaDBbuvNXw@mail.gmail.com>
Subject: Re: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Mon, Feb 20, 2017 at 6:47 PM, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> This change breaks POSIX SH compliance, as reported by shellcheck:
>
> In scripts/bin2png.sh line 7:
>         local pnm=${file/%bin/pnm}
>                   ^-- SC2039: In POSIX sh, string replacement is not supported.
>
>
> In scripts/bin2png.sh line 8:
>         local png=${file/%bin/png}
>                   ^-- SC2039: In POSIX sh, string replacement is not supported.
>
> It also breaks on my system which uses a strict posix compliant shell :D

Does "local pnm=${file%bin}pnm" work?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
