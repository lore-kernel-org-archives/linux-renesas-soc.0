Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96E2C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87A9520833
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfDOLKH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 07:10:07 -0400
Received: from sauhun.de ([88.99.104.3]:40758 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbfDOLKG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 07:10:06 -0400
Received: from localhost (p54B331F8.dip0.t-ipconnect.de [84.179.49.248])
        by pokefinder.org (Postfix) with ESMTPSA id EBF4E2C0114;
        Mon, 15 Apr 2019 13:10:03 +0200 (CEST)
Date:   Mon, 15 Apr 2019 13:10:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver
 implementations
Message-ID: <20190415111003.6rryld6rfounopho@ninjato>
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qki6sfr4ixvgmelk"
Content-Disposition: inline
In-Reply-To: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qki6sfr4ixvgmelk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 12:22:40AM +0200, Niklas S=C3=B6derlund wrote:
> Both the Renesas and Uniphier implementations perform actions which
> affect runtime PM before calling into the core tmio_mmc_host_probe()
> which enabled runtime PM. Move pm_runtime_enable() from the core and
> tmio_mmc_host_probe() into each drivers probe() so it can be called
> before any clocks or other resources are switched on.
>=20
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---

Thanks for keeping at this. Setting up the APE6 board for further tests
was painful, I understood that.

Since you lost the cover-letter from the last series, I think it should
be mentioned that this fixes a clock imbalance problem (at least on
Gen3).

For the APE6 tests, we need to wait until Geert comes back. I surely
would like his input. And Yamada-san's, too, to make sure his platform
also benefits.

>  drivers/mmc/host/renesas_sdhi_core.c |  6 ++++++
>  drivers/mmc/host/tmio_mmc.c          |  5 +++++
>  drivers/mmc/host/tmio_mmc_core.c     | 11 +++++++++--
>  drivers/mmc/host/uniphier-sd.c       |  3 +++
>  4 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 5e9e36ed2107a01c..db73f9f1b186f0ff 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -770,6 +770,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	/* All SDHI have SDIO status bits which must be 1 */
>  	mmc_data->flags |=3D TMIO_MMC_SDIO_STATUS_SETBITS;
> =20
> +	pm_runtime_enable(&pdev->dev);
> +
>  	ret =3D renesas_sdhi_clk_enable(host);
>  	if (ret)
>  		goto efree;
> @@ -850,6 +852,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  efree:
>  	tmio_mmc_host_free(host);
> =20
> +	pm_runtime_disable(&pdev->dev);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_probe);
> @@ -861,6 +865,8 @@ int renesas_sdhi_remove(struct platform_device *pdev)
>  	tmio_mmc_host_remove(host);
>  	renesas_sdhi_clk_disable(host);
> =20
> +	pm_runtime_disable(&pdev->dev);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index 93e83ad25976e756..8539e10784b40961 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -172,6 +172,8 @@ static int tmio_mmc_probe(struct platform_device *pde=
v)
>  	host->mmc->f_max =3D pdata->hclk;
>  	host->mmc->f_min =3D pdata->hclk / 512;
> =20
> +	pm_runtime_enable(&pdev->dev);
> +
>  	ret =3D tmio_mmc_host_probe(host);
>  	if (ret)
>  		goto host_free;
> @@ -191,6 +193,7 @@ static int tmio_mmc_probe(struct platform_device *pde=
v)
>  	tmio_mmc_host_remove(host);
>  host_free:
>  	tmio_mmc_host_free(host);
> +	pm_runtime_disable(&pdev->dev);
>  cell_disable:
>  	if (cell->disable)
>  		cell->disable(pdev);
> @@ -207,6 +210,8 @@ static int tmio_mmc_remove(struct platform_device *pd=
ev)
>  	if (cell->disable)
>  		cell->disable(pdev);
> =20
> +	pm_runtime_disable(&pdev->dev);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 130b91cb0f8a3fd1..26c148d3c8a2e655 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1152,6 +1152,15 @@ void tmio_mmc_host_free(struct tmio_mmc_host *host)
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_free);
> =20
> +/**
> + * tmio_mmc_host_probe() - Common probe for all implementations
> + * @_host: Host to probe
> + *
> + * Perform tasks common to all implementations probe functions.
> + *
> + * The caller should have called pm_runtime_enable() prior to calling
> + * the common probe function.
> + */
>  int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  {
>  	struct platform_device *pdev =3D _host->pdev;
> @@ -1260,7 +1269,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>  	pm_runtime_use_autosuspend(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> =20
>  	ret =3D mmc_add_host(mmc);
>  	if (ret)
> @@ -1296,7 +1304,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *hos=
t)
> =20
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_sync(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
> =20
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-s=
d.c
> index 91a2be41edf6196b..49aad9a79c18d24a 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -631,6 +631,7 @@ static int uniphier_sd_probe(struct platform_device *=
pdev)
>  	host->clk_disable =3D uniphier_sd_clk_disable;
>  	host->set_clock =3D uniphier_sd_set_clock;
> =20
> +	pm_runtime_enable(&pdev->dev);
>  	ret =3D uniphier_sd_clk_enable(host);
>  	if (ret)
>  		goto free_host;
> @@ -652,6 +653,7 @@ static int uniphier_sd_probe(struct platform_device *=
pdev)
> =20
>  free_host:
>  	tmio_mmc_host_free(host);
> +	pm_runtime_disable(&pdev->dev);
> =20
>  	return ret;
>  }
> @@ -662,6 +664,7 @@ static int uniphier_sd_remove(struct platform_device =
*pdev)
> =20
>  	tmio_mmc_host_remove(host);
>  	uniphier_sd_clk_disable(host);
> +	pm_runtime_disable(&pdev->dev);
> =20
>  	return 0;
>  }
> --=20
> 2.21.0
>=20

--qki6sfr4ixvgmelk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly0ZosACgkQFA3kzBSg
Kba4iQ/+LAl9g6besQHD+ji/Gnj0ccWHIgqfnJSmwkHxP5N/34Qdw6Y1YyE/9QnQ
14VzK+mnVldxHIcu7XAneKWzG8zxliwVmDiNbGxBNRVou6+Sqc+QNwQFx9wQFfWR
W20cOqUuaDI4YTdiRKh9T5unTQvBmO2Wkhmqzcqfp102+dWXmmwrPRcG2e0sN6oP
N+QdGemJFciTehhjuucRbfezSdCwxye9KtgN2I6ZPYiBmREK9k/dblhw50U4pCYt
8B+l7qC5nGSoIVe0EXIhlJbcPELEYRkzfwrLhrLVf5Pti16R4dX741RB3pUOoxfK
ae5WYL7jKpfaPOHP7zlvxp4OXPzHVsQ+i2OwJrvzv1c0j570/2g64hGzG3EA9B6h
CVREwGgM6LCnMfQQyemq180+ObFeCqv8UxTE9RceLAGOsH+GltojOax/Fe9YTljH
XQvBMNn84CoYRoV2k2mOc7ZUGvXz5VZMiYC/7TSb5jT6HJl+/ENb2Ob21R5vxUxa
Sg/YoMU/sJyJGEz1qvIZF8eHsdfVDrVgdmm+++mB1qf0Bsaz6WFErdycgKRs2uWg
WiuLFFZP9DKBLWaq8jyzCHm7Idqa6oemd0Cow5T67mt6wBkHIS2VQAMahH7TCL8F
gRScKg06m468ytNXtEmXk8UfCb/9uI8K9jaNhnVSDFQXt8uveTc=
=haAH
-----END PGP SIGNATURE-----

--qki6sfr4ixvgmelk--
