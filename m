Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:36742 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756611AbdD2Qvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Apr 2017 12:51:54 -0400
Date: Sat, 29 Apr 2017 18:51:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC 0/2] mmc: sdhi: make use of CBSY
Message-ID: <20170429165150.GA1525@katana>
References: <1453808801-12510-1-git-send-email-wsa@the-dreams.de>
 <ac6f67df-b124-53c3-ee54-9f215120c556@gmail.com>
 <20170429095523.GA2689@katana>
 <12359195-20b7-eee1-f914-db1c2ae0a6ee@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <12359195-20b7-eee1-f914-db1c2ae0a6ee@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So if it does no harm an makes the code closer to the docs, would it be an
> option to apply it?

We likely need to wait a cycle because of some on-going refactor work,
but in general: yes, I'll pick it up again.


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkExKEACgkQFA3kzBSg
KbbJNg/9GWdoCHYv4THKtrsB9QsPJpv3xhx9un8tdulhfHxr8nbGeAo/06/J5h98
qqqZpIlzuGIELVap1OONeE4x+lYWdryqDuSK6UBNrQ+gdEZlqa7FxfV5qjMVzPe4
npo1ucc5Mgerscnia2ZIWRiSeuQ7fhrxQ+cTynYMhbXW9G4827y5QNL0MUD1jUFN
v2/P478YSz6kWP3uc6hB9TutItDEEzkkP6+z6cLVpXYuaS3W+2Kdc/5PBxrKKwRy
9t1TEcuVquH912Yik4fXHfB9k1kieCDMBCAckwEjDvvc69CMWHeojTdOUk5G0h2J
Km5JB/vJ/iI7UrAiuGsAHuxeLYOPjKa3Ovh+YzcmAwdL2n+Ryy6jszRzhSVFDL7D
bUX5lNP/xXg70li7kdSsgoplaXN8yI7bzeptF8/mNajdUS5K0BgcH2Nof4RrlLks
HzpPO3/MYmrRLOYymKzwfy5oAHnOFmOYv5yW5cUwf3PAEWtIQQEGFzEdgMVD2c8G
aEp6J0qjGjvLQtd2HqmmTSfimSv9nQ4J0AS4zb4Thm/4yQVophFmuGXNyPpwKR3K
Z8SC0kZsXaHPEsZdtrgxfstxOkOWPOW4rTZCm0mNkBZaosk5hZ6/a+Xa7J8fRM2y
+PYP4qlgy6KbwHix6cIFo/qlSc/1neowkvdD+X7tRkDtiz0cSOg=
=gft3
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
