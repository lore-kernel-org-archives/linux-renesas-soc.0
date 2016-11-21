Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33877 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbcKUJXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:23:48 -0500
Received: by mail-it0-f67.google.com with SMTP id o1so14288035ito.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 01:23:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1686355.2zT21Pz9pV@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdW6VE4ohO=nMgtzkWbfFc+VC33OMFzaxSBGy17UcaL9cQ@mail.gmail.com> <1686355.2zT21Pz9pV@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2016 10:23:46 +0100
Message-ID: <CAMuHMdWcyJsBEbCFoQe7LcUn+1EeCH_F+6yUSR8hsgy_PQOJrg@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] arm64: dts: r8a7795: salvator-x: Add panel
 backlight support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Nov 21, 2016 at 10:19 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 21 Nov 2016 09:36:22 Geert Uytterhoeven wrote:
>> On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart wrote:
>> > The panel backlight is controlled through a GPIO and a PWM channel.

>> > --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
>> > @@ -178,6 +178,16 @@
>> >                         };
>> >                 };
>> >         };
>> > +
>> > +       backlight: backlight {
>> > +               compatible = "pwm-backlight";
>> > +               pwms = <&pwm1 0 50000>;
>> > +
>> > +               brightness-levels = <256 128 64 16 8 4 0>;
>>
>> Would it make sense to define more and/or linear levels?
>
> Possibly, this is pretty arbitrary. Linear levels might not be the best option
> given that the human eye doesn't have a linear response to light power, but we

It not only depends on the human eye, but also on the backlight hardware
(is the conversion from voltage (L_VBRT) to light linear?).

> could certainly have more levels. In that case I'd prefer modifying the pwm-
> backlight DT bindings though, and specifying the PWM resolution instead of
> discrete levels.
>
> Note that the LVDS panel backlight PWM control signal is multiplexed with the
> external memory A21 signal on the Salvator-X board, with SW5 selecting which
> how to route the signal. When using backlight control we can't access the
> whole NOR flash anymore, so I'm not sure this patch should be merged.

That NOR flash is also optional, right?
My Ex Memory Connector is not populated.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
