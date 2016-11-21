Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37184 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbcKUJSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:18:50 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 09/13] arm64: dts: r8a7795: salvator-x: Add panel backlight support
Date: Mon, 21 Nov 2016 11:19:05 +0200
Message-ID: <1686355.2zT21Pz9pV@avalon>
In-Reply-To: <CAMuHMdW6VE4ohO=nMgtzkWbfFc+VC33OMFzaxSBGy17UcaL9cQ@mail.gmail.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdW6VE4ohO=nMgtzkWbfFc+VC33OMFzaxSBGy17UcaL9cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 21 Nov 2016 09:36:22 Geert Uytterhoeven wrote:
> On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart wrote:
> > The panel backlight is controlled through a GPIO and a PWM channel.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> > @@ -178,6 +178,16 @@
> >                         };
> >                 };
> >         };
> > +
> > +       backlight: backlight {
> > +               compatible = "pwm-backlight";
> > +               pwms = <&pwm1 0 50000>;
> > +
> > +               brightness-levels = <256 128 64 16 8 4 0>;
> 
> Would it make sense to define more and/or linear levels?

Possibly, this is pretty arbitrary. Linear levels might not be the best option 
given that the human eye doesn't have a linear response to light power, but we 
could certainly have more levels. In that case I'd prefer modifying the pwm-
backlight DT bindings though, and specifying the PWM resolution instead of 
discrete levels.

Note that the LVDS panel backlight PWM control signal is multiplexed with the 
external memory A21 signal on the Salvator-X board, with SW5 selecting which 
how to route the signal. When using backlight control we can't access the 
whole NOR flash anymore, so I'm not sure this patch should be merged.

> > +               default-brightness-level = <6>;

-- 
Regards,

Laurent Pinchart
