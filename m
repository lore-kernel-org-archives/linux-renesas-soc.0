Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:61293 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752585AbcHRHfE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 18 Aug 2016 03:35:04 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH/RFC 0/4] usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
In-Reply-To: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1467880362-4844-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Thu, 18 Aug 2016 10:34:31 +0300
Message-ID: <87a8ga5y48.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Yoshihiro-san,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> This patch set is based on the latest Felipe's usb.git / testing/next bra=
nch.
> (commit id =3D 15e4292a2d21e9997fdb2b8c014cc461b3f268f0)
>
> This patch set also needs an additional patch (like the end of this email)
> to fix the renesas_usbhs driver for R-Car Gen3.
> (I will submit this patch after v4.8-rc1 was released.)
>
> I'm not sure this is a correct way or not. So, I added "RFC" in this patc=
h set.
> About the detail of this patch set, please refer to the commit log of
> first patch ("usb: gadget: add a new quirk to avoid skb_reserve in u_ethe=
r.c").
>
> Yoshihiro Shimoda (4):
>   usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
>   usb: gadget: u_ether: add a flag to avoid skb_reserve() calling
>   usb: gadget: f_ncm: add support for no_skb_reserve
>   usb: renesas_usbhs: set quirk_avoids_skb_reserve if USB-DMAC is used
>
>  drivers/usb/gadget/function/f_ncm.c    |  2 ++
>  drivers/usb/gadget/function/u_ether.c  |  5 ++++-
>  drivers/usb/gadget/function/u_ether.h  |  1 +
>  drivers/usb/renesas_usbhs/mod_gadget.c |  2 ++
>  include/linux/usb/gadget.h             | 13 +++++++++++++
>  5 files changed, 22 insertions(+), 1 deletion(-)

It has been over a month since you sent this series and nobody said
anything. Can you resend without RFC so I can apply?

Thank you

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJXtWUHAAoJEIaOsuA1yqREhaoP/iQPuyFNev2BIQc/li9Mt1y4
za6dhpCqqZbl38isERyXQsPrVYYhadJCbFoGIL2Qzh/xouMGfhqt4dOp5Gqv17LI
uR3qTByn0Y0TofH+UdCd1Kb4yXOkgdQImNobk4OSkY7snL6vTnhofyXBB0vBljVq
WEhBke0nbVck4eucFp8DtaFa+qB0IKAPrd8jke39arR1bU2gXDQHdCFT1H9w36QQ
nPOOcSGZu4c+IiaqdXmPY45FphlXKS0gx3SePe8m8M3I9eB65XPSedXKDYVZg/tf
bCNQgCWouSwQFOWU2gnYYdlvJwOzANvxLXFWQDGcIKldZiNfAndo+oWfVgJ3WnH8
c5FF8ojC4o8jfuNhOwkMjUzEUtnCaLtv3wHCLmq6m6F35TENt0UyQtXMX20Q9EDg
k9IIPMiyg9XXj7xDpIbudcl88u/bIqmeZH7gZKC7RZiNzF+WTXZHt3jSATbuNk4F
EAvigQePAOnuyoOr1Xv5g2+59mD7rIMQjNeNF1RXQr9SCY4iOHxyWpQtL9Qn9zKF
KEGRp7hNgP0VVJzZNveJk+/APTWKZHH/ceqkYrX0JJ94Zzkz3xSDOwr0cP0mhirn
vQKSIFvXLkjy64HxvBbrK1m48Yak4q6X9wktXMptnN69BVzjDQUG0IaCQOZLbSDk
IxswNt1mTsqXXD3Px9Z4
=A6yJ
-----END PGP SIGNATURE-----
--=-=-=--
