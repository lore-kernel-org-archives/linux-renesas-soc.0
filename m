Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbeKBEty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:49:54 -0400
Date: Thu, 1 Nov 2018 20:45:29 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20181101194528.GS2433@kunai>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R+WA+n3pAWWgNWUs"
Content-Disposition: inline
In-Reply-To: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--R+WA+n3pAWWgNWUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This patch have quiet a few dependencies I'm afraid, let me know if you=
=20
> wish to be notified once they all upstream. I don't think it's a good=20
> idea to pick this up before all dependencies are resolved.

Yes, we should do that. Ping Simon once all dependencies are in next. It
is still fine to have this patch here in case people want to test. BTW
did you mention your branch somewhere where you collected all these
patches to make HS400 working/enabled?

For this patch already:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--R+WA+n3pAWWgNWUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbV9gACgkQFA3kzBSg
KbZP+g/9HrORmEp8Oxhr2TPjg9Ah5WS0SRvSrKmpvo3N5tpJ1XdRez31NSfAN0Tc
gEsdTGJ1ZGtuIYjS9WF9f4ThzyXaFdYa3H6kzkbqxM29XWsKrqTWIhVZQ7OBDvaJ
Cq/jW26oJAWZfjkkQ9dT3UnvPnWNkwNd1RZ2q4WMNWhTRBtULX3AAtf6yWPetFR5
TkVU6NOX0eHXD69B2WGg81IprppdcNVQZlq3GJZ9eS410S1ruxy/hfnNLfY8Paiq
TCMd1VcMQyrdoqNdYMgEpAI5rpAXjn6TzQdR8FubtPD4L3BECx8yrPvMCy/kJ0ej
jgkybU/1+zxH9Sj6jJuItkoaXuh8nCXUHisJKIAACdrzvxIhfEDZk85uPLAJEP7Y
iKxZEKnrMRLVFFhs5hHqEUpDCdQJw/ivRj+gxtm1GK8LbXFH83NCocYKZY8UXocY
pFRDKjcYbiRHvHnPrLufbKnWiapdDKBtCw9AU3FSXK40iKtDNizBmO0f6uuTksbH
ua3DS+LEA+Bh4jmtkNK7ACyInvKRSGeKRyLMgplsiVfn2Y07Zhd1xj7F7ShJ8ExL
M19j91mebiv5UCKnJ/Y9K862NL1b4M30iM21Cq5p7FL1HlKkCdAzQDYQrx+SiT0y
+VxjfyexDEPsxlFNiUgye3J4fl0nRUiaRiZS2v3vBFd4QGrdUNs=
=CqKK
-----END PGP SIGNATURE-----

--R+WA+n3pAWWgNWUs--
