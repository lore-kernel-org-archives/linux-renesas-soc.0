Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBDF2E737E;
	Thu,  6 Aug 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003003; cv=none; b=RRhzU4CLySr6eDVgZpxEp3vlDGwErulVqWyR/PxVKw/zVE402ylqcU7UZEE2PXQevXUJpdzzscQeh56Sg4qQOyxm0Z3wX4tkIZz2wWwOYEXPQhmhXqIcy6SXI/GmLzaxH3xRazzhpEfMKH/RLgzxw/38quSW4y6fZbfHg93W3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003003; c=relaxed/simple;
	bh=o0jiUEE452BJNPpsZwJcdX/Wf97dJvtN9eGNW6re4Sk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A0uni4J9jIY/3mjmfeKEL8ne3BRur9NCn77RZUhIubzh7Kijrc/lCYJ3r0AJ3pZXBUlkxg3pqTWhR3DmKetibIot9ZsRUAs0xyLbi93roFY7VUCrJXgGbQm5I3mPl0JJiKktl950AzJtlcZDr3AdM5etx/ugZ3OmcQqckSlsyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5E129201FA9;
	Thu, 06 Aug 2026 09:56:29 +0200 (CEST)
Message-ID: <5e6e2e4e0f188377e63ac9d02b60aeb08cc29bb7.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Mark Brown <broonie@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org"
	 <linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 06 Aug 2026 09:56:29 +0200
In-Reply-To: <TY3PR01MB11346A7ED25E81534A144B22F86D32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
	 <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
	 <TY3PR01MB11346A7ED25E81534A144B22F86D32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-08-05 at 10:26 +0000, Biju Das wrote:
> Hi Philipp Zabel,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 09 July 2026 09:31
> > Subject: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
> >=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >=20
> > Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match=
 table for the RZ/G3L (r9a08g046)
> > SoC, using a dedicated rzg3l_info struct with pwrrdy set, similar to RZ=
/G3S.
> >=20
> > The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it u=
ses a separate rzg3l-vbus-
> > regulator driver to handle the additional VBUSEN control for port 2. Th=
e regulator_driver_name field is
> > used as the platform device name passed to platform_device_alloc(), and=
 must exactly match the name the
> > corresponding regulator driver registers via its id_table for platform =
bus matching to succeed.
> >=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v3->v4:
> >  * Updated the commit description.
> >  * Migrated to id_table match using driver_name and reduced the length
> >    < 24.
> > v2->v3:
> >  * No change.
> > v1->v2:
> >  * No change.
> > ---
> >  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/re=
set-rzg2l-usbphy-ctrl.c
> > index 84e745e49240..0803195080bd 100644
> > --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> > +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> > @@ -42,6 +42,7 @@ struct rzg2l_usbphy_ctrl_priv {  };
> >=20
> >  struct rzg2l_usbphy_ctrl_info {
> > +	const char *regulator_driver_name;
> >  	bool pwrrdy;
> >  };
> >=20
> > @@ -110,15 +111,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_u=
sbphy_ctrl_priv *priv)
> >  	spin_unlock_irqrestore(&priv->lock, flags);  }
> >=20
> > -static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {};
> > +static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {
> > +	.regulator_driver_name =3D "rzg2l-vbus-regulator", };
> >=20
> >  static const struct rzg2l_usbphy_ctrl_info rzg3s_info =3D {
> > +	.regulator_driver_name =3D "rzg2l-vbus-regulator",
> > +	.pwrrdy =3D true,
> > +};
> > +
> > +static const struct rzg2l_usbphy_ctrl_info rzg3l_info =3D {
> > +	.regulator_driver_name =3D "rzg3l-vbus-regulator",
> >  	.pwrrdy =3D true,
> >  };
> >=20
> >  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
> >  	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl", .data =3D &rzg2l_info =
},
> >  	{ .compatible =3D "renesas,r9a08g045-usbphy-ctrl", .data =3D &rzg3s_i=
nfo },
> > +	{ .compatible =3D "renesas,r9a08g046-usbphy-ctrl", .data =3D &rzg3l_i=
nfo
> > +},
> >  	{ /* Sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table); @@ -245,7 +255=
,7 @@ static int
> > rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
> >  	if (error)
> >  		goto err_pm_runtime_put;
> >=20
> > -	vdev =3D platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
> > +	vdev =3D platform_device_alloc(info->regulator_driver_name, pdev->id)=
;
>=20
> Please let me know, should I send a patch to increase the length from 24-=
>32 [1]
> So that there won't be any backward compatibility issues.
>=20
> [1] https://elixir.bootlin.com/linux/v7.1.2/source/include/linux/mod_devi=
cetable.h#L604

I'm not sure.

PLATFORM_NAME_SIZE was last extended in commit 655862865c97
("mod_devicetable: Enlarge the maximum platform_device_id name
length"), but only very conservatively. Whether it is relevant that
platform_device_id fits into 32-byte cache line size of some
architectures, I can't say. The _NAME_SIZEs of other buses (aux, i2c,
spi, ...) already vary between 20 and 40 chars.

You could either try that, or you could prepend a single patch that
does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator" rename in
both regulator and reset drivers and that could be merged into both
trees.


regards
Philipp
