Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36070 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752671AbdGFFmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 01:42:36 -0400
Date: Thu, 6 Jul 2017 07:42:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pwm: Add R-Car M3-W device tree bindings
Message-ID: <20170706054232.GA16144@ulmo.fritz.box>
References: <1494576582-17881-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <1494576582-17881-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2017 at 10:09:42AM +0200, Simon Horman wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>=20
> Add device tree bindings for the PWM controller found on R-Car M3-W SoCs.
>=20
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
> v4
> * Broke out of lager patchset on which it appears to have no dependencies
> * Added Reviewed by tags=20
> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlldzcMACgkQ3SOs138+
s6EoAg/+O6gw/s7zz86RKzDQh5IOESiSogQMM5yGkMfvjYcUxqxy2LGJtQJc6mgB
3ljrht2k1WNTltThAeAzVsTi2JCTLU7sOk67Ax/C0JGeI761hY6myCOhc7zl7gxZ
549MiljdJqabzGE2KRfUDySHC0/m4QdWg0OE+hWKCThKUJAOoL3xMNN4eLPKy6sP
vGdgCBf8ydKU1aSOqYqNyPIgMqlSHROLE2x5lVuyJnshtKQC9uuSZ5rRHh8CuRvU
ineO3jULbv4f5qJqblwvmnoAnb3zfoER6dWkLpdeBeB8vrIvL6nHkUtCkZFj6tt8
AzXIw+7f4PfPEG75PhVZPLJrv2Op7UpVSD996Q5fLZi7Gfl+/o4SKWRJeSSFKCSz
ZCvQ1ROYsrTRV7/LGnazRC+WnJAJYSsGFQ0j0Etfv5PjqO4QIg9Ddvz6u+6+NEkT
PsmB7G+gxCE70RtDDwpjd8u3UTPtmpfoeafVEIYZ8YX4HV9oXWttWCvfYDCegJfE
Cteq0kVj5GJAO274JLllsPgnak4EBdjwb77mLb6//sVZW+QIaeRaX7msfrUnzJcH
0VCiZx8azjK+84IjW7ZQrFYxNJuIrrQmzwx6SFOb4xlqU8vON9YVfHvO9RYGhaag
QzrQPbiRlOoQIjpVEEKmRAzxYjDfgnUTtf0XcgESH+5MsERaxEM=
=HGfn
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
