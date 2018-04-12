Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:59796 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752483AbeDLLbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 07:31:35 -0400
Date: Thu, 12 Apr 2018 13:31:34 +0200
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
Message-ID: <20180412113134.nzz4ncvl453dkcvr@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
 <20180412111127.iyvxe2xvemlnpj4v@katana>
 <CAMuHMdXPe7kipfN1ve2C3EpM-bxCvW9Akiqv7Ri4NqYYOTVW7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="26a63mr4q5p3md2n"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXPe7kipfN1ve2C3EpM-bxCvW9Akiqv7Ri4NqYYOTVW7Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--26a63mr4q5p3md2n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> That should have been caught by the !soc check above, and have already
> returned with -ENODEV.

Now I get it: You mean non-0 check, not non-NULL check...


--26a63mr4q5p3md2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrPQ5UACgkQFA3kzBSg
KbZmLg/+PtcnSmCX3AkKGqeILvp4NX93vrG4jtAUUVp+FwkcAVCSAlSC/4kMVOnV
CUAx1da36CdwdTpvRy0KRvc0IZ+CZgeM0wsRt/l9T1HCEpObhmRshF1bB/tT4MtT
438j80JtvX7+aGCKQ7CBF4uUDQA39lWC2SNi13St2ldOC31CIT21hWlC/p9tps7h
9bHz0nwMkLk9Ri0BRP19qAhoPPSM1vRYC8pPLeUN0VoCU9xGAHDpMSjdBpC/Ub/l
sAK5bb8e5eBVBX0cDkTYedcZZEH0vxEd9AdusgGOUykuAUNvy1svWCyVXSGP6npM
ifvnnmmvyle09pXEbR23cvxp4G2Jlbygo2bzgsrCp/3mKNr2tp7zYKzXlmcPqkiC
p0j9DEzGaySRhKPPOC8AZPeqVnWJ15Xi2cgCm+p2FDGXItlYkvPTVGjBZQNK2bbg
mEgl7ODsWYEh3LlH9knpzgkz8Zh1SDrvQcAX7cEzhkb+pqLwDCTrOvWHbH4MZK80
Clp4tJBrzwhViyM3EXLlN0mL74a74r4lpsnbIg6ZJTIhCZe6LaMjT7vvYDz+HybA
O8LhqckKRmSCFnxT3Z/9axpwm2ifhFl6oxuDLIcA30G9aX9S0gl2sI0YJI8yQy63
Zhs4TdkjVne4XhAgREafA0mwZ59PO+vHVaObSS6RCc1fSIWGw6Q=
=rd2K
-----END PGP SIGNATURE-----

--26a63mr4q5p3md2n--
