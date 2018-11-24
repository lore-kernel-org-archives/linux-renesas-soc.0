Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34498 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbeKYI02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 03:26:28 -0500
Date: Sat, 24 Nov 2018 22:37:04 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>
Subject: Re: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
Message-ID: <20181124213704.GA1044@kunai>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
 <20181121023540.GB2445@kunai>
 <CAJiuCcf1Fq2jmvfzer9hX14pTpuuL+TcmweYGnC6YHCXbR51jw@mail.gmail.com>
 <CAJiuCcfWVvYkYGmekzFY4KR33qGkghpdEt6YAnDYoaN3JOowUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <CAJiuCcfWVvYkYGmekzFY4KR33qGkghpdEt6YAnDYoaN3JOowUg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Tested fine with SDHCI Iproc controller on 4.9.137 and 4.19.2 with
> Auto-CMD12 enable.
> But there is something, it's not working not introduce with this patch on 4.14

I didn't get the last sentence. Could you explain in more detail?


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv5xHwACgkQFA3kzBSg
KbagURAAs8GOJHOkgwIsxQzD/q/XFfHeAvzHbSicr0nYxP6L+79BOS6iNR5n8WGN
BkAsDU+EPHE+llZrwdi51Vow2vHmVop1LEIOjZf7IjDhRfsgUVxVng0Zl4y4zKsD
mQVk2Sg81MP9pis7r3hDNbXKm1uug6JFKyMZPJZ4cGrT7smr/HAO8y4byvWyC7Zd
WPbmt4X/1tS21zqqTKXCcuzFKjUYorCxOEzfAqfs4qvg6idVIYg7YgXcar1ooZKM
WxcN5hMHE1PBTWXhFJkcMHSiB4QzFwQEEGVIrbfstPrA4cKgGmkxQ7BHnoPdeh8B
RZ9hTHODtqgZ7oKVyxvBj50KVIWAgtLQrCvORTHD1uPaJwa6df+XMKEKeBsFS+dZ
9d6uyKANcyTRStzy13kzIaqzoRgqJebEK+qcFgFRcBAuZgu+ncxbqEJhPuj719an
ZiG9CUTvvPk78V5VNCH02kHZA2tpQgGP1839RiHHItFLlCTPX273kZqCpPVmqDrX
rvE2T83tMtYnJTZe5NXO6O33Vb5fYw4XGbQdS9qOdrNcMGyjNGZM4On3HFrrktzK
2vcDV/0N4PqAo3P50l+76i+wIH55Zklc30S4U3u+j1rcHfXvP4RZUf2pLdyr6uq4
sb9HcYzTh5dPF4+eLj434C4vLwxbflWuNvYePfpXiULXNzE1mbU=
=7clh
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
