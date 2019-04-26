Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A48EC43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3C6020679
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfDZJ4D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:56:03 -0400
Received: from sauhun.de ([88.99.104.3]:51316 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfDZJ4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:56:03 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 2066D2C0114;
        Fri, 26 Apr 2019 11:56:01 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:56:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] mmc: tmio: add init_card ops
Message-ID: <20190426095600.GE1031@kunai>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190426094500.66fg3treuml6v47u@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <20190426094500.66fg3treuml6v47u@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 11:45:01AM +0200, Simon Horman wrote:
> On Fri, Apr 26, 2019 at 02:18:48PM +0900, Yoshihiro Shimoda wrote:
> > Since renesas_sdhi_internal_dmac driver would like to use
> > the init_card() ops in the future, this patch adds init_card ops
> > into the struct tmio_mmc_host and struct tmio_mmc_dma_ops.
> >=20
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Don't you think this not needed anymore in context with all the
refactoring around 2aaa3c5193db ("mmc: tmio, renesas_sdhi: set
mmc_host_ops hooks directly")?


--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzC1bAACgkQFA3kzBSg
KbbeuQ/9H69WmEWVTWygSKkVmI/ij/EAIFXid3ccbNSWj7Z2U66xgx5yDTQSr9Fl
NwL43RYXyQydGuq9UUGXmuqGt+LAivVifpZYMHla9xFpW86pHBBVtPK2jWy00YJ9
NTfr1y9JCxC5CWKDLZP6wrzTlHK4e2AEix4g7tVoeBJWGy3ZuxUSoUEl7Nqc7giT
TVaR36Q78b7h0BaALxcrc+spNA9A0xQysN3mALMKWdhh18Zw+xRG9sgpKa7G3BWm
niA31nSI1ErnITAa0s8QHPLSgIfG5yhBJP4INWebPpl71Er1Rzz/hMqm8Wh7SiqR
FEG/CHJrY1EvihTjNMoNrhr7a40BpAWLGRb3u2bbIj0xI5yujz+fVTJiqZiT6cBq
LEDPQbZVqe+2pRRUiicbHKMYcC++fqRghz3jJhEW9uCDilzgoouZ8x6cvNn9a+G+
9mjqcGrTmNV9/GALzJHU1m7uxiRbE4ro6NwRUaJ/NHSw+f4WhjPO/Sigz85YwSPc
CpfheRICdo/0WbsX/dWKbsMWbqbxygW+jlzvOkaoPzDsufv0UTlZuv62NQlFb9D6
O/+6c4WYa+7dQPbfE3phWHgGZO9hxWn6E1Oolj0G51MxYPTbiefCvwzIhY22xJLm
CazLmU+mOAXp+e502RoTeQkxgtFQHVa6c1APM9uI70J4Qis6O48=
=tkBx
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
