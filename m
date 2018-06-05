Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751822AbeFEJVx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 05:21:53 -0400
Date: Tue, 5 Jun 2018 11:21:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3] ARM: shmobile: Rework the PMIC IRQ line quirk
Message-ID: <20180605092151.57ezynjgf23yunkf@ninjato>
References: <20180604175911.799-1-marek.vasut+renesas@gmail.com>
 <20180605080727.ygh25rmjsrs3dmlq@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jgvlq5pi7jztadld"
Content-Disposition: inline
In-Reply-To: <20180605080727.ygh25rmjsrs3dmlq@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jgvlq5pi7jztadld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, Jun 05, 2018 at 10:07:28AM +0200, Simon Horman wrote:
> On Mon, Jun 04, 2018 at 07:59:11PM +0200, Marek Vasut wrote:
> > Rather than hard-coding the quirk topology, which stopped scaling,
> > parse the information from DT. The code looks for all compatible
> > PMICs -- da9036 and da9210 -- and checks if their IRQ line is tied
> > to the same pin. If so, the code sends a matching sequence to the
> > PMIC to deassert the IRQ.
> >=20
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

=46rom an I2C point of view:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Minor nits:

> > @@ -122,7 +143,13 @@ static struct notifier_block regulator_quirk_nb =
=3D {
> > =20
> >  static int __init rcar_gen2_regulator_quirk(void)
> >  {
> > -	u32 mon;
> > +	struct device_node *np;
> > +	const struct of_device_id *id;
> > +	struct regulator_quirk *quirk;
> > +	struct regulator_quirk *pos;

Merge the last two lines into one?

> > +	struct of_phandle_args *argsa, *argsb;
> > +	u32 mon, addr;
> > +	int ret;
> > =20
> >  	if (!of_machine_is_compatible("renesas,koelsch") &&
> >  	    !of_machine_is_compatible("renesas,lager") &&
> > @@ -130,6 +157,45 @@ static int __init rcar_gen2_regulator_quirk(void)
> >  	    !of_machine_is_compatible("renesas,gose"))
> >  		return -ENODEV;
> > =20
> > +	for_each_matching_node_and_match(np, rcar_gen2_quirk_match, &id) {
> > +		if (!np || !of_device_is_available(np))

Can '!np' actually happen? This is the exit condition of the for-loop,
or am I overlooking something?

Regards,

   Wolfram


--jgvlq5pi7jztadld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsWViYACgkQFA3kzBSg
KbZAGg//ZI6pLJPe3S0usCFE8KZhA6I/MHl/0Q0LhZIyUHvCBN5fMQUOdVaGZAMc
ln+3CV4V1CIjJ++aXFgwd1ggN+l3phoGjbtx2afGWVakFqwo69J+SZhZ8DQZAtY6
i6PwBN9sEg/hwns8PLRdxa/WGK3PUDq/sZAjM/jdtvEOdFP7vaS14zxt+VChlgUP
F8LoQ/oT9gRHg6c9cnXrY1xBUBe8W9JSt0LVAZHmOPDK4TnOu30JTcgm+Dck4/TJ
RTnGXAbwJy5JVxqBncKp7p0DN+3/fZMdTD/7TTCXYu1ckSO/ejdmL1lt5SumFa/G
sqjQJpwsucjGXACD6SGCii2g/TZVUyQaOZgBk9HhOYsPIVgihYR5luLTGv42CMs3
SoHKNCKTkWcUzAs2wEIaSM9+5aYj38GvWf7mtpRpQEl/18Qp0DPaI3LcLcsvtTuT
bgcWUSVduATOe14qB0/vMSyrWEPWShaWCcGfq2snC7iKSm6w3kW4xhOmEa27CtUF
GJb10sC5vU9lBnHU8LBl4DjlRKjoXrsBHcTmSLl6gZ0MeE0YuAKPE+dn0Q7n3HTe
/0M6MoOWauuGm7jJytW30WIzvkoOsVConC24AB+e6M/H1Fd3wDsxmRX9mpkJYOrk
hkY/ZjKQB8SdQPq9Adz2dMMEyO5z9DSpQxle2Fp+dLzUygYKMEU=
=2hre
-----END PGP SIGNATURE-----

--jgvlq5pi7jztadld--
