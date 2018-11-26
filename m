Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46464 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbeKZUce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 15:32:34 -0500
Date: Mon, 26 Nov 2018 10:38:58 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>
Subject: Re: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
Message-ID: <20181126093858.GC921@kunai>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
 <20181121023540.GB2445@kunai>
 <CAJiuCcf1Fq2jmvfzer9hX14pTpuuL+TcmweYGnC6YHCXbR51jw@mail.gmail.com>
 <CAJiuCcfWVvYkYGmekzFY4KR33qGkghpdEt6YAnDYoaN3JOowUg@mail.gmail.com>
 <20181124213704.GA1044@kunai>
 <CAJiuCcdLwC7OBLK5hEm6d07QkO6Z4Z_kOm70vXT8bZKs6QfXWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdLwC7OBLK5hEm6d07QkO6Z4Z_kOm70vXT8bZKs6QfXWQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Just want to point that RPMB with Iproc controller don't work on 4.14
> but it's not due to your patch.

Thanks, now I got it!


--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv7vzIACgkQFA3kzBSg
KbYd4Q//YjH4AjVD5KsVUdi1AaNaX8OcqV/JCTMMlvYF0Pa4OdvSfTLlWAD6aE8n
G84gJfYME+eDeyra4o6q2GOfvhPIjUVfAGIe28RPbcv6jtC2LoGdXtYnLlp6aF2W
KW03vIuu7wC+xCA/SxOz44mlfbizKmuB+Wd80GYWRpLkO6TL6Vi4iMjYeaS0DZOm
GRZCMb1nHHxj4C8gtpmYzYnQZVl8jeJVqzWpvYbHXYx2C1TDjc53Fe9fT0jAyjNy
kcjR3hQhiggBJ/3KwbYY0rvkzkS+VMGKTMKPUL9B45KT2rscOnNa7UOEHHI0FzSA
ydJhkDdBX00YdCQ0JNJ4AGMA47YH964XewY3GTcVkuilIn5g+mcnR+3/G08pctDP
A6DmQIPyhHCDeO/TrVHiIaUFWNbb0HtXtkYeM0i3CfsiXmF/Vhf26JMXg1pH216X
5m/tZ44XAwCI96I0lWcWEueBx4umlR3RzD8R7y8eRjOB6H/A7Zs3jFYeEHpMit7I
Uv9hBwsxArFcjYyHeqUZomYRr6VbYlRf9e3wFpeBLFOrzBQcnJkvB/GCwHHpguZS
v6tposKFl9X7faoD/6OfGh4sxNnUVzaZqegljEvBOfoAFsF+U7GYhgjQCjuUFuX5
HJ/q1Qk2ypZd6JFUGmyWCpEHrJskDJCtJgS6FqymKf0oyGqay44=
=0ejR
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
