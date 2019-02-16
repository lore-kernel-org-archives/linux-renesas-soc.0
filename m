Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DBEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A678222E6
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfBPOrp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 09:47:45 -0500
Received: from sauhun.de ([88.99.104.3]:43464 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbfBPOrp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 09:47:45 -0500
Received: from localhost (unknown [195.52.228.164])
        by pokefinder.org (Postfix) with ESMTPSA id A8F6B2C0509;
        Sat, 16 Feb 2019 15:47:42 +0100 (CET)
Date:   Sat, 16 Feb 2019 15:47:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190216144742.rvitloqjzf7towgy@ninjato>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190216140432.u3gw33vvqe4njrgn@ninjato>
 <837a9193-3024-23bf-c6a3-304904d3dba1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ecl7tv6k64vqgve2"
Content-Disposition: inline
In-Reply-To: <837a9193-3024-23bf-c6a3-304904d3dba1@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ecl7tv6k64vqgve2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2019 at 03:06:55PM +0100, Marek Vasut wrote:
> On 2/16/19 3:04 PM, Wolfram Sang wrote:
> >=20
> >> +	    !strcmp(propname, "enable-gpio") &&
> >=20
> > I haven't looked at the actual issue, but one minor nit I usually have:
> >=20
> > I think 'strcmp() =3D=3D 0' is easier to read since the above is too ea=
sy to
> > be mistaken as "if not equal". I have just been bitten again by this
> > after a long day, although I should know better... :/
>=20
> Note that I just followed the coding style in the rest of the function,
> if we want to update the coding style the gpiolib, that's for separate
> patch.

Fair enough.


--ecl7tv6k64vqgve2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxoIooACgkQFA3kzBSg
KbZIHQ/+LRNDpD3buP9wn1M8eXC4WZP+P6JJQ/zdsV/hK7+Vzz2YMplVRjQQI8oL
vO0/7KrvNwGEzAcGsPSqSKgqkndieMLJPZ/Vue9lvMO0t2gtNnekYWYaLrIVrWLg
a4YVrxBu/PqycdegnQ/J5WN8LUOcL2TWx7J4JjSVZZemwflylZqdWly6IMwiMvLC
e/IY81NqMs/KpiO82FBKjjuEJpUx9oF2RfZvso75PTI8bnzJz6c6Au72LjpTTJUP
0/tsAW3UZtINSeQ6dGeBkXWbSl8yF3w/GnL3nQ9IansuZGvyERPR2aGxn4uH8sA/
oQZPIT3AeeeA6EOjDWsPHgCWtBYRi5HKBtKMiReLyuyWQkArVcNmsprXy1MlLUYp
OELhzF5h9V+KxfOJV354TvhrH1cFo2QlUgm0tQjcB5iVk5GlKeE05YZhCEBOAVAs
6Vcl6sCKByCO9jz7Hk717+GadCCRIH7DGO2PHtZ3HBKh5lIvZPRgZdHqY1Ef8E6v
nZRQaT8xDZQfjB2YCYQ2bMByIZPMNMLqd8FshXqI8OMxq5ZB0BRzXI9SuNFRFWLG
m1jDYJAi2Bin+i1II+KBj9oh5U8047fU04EWZFrfXyTGIRaC7tIg9l+ZzZADj/fW
9d+d6NBHyy/skDG9qhpt4AfLUQX879zwPhxgrmP68ljUXxa+u14=
=3sy9
-----END PGP SIGNATURE-----

--ecl7tv6k64vqgve2--
