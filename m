Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38412 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752574AbeF1FN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jun 2018 01:13:27 -0400
Date: Thu, 28 Jun 2018 07:13:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180628051325.pehoyggnxrqymfos@ninjato>
References: <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato>
 <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
 <20180627084421.zrtpsms5eyftqcfb@ninjato>
 <OSBPR01MB229371E806C2D772B426C469D8480@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tntmbgsk4z4ro5ws"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB229371E806C2D772B426C469D8480@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--tntmbgsk4z4ro5ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Shimoda-san,

> Please refer to "57.5.4 Usage note for the transmission and reception
> procedure" in the datasheet Rev. 1.00.

Thank you. I'll send a new version with the workaround in the i2c
driver.

> The BSP waits for maximum 1024us, not 1024ms.

You are right. Sorry, my mistake.

Regards,

   Wolfram


--tntmbgsk4z4ro5ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls0bnUACgkQFA3kzBSg
KbYzGxAAo20Nw4Uu4Qwdnb7arf+Z63MdscylukN3e9rjQNq5vLNM8ayzqCutWVtB
lsP54P00jxiOv+C2TBSWWhEz1pAX8BgoHnciCvAaFbwc24TRjDjABVo51H6owR2u
Ya31m+IhWydBZKsSgoO+cU7Dwcrzo3ZAgmgU1Unn+D1OD/TzPmR4LSceLdE1xkUO
DICwkTZKWLPd6SbTp82HtnD8y8SqOeSI4wfxWqtc/59oP3w9EYXFJAJgAokba2qi
nwZnxc6y7qGpyl0Uq+YR4tD8c9Bn6EpINtX9ujhwZ1JLo7x0lA9Z9HOQmDC03JMQ
ZwfNs0XMk7OSyXOQTCnyN9ktudYA8dslUruPfjNUUiQFbcOenRwbPd1Piynx37SO
uBrW7sWWW5GNXdMDkTYXno+l2EZ2eHWu5TmNp2U0X8NoF6eLtqILcwJ7aRYfG2yT
EzcXbIykWFR2NC+l3RoE62eT1mG+JsM+ocxa/tzwvQ5IwKjXFJ15P/giHoHCVXyB
XfZF0dLnliUNJYU85kiob5F7ign6Pg+p+5Y8Us1V9kTpZqwzLV4aF3t5QdLDk9TX
F9SggaCdDOu61qnR0nJIV8t8wR3pIRPnrXJ7j5q4oHWxqR9HS0U/WkE1c57Q/+o9
mBi6eVQ2PSo7FKENd0uMwqxfPMVszpax4xhkEEp96c++VG/1+og=
=X6An
-----END PGP SIGNATURE-----

--tntmbgsk4z4ro5ws--
