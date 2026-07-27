Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EF62809;
	Mon, 27 Jul 2026 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139075; cv=none; b=mhEVB9G59a1fsZGBRBAMYJ6SvqOcKshXason5l1taOOMLG4kMNJCa5s4t5ddRw9npdhJSi+BncvSdVAZHwHpl63STDpyM8m0jXz89HxYD2RiquEer2MRM78Sgju4Gchb3AYGRL/Cgb7uucR39dLlcB4LIDE3v49nvRpQYSRfBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139075; c=relaxed/simple;
	bh=mIQZmhhA5DAPEtUxkQJ7KKd+ARv4l6curHbz29kQcao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0mnfCPqxb0HeS6eq29+mHHMC5I5ZREr2nx0Os/Ay6eeWfle5O+sv+K06LDZTtTqqJj5w7yqXS8GuB5wmSJg/KTmelEtXTOWSife4DPnXrcjFd/GWcm1rDixBwoKD5yJ5pJWdOZ4+rJComN4VgHyjyVsmfj9+NGBjDMQUGhU9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6851B202057;
	Mon, 27 Jul 2026 09:57:50 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woGDe-001VOh-12;
	Mon, 27 Jul 2026 09:57:50 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woGDe-000000007ge-10xb;
	Mon, 27 Jul 2026 09:57:50 +0200
Message-ID: <4f8564aad166a3e64dab2caa550938b6c5ec8038.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org, Prabhakar
 Mahadev Lad	 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 27 Jul 2026 09:57:50 +0200
In-Reply-To: <20260725123433.162348-2-biju.das.jz@bp.renesas.com>
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
	 <20260725123433.162348-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sa, 2026-07-25 at 13:34 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that is controlled
> through a power sequencer rather than directly by the SYSC driver.
>=20
> Add a pwrrdy_pwrseq flag to struct rz_sysc_soc_id_init_data to mark
> SoCs with this property, and set it for RZ/G3L. When set,
> rz_sysc_probe() registers a "pwrseq-pwrrdy" auxiliary device so a
> dedicated driver can handle the PWRRDY sequencing, with automatic
> teardown via devm_add_action_or_reset().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/soc/renesas/r9a08g046-sysc.c |  1 +
>  drivers/soc/renesas/rz-sysc.c        | 40 ++++++++++++++++++++++++++++
>  drivers/soc/renesas/rz-sysc.h        |  2 ++
>  3 files changed, 43 insertions(+)
>=20
> diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r=
9a08g046-sysc.c
> index 90db9d383539..cd129c727461 100644
> --- a/drivers/soc/renesas/r9a08g046-sysc.c
> +++ b/drivers/soc/renesas/r9a08g046-sysc.c
> @@ -76,6 +76,7 @@ static const struct rz_sysc_soc_id_init_data rzg3l_sysc=
_soc_id_init_data __initc
>  	.devid_offset =3D 0xa04,
>  	.revision_mask =3D GENMASK(31, 28),
>  	.specific_id_mask =3D GENMASK(27, 0),
> +	.pwrrdy_pwrseq =3D true,
>  };
> =20
>  const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst =3D {
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.=
c
> index 161e8c38eea6..ea49ca51e740 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
> =20
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/io.h>
> @@ -84,6 +85,41 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, cons=
t struct of_device_id *mat
>  	return 0;
>  }
> =20
> +static void rz_sysc_pwrrdy_pwrseq_unregister_adev(void *adev)
> +{
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int rz_sysc_pwrrdy_pwrseq_init(struct device *dev, const struct r=
z_sysc_init_data *data)
> +{
> +	const struct rz_sysc_soc_id_init_data *soc_data =3D data->soc_id_init_d=
ata;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	if (!soc_data->pwrrdy_pwrseq)
> +		return 0;
> +
> +	adev =3D devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);

The lifetime of this allocation should be tied to adev->dev, not its
parent. Can't you just use devm_auxiliary_device_create() though?

> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D "pwrseq-pwrrdy";
> +	adev->dev.parent =3D dev;
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, rz_sysc_pwrrdy_pwrseq_unregister_a=
dev, adev);
> +}

regards
Philipp
