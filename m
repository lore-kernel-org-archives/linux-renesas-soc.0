Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv2 2/5] scripts: Provide bin2png.sh helper
Date: Mon, 13 Feb 2017 16:24 +0200
Message-ID: <2117839.8xmmGiJgDY@avalon>
In-Reply-To: <CAMuHMdXbjOdHAGJbShs01RPBNZhMpHWExXR=fdeOc+7Lm88ujQ@mail.gmail.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <4992539.3i9E3kRg7r@avalon> <CAMuHMdXbjOdHAGJbShs01RPBNZhMpHWExXR=fdeOc+7Lm88ujQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 13 Feb 2017 15:17:10 Geert Uytterhoeven wrote:
> On Mon, Feb 13, 2017 at 3:03 PM, Laurent Pinchart wrote:
> >> +PNM=$(echo $FILE | sed -e 's|\.bin$|.pnm|')
> > 
> > You can write this as
> > 
> > PNM=${FILE/.bin/.pnm}
> 
> / doesn't just match the suffix, try with waste.bin.picture.bin :-)

There's a single '.bin' string in the file names we deal with, but in general 
you're right, yes.

> PNM=${FILE%.bin}.pnm

I've used PNM={FILE/%bin/pnm}

-- 
Regards,

Laurent Pinchart
