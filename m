Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E78C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:13:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 907D6218B0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfDWVN3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 17:13:29 -0400
Received: from sauhun.de ([88.99.104.3]:56278 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfDWVN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 17:13:29 -0400
Received: from localhost (p5486CDD9.dip0.t-ipconnect.de [84.134.205.217])
        by pokefinder.org (Postfix) with ESMTPSA id 833512C7BF4;
        Tue, 23 Apr 2019 23:13:26 +0200 (CEST)
Date:   Tue, 23 Apr 2019 23:13:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools 1/2] tools: i2ctransfer: consequently document
 -a
Message-ID: <20190423211326.GA5659@kunai>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
 <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 11:33:34PM +0100, Wolfram Sang wrote:
> The text describing the address to be used did not reflect the recent
> change where some of the functionality of '-f' has been seperated into
> '-a'.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly/f/EACgkQFA3kzBSg
KbbeEg/8CPj6/kGjf+HnDzU8GJ4Xxg7rVRRNqQAKE7yE2durP79bbzTTfi0xVLwz
MlzhgMqWZWcUEYXAYsO7cea0S/cFpFG20XKy3RKhi2SZJQ2ZB3AvhdzDVxVRn/Na
dTM/UbBUrtzNrcK1OaiYCswl/t5DL8raGDjfjtaxLHWZ2z0q3Mfj3x2Eat5KYzSn
pVsGL/1RaA3cqtaEWaIwPjpfo/Rmp0vNbNYqsRIXwzieY8+OSKk67YBCkRo35IbY
SxVK+FXyR8t5FxYf/zsM8D5hq0JjwyUhIjXmyjDV+oGbAIOUqkka+C0VdRzTG9q+
WosrZk1Wmb9gU5H1unTpfin1ARD5PsQLH0Fm9JIAorNzAYG42PbygURp4DJxeYnU
O8nLd6zq4N+/k+u1nNl9hLrzIW7r4EknfQHwOG/0sBpNpK6p8+Q/SWUAHgEnCZGd
FcXDmL8CylE82//l9tWiK/g4QAblrceh8g4iyFfeLcMyf8NWJRd7jJRh6bXdHnpP
s4Xy6G5Tsj2uIEa8peBBmtnF9BRI9dfwtEn2koPp3ZgC0fuh3o2JYX5jFFtQWWrw
t0DWwtTnXJO0S530GkI2S+02LdXHR2tKA1kfs2WDhEtPHGi//qy6J+EODIZtQFuP
YiDLCaR1uVgIXmvpSRdB81MdfH30BVnxCRUUkDGx5kBIjU14G4M=
=HCvV
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
