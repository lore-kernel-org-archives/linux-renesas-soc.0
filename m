Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:46335 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750813AbcIAFvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 01:51:01 -0400
Date: Thu, 1 Sep 2016 07:50:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
Message-ID: <20160901055044.GA1603@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
 <20160830112457.GB1638@katana>
 <87pooppivx.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
 <878tvca1op.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <878tvca1op.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I can reproduce this on Lager board now.
> If I OFF:ed on SW8 : 4bit (= MD21), kernel boot will be failed.
> It happened on both board

Even with my recent patch?


--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXx8G0AAoJEBQN5MwUoCm2SU0P/AoYzEq5O3JBp5RclVUDSfDJ
HZC90CtvEKAY7wVRjHp/2lgk3gyE7WRPtW9AFMj3UDa2bPU0WJ+IHGNSZnmiNEiE
DqFVvgGqXfx2Atec9R/nEEx8XkzB1YIWQV0wVITKJbVWsZn21hwBwdCCIO7JzroG
eiHEV4NL5brQycno5mZDjH+0AlvymUqjOtyfFN8tY6MviJXGNMQE37pA4yVSV/mH
nO/6g0b5XhABM6xx4/FZ14vhohHMESIE/pA0701D4i3bqJQbsY4cDEvUlVf86QKo
TIy6xXMV/jGHiVB97zhMXba8TzscEcEpis6ObO/oz69X+nFUgMtvhMIZd3A8J9LS
FdtS2WTLrgMaSZA+aS267Yz8PJuukiZGJWs5H2+LWqSuGAuRroKXSh1q5fbNa6Yf
OdnAwShy+YsDi4r6+zWwd97at8W7kNdEogBurYm7U71Bps2lTnQRsTTOxLXSYokt
G/wwSTTwjR3NWIAm5q9ioUqoxagkLP/sLpi6YEisTkZR806HTyv9d1ggiG8vxAbs
aYihVTe51M7xnsqbeAoaVSLT2aLXVUmos2I+tgX5jXRx8MN6bvougdZRIes0/FD7
Z/PLCtFcbt/HXKvm7EUbNfNbgtBiD2s6hRyrOYgNyrwZTMDWq1tCMIXSjIztO/km
OOwJo6NWUo5tSQNWy0a3
=CGRQ
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
