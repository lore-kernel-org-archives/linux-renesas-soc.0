Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <4992539.3i9E3kRg7r@avalon>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1480627909-19207-3-git-send-email-kieran.bingham+renesas@ideasonboard.com> <4992539.3i9E3kRg7r@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 15:17:10 +0100
Message-ID: <CAMuHMdXbjOdHAGJbShs01RPBNZhMpHWExXR=fdeOc+7Lm88ujQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Feb 13, 2017 at 3:03 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> +PNM=$(echo $FILE | sed -e 's|\.bin$|.pnm|')
>
> You can write this as
>
> PNM=${FILE/.bin/.pnm}

/ doesn't just match the suffix, try with waste.bin.picture.bin :-)

PNM=${FILE%.bin}.pnm

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
