Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA32941A4EF;
	Thu, 23 Jul 2026 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798347; cv=none; b=cWGoFtxD6hGeLfusr014h4niHneDPN/5RJLj9EvzpD4pW0+mhenLqiggPa0Yudp8AGn+yI2DQMAEfDpBbrPZsOVxT3HduGJDyeT8hjKf8uxdk08pU53XSlWI6mInBLVeDyOHrK0uyieXfY3psPKRLxtFmdoaD8LjLt4ZL8Nq8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798347; c=relaxed/simple;
	bh=WQ12BUzlTqlMNJW+uMwK49fk+51o+U2WwadyukRZcnQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ffjAJWtrXY+Kb9Kb3gOMZFvefRTBQ+1YevCPlZa8ePlWSxZxuI74TehJkWxKUbZQEtQUew3MhRF2CCyoc6JBHttBgt4vhzoeDTG0RsbLJ++PEiRoumMZAKskEykkInlKzNh9DrPjeQE8ML6W0Qx1x4pMCH2GukEaP7gyb2TZZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DAF0220113B;
	Thu, 23 Jul 2026 11:18:53 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmpZt-000sJu-2d;
	Thu, 23 Jul 2026 11:18:53 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wmpZt-000000005Ir-35ZC;
	Thu, 23 Jul 2026 11:18:53 +0200
Message-ID: <205332eed1af6a85a783952210e1640bc583b5a3.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Mark Brown <broonie@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad
	 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 23 Jul 2026 11:18:53 +0200
In-Reply-To: <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
	 <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-07-09 at 09:30 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
> table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
> struct with pwrrdy set, similar to RZ/G3S.
>=20
> The RZ/G3L SoC has 2 OTG controllers compared to one on RZ/G3S, so it
> uses a separate rzg3l-vbus-regulator driver to handle the additional
> VBUSEN control for port 2. The regulator_driver_name field is used as
> the platform device name passed to platform_device_alloc(), and must
> exactly match the name the corresponding regulator driver registers
> via its id_table for platform bus matching to succeed.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated the commit description.
>  * Migrated to id_table match using driver_name and reduced the length
>    < 24.
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 84e745e49240..0803195080bd 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -42,6 +42,7 @@ struct rzg2l_usbphy_ctrl_priv {
>  };
> =20
>  struct rzg2l_usbphy_ctrl_info {
> +	const char *regulator_driver_name;

After patch 4, this will not be driver.name anymore.
Maybe call this regulator_name or regulator_device_name?

>  	bool pwrrdy;
>  };
> =20
> @@ -110,15 +111,24 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usb=
phy_ctrl_priv *priv)
>  	spin_unlock_irqrestore(&priv->lock, flags);
>  }
> =20
> -static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {};
> +static const struct rzg2l_usbphy_ctrl_info rzg2l_info =3D {
> +	.regulator_driver_name =3D "rzg2l-vbus-regulator",
> +};
> =20
>  static const struct rzg2l_usbphy_ctrl_info rzg3s_info =3D {
> +	.regulator_driver_name =3D "rzg2l-vbus-regulator",
> +	.pwrrdy =3D true,
> +};
> +
> +static const struct rzg2l_usbphy_ctrl_info rzg3l_info =3D {
> +	.regulator_driver_name =3D "rzg3l-vbus-regulator",
>  	.pwrrdy =3D true,
>  };
> =20
>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
>  	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl", .data =3D &rzg2l_info },
>  	{ .compatible =3D "renesas,r9a08g045-usbphy-ctrl", .data =3D &rzg3s_inf=
o },
> +	{ .compatible =3D "renesas,r9a08g046-usbphy-ctrl", .data =3D &rzg3l_inf=
o },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
> @@ -245,7 +255,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_de=
vice *pdev)
>  	if (error)
>  		goto err_pm_runtime_put;
> =20
> -	vdev =3D platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
> +	vdev =3D platform_device_alloc(info->regulator_driver_name, pdev->id);

Switching from "rzg2l-usb-vbus-regulator" to "rzg2l-vbus-regulator"
breaks bisectability. Any reason not to just use "rzg2l-usb-vbus-
regulator" and "rzg3l-usb-vbus-regulator"?

regards
Philipp
