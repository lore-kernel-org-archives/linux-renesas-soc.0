Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6155C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 11:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2A1620684
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 11:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfCELCH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 06:02:07 -0500
Received: from sauhun.de ([88.99.104.3]:33396 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbfCELCH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 06:02:07 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id 3A4F82E3551;
        Tue,  5 Mar 2019 12:02:05 +0100 (CET)
Date:   Tue, 5 Mar 2019 12:02:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT] thermal: rcar_thermal: update calculation formula
 for E3
Message-ID: <20190305110204.GA2247@kunai>
References: <1551127558-28916-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <1551127558-28916-1-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 05:45:58AM +0900, Yoshihiro Kaneko wrote:
> HW manual changes temperature calculation formula for E3:
> - When CTEMP is less than 24
>    T =3D CTEMP[5:0] * 5.5 - 72
> - When CTEMP is equal to/greater than 24
>    T =3D CTEMP[5:0] * 5 - 60
>=20
> This was inspired by a patch in the BSP by Van Do <van.do.xw@renesas.com>
>=20
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx+VygACgkQFA3kzBSg
KbYKIw/7BZc3PmuYcZdkFEyBY72S2Tu9+QPVFNjdo1thg0HAvHXr54tRS3Jnnut+
dBpkTGDX7Q6EdvwihaMo0LO6IL5wfXuRuDKkk88nn9XuQAkC5stcnL6Va3z67F8v
NhqirF/ZFU97itbGVkt7m+727yeRQYl6YRD8gqzEGcZuaSp6qv8UPr+3c7TAccg8
B9jBTOci99K4lJP7X8x7jQOfBebtcahzVcChJ2jSJ/nIBGcAl9diwk9J7H8kHieb
hWybDbRy4eowZ3OUpAkzdTvD8JUl37V2asEDp4elr6MiZmt7lY4VvwTJV8QZ4ijL
oLLKx87s91dsFQNmQDCdjRhQdevBR7dyHmanKeM3CvYMuWmXMBAPtjoq1XgMAyLO
kGYUba5A8ktg1+oKXrGLuuhPl5rlvzeHqcULYmuX/Hc7w+QrexzBeF9VlY2Z54or
IC97HumE+3tNwD2CeBG766UbUC29a7lJ0GlwC+QhIh6HjXxSNXDf7OQnitvsgaFl
66T73U0lBMnb4tS2W6Ggv44uB/PwgnmnYUdywF+uxtV8U2ubrdbK7McedCdHdO3B
WjpGVdiW2P/BIWZ/NroeRZk2kuj7GFfJYhk7X0Fk8AmpcKyM1TAh+7T4wxQOfMw+
u6b3cF4BX1ak40AVkwtAZ9JtLVDa03SJ8W6N1D6nxCde/xngfAQ=
=kbqn
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
