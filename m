Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1605069.rWfQvu2DRJ@avalon>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdW8CNrP0peCHxaqA4Yj7DEmbH9L0Qai+TMpfgbyVMn3Nw@mail.gmail.com>
 <4011173.GR855PE2mA@avalon> <1605069.rWfQvu2DRJ@avalon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Nov 2016 21:36:04 +0100
Message-ID: <CACRpkda9e=wypg_FSVgFwNtEAH1Soef8m6Brrgq+S_Yfr08++w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 15, 2016 at 3:28 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>> >>> Apart from that, there's also the discrepancy between hardware
>> >>> description (the GPIO is connected to both buttons and LEDs, hence it
>> >>> should be described that way in DT)
>> >>
>> >> Correct, this is where a framework change is needed if we want to allow
>> >> both the GPIO keyboard and LED drivers to request the GPIO.
>>
>> Linus, would this be acceptable to you ?

Yes, if:

- It is solved in a generic way so that there is a call like
gpiod_get_nonexclusive()
  or similar to get a second handle on a GPIOd someone else is already using.

- It is cross-coordinated with the regulator people who have exactly the same
  problem for fixed GPIO regulators and which is why that code looks like hell.

Apart from that, we generally need a way to access LEDs as resources with
foo-leds = <&led_foo>; in the device tree just like we can get GPIOs and I
hope someone is working on that for this thing... triggers is such a hack.

Yours,
Linus Walleij
