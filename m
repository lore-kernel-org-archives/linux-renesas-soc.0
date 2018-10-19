Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58091 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727549AbeJTBCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Oct 2018 21:02:45 -0400
Date: Fri, 19 Oct 2018 18:55:44 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
Message-ID: <20181019165544.GH11703@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdV1NKag-1KWFuWwgxgj+HDG-kB0F7L-WDVM+1E4-RncRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1NKag-1KWFuWwgxgj+HDG-kB0F7L-WDVM+1E4-RncRw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert, Simon,
   sorry to resurect this one, but while upporting VIN pin definition
for R8A77965 I have noticed something in this patch.

Please see below.

On Tue, Oct 02, 2018 at 11:25:31AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,

[snip]

> > @@ -1889,6 +2077,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
> >         SH_PFC_PIN_GROUP(usb0_id),
> >         SH_PFC_PIN_GROUP(usb30),
> >         SH_PFC_PIN_GROUP(usb30_id),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 8),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 10),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 12),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 16),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 20),
> > +       VIN_DATA_PIN_GROUP(vin4_data_a, 24),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 8),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 10),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 12),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 16),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 20),
> > +       VIN_DATA_PIN_GROUP(vin4_data_b, 24),

look here...

[snip]

> >
> > +static const char * const vin4_groups[] = {
> > +       "vin4_data8_a",
> > +       "vin4_data10_a",
> > +       "vin4_data12_a",
> > +       "vin4_data16_a",
> > +       "vin4_data20_a",
> > +       "vin4_data24_a",
> > +       "vin4_data8_b",
> > +       "vin4_data10_b",
> > +       "vin4_data12_b",
> > +       "vin4_data16_b",
> > +       "vin4_data20_b",
> > +       "vin4_data24_b",

Then here.

VIN_DATA_PIN_GROUP() expands as:

#define VIN_DATA_PIN_GROUP(n, s)				\
	{							\
		.name = #n#s,					\
		.pins = n##_pins.data##s,			\
		.mux = n##_mux.data##s,				\
		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
	}

So these groups should not be named
        "vin4_dataX_a" and
        "vin4_dataX_b"

But instead
        "vin4_data_aX" and
        "vin4_data_bX"

Am I wrong?

The only Gen3 SoC in mainline which uses the VIN data pins defined
through this macro is D3, which fortunately does not have any 'a' or
'b' group.

$ git grep vin\.*_data* arch/arm64/boot/dts/
arch/arm64/boot/dts/renesas/r8a77995-draak.dts:        groups =  "vin4_data8", "vin4_sync", "vin4_clk";

$ cat drivers/pinctrl/sh-pfc/pfc-r8a77995.c | grep "vin4_data, 8"
        VIN_DATA_PIN_GROUP(vin4_data, 8),

Going forward we might see some user of vin data groups having to
refer to "vin4_data_a8" and so on, which is not nice compared to
"vin4_data8_a".

What do you think?
In any case, this patch is indeed wrong. Or we align the group names
to what the macro produces, or change the macro, but I cannot tell how
to do that in a sane way? (introduce a new one that wants a 'group'
argument too?)

Thanks
  j

> > +       "vin4_data8_sft8",
>
> You dropped the sft8 pins, but forgot to remove the sft8 group name.
>
> > +       "vin4_sync",
> > +       "vin4_field",
> > +       "vin4_clkenb",
> > +       "vin4_clk",
> > +};
> > +
> > +static const char * const vin5_groups[] = {
> > +       "vin5_data8_a",
> > +       "vin5_data8_sft8_a",
>
> Likewise.
>
> > +       "vin5_data10_a",
> > +       "vin5_data12_a",
> > +       "vin5_data16_a",
> > +       "vin5_data8_b",
> > +       "vin5_sync_a",
> > +       "vin5_field_a",
> > +       "vin5_clkenb_a",
> > +       "vin5_clk_a",
> > +       "vin5_clk_b",
> > +};
>
> The rest looks OK to me, and matches the datasheet clarification.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbygyQAAoJEHI0Bo8WoVY8yGUQAJyL/R1Nqz2jG5/gwffE4GP0
CJJHwiQYO8kwS0qhsxZyGGiuTTny8nH7dTdYbUB0zLfvVJ43EL0AYhfF0nl0YTaE
s4WJxY5mGDT4VktctN4gkQDTFkyNs+NxeWLHmcCezHun+fv6FhBQc2CedfwONjx1
UW2WafTEBu9JqjMTCO04G/AmCKZTXkGPKDR7cTTt3TEOgA7iJT9OGbDfnk+tZ/6r
3dJw7UzSdcmU+9zaTT3seFWURaUVgt0du3L/ptOvOcW0I4E/CArOzm8e0xyi06Q4
+TtbbvLBljqzg1mAosLvZJK25ayMBwatqY19GOdwno4skCaKjqoNr4/70na4zZK3
6UfHF0kyAQCFH+/bhspi6e3zcRIhaMzVDwTfvNLHhqfRB+jEPQCQMl3dhtOD5VcP
AzBFRLTi2moo+JknJAZ0bmdo8BT3uCQuCHe9w6yH+FTi9QkED7Hpa/W/UiIuu7U3
rszttEnYEs4YmOb47i7EKf69pJm17YnpxeLCfLolETgmJx4z7TWlWz5zEmZa6A/U
ilUSi43KD9yqo2YzxYzsaAzyib+0ayOz0jFwvlZxltMGdp+iyHkGxXePH0O7+ecW
pUyFVuVsQOe1x1PtcNRcn++tON8/dVJsSh/VZH/GgBhGGVYYntFssHd1S9T/7Y7Z
TOhAZCMFaBw/O3eD+nSR
=jvF4
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--
