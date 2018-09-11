Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42961 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbeIKOnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 10:43:08 -0400
Date: Tue, 11 Sep 2018 11:44:30 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
Message-ID: <20180911094430.GS28160@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <20180910130115.z6qwfzrimg3ceyup@verge.net.au>
 <20180911074448.GQ28160@w540>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zfSPj0+0wxNpTjLN"
Content-Disposition: inline
In-Reply-To: <20180911074448.GQ28160@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zfSPj0+0wxNpTjLN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi again,
   I actually noticed I'm handling VIN4 and VIN5 un-consistently
here...

On Tue, Sep 11, 2018 at 09:44:48AM +0200, jacopo mondi wrote:
> Hi Simon,
>    thanks for looking into this patch
>
> On Mon, Sep 10, 2018 at 03:01:15PM +0200, Simon Horman wrote:
> > On Wed, Sep 05, 2018 at 05:29:42PM +0200, Jacopo Mondi wrote:
> > > This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 250 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 250 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > index b81c807..0797940 100644
> > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > @@ -1831,6 +1831,194 @@ static const unsigned int usb30_id_mux[] = {
> > >  	USB3HS0_ID_MARK,
> > >  };
> > >
> > > +/* - VIN4 ------------------------------------------------------------------- */
> > > +static const union vin_data vin4_data_a_pins = {
> > > +	.data24 = {
> > > +		RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> > > +		RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> > > +		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> > > +		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> > > +		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> > > +		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> > > +		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> > > +		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> > > +		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
> > > +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> > > +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> > > +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin4_data_a_mux = {
> > > +	.data24 = {
> > > +		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> > > +		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> > > +		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> > > +		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> > > +		VI4_DATA8_MARK,   VI4_DATA9_MARK,
> > > +		VI4_DATA10_MARK,  VI4_DATA11_MARK,
> > > +		VI4_DATA12_MARK,  VI4_DATA13_MARK,
> > > +		VI4_DATA14_MARK,  VI4_DATA15_MARK,
> > > +		VI4_DATA16_MARK,  VI4_DATA17_MARK,
> > > +		VI4_DATA18_MARK,  VI4_DATA19_MARK,
> > > +		VI4_DATA20_MARK,  VI4_DATA21_MARK,
> > > +		VI4_DATA22_MARK,  VI4_DATA23_MARK,
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin4_data_b_pins = {
> > > +	.data24 = {
> > > +		RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
> > > +		RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
> > > +		RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
> > > +		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
> >
> > I am curious to know why the data B pins below (8 - 23)
> > are duplicates of the corresponding data A pins in vin4_data_a_pins.
> >
>
> On R-Car E3 only pins [0-7] of VIN4 interface have an '_a' and '_b'
> options. Pins from [8-23] are "shared".
>
> We can discuss how we want this to be handled, but according to Table
> 6D.5 (pag. 383 of R-Car chip manual revision 1.00) this table is
> correct.
>
> Currently there are two open questions on this PFC patch:
> 1) This one here you reported

It does not end here, I'm sorry.

VIN4 and VIN5 are described differently, it seems to me that we have

vin4_data[0-7]_[a|b]
vin4_data[8-23]
vin4_sync

vin5_data[0-7]_[a|b]
vin5_data[8-15]_a
vin5_sync_a

So I handled it differently, as I've registered the following data groups
for VIN4

> > > +	"vin4_data8_a",
> > > +	"vin4_data10_a",
> > > +	"vin4_data12_a",
> > > +	"vin4_data16_a",
> > > +	"vin4_data20_a",
> > > +	"vin4_data24_a",
> > > +	"vin4_data8_b",
> > > +	"vin4_data10_b",
> > > +	"vin4_data12_b",
> > > +	"vin4_data16_b",
> > > +	"vin4_data20_b",
> > > +	"vin4_data24_b",

And the following ones for VIN5


> > > +	"vin5_data8_a",
> > > +	"vin5_data10_a",
> > > +	"vin5_data12_a",
> > > +	"vin5_data16_a",
> > > +	"vin5_data8_b",

If I would have been doing the same as I did for VIN4, I should have
had "vin5_data10_b", "vin5_data12_b" and so on, with only the first 8
pin being different between all _a and _b groups.

I didn't do that because the VIN5 pins in the [8-15] range have a clear _a
indications, but the more I think about this, the more I think that's
a typographical mistake in the chip manual, and the VIN5 groups should
not have any _a suffix, except for the first 8 pins, where a
corresponding _b group actually exists. Or there is maybe an
explanation why VIN4 and VIN5 are different, but I don't see it right
now...

Thanks
   j


> ... (see below)
>
> > > +		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> > > +		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> > > +		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> > > +		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> > > +		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
> > > +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 15),
> > > +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> > > +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin4_data_b_mux = {
> > > +	.data24 = {
> > > +		VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
> > > +		VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
> > > +		VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
> > > +		VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
> > > +		VI4_DATA8_MARK,   VI4_DATA9_MARK,
> > > +		VI4_DATA10_MARK,  VI4_DATA11_MARK,
> > > +		VI4_DATA12_MARK,  VI4_DATA13_MARK,
> > > +		VI4_DATA14_MARK,  VI4_DATA15_MARK,
> > > +		VI4_DATA16_MARK,  VI4_DATA17_MARK,
> > > +		VI4_DATA18_MARK,  VI4_DATA19_MARK,
> > > +		VI4_DATA20_MARK,  VI4_DATA21_MARK,
> > > +		VI4_DATA22_MARK,  VI4_DATA23_MARK,
> > > +	},
> > > +};
> > > +
> > > +static const unsigned int vin4_sync_pins[] = {
> > > +	/* HSYNC, VSYNC */
> > > +	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
> > > +};
> > > +
> > > +static const unsigned int vin4_sync_mux[] = {
> > > +	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin4_field_pins[] = {
> > > +	RCAR_GP_PIN(2, 23),
> > > +};
> > > +
> > > +static const unsigned int vin4_field_mux[] = {
> > > +	VI4_FIELD_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin4_clkenb_pins[] = {
> > > +	RCAR_GP_PIN(1, 2),
> > > +};
> > > +
> > > +static const unsigned int vin4_clkenb_mux[] = {
> > > +	VI4_CLKENB_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin4_clk_pins[] = {
> > > +	RCAR_GP_PIN(2, 22),
> > > +};
> > > +
> > > +static const unsigned int vin4_clk_mux[] = {
> > > +	VI4_CLK_MARK,
> > > +};
> > > +
> > > +/* - VIN5 ------------------------------------------------------------------- */
> > > +static const union vin_data vin5_data_a_pins = {
> > > +	.data16 = {
> > > +		RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
> > > +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
> > > +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> > > +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> > > +		RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> > > +		RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
> > > +		RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
> > > +		RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin5_data_a_mux = {
> > > +	.data16 = {
> > > +		VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
> > > +		VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
> > > +		VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
> > > +		VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
> > > +		VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
> > > +		VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
> > > +		VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
> > > +		VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin5_data_b_pins = {
> > > +	.data8 = {
> > > +		RCAR_GP_PIN(2, 23), RCAR_GP_PIN(0, 4),
> > > +		RCAR_GP_PIN(0, 7),  RCAR_GP_PIN(0, 12),
> > > +		RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
> > > +		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
> > > +	},
> > > +};
> > > +
> > > +static const union vin_data vin5_data_b_mux = {
> > > +	.data8 = {
> > > +		VI5_DATA0_B_MARK,  VI5_DATA1_B_MARK,
> > > +		VI5_DATA2_B_MARK,  VI5_DATA3_B_MARK,
> > > +		VI5_DATA4_B_MARK,  VI5_DATA5_B_MARK,
> > > +		VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
> > > +	},
> > > +};
> > > +
> > > +static const unsigned int vin5_sync_a_pins[] = {
> > > +	/* HSYNC_N, VSYNC_N */
> > > +	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
> > > +};
> > > +
> > > +static const unsigned int vin5_sync_a_mux[] = {
> > > +	VI5_HSYNC_N_A_MARK, VI5_VSYNC_N_A_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin5_field_a_pins[] = {
> > > +	RCAR_GP_PIN(1, 10),
> > > +};
> > > +
> > > +static const unsigned int vin5_field_a_mux[] = {
> > > +	VI5_FIELD_A_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin5_clkenb_a_pins[] = {
> > > +	RCAR_GP_PIN(0, 1),
> > > +};
> > > +
> > > +static const unsigned int vin5_clkenb_a_mux[] = {
> > > +	VI5_CLKENB_A_MARK,
> > > +};
>
> 2) VIN5 synchronism signals (V/HSYNC, CLKENB, FIELD) are marked as
>    "_A" only, while VIN4 ones have not _A or _B extensions and are
>    shared between _A and _B group. The VIN5_#_A extension is an
>    indication that synchronism signals for group _B are not
>    multiplexed but active be default according to Morimoto-san, that
>    is about to confirm this with HW team. In that case, we need to
>    decide if to provide an 'vin5_sync_b' group anyway to let user
>    select it from DTS. Otherwise it won't be possible to select
>    synchronism pins for VIN5_B group (which is maybe fine if they're
>    not multiplexed at all).
>
> Thanks
>    j
>
> > > +
> > > +static const unsigned int vin5_clk_a_pins[] = {
> > > +	RCAR_GP_PIN(1, 0),
> > > +};
> > > +
> > > +static const unsigned int vin5_clk_a_mux[] = {
> > > +	VI5_CLK_A_MARK,
> > > +};
> > > +
> > > +static const unsigned int vin5_clk_b_pins[] = {
> > > +	RCAR_GP_PIN(2, 22),
> > > +};
> > > +
> > > +static const unsigned int vin5_clk_b_mux[] = {
> > > +	VI5_CLK_B_MARK,
> > > +};
> > > +
> > >  static const struct sh_pfc_pin_group pinmux_groups[] = {
> > >  	SH_PFC_PIN_GROUP(avb_link),
> > >  	SH_PFC_PIN_GROUP(avb_magic),
> > > @@ -1889,6 +2077,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
> > >  	SH_PFC_PIN_GROUP(usb0_id),
> > >  	SH_PFC_PIN_GROUP(usb30),
> > >  	SH_PFC_PIN_GROUP(usb30_id),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 8),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 10),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 12),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 16),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 20),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_a, 24),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 8),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 10),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 12),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 16),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 20),
> > > +	VIN_DATA_PIN_GROUP(vin4_data_b, 24),
> > > +	SH_PFC_PIN_GROUP(vin4_sync),
> > > +	SH_PFC_PIN_GROUP(vin4_field),
> > > +	SH_PFC_PIN_GROUP(vin4_clkenb),
> > > +	SH_PFC_PIN_GROUP(vin4_clk),
> > > +	VIN_DATA_PIN_GROUP(vin5_data_a, 8),
> > > +	VIN_DATA_PIN_GROUP(vin5_data_a, 10),
> > > +	VIN_DATA_PIN_GROUP(vin5_data_a, 12),
> > > +	VIN_DATA_PIN_GROUP(vin5_data_a, 16),
> > > +	VIN_DATA_PIN_GROUP(vin5_data_b, 8),
> > > +	SH_PFC_PIN_GROUP(vin5_sync_a),
> > > +	SH_PFC_PIN_GROUP(vin5_field_a),
> > > +	SH_PFC_PIN_GROUP(vin5_clkenb_a),
> > > +	SH_PFC_PIN_GROUP(vin5_clk_a),
> > > +	SH_PFC_PIN_GROUP(vin5_clk_b),
> > >  };
> > >
> > >  static const char * const avb_groups[] = {
> > > @@ -1996,6 +2210,40 @@ static const char * const usb30_groups[] = {
> > >  	"usb30_id",
> > >  };
> > >
> > > +static const char * const vin4_groups[] = {
> > > +	"vin4_data8_a",
> > > +	"vin4_data10_a",
> > > +	"vin4_data12_a",
> > > +	"vin4_data16_a",
> > > +	"vin4_data20_a",
> > > +	"vin4_data24_a",
> > > +	"vin4_data8_b",
> > > +	"vin4_data10_b",
> > > +	"vin4_data12_b",
> > > +	"vin4_data16_b",
> > > +	"vin4_data20_b",
> > > +	"vin4_data24_b",
> > > +	"vin4_data8_sft8",
> > > +	"vin4_sync",
> > > +	"vin4_field",
> > > +	"vin4_clkenb",
> > > +	"vin4_clk",
> > > +};
> > > +
> > > +static const char * const vin5_groups[] = {
> > > +	"vin5_data8_a",
> > > +	"vin5_data8_sft8_a",
> > > +	"vin5_data10_a",
> > > +	"vin5_data12_a",
> > > +	"vin5_data16_a",
> > > +	"vin5_data8_b",
> > > +	"vin5_sync_a",
> > > +	"vin5_field_a",
> > > +	"vin5_clkenb_a",
> > > +	"vin5_clk_a",
> > > +	"vin5_clk_b",
> > > +};
> > > +
> > >  static const struct sh_pfc_function pinmux_functions[] = {
> > >  	SH_PFC_FUNCTION(avb),
> > >  	SH_PFC_FUNCTION(i2c1),
> > > @@ -2013,6 +2261,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
> > >  	SH_PFC_FUNCTION(scif_clk),
> > >  	SH_PFC_FUNCTION(usb0),
> > >  	SH_PFC_FUNCTION(usb30),
> > > +	SH_PFC_FUNCTION(vin4),
> > > +	SH_PFC_FUNCTION(vin5),
> > >  };
> > >
> > >  static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> > > --
> > > 2.7.4
> > >



--zfSPj0+0wxNpTjLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbl45+AAoJEHI0Bo8WoVY8jw8QAJfHrVo3CwO+k176zkcD71ez
LoM/qQwxK1cjcVsDDU98MCTopPq/7iatq70CzZiiQHJd5FyndKcrU3sZuoC1uVK5
8QqE9JFxUVmY4ZKHjvDH/rfUg7ylI9lWD5+nLGwRjGC5D9XcZODWPwwaLWqT+3K8
UPvU4Alx0WtLOuBT27aTKFW96/BJEyjhTJQG6fiN+1MOD7h3zeJWwM2aFmztAqjJ
KTExPhb9TxuH2EG0Wq1sHyxA4/wniyOmlj8GqzrYHjorsDa661JgZrh3hkhIqIth
if2e8y0dpE/0weHu/qZ5nMNMGwITqecsMzbHl4JEePwGKbMZf5iVd+L6dk+8fB9o
2NfytdAhL+qkDe3FCJA3CgL2y3Ho9W8+ubFNdXjeOGFsuun1sfDvoakOk5CVSLEK
UsnAUmcRmksjk5qvIoGUsMA0MzietA1XZCDJEpyUhMzg9WXI41BJVc8EErBQRub9
ien3pYrOokISvrfaO9N8HuRBVAvntjAyXQH9ktYGvvLXxBac6/cqszG4OQmnrp2a
OEqgKLLKGCcqVcd3vwmuIS37KHJheJYLXF6SmWy6UrniouakKF4BzJ1TfnisDIGT
PU7igFk1XhBBZ2OjygQjBgPeVypQ2dd3xXkOMfdRHKDy+xcGoL0ahekCkNXdY/vi
uLXN+Dxh0DqY95/EvWCI
=sWaj
-----END PGP SIGNATURE-----

--zfSPj0+0wxNpTjLN--
