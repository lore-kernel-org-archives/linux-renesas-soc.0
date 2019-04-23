Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C34C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7CCD218DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbfDWVNl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 17:13:41 -0400
Received: from sauhun.de ([88.99.104.3]:56290 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbfDWVNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 17:13:40 -0400
Received: from localhost (p5486CDD9.dip0.t-ipconnect.de [84.134.205.217])
        by pokefinder.org (Postfix) with ESMTPSA id 6B42E2C7BF4;
        Tue, 23 Apr 2019 23:13:38 +0200 (CEST)
Date:   Tue, 23 Apr 2019 23:13:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools 2/2] tools: restrict all addresses defined by
 the standard
Message-ID: <20190423211338.GB5659@kunai>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
 <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline
In-Reply-To: <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 11:33:35PM +0100, Wolfram Sang wrote:
> The I2C standard reserves addresses 0x03-0x07. Adapt our tools to that.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly/gAEACgkQFA3kzBSg
KbaRhg//SKE4688o+r30Norh+qE/eIfR4ZtHWUrlSkvL1JmzhSc0xsJEK5HvlrvC
9rjCmv5aQQNHBnZU9waTcvLyisBxsSoABvK+ReB0xFkzcXMjPau5fNFvR50E+yj5
6AYuMuzPKqmYV+0SoV/5y46njQlMHKTMXwFM3y+NNCGCnMk6lFB3F6RDbuB9E7Ta
aVyGkTE7VGwnlUg8uMVfAqiebZW7HPi0SBwU87sYvo2C/+k0iKf8tLIvbrsV7EJx
SuodUHwUE7LqnI6yVNvKyPHlTL0inVg9cciVU+/Ccnvm0ropCA5nD5Q2y6OUV6C3
mcGaRvTdIRrPnOFCuI5KvF74N95YtzyaM+Tmci/P7lY9LgVV8y6dyOfUFqOHZyMq
zJK+SMl05LX2FL2VaGoe3OHIDRJ6kzmS6hVZWqrB1CLua86vrlsYmtT1HyYjOJ6p
KHKz32tBs8AvbalnaFGb5DX2nr7fn6NSvQOjX4V0bjHG+OR0rXHQPSL2rL1WZvvB
B3QsY7wcJKs3sVHpiU7UCjRAK7XYG4IndDQT9IXQ5qse1d+G01b4X5wAvUngXku8
gww2VgYfsH+EWgEgNzbFTQ9V1xx7+YLS1/3czeeZgH+KkmVFjBLdtL5O+0KbvuKQ
VM1cU6los4QMkHVMKrO5IlKZD7n/svTPR8W4xl1GWDtTlBh47dU=
=ne08
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
