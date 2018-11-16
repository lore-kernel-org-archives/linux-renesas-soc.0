Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:31461 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbeKQKFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Nov 2018 05:05:00 -0500
Date: Sat, 17 Nov 2018 00:50:31 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>, uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Message-ID: <580133467.90254.1542412231173@webmail.strato.com>
In-Reply-To: <CAMuHMdWK436=5cjzu7FneKYc7=Szo6z0gLtu0hbSZ5EGeXMNEA@mail.gmail.com>
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
 <1542352851-25393-2-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdWK436=5cjzu7FneKYc7=Szo6z0gLtu0hbSZ5EGeXMNEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: sh-pfc: Add physical pin multiplexing
 helper macros
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On November 16, 2018 at 9:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> 
> Hi Uli,
> 
> On Fri, Nov 16, 2018 at 8:21 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > Used by I2C controllers 0, 3 and 5 in R8A7795 and R8A7796 SoCs.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Some bikeshedding below, which I believe would increase readability.
> 
> > --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> > +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> > @@ -386,6 +386,28 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
> >         PINMUX_DATA(fn##_MARK, FN_##msel, FN_##fn, FN_##ipsr)
> >
> >  /*
> > + * Describe a pinmux configuration similar to PINMUX_IPSR_MSEL, but with
> > + * an additional select register that controls physical multiplexing
> > + * with another pin.
> > + *   - ipsr: IPSR field
> > + *   - fn: Function name, also referring to the IPSR field
> > + *   - msel1: Physical multiplexing selector
> 
> psel?
> 
> > + *   - msel2: Module selector
> 
> msel?
> 
> > + */
> > +#define PINMUX_IPSR_MSEL2(ipsr, fn, msel1, msel2) \
> 
> PINMUX_IPSR_PHYS_MSEL?
> 
> > +       PINMUX_DATA(fn##_MARK, FN_##msel1, FN_##msel2, FN_##fn, FN_##ipsr)
> > +
> > +/*
> > + * Describe a pinmux configuration in which a pin is physically multiplexed
> > + * with other pins.
> > + *   - ipsr: IPSR field
> > + *   - fn: Function name, also referring to the IPSR field
> > + *   - msel: Phyiscal multiplexing selector
> 
> psel?
> Physical
> 
> > + */
> > +#define PINMUX_IPSR_PHYS(ipsr, fn, msel) \
> > +       PINMUX_DATA(fn##_MARK, FN_##msel)
> > +
> > +/*
> >   * Describe a pinmux configuration for a single-function pin with GPIO
> >   * capability.
> >   *   - fn: Function name
> 
> If you agree, I can fix up all of the above while applying.

That would be fine with me, thank you.

CU
Uli
