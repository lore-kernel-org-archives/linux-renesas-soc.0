Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D4BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 08:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 069EC20880
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 08:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfBUItu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 03:49:50 -0500
Received: from sauhun.de ([88.99.104.3]:35140 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbfBUItu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 03:49:50 -0500
Received: from localhost (p54B336C3.dip0.t-ipconnect.de [84.179.54.195])
        by pokefinder.org (Postfix) with ESMTPSA id C94E52C088A;
        Thu, 21 Feb 2019 09:49:48 +0100 (CET)
Date:   Thu, 21 Feb 2019 09:49:45 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Register hwmon sysfs
 interface
Message-ID: <20190221084945.ruyyshoiy5klbpzy@katana>
References: <20190211195620.32753-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4tgzx7phtb5be47x"
Content-Disposition: inline
In-Reply-To: <20190211195620.32753-1-marek.vasut@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--4tgzx7phtb5be47x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +static void rcar_gen3_hwmon_action(void *data)
> +{
> +	struct thermal_zone_device *zone =3D data;
> +
> +	thermal_remove_hwmon_sysfs(zone);
> +}
> +
>  static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  {
>  	struct rcar_gen3_thermal_priv *priv;
> @@ -429,6 +437,17 @@ static int rcar_gen3_thermal_probe(struct platform_d=
evice *pdev)
>  		if (ret < 0)
>  			goto error_unregister;
> =20
> +		tsc->zone->tzp->no_hwmon =3D false;
> +		ret =3D thermal_add_hwmon_sysfs(tsc->zone);
> +		if (ret)
> +			goto error_unregister;
> +
> +		ret =3D devm_add_action(dev, rcar_gen3_hwmon_action, zone);
> +		if (ret) {
> +			rcar_gen3_hwmon_action(zone);
> +			goto error_unregister;
> +		}
> +
>  		dev_info(dev, "TSC%d: Loaded %d trip points\n", i, ret);
>  	}

This slipped through the cracks for me, I am sorry about that. I know it
is applied by now but I still wonder if the above functionality couldn't
be moved into the core as a generic helper? There is nothing R-Car
specific in here. From what I see it could be something like:

	devm_thermal_activate_hwmon_sysfs(dev, zone);

?


--4tgzx7phtb5be47x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxuZiQACgkQFA3kzBSg
KbYM5w/8DyPRXWlwFJS3C4AO2N6907+O3UH57vuz6oalPDJ4Z7tDYXoi7lUsoI41
TtmAYKAJNQVCukA7aIbiHXpKqrTer4JsqsT+9Ls2rgmSBZGx3ZspHMchKk/7rD2C
6OZaOBymg/MFEWs/fXcoWuStTg3IAcd9jkX489DuvEpYykxjYgK39b0hbJ+sRDzt
e0SsnXEkIPKqInmm8AI3g9yZG3i6puAnvcGHtrAbXEH11wHu6vyLfN2DqFhRBKJs
PUb0ZGlZAtr/QUJ8cQw6TGHtIO5aT57ehAogOevWQMRw7yoC+X0Ea95re9aGdlyF
xGN9ESi/G9zuTAVBqOizi3pN/kE24266XdlenfcAkHjhksMRoqYTJUXBBE1oGxyN
xb3yqvYJKO34DveTHG5XEGQlKkG8Bc7A9yHdyzE1XjmDEAExYvoI+VPZrQDFag4I
5OWi2+1xgsBM7yktmXbqBwcZj0xY+riHXukJ8Aeei89ZBZXmDieTDwFFt8mYdhTQ
hL7a1NGc0nALFeO+x0OvAssOO7Pj/Do+OkeaCEJGnx9xO8hz+GbRx9OtbjzQ3JvK
7xHc9LRQF3yVf5ZQOUMTjtyFs0leYlGF1tuuH+Rt8lRE6zO5PJM7ZOBRqQHe8j5G
Del6C96MFOSKZRWvsboUzanRdCSAMxr8b8nkpZ5j9ioN4nWSk+8=
=Fqjr
-----END PGP SIGNATURE-----

--4tgzx7phtb5be47x--
