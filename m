Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40542 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbeJUDPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Oct 2018 23:15:44 -0400
Received: by mail-vk1-f196.google.com with SMTP id h20-v6so8870395vke.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Oct 2018 12:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdV1NKag-1KWFuWwgxgj+HDG-kB0F7L-WDVM+1E4-RncRw@mail.gmail.com> <20181019165544.GH11703@w540>
In-Reply-To: <20181019165544.GH11703@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 20 Oct 2018 21:04:07 +0200
Message-ID: <CAMuHMdUqKKLsmVKVzdmg06c6HhNKO03ROQgXx_A6O-_Rvam5jQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Fri, Oct 19, 2018 at 6:55 PM jacopo mondi <jacopo@jmondi.org> wrote:
>    sorry to resurect this one, but while upporting VIN pin definition
> for R8A77965 I have noticed something in this patch.
>
> Please see below.
>
> On Tue, Oct 02, 2018 at 11:25:31AM +0200, Geert Uytterhoeven wrote:
> > Hi Jacopo,
>
> [snip]
>
> > > @@ -1889,6 +2077,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
> > >         SH_PFC_PIN_GROUP(usb0_id),
> > >         SH_PFC_PIN_GROUP(usb30),
> > >         SH_PFC_PIN_GROUP(usb30_id),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 8),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 10),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 12),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 16),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 20),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_a, 24),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 8),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 10),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 12),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 16),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 20),
> > > +       VIN_DATA_PIN_GROUP(vin4_data_b, 24),
>
> look here...
>
> [snip]
>
> > >
> > > +static const char * const vin4_groups[] = {
> > > +       "vin4_data8_a",
> > > +       "vin4_data10_a",
> > > +       "vin4_data12_a",
> > > +       "vin4_data16_a",
> > > +       "vin4_data20_a",
> > > +       "vin4_data24_a",
> > > +       "vin4_data8_b",
> > > +       "vin4_data10_b",
> > > +       "vin4_data12_b",
> > > +       "vin4_data16_b",
> > > +       "vin4_data20_b",
> > > +       "vin4_data24_b",
>
> Then here.
>
> VIN_DATA_PIN_GROUP() expands as:
>
> #define VIN_DATA_PIN_GROUP(n, s)                                \
>         {                                                       \
>                 .name = #n#s,                                   \
>                 .pins = n##_pins.data##s,                       \
>                 .mux = n##_mux.data##s,                         \
>                 .nr_pins = ARRAY_SIZE(n##_pins.data##s),        \
>         }
>
> So these groups should not be named
>         "vin4_dataX_a" and
>         "vin4_dataX_b"
>
> But instead
>         "vin4_data_aX" and
>         "vin4_data_bX"
>
> Am I wrong?

Nice catch!

For consistency with other groups, they should be named "vin4_dataX_a"
and "vin4_dataX_b".

> The only Gen3 SoC in mainline which uses the VIN data pins defined
> through this macro is D3, which fortunately does not have any 'a' or
> 'b' group.
>
> $ git grep vin\.*_data* arch/arm64/boot/dts/
> arch/arm64/boot/dts/renesas/r8a77995-draak.dts:        groups =  "vin4_data8", "vin4_sync", "vin4_clk";
>
> $ cat drivers/pinctrl/sh-pfc/pfc-r8a77995.c | grep "vin4_data, 8"
>         VIN_DATA_PIN_GROUP(vin4_data, 8),
>
> Going forward we might see some user of vin data groups having to
> refer to "vin4_data_a8" and so on, which is not nice compared to
> "vin4_data8_a".
>
> What do you think?
> In any case, this patch is indeed wrong. Or we align the group names
> to what the macro produces, or change the macro, but I cannot tell how
> to do that in a sane way? (introduce a new one that wants a 'group'
> argument too?)

I only gave this a brief look, but it seems like we need more/better macros.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
