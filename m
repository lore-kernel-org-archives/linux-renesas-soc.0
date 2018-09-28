Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:33817 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbeI1OIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 10:08:40 -0400
Date: Fri, 28 Sep 2018 09:46:07 +0200
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
Message-ID: <20180928074607.GC6485@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <20180910130115.z6qwfzrimg3ceyup@verge.net.au>
 <20180911074448.GQ28160@w540>
 <20180911094430.GS28160@w540>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline
In-Reply-To: <20180911094430.GS28160@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi again,
   thanks to Morimoto-san, we got answers from the HW team.
I'm pasting them here below.

On Tue, Sep 11, 2018 at 11:44:30AM +0200, jacopo mondi wrote:
> Hi again,
>    I actually noticed I'm handling VIN4 and VIN5 un-consistently
> here...
>
> On Tue, Sep 11, 2018 at 09:44:48AM +0200, jacopo mondi wrote:
> > Hi Simon,
> >    thanks for looking into this patch
> >
> > On Mon, Sep 10, 2018 at 03:01:15PM +0200, Simon Horman wrote:
> > > On Wed, Sep 05, 2018 at 05:29:42PM +0200, Jacopo Mondi wrote:
> > > > This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 250 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 250 insertions(+)
> > > >
> > > > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > > index b81c807..0797940 100644
> > > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > > @@ -1831,6 +1831,194 @@ static const unsigned int usb30_id_mux[] = {
> > > >  	USB3HS0_ID_MARK,
> > > >  };
> > > >
> > > > +/* - VIN4 ------------------------------------------------------------------- */
> > > > +static const union vin_data vin4_data_a_pins = {
> > > > +	.data24 = {
> > > > +		RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> > > > +		RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> > > > +		RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> > > > +		RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> > > > +		RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> > > > +		RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> > > > +		RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> > > > +		RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> > > > +		RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
> > > > +		RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> > > > +		RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> > > > +		RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
> > > > +	},
> > > > +};
> > > > +
> > > > +static const union vin_data vin4_data_a_mux = {
> > > > +	.data24 = {
> > > > +		VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> > > > +		VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> > > > +		VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> > > > +		VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> > > > +		VI4_DATA8_MARK,   VI4_DATA9_MARK,
> > > > +		VI4_DATA10_MARK,  VI4_DATA11_MARK,
> > > > +		VI4_DATA12_MARK,  VI4_DATA13_MARK,
> > > > +		VI4_DATA14_MARK,  VI4_DATA15_MARK,
> > > > +		VI4_DATA16_MARK,  VI4_DATA17_MARK,
> > > > +		VI4_DATA18_MARK,  VI4_DATA19_MARK,
> > > > +		VI4_DATA20_MARK,  VI4_DATA21_MARK,
> > > > +		VI4_DATA22_MARK,  VI4_DATA23_MARK,
> > > > +	},
> > > > +};
> > > > +
> > > > +static const union vin_data vin4_data_b_pins = {
> > > > +	.data24 = {
> > > > +		RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
> > > > +		RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
> > > > +		RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
> > > > +		RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
> > >
> > > I am curious to know why the data B pins below (8 - 23)
> > > are duplicates of the corresponding data A pins in vin4_data_a_pins.
> > >
> >
> > On R-Car E3 only pins [0-7] of VIN4 interface have an '_a' and '_b'
> > options. Pins from [8-23] are "shared".
> >
> > We can discuss how we want this to be handled, but according to Table
> > 6D.5 (pag. 383 of R-Car chip manual revision 1.00) this table is
> > correct.
> >
> > Currently there are two open questions on this PFC patch:
> > 1) This one here you reported
>
> It does not end here, I'm sorry.
>
> VIN4 and VIN5 are described differently, it seems to me that we have
>
> vin4_data[0-7]_[a|b]
> vin4_data[8-23]
> vin4_sync
>
> vin5_data[0-7]_[a|b]
> vin5_data[8-15]_a
> vin5_sync_a
>
> So I handled it differently, as I've registered the following data groups
> for VIN4
>
> > > > +	"vin4_data8_a",
> > > > +	"vin4_data10_a",
> > > > +	"vin4_data12_a",
> > > > +	"vin4_data16_a",
> > > > +	"vin4_data20_a",
> > > > +	"vin4_data24_a",
> > > > +	"vin4_data8_b",
> > > > +	"vin4_data10_b",
> > > > +	"vin4_data12_b",
> > > > +	"vin4_data16_b",
> > > > +	"vin4_data20_b",
> > > > +	"vin4_data24_b",
>
> And the following ones for VIN5
>
>
> > > > +	"vin5_data8_a",
> > > > +	"vin5_data10_a",
> > > > +	"vin5_data12_a",
> > > > +	"vin5_data16_a",
> > > > +	"vin5_data8_b",
>
> If I would have been doing the same as I did for VIN4, I should have
> had "vin5_data10_b", "vin5_data12_b" and so on, with only the first 8
> pin being different between all _a and _b groups.
>
> I didn't do that because the VIN5 pins in the [8-15] range have a clear _a
> indications, but the more I think about this, the more I think that's
> a typographical mistake in the chip manual, and the VIN5 groups should
> not have any _a suffix, except for the first 8 pins, where a
> corresponding _b group actually exists. Or there is maybe an
> explanation why VIN4 and VIN5 are different, but I don't see it right
> now...
>

[VI4]
- Data[15:8] are     shared on A/B
- Data[7:0]  are not shared on A/B
- clock/sync are     shared on A/B

[VI5]
- A can use data[15:0]
- B can use data[7:0] only. BT.656 YUV422-8bit support only
- A/B uses each clock (not shared)
- A only has sync

So I think this patch is correct, and the following registered groups
matches the hardware capabilities

+	VIN_DATA_PIN_GROUP(vin4_data_a, 8),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 10),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 12),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 16),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 20),
+	VIN_DATA_PIN_GROUP(vin4_data_a, 24),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 8),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 10),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 12),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 16),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 20),
+	VIN_DATA_PIN_GROUP(vin4_data_b, 24),
+	SH_PFC_PIN_GROUP(vin4_sync),
+	SH_PFC_PIN_GROUP(vin4_field),
+	SH_PFC_PIN_GROUP(vin4_clkenb),
+	SH_PFC_PIN_GROUP(vin4_clk),
+	VIN_DATA_PIN_GROUP(vin5_data_a, 8),
+	VIN_DATA_PIN_GROUP(vin5_data_a, 10),
+	VIN_DATA_PIN_GROUP(vin5_data_a, 12),
+	VIN_DATA_PIN_GROUP(vin5_data_a, 16),
+	VIN_DATA_PIN_GROUP(vin5_data_b, 8),
+	SH_PFC_PIN_GROUP(vin5_sync_a),
+	SH_PFC_PIN_GROUP(vin5_field_a),
+	SH_PFC_PIN_GROUP(vin5_clkenb_a),
+	SH_PFC_PIN_GROUP(vin5_clk_a),
+	SH_PFC_PIN_GROUP(vin5_clk_b),


