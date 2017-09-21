Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:48597 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751609AbdIUJlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 05:41:45 -0400
Received: by mail-wm0-f53.google.com with SMTP id m127so101081wmm.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2017 02:41:45 -0700 (PDT)
Message-ID: <1505986855.23573.80.camel@hp800z>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Date: Thu, 21 Sep 2017 12:40:55 +0300
In-Reply-To: <CAMuHMdU87p0xjtfOtaoHPcqZZxVvxJc-b1jdP_iJYBwHv1=ebw@mail.gmail.com>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
         <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com>
         <1505983900.23573.76.camel@hp800z>
         <CAMuHMdU87p0xjtfOtaoHPcqZZxVvxJc-b1jdP_iJYBwHv1=ebw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, 2017-09-21 at 11:10 +0200, Geert Uytterhoeven wrote:
> Hi Pantelis,
> 
> On Thu, Sep 21, 2017 at 10:51 AM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
> > On Wed, 2017-09-20 at 14:32 +0200, Geert Uytterhoeven wrote:
> >> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
> >> <vladimir.barinov@cogentembedded.com> wrote:
> >> > +#include "ulcb-kf.dtsi"
> >>
> >> As the Kingfisher is actually an expansion board for H3ULCB (with R-Car H3
> >> ES1.1 and ES2.0) and M3ULCB (with R-Car M3-W), turning ulcb-kf.dtsi into a
> >> DT overlay would make sense.
> >> That would also solve the issue of the 3 extra DTSes needed for all possible
> >> combinations of ULCB and Kingfisher (r8a7795-es1-h3ulcb-kf.dts,
> >> r8a7795-h3ulcb-kf.dts, r8a7796-h3ulcb-kf.dts (perhaps more to follow?)).
> >>
> >> But that's too premature, without upstream support for the easy loading of
> >> DT overlays.
> >>
> >
> > Sigh, yes.
> >
> >> > +/ {
> >> > +       model = "Renesas M3ULCB Kingfisher board based on r8a7796";
> >> > +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> >> > +                    "renesas,r8a7796";
> >> > +};
> >>
> >> And how to support from an overlay the addition of "shimafuji,kingfisher" to
> >> (not replacement of!) the main compatible value?
> >
> > You can hack something in DT but it will be gross indeed.
> >
> > Ideally you'd want a += operator, but it's going to take a lot of
> > changes starting from DTB blob format.
> >
> > In yaml we could easily do this with an append tag type
> >
> > compatible: [ "renesas,m3ulcb", "renesas,r8a7796" ]
> >
> > compatible: !append "shimafuji,kingfisher"
> 
> As we already have /delete-property/, we could add /append-property/ and
> /prepend-property/? Would be useful for a .dts including and enhancing
> an .dtsi, too.
> 

Yes, that would work on the DTS source level. Doesn't help at runtime.

> That doesn't solve the DTB blob format issue yet, though.
> 

Right. The tree and property deletion commands do not have a mapping to
the DTB format. You could add special characters to a property name and
have the overlay application code do something about it.

For instance the original overlay submission did support property and
node deletion by using '-property' & '-node'. Alas it was removed.

> > Are you going to be at ELCE? I have a bunch of thing to ask you about
> > your DT usage patterns.
> 
> Yes, and registered for the Device Tree Workshop.
> 

Great. See you then.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Regards

-- Pantelis

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
