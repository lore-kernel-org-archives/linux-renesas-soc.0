Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48194 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752153AbeDSUJP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 16:09:15 -0400
Date: Thu, 19 Apr 2018 22:09:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77980 to
 whitelist
Message-ID: <20180419200907.udbe3v744a4tvu6c@ninjato>
References: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="clbx7ueqygkqgwin"
Content-Disposition: inline
In-Reply-To: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--clbx7ueqygkqgwin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 19, 2018 at 11:07:44PM +0300, Sergei Shtylyov wrote:
> I've successfully tested eMMC on R8A77980/Condor. R8A77980 has a single
> SDHI core anyway, so can't be a subject of the known RX DMA errata...

Lucky you ;)

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--clbx7ueqygkqgwin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrY92MACgkQFA3kzBSg
KbaIcBAAkjGV7P7hgKOd5nHLwBsQOxCJjUKYPMCBmQv9fdpe72G4C5gFb088ErYE
fqKidrVMFBAkQwIve3QDvEKftW4KtP+vESrX8XwcJeuSZ8+Kl9jHEMGbnyegXBoD
2e10RkGErCjEqF4oUn3Sg2ySGT5RQ/8FuK1d0uK6VFXnISnfR9Qj19QVooH3FCy2
sPE94q8ZXQY/S5T8nmLWl1GdjwuUnY0TSM4gVTtOQgXEQokjTj/sMADqsBDqPSSK
7Ua8OL/n2v0NYt4FYshLRTZYulZrnLSNGCROhEHAddhS5jMCjeu9cN5rV8vY64Il
92ZqyJoclPL9SfH176+NsJb5EEc1MkG2xVfqaWzc7hDpmoq6jFy8C4+SfO6xseWP
Vp1xck2xe8iQsQ8fgJ8twjINLM2ZdNjwU+mPySu7vXGKu2Fw/X8QyPfRSVp6lDz/
t4WJychkuGn73wDPGdX6qqmZ3NjadxayqbWY0Lw1VKp+ZgEGscHXMTkGHJEWk1VP
LZBxdi+FNsdrRAJ1mQJ4DCw7z9yizBjSeJjUlC5GgCti0KHkax/3me/wrnovb/jK
aKegxAHrwYsxWvNleYCGkBCsZP/0jYXqnESSGdHBtGVGFcdPfdDlroG7JLDhsxqR
TjDbM6/p+7KM49bu/rStlQdi+vNMSwVbyDBJmB5giC00dDXIjfs=
=/nD9
-----END PGP SIGNATURE-----

--clbx7ueqygkqgwin--
