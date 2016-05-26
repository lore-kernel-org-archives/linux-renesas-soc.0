Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43727 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754788AbcEZSnb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 14:43:31 -0400
Date: Thu, 26 May 2016 20:43:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	arnd@arndb.de
Subject: Re: [PATCH] i2c: rcar: use dma_request_chan()
Message-ID: <20160526184323.GA1614@katana>
References: <1463646557-22489-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <1463646557-22489-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2016 at 10:29:17AM +0200, Niklas S=C3=B6derlund wrote:
> New drivers should not use dma_request_slave_channel_reason() but
> dma_request_chan(). The former is a macro to the later so this change do
> not effect the driver in any way.
>=20
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Applied to for-next, thanks!


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXR0PLAAoJEBQN5MwUoCm2tNcP/iyJ8xGMQVDb4cmw8IcKZqoP
Es5SszAnGh/63ckADcwWBYKncPh3qwPGqg+1ehe+BpID9/3Ta5MzK8TxI4tGfBns
VD1mjE0mQ0APzWZUgnoNE/ynYeUOSoZtMTLbxY7NBFR/1MnFDwqyJLco1ovWhh17
eK9OoQ5mK8VW38UPQm1qPn5laUJSOMmv9wc5qvkcll2FPx7/roNtIXVL7rsNqwhJ
1UmI1SpGmgiTx1U4+f72CwKKnyKoJu6zXRfE/yxOB6gWAdIIMyPnIrzznNz6vbmh
86xz0fIG66xV5Tr5I3HQlzf9ytt3gMnW1UmBHAiG62t3lhG4K/ZZMrnF0WUb39c+
Sae8/ddo+LK5dTXbHH/QNMMGQCZ+lpHOjzXPDxZsA3NcqORimuhWsVcD+zD/DrQk
domvJ0DdKBPv6L2ucPlNIM9PvQmkTgOhM5aclc39fFxDU2icji3Q8ym7OxmkZ3Ne
u8JrRrmsuiWMVeGhand1jS3i5w3mHdGHh6RX2msEk/N0b8iLZ2sxQlkM08s+6Csj
j89F0PZGYd+0mbmhldSBteS9LLibF65M4vVAUwLgnyhR0jjDqa+unHFqvo3zBqX1
+uEBs8kuok+KTctfRTK4jhxPtstRrzkiW/n4gHMYHIBNDg5WIN31teYHbrji167d
PokmBlumzem7tT3XuYTP
=0B2j
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
