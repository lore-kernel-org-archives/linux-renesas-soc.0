Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49759 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753993AbdDEIpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 04:45:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 09/13] arm64: dts: r8a7795: salvator-x: Add panel backlight support
Date: Wed, 05 Apr 2017 11:45:59 +0300
Message-ID: <18654178.y7VdoJ3ein@avalon>
In-Reply-To: <2227128.532ZZ8dc1T@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWcyJsBEbCFoQe7LcUn+1EeCH_F+6yUSR8hsgy_PQOJrg@mail.gmail.com> <2227128.532ZZ8dc1T@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 21 Nov 2016 11:59:47 Laurent Pinchart wrote:
> On Monday 21 Nov 2016 10:23:46 Geert Uytterhoeven wrote:
> > On Mon, Nov 21, 2016 at 10:19 AM, Laurent Pinchart wrote:
> >> On Monday 21 Nov 2016 09:36:22 Geert Uytterhoeven wrote:
> >>> On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart wrote:
> >>>> The panel backlight is controlled through a GPIO and a PWM channel.
> >>>> 
> >>>> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> >>>> @@ -178,6 +178,16 @@
> >>>>                         };
> >>>>                 };
> >>>>         };
> >>>> +
> >>>> +       backlight: backlight {
> >>>> +               compatible = "pwm-backlight";
> >>>> +               pwms = <&pwm1 0 50000>;
> >>>> +
> >>>> +               brightness-levels = <256 128 64 16 8 4 0>;
> >>> 
> >>> Would it make sense to define more and/or linear levels?
> >> 
> >> Possibly, this is pretty arbitrary. Linear levels might not be the best
> >> option given that the human eye doesn't have a linear response to light
> >> power, but we
> > 
> > It not only depends on the human eye, but also on the backlight hardware
> > (is the conversion from voltage (L_VBRT) to light linear?).
> 
> So we need to specify transfer functions in DT ;-)
> 
> >> could certainly have more levels. In that case I'd prefer modifying the
> >> pwm- backlight DT bindings though, and specifying the PWM resolution
> >> instead of discrete levels.
> >> 
> >> Note that the LVDS panel backlight PWM control signal is multiplexed
> >> with the external memory A21 signal on the Salvator-X board, with SW5
> >> selecting which how to route the signal. When using backlight control we
> >> can't access the whole NOR flash anymore, so I'm not sure this patch
> >> should be merged.
> > 
> > That NOR flash is also optional, right?
> > My Ex Memory Connector is not populated.
> 
> That's correct. The Salvator-X DT file in mainline is just an example
> anyway, and we should pick the most useful peripherals for that purpose.

Would you like me to include this in my next Salvator-X DT patch series for 
upstream merge ?

-- 
Regards,

Laurent Pinchart
