Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:34902 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751719AbeDLLk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 07:40:58 -0400
Date: Thu, 12 Apr 2018 13:40:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180412114056.hdt3xwgdwi6ql3le@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
 <20180412111127.iyvxe2xvemlnpj4v@katana>
 <CAMuHMdXPe7kipfN1ve2C3EpM-bxCvW9Akiqv7Ri4NqYYOTVW7Q@mail.gmail.com>
 <20180412113134.nzz4ncvl453dkcvr@katana>
 <CAMuHMdVnYrw+Z_+REEpTOb7_N3UHAgUhjpuwHk+JKew=UMDeZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2pbnwzm4rg5wu46m"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnYrw+Z_+REEpTOb7_N3UHAgUhjpuwHk+JKew=UMDeZg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--2pbnwzm4rg5wu46m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 01:34:41PM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Thu, Apr 12, 2018 at 1:31 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> >> That should have been caught by the !soc check above, and have already
> >> returned with -ENODEV.
> >
> > Now I get it: You mean non-0 check, not non-NULL check...
>=20
> soc->data _is_ a pointer. You only cast it to an integer on the next line.

Yes. I usually worked with it as an integer, so I got confused. Will
fix.


--2pbnwzm4rg5wu46m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrPRcgACgkQFA3kzBSg
Kba6Fg//dREhd/bo4qnaNEqPySHooN/fmnM+6vPAfWqUSB0MNJ2tckajha8bxSdd
QDWgW4oGuVtv7BMi44e4v/txol6hK7oUc/5cwQfgouC14Ll2+Jqb3nJs4/tnsVnA
sC6r8IrVxYhOwYfU3mcD49fJ5un/vQoB3M+7nrh4cOpv14brL6NJxqgPYYVNeqLU
m3YhIjZuQnBfadeCv/xhkXuMD/qBiXZZGPe6g24xkAkvAP/cnnnGktq5iVrujIFA
/ukv5x4zjRcYF3tbaMn9zWgFcrLScCmA56MUIzBnrmXwMBF4NCganDtHbO3zYMWB
Cp9nCYxhsViB3UlmwU4uJhqBoIrpuFaA5smdCnozBOLP/tWkEGhpm/VzFh3K/82q
9wJR8riFpZEVqHMIfxoTOXIlrnvbti2qKk5hGR6+U5/G9GtQqPuCvk+vGImV3xRp
CvzUWjriSPnY7j2nMKYnbG5wYR1V9Bu7HRobfb83YU1WHHWU3chOTbuhLVcO5ZZp
IHEqtFNp95jyfVorf4vPVZa6G7mby/faOnzTQrhWcIvZjRXNmJ3IvCaUGXXvxsSi
ogaFxRJvlG8GO+0v4MFy2sYjnV3lzxfwY/idQGqM8mwsCvgLiES5shSNHmhAGE2/
+aZmcarhp9R/mrrLCmH++uOzZ6J3K4+xRyy+B8QHmcEI2na/ags=
=2Qw1
-----END PGP SIGNATURE-----

--2pbnwzm4rg5wu46m--
