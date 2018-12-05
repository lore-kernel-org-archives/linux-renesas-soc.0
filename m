Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50074 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbeLEVYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 16:24:01 -0500
Date: Wed, 5 Dec 2018 22:23:59 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Subject: Re: [PATCH v2 0/4] I2C0/3/5 pin control for H3 and M3-W
Message-ID: <20181205212359.qv3f5ecxldgjgrxn@ninjato>
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lt6maediapv4kwec"
Content-Disposition: inline
In-Reply-To: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lt6maediapv4kwec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uli,

>   pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups and functions
>   pinctrl: sh-pfc: r8a7795-es1: Add I2C{0,3,5} pins, groups and
>     functions
>   pinctrl: sh-pfc: r8a7796: Add I2C{0,3,5} pins, groups and functions

The BSP also has a similar patch for r8a77965. Could you also take care
of that?

Happy hacking,

   Wolfram


--lt6maediapv4kwec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwIQesACgkQFA3kzBSg
KbYkSw/+NCg2zcKwe4eqoXr3ojVvBsZpUbIrwVWvB1n4q0kbfysr1G5GAwWlP4lr
oHlD5wGYrGI5HEyFWDCStuboR7e6HjGvWyOG1AV64Pgs8AaA3L9LfFtRlHjNYiPV
qkn0IXU2oyUDRSGriIbmSBCVu9wQdQHQHc7KNU9DqncJEu5Ihjf2f3shtdVGKtVP
NsZKeO3VLct5cNoXE6Xi4UGJsV3qgJkAZaQAuBBcMR/0jwpey+6PiDKMVK4U3F6w
0/gtXC8MG2nFqco7aB2tvFejRJdNXyngmKbf8AiINDRcrBw4J4lt8etWHUxi9Qm4
JdvmxOoda8hzTQnvAuILJ9saIHfNt7f0ImAKahWvc+94ZWICPbr14pZ7UWg+6RR3
kGNZbqXU5mnzwyfolqVvc5VPL1ol7+GpG2vPvHxA1NFCg0Ecmr2fkDVZTcoPrPH0
EXIaxTFjOz3YHX4YYhxAqixeMwx1BIxws/texc0ewiCQpP3rKGafabCCN5fqkPyJ
2xuhdNIKqTPCbO6BDgRdgNDmpo4ZtPFRXjyC4nn+raTc3rdp6zuNOu/kQ/OfHzLW
ZxdfoBrI5uKgTI1AZjyKS0oHNMGvfLDb/SF9YUiQXSjeD36VwEQ3T6dAb8nbwiGv
DfMeIrAelIGo51Y8gDkHz/0LJ3GmAP8L8KK9YlcSh0tYcWLOiOw=
=NDR6
-----END PGP SIGNATURE-----

--lt6maediapv4kwec--
