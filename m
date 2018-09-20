Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58292 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbeITN2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 09:28:13 -0400
Date: Thu, 20 Sep 2018 09:46:02 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180920074602.eepb3zgc3txqqznp@katana>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
 <20180627061411.GQ5237@bigcity.dyn.berto.se>
 <20180627072702.ayayizxgghvoogdf@katana>
 <20180628003507.GR5237@bigcity.dyn.berto.se>
 <20180916144807.GB1083@kunai>
 <20180919220227.GH4351@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nnvhglwd3ids6mey"
Content-Disposition: inline
In-Reply-To: <20180919220227.GH4351@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nnvhglwd3ids6mey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 12:02:27AM +0200, Niklas S=C3=B6derlund wrote:
> Hi Wolfram,
>=20
> On 2018-09-16 16:48:07 +0200, Wolfram Sang wrote:
> >=20
> > > > > > So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'=
d think.
> > > > > > Maybe we should even move it to renesas_sdhi_core.c, but I am n=
ot too
> > > > > > sure about that.
> > > >=20
> > > > ... this.
> > > >=20
> > >=20
> > > I will look into this and send a new version :-)
> >=20
> > Did you send V2 of this? I can't find it.
> >=20
>=20
> No I have not yet posted a v2 of this series. Perhaps I should break=20
> this patch out and send separate? I have handled the comments for this=20
> but patch 3/3 in this series still requires more work, what do you=20
> think?

Yes, please.


--nnvhglwd3ids6mey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlujUDYACgkQFA3kzBSg
KbYFbw/5AeAdOKLKD/B/RyNoq6GGB3lX6d2XfFVmT4+kaXnBJwkjLMpGtK9RCWMv
zYkYk5f3+1oNlfdSCK3Ogvdg+nMNj8SC/BCKnNkZHYjk/3nXyL9qplMgmhrMmYME
qTKGk5Kjy1yCrfkl2ORCoKBLTIKmCXwdmCcaBP+BEwID9ObVbaKu3pRDCPWoaZlp
oYJuIJxxA+r/smN2auN1ctNjb2I2pojSxceBQg2BznNBiwkZQ4UH+OyHkZ4mnARL
KVWgMBzW7c8DQ54y7CqSCphA9EWXod5fktrmc7dtTijYu8qSbFpc+nb+5FHz0koW
wEHPv+NhW+F7hYZA5/fMT6pkjxpq+uSLta5vmUmavncZdO02sH4ynvWAauhXDlRu
8oXkibenjIZMoctYkBe2+eLYGVA7mchqXeVrYVFm+i8tU7+Gk3o7AuwARA8r1suW
skwJXj9PszelDZfh5m3gQQch2efFRcHMv5QFMgjVqTukdQuq85SPvt0hwS0Y5jaV
Ok5ZfbHuwD4k3WgaCkh3NfltC5FiWQKWkOCFIj+RLlv0ohSFuLgScE+BDWaYdktG
4jlR+0f+0N5Ox4C8AvNO4q96jCyCVx6hTYUmnKuu8QvP4/RCHuywKEHYN+iO54Fx
GikxEyl5k3jeyy5tzq08TIlMSfnt30eAjb5SVUj61Kzq5CBmjV8=
=IWOw
-----END PGP SIGNATURE-----

--nnvhglwd3ids6mey--
