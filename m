Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:33397 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751259AbcFNWJW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 18:09:22 -0400
Date: Wed, 15 Jun 2016 00:09:12 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: r8a7790: lager: use demuxer for I2C
Message-ID: <20160614220912.GA5528@tetsubishi>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <20160613143134.GB1603@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20160613143134.GB1603@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Confirmed :( Got today only this far that the ENODEV comes from the PFC
> driver. CONFIG_DEBUG_PINCTRL is a good idea for further debugging
> probably.

Correction, it seems the pinctrl handle gets mixed up, so the
devm_pinctrl_get_select() fails. Does that match your findings?
Pity I can't access my boards for the rest of the week :(


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYICHAAoJEBQN5MwUoCm2gHwP/0fuF2CCcjWMtzYqnJw3cYSG
3cPvbK7kr3iPlvrjuZdcl1bNJzpsO+z+7+cMdhDTHpQf5HOQokM8d9wewGK/CAc+
k16yiNORnmaBeWvv+7NpbqzaxLp+OWsqhlTM1FK3+K6dBD7d3QjlOrX4V/k+/7eV
cpWbiJLnN1EaCK6Pt9+4sgRsZUGedbKBi7EICEYF62yZVpWlvseN8UvS3QehxeWy
NGPjaCR96zBk26dzaxHgJig6puM3A+2MWrcQcJnt8iqxt/GprbIXeiGExy4w7BsN
16ICVnG+bszaqxYIqlhSt+/17jErEi37TENdFHIsFtc2NnsSJ47H3jGW656szY4A
582+JuZfIafPDsCC5YfujDZne2U8lQROQ/rn9GqNwXObMwmCTzh2JfGM85J55KlR
QKKm499+OOEweUGKUO6Aih2MENKnqMfo0TUNqxgTb8+8tc4VJ9q95PycYLmspoXu
h1heTcjecQa0Xts6Y1ZK94hrH5KnclhJYMEukLAMLu3emCB8t9OVy+JUWtwGBcTo
iYzUcCKbVJz3YK3Gh/2rkeD5ROwL2+NNfw2DY1Rhn58R+El46LZvM2M3CWvK88gs
1z4F1XkEHSebpdRZzCEL84U/hhmgjlAVwAzp6ECA9XeNL1xF7Th5nfbOjQemeul2
Fmx6MvtKBAJqQvQ6WiuM
=kbah
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
