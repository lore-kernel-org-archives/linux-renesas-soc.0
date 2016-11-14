Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
Date: Tue, 15 Nov 2016 01:59:14 +0200
Message-ID: <1579044.36Kjjoy1H1@avalon>
In-Reply-To: <CAMuHMdWbXFBz2PpyGsgZNEPV50JYmZFfhw4hCVOpCviOUyct7g@mail.gmail.com>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <3190171.WPEDSgjiKH@avalon> <CAMuHMdWbXFBz2PpyGsgZNEPV50JYmZFfhw4hCVOpCviOUyct7g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 14 Nov 2016 20:47:03 Geert Uytterhoeven wrote:
> On Mon, Nov 14, 2016 at 5:44 PM, Laurent Pinchart wrote:
> > On Monday 14 Nov 2016 14:47:00 Geert Uytterhoeven wrote:
> >> On Mon, Nov 14, 2016 at 2:41 PM, Laurent Pinchart wrote:
> >>> On Monday 14 Nov 2016 14:35:26 Geert Uytterhoeven wrote:
> >>>> The main reason I haven't sent out a similar series yet is because the
> >>>> GPIOs used for the 3 push buttons are shared with the 3 user LEDs. For
> >>>> each of them, you have to choose at DT time if you want to use them as
> >>>> buttons or as LEDs.
> >>>> 
> >>>> On ULCB, the same issue is present. For those, we settled on 1 key and
> >>>> 2 LEDs...
> >>>> 
> >>>> Looking forward to more comments...
> >>> 
> >>> In theory the GPIOs could be shared by the gpio-keys and LED drivers in
> >>> open- drain mode. I'm not sure the GPIO subsystem supports that though.
> >> 
> >> Been there, done that, cfr. "[RFD] Sharing GPIOs for input (buttons) and
> >> output (LEDs)". The result wasn't pretty...
> > 
> > Wasn't it ? Linus basically told you to use open-drain GPIOs and fix the
> > GPIO driver in case it can't read the value of GPIOs configured as output
> > in open- drain mode. If didn't shoot the idea down.
> 
> If I'm not mistaken, the R-Car GPIO block does not support open-drain GPIO.

Not as such, but we can switch between input and output low, which is 
basically open-drain.

> Even if it would support it, you cannot read the GPIO while actively
> pulling it down.

When actively driving it low you know the value is 0. Only when driving it 
open do you need to read the value back, and that's easily implemented as the 
hardware will be configured in input mode then.

> Hence you have to time-multiplex the GPIO to use both LEDs and buttons,
> through switching between pulling down and not pulling down (or between
> output and input, which is what I did).

No, if you want to use both, you should configure the I/O in open-drain, in 
which case you have two options:

- Turn the LED on by driving the I/O "high", meaning leaving it floating. The 
pull-up resistor will turn the MOSFET on, the LED will be lit. When the 
corresponding button is pressed the I/O will be connected to GND, turning the 
LED off, and signalling the input.

- Turn the LED off by driving the I/O low. Pressing the button won't have any 
effect. We need in this case to ignore the input value, which could be done by 
disabling the I/O interrupt (or just ignoring it).

> Apart from that, there's also the discrepancy between hardware description
> (the GPIO is connected to both buttons and LEDs, hence it should be
> described that way in DT)

Correct, this is where a framework change is needed if we want to allow both 
the GPIO keyboard and LED drivers to request the GPIO.

> and user policy (the user wants to use e.g. the first GPIO as a button, and
> the second GPIO as an LED).

That's easy to do, the user will just need to turn the first LED on, allowing 
full button operation on the I/O.

> If you have ideas to solve these 2  issues, I'm happy  to hear your
> thoughts!

-- 
Regards,

Laurent Pinchart
