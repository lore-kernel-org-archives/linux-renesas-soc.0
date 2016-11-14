Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <3311383.qyYI76AWiA@avalon>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWwEoH79DnVwret7bK9i-f-tXfSVMRSQdk=k-Ps5PUMGQ@mail.gmail.com> <3311383.qyYI76AWiA@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Nov 2016 14:47:00 +0100
Message-ID: <CAMuHMdVs7BSYOiPHvSnmP4+OGZVyGL6K+X3i9DT4VBfqBRxtzw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Nov 14, 2016 at 2:41 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 14 Nov 2016 14:35:26 Geert Uytterhoeven wrote:
>> The main reason I haven't sent out a similar series yet is because the GPIOs
>> used for the 3 push buttons are shared with the 3 user LEDs. For each of
>> them, you have to choose at DT time if you want to use them as buttons or
>> as LEDs.
>>
>> On ULCB, the same issue is present. For those, we settled on 1 key and 2
>> LEDs...
>>
>> Looking forward to more comments...
>
> In theory the GPIOs could be shared by the gpio-keys and LED drivers in open-
> drain mode. I'm not sure the GPIO subsystem supports that though.

Been there, done that, cfr. "[RFD] Sharing GPIOs for input (buttons) and
output (LEDs)". The result wasn't pretty...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