Thanks
   j

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbrdw/AAoJEHI0Bo8WoVY8I+0P/i5txFU9zFIEay5KowwcFEok
7CzMYBTOPHJDieVgL0JlJwZsSeGUzTVhC+LXjoOIjjQ4nGzzkZEJE7Fk2lQkby5k
bB48F45jmnoaztPf84ACsXhCTCmXv+kvsGL/sWBPZwxfn68kmB/wncA5fGhhH++t
M0V72kQobulZKKL2Cesc2yVbg+Siou+UHYTUMqEZ+1Yq+ws3qQ0y0Rt1523/fMG4
tlJdOqIOjClG4/6o4as+4Of1A657iOgRlPced2YICRDAIQvb6gQgf/FbjLXG2e9n
k9JeYf1nvYthliR7koyOGmC5wjURYVWCFQtC1bn/2fLuGu8pcNe7PjJT3Hrd43Ig
yZWJjjBY8tj2EgYYrKU9kITA1HK/RqdX6RKpYtJXMWLrghGX6pzVUVJxBXZ/KXgE
ScLpunJJdeOCNIK4QDak9dmLJX+fv0gsoVzfInLmBfoVPIwo5nCAPD6Zdb0UnOdl
Bg4abmIRRD0l02cDjBVm/4rAShGFCaHsBJ5Xlz2+eT5ndq5esp+F5IrjA2EQlpvF
AbD2DUFiLfgRpoB2sSVlktBXXhYT+bszEzbKmtvBog7aHh14nUq5n1a4tKu5ehEO
M8FfSg5V5kUAqtv+3T46MWo5psidTzFqQu+2dRAYP4ToLqMUnc4QNMreQydAKm1C
rNm3r+7V2uv550QnSPNq
=xIbD
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
