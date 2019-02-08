Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B10C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:29:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45330218DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfBHV3w (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 16:29:52 -0500
Received: from sauhun.de ([88.99.104.3]:59820 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbfBHV3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 16:29:51 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id 3C7CB2C282F;
        Fri,  8 Feb 2019 22:29:50 +0100 (CET)
Date:   Fri, 8 Feb 2019 22:29:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: sh_mobile: sort compatible entries
Message-ID: <20190208212949.GC12451@kunai>
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
 <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2019 at 11:00:09PM +0100, Wolfram Sang wrote:
> Makes it easier to add new ones.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxd9M0ACgkQFA3kzBSg
Kbb7Mg/7BKbRxWMVqhwDl0BqzUxYC6lbj2/N9xIJm3LNKqYNT0qgCRejVXibctnt
z2xFZQnXe6Ngu9RD0NtsI+t8MetcR98eeoHo4IeFoWvmzqRtLLHkXnHXy65v5TRm
Tx6DXUtRxUFoho2vQGNWXr+SU0IbIFoZizoLA+/pY2HvNxgSUAVv1kbZ5l/If3Yp
n4OwrnwnJkFQA7Sxqbu+/DRsWeDDOZop6AjQoUyuMBbneAoCJ4IsdliqT1o+jqVm
Xsya3J1vHFvanIQWY8lI6oS6LV31RhepA2xWDlyahCliJ1hlRAzzGdcst+61zJ9l
o/4MTR53zkiY6s066JQvVYOGha4gmLu2PYdeK+N1CJ2YwFg3XYZ2TV+UFhXGLNqT
ThEQhNrmBWNRv81l6V66BqHUdtPGA8gsNaSjMvBP1xmF7WOrJ+Pmy6cYlRzDx0pm
mYNNJPoNznH+7UbI1+zq5q/O8KkAj4+ybcGtjGd1wf/7yXlLMk9LwRC2lcL2wONe
78FnPLYsLd226wxrLPDAyEI7lHbd+BJydD3waMci+tTDDjqBDoYnKxFR0OQR6328
YL43x/GVRfCD3rjKmwThJUN8Wis9s3cisyGVIgN8NCb7L9cvHI7RPss9MCl5bpdv
VmtMaqQntmUDBmboY6FpC6UnuZ4dtjzRO9cI6nOKgoNxOjS6Fhc=
=Bzgz
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
