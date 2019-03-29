Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B04C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 10:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54EAB20643
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 10:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfC2KGS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 06:06:18 -0400
Received: from sauhun.de ([88.99.104.3]:53168 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbfC2KGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 06:06:17 -0400
Received: from localhost (p5486CEF3.dip0.t-ipconnect.de [84.134.206.243])
        by pokefinder.org (Postfix) with ESMTPSA id 1961B2C2817;
        Fri, 29 Mar 2019 11:06:15 +0100 (CET)
Date:   Fri, 29 Mar 2019 11:06:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Fix HSCIF RX sampling point adjustment
Message-ID: <20190329100614.GA1634@kunai>
References: <20190329091026.18958-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20190329091026.18958-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 10:10:26AM +0100, Geert Uytterhoeven wrote:
> The calculation of the sampling point has min() and max() exchanged.
> Fix this by using the clamp() helper instead.
>=20
> Fixes: 63ba1e00f178a448 ("serial: sh-sci: Support for HSCIF RX sampling p=
oint adjustment")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyd7hIACgkQFA3kzBSg
Kbb+VQ//Vh5dIIDPdIzV4vQD9dvzHHDGZ+SmLODA3OjB3qpF3hpmq8jL5qgFjmSq
69WvwVtCABaZdk6W4Wm5S6jHFtCs51T1VHvUFFuF4uO05bkavhi8vHnGmB/q4eCN
ILrYI6s+CB+jKNwTUK7tuvbpRpeb1NaA9/cQLMsiQGYJQQfBfUeBQRR+T1WfG333
EOVLPlhpC8okrwSn+KDjeEn1QF74q4JdKsH7DO1qiz2ntpS+BnlBoE+MLjbtGxTv
QDsDpLf1hBwwzVI2i84IlVa+UrGwh0Jn7rzt9knxQjegAYi2e2mw71b96wHiiE6S
6wKCnlS4pvvWwKqviWC+Bm/HtdLaQQfngoBK4oFSScGdk1XmlU0M/c+gRy0voY9o
KcCoE2SS/349E3twdSRrclXSfycQU2GaE4pme280bMVwn6ys/sTCSrGI5tY+IwA5
y93iD4MHYaamZS9Xu+I5oGSZVKVO6p6Lo8XAAuFFiGxK7QlkjLDHPEIK9RQoP/Qg
sKK8W82a3DOf1TjJ4YMuJRn9uMk7223/ex49jQE1ftkm8BHEjEVnPj0CsOsen26T
Ndm70SV4qiVPbWLnczuUrHIvAHDYpZxMU/8jFzwERsUJLHPuYDPcvrXpfsI9XOJf
ot5R1MIlR6UhYQLvaItjsVaXRZ4su1hZc371I/2J0YPhi8g1clc=
=yzWy
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
