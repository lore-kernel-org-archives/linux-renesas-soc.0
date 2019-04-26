Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B242CC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BAD4206E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfDZJhO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:37:14 -0400
Received: from sauhun.de ([88.99.104.3]:51152 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfDZJhN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:37:13 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 534E22C0114;
        Fri, 26 Apr 2019 11:37:12 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:37:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi_internal_dmac: use multiple
 segments if possible
Message-ID: <20190426093711.GC1031@kunai>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <1556255930-18188-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +static void
> +renesas_sdhi_internal_dmac_init_card(struct tmio_mmc_host *host,
> +				     struct mmc_card *card)
> +{
> +	if (host->pdev->dev.iommu_group &&
> +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> +		host->mmc->max_segs =3D 512;
> +	else
> +		host->mmc->max_segs =3D host->pdata->max_segs;
> +}
> +

Will this work with Gen2 as well if we explicitly set max_segs in
of_rcar_gen2_compatible (renesas_sdhi_sys_dmac.c)? Then we could simply
move the above chunk to renesas_sdhi_core.c and use this minimal diff.

--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -726,6 +726,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
=20
 	/* SDR speeds are only available on Gen2+ */
 	if (mmc_data->flags & TMIO_MMC_MIN_RCAR2) {
+		host->ops.init_card =3D renesas_sdhi_init_card;
+
 		/* card_busy caused issues on r8a73a4 (pre-Gen2) CD-less SDHI */
 		host->ops.card_busy =3D renesas_sdhi_card_busy;
 		host->ops.start_signal_voltage_switch =3D

What do you think, Shimoda-san? Otherwise, we probably need to keep the
init_card in the dma_ops struct and could do something like

+		host->ops.init_card =3D dma_ops->init_card;

?

Need to think about the latter a bit more, though.


--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzC0UcACgkQFA3kzBSg
KbY0qg/8DCmfDI86HFGWYjiAe0fZMqBKXJ24bh7lKqwT/icRuo18UkQF9mLEfQNB
WfigT6i/fZLRjfE+3ndF4C9KOqVM+7UDrbDsSpKPz9gpedtMWwDHWaNe/OIwMHPT
6H/uSGqxoohRg3DB8MJGaSJXpmQhZzTf7pk6iVMp6bBPHIgKbKDGUyAlxtPXXW6G
+Cohe2TN3IelSJ4juA8ZTci+LM0am/85pGInzifivPNiHDc12S+eeBdkyeUYUkQM
2J1obdP/L7NgIEnA6eD+D0PWL6hbBvFPGbW/bgNIGSYfLOvvvaYhxFsQiF5EoPk2
Nmf2zA+AiyADltpybcdNaxNOqpdB2dChRNH0Z21dXkDDoougqFz2R1PpBj90jsy9
xn+znvQmzW5Sg3fB5hELL8lcMlk/8Jnhjoqa0glC5R/HHkH8meE+OlMqHbW1nyyo
Ts8+WPEtkC4JsjKlti22h3sfXcUCVp8ks/sFYkpy2vxnmMIfXgXPyIl6wBqLbIuP
gzF0mBIFN+I8m/9D6TI4qgXzF1sTtz3NUQSTTMLH36KtGsUgdgLaAGsaHKeMX2um
fIeAgQcBYwvURDfSrh1dTHXXrCcIL4aNm20g83rULSkSaiVqqGzM4SI7v9h1amA2
pTxv/PmXFn5bSHkTvFaB08ksBbBOoyYkfcvI867q8pBFi46JInw=
=4Jmk
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
