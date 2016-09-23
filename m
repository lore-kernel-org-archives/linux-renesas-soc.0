Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 23 Sep 2016 11:03:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clocksource: sh_cmt: Document r8a779[34] SoC specific
 bindings
Message-ID: <20160923090319.GA31361@verge.net.au>
References: <1474618805-22731-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVGVFD2BrAGMOu1m=Ec=S-1JO=RfAuBGCB74L-astjnLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGVFD2BrAGMOu1m=Ec=S-1JO=RfAuBGCB74L-astjnLw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 23, 2016 at 10:35:06AM +0200, Geert Uytterhoeven wrote:
> Hi Simon, Magnus,
> 
> On Fri, Sep 23, 2016 at 10:20 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > This documents the SoC specific binding for the r8a779[34] SoCs.
> > This is in keeping with the documentation of other R-Car Gen2 SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > index 1a05c1b243c1..566fb599ea39 100644
> > --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > @@ -48,10 +48,15 @@ Required Properties:
> >                 (CMT[01])
> >      - "renesas,cmt-48-r8a7791" for the r8a7791 48-bit CMT
> >                 (CMT[01])
> > +    - "renesas,cmt-48-r8a7793" for the r8a7793 48-bit CMT
> > +               (CMT[01])
> > +    - "renesas,cmt-48-r8a7794" for the r8a7793 48-bit CMT
> > +               (CMT[01])
> >      - "renesas,cmt-48-gen2" for all second generation 48-bit CMT
> > -               (CMT[01] on r8a73a4, r8a7790 and r8a7791)
> > +               (CMT[01] on r8a73a4, r8a7790, r8a7791, r8a7793, r8a7794)
> >                 This is a fallback for the renesas,cmt-48-r8a73a4,
> > -               renesas,cmt-48-r8a7790 and renesas,cmt-48-r8a7791 entries.
> > +               renesas,cmt-48-r8a7790, renesas,cmt-48-r8a7791,
> > +               renesas,cmt-48-r8a7793 and renesas,cmt-48-r8a7794 entries.
> >
> >    - reg: base address and length of the registers block for the timer module.
> >    - interrupts: interrupt-specifier for the timer, one per channel.
> 
> And these are planned to be removed again with Magnus'
> "devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings"
> (https://patchwork.kernel.org/patch/8579481/)?

Sorry, that slipped my mind.

Magnus, what is the status of that work?
