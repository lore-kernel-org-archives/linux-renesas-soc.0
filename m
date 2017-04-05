Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932546AbdDESVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 14:21:18 -0400
Date: Wed, 5 Apr 2017 14:21:13 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 09/13] arm64: dts: r8a7795: salvator-x: Add panel
 backlight support
Message-ID: <20170405182112.GB31226@verge.net.au>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWcyJsBEbCFoQe7LcUn+1EeCH_F+6yUSR8hsgy_PQOJrg@mail.gmail.com>
 <2227128.532ZZ8dc1T@avalon>
 <18654178.y7VdoJ3ein@avalon>
 <CAMuHMdVubYkdwGrjx_1JZDnmMjgS379zYdng7MKnUB6_VaZYNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVubYkdwGrjx_1JZDnmMjgS379zYdng7MKnUB6_VaZYNA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 05, 2017 at 10:55:32AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Wed, Apr 5, 2017 at 10:45 AM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Monday 21 Nov 2016 11:59:47 Laurent Pinchart wrote:
> >> On Monday 21 Nov 2016 10:23:46 Geert Uytterhoeven wrote:
> >> > On Mon, Nov 21, 2016 at 10:19 AM, Laurent Pinchart wrote:
> >> >> On Monday 21 Nov 2016 09:36:22 Geert Uytterhoeven wrote:
> >> >>> On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart wrote:
> >> >>>> The panel backlight is controlled through a GPIO and a PWM channel.
> >> >>>>
> >> >>>> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> >> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> >> >>>> @@ -178,6 +178,16 @@
> >> >>>>                         };
> >> >>>>                 };
> >> >>>>         };
> >> >>>> +
> >> >>>> +       backlight: backlight {
> >> >>>> +               compatible = "pwm-backlight";
> >> >>>> +               pwms = <&pwm1 0 50000>;
> >> >>>> +
> >> >>>> +               brightness-levels = <256 128 64 16 8 4 0>;
> >> >>>
> >> >>> Would it make sense to define more and/or linear levels?
> >> >>
> >> >> Possibly, this is pretty arbitrary. Linear levels might not be the best
> >> >> option given that the human eye doesn't have a linear response to light
> >> >> power, but we
> >> >
> >> > It not only depends on the human eye, but also on the backlight hardware
> >> > (is the conversion from voltage (L_VBRT) to light linear?).
> >>
> >> So we need to specify transfer functions in DT ;-)
> >>
> >> >> could certainly have more levels. In that case I'd prefer modifying the
> >> >> pwm- backlight DT bindings though, and specifying the PWM resolution
> >> >> instead of discrete levels.
> >> >>
> >> >> Note that the LVDS panel backlight PWM control signal is multiplexed
> >> >> with the external memory A21 signal on the Salvator-X board, with SW5
> >> >> selecting which how to route the signal. When using backlight control we
> >> >> can't access the whole NOR flash anymore, so I'm not sure this patch
> >> >> should be merged.
> >> >
> >> > That NOR flash is also optional, right?
> >> > My Ex Memory Connector is not populated.
> >>
> >> That's correct. The Salvator-X DT file in mainline is just an example
> >> anyway, and we should pick the most useful peripherals for that purpose.
> >
> > Would you like me to include this in my next Salvator-X DT patch series for
> > upstream merge ?
> 
> That's fine for me (CC Simon). Thx!

Sounds good to me.
