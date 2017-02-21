Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <1480627909-19207-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <4992539.3i9E3kRg7r@avalon>
 <7cc4fc1a-cd4b-a3ac-7450-48deffd30d27@ideasonboard.com>
 <CAMuHMdW658tmHBgU9az=YW3CLnB=+=jRFwV-8ChYiaDBbuvNXw@mail.gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <034c0107-9890-7e1c-b20b-c8e9559aeab0@ideasonboard.com>
Date: Tue, 21 Feb 2017 18:00:18 +0000
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW658tmHBgU9az=YW3CLnB=+=jRFwV-8ChYiaDBbuvNXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 20/02/17 20:45, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Mon, Feb 20, 2017 at 6:47 PM, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> This change breaks POSIX SH compliance, as reported by shellcheck:
>>
>> In scripts/bin2png.sh line 7:
>>         local pnm=${file/%bin/pnm}
>>                   ^-- SC2039: In POSIX sh, string replacement is not supported.
>>
>>
>> In scripts/bin2png.sh line 8:
>>         local png=${file/%bin/png}
>>                   ^-- SC2039: In POSIX sh, string replacement is not supported.
>>
>> It also breaks on my system which uses a strict posix compliant shell :D
> 
> Does "local pnm=${file%bin}pnm" work?

Yes, it does indeed seem to work so far!

Thanks for the hint.

I'll test a bit more and hopefully send a patch tomorrow :D

--
Kieran

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
