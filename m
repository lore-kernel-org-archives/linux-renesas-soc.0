Return-Path: <SRS0=toeV=YO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D39CA9EAF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Oct 2019 12:21:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24121205C9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Oct 2019 12:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJUMVN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Oct 2019 08:21:13 -0400
Received: from sauhun.de ([88.99.104.3]:46614 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727344AbfJUMVN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 08:21:13 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id 85EDB2C0076;
        Mon, 21 Oct 2019 14:21:11 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:21:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: rcar: Add r8a774b1 support
Message-ID: <20191021122111.GF1145@ninjato>
References: <1570175998-50891-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline
In-Reply-To: <1570175998-50891-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 08:59:58AM +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) I2C compatibility with the relevant driver
> dt-bindings.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2torcACgkQFA3kzBSg
KbZm6g//aWpMiQeOcoTJFyhxFSm7dmYxrrj9RQ8vMwAhkIAtu6JRSxvWOVDe6e27
v3oO2DvSW+3FfqD736mz7weiteRwjsJBm4RR0y2fiWO1fcd3U5QlxOfBtFfeLP9t
8KcNKtjkcJrS0TwSdFQRDVR3+u9rpRYDEOBg66QDJaQyK/tTOUMyguurQT2X9PcV
9YwG+295JxneGKI8s21MlexM4qAMZY8+I2qw+OpdxSzzEaDZYRNl4M/7GStVyQ1V
iy6RJkiQtgkhVGqXPEecTs5O+YOTJsXvJ51IqdTTytj5EQtzfNoioqRmdXL7UrjV
06v6us23tmSK7lPTm++HEP8fDSwk4wJcoAXiOKa/pWA/qtI5RovUbZl5VFRv02lx
ibmK4Afo0ZXMdc/5hBMcJOmMT050LKMQELnTJgloZncY2xCy3unW3By57Eymc8o6
b4nLldWyZ+gx4Jtmw8QoU85Lm/29FLMaQL6Ek+uOaImXHTXAN46v2NJEVPOiW9VN
B/gc/P5haSfKBwXFhXTdUcLg2YeIzTRSRq70nuToPZ1XQtPTGezL5DesOJiLCRf2
ell6Nu/1SXg0irMkOCbuSG4Nj+U7UiT0LRSkQUf+YCRI38Lulbqh8w+elkw7q9K5
jfvQJGz1fjCKduTMV74JXFT60qC+2g0uR8KfpPsSDDnlJ1vQfFg=
=Cpno
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
