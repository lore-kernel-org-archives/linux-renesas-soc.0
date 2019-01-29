Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CA8C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 914EF214DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbfA2ICA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 03:02:00 -0500
Received: from sauhun.de ([88.99.104.3]:53808 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfA2ICA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 03:02:00 -0500
Received: from localhost (unknown [87.140.57.181])
        by pokefinder.org (Postfix) with ESMTPSA id 295053E422B;
        Tue, 29 Jan 2019 09:01:57 +0100 (CET)
Date:   Tue, 29 Jan 2019 09:01:56 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     marek.vasut@gmail.com
Cc:     linux-mmc@vger.kernel.org,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix card initialization failure in
 high speed mode
Message-ID: <20190129080156.GB911@kunai>
References: <20190129054039.15278-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <20190129054039.15278-1-marek.vasut@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2019 at 06:40:39AM +0100, marek.vasut@gmail.com wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> This fixes card initialization failure in high speed mode.
>=20
> If U-Boot uses SDR or HS200/400 mode before starting Linux and Linux
> DT does not enable SDR/HS200/HS400 mode, card initialization fails in
> high speed mode.
>=20
> It is necessary to initialize SCC registers during card initialization
> phase. HW reset function is registered only for a port with either of
> SDR/HS200/HS400 properties in device tree. If SDR/HS200/HS400 properties
> are not present in device tree, SCC registers will not be reset. In SoC
> that support SCC registers, HW reset function should be registered
> regardless of the configuration of device tree.
>=20
> Reproduction procedure:
> - Use U-Boot that support MMC HS200/400 mode.
> - Delete HS200/HS400 properties in device tree.
>   (Delete mmc-hs200-1_8v and mmc-hs400-1_8v)
> - MMC port works high speed mode and all commands fail.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-mmc@vger.kernel.org

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxQCHQACgkQFA3kzBSg
KbYEmhAAmUsG9V2LRfy/9Zu5KRe4n4CkwfNhgvItF2TkBBFY4aqK2EuL6WQoTK9V
5uhBpyF+OwoUDrw5JBoVq/Q8LzXuUg4d/ie1POLWoaXqjz0nI03Jo0lwRy4/5VUL
AD9NRW3fyrBtWsfNbaAriqsyf+3bPrG4HN6d2fQGq+wAX5tOV4jbObCeGGck5oE8
JqEHi/gCozdQ8yy1hFNwsx5AHTN0RUtauBbG9P+rZVtrVxUauV+Wye3yOkRZMXIu
v7B1Z/hb6/9GCpn2+q/WIVmVVQGAS2A0eyc5AYzcxFm6ITLV4E2HX6aMic45Rlzt
3vZ0+pighLNGEV5yELuBuVOp5bei/x/+AqScVt2wwmgsj68wFCaSqfSA0gVKTWLP
IbiGJcOw9axOc0VmNILf5WsYGo+SgyCPJdbP78Hee9xg3rWYkfgh4lJzYAeZGEzE
rSQm1lgDhreWtZLPq1GI8Exucp/ukEPMNgwJ5LvVxzCSvSI0TQeNiX8uIE3tU81X
LGHNJYZFmZ/FRu2VhSgineCwmDMfZT2KP/j0AlOMFGGHbA06TOKoUMc3+oCfjcwh
UDjSgd+LOKeVMxJxQQygdORF5syADoiW5G6rtJwvT4VomlgaTUV4Tt0LmXUpgTWK
afnFVyFRrrm97fiavGaQf8/vCjO1+qsvIYcmMyqIxclNjqFL9sQ=
=LQO6
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
