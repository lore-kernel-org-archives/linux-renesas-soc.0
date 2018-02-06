Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36858 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752528AbeBFIyY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 03:54:24 -0500
Date: Tue, 6 Feb 2018 09:54:22 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: change comparison to bitshift when
 dealing with a mask
Message-ID: <20180206085422.qokhonesh6oqtaof@ninjato>
References: <20180206085040.3018-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pouaakhr7brj4bh2"
Content-Disposition: inline
In-Reply-To: <20180206085040.3018-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--pouaakhr7brj4bh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2018 at 09:50:40AM +0100, Wolfram Sang wrote:
> Due to a typo, the mask was destroyed by a comparison instead of a bit
> shift.
>=20
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Only build tested.

Add. note: according to 'git grep', this macro is unused currently, so
no regression.


--pouaakhr7brj4bh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlp5bT4ACgkQFA3kzBSg
KbZ7KA//QLqcAARl4SwJ6us+/7ONAlbxEUypFJIWc/z2VymBZCEqSGV+xk+OSZon
sRemx6vsRSLrGCQ3++Vx9T/aajE8m5kIqm+2oDYNuYr2CyteLE60yL1g3VvWvQE2
OtvyWHimxaYDriWv4AH+XGUPBXzvtzwRBa6ih+4e9EoCVNzKsuXdxWf+N7yOEQSs
mRl9htiOpxASYkdJ9q8fywn48oPjKjy6j0fTN88dsXpk0C/7E5YlsGyrHnVT2EtB
IYPEIwGNeOqX6zfZUDImH8thGMYVPxw94pXrG53/5i1gH6kEP7K5PtIRt7lqGtjD
zV8toebfyCwlxvTfNS+EmnNUq9wy7V6O5/n2unNT02IQBj8sPs/7TKATG5QrD5yB
ODiruPrbu5KCiEL8Us6r9SW573DIAq1ZqoHSPfgnc5XjBnZb7dFpJMwggjle/6rm
CKysNcxa3L9osq6B+jMz6sUiIMdm687jTTLm/B2DHmiu2fd8ANH2EG254mGNB28H
Wd/y4z+9iEyP24MtjLQMJascT5bagmyzZ3ZQCjWASWTndptjfEMWEvDQ091mWZyw
sNcUnJzp5l6GGqmfLwY9lShHJziZBjsV9lvWbhL8EY8n8k9AQ7iP1KsrGEIaqvWa
m5kt1RPKpJvPiHn5qclnPOprnPOu9Cn115B6bWovUyqI8A3w0mk=
=Ik6a
-----END PGP SIGNATURE-----

--pouaakhr7brj4bh2--
