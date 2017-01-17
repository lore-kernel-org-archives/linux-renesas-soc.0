Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:54030 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750849AbdAQIVW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 03:21:22 -0500
Date: Tue, 17 Jan 2017 09:21:19 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Message-ID: <20170117082118.GA1487@katana>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana>
 <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The reason is that would then keep me from having to modify the existing
> functions sh_mobile_sdhi_clk_enable/disable.

Why do you prefer this? I may be missing something but a small if-block
per function are not expensive IMO.

> Is anyone going to have an issue if I turn the card-detect clock on but never
> turn it off???? That was the patch that I was going to test out and submit.

It smells a bit hacky to me. And while hacky things are sometimes
needed, IMO this doesn't hold true here. With just 3 more lines (an
if-block in disable and a variable for the new clock) we can have it
proper.


--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYfdP+AAoJEBQN5MwUoCm2ywUP/AtXzaepUp4pK3jCDKgsHGYc
i+RVkHuUAMhUcOyDVGPEELWI5cSOd09bXIiJqPT/E+rj7aTmTyLEyfdZ7lPwh5Bf
jcNmnfmRiatg4cACM1OgcXsRZMcdyIi0JyaksNjrE6LQXYWPFfjeXwVsqUAULaxg
YES6HATRNHGrczY46QnnN6+vlT+59zF40J7xYwQS//pF6I6tBIgkSnFn6st4LGGK
CvY0rNX/08VRLkvhqsXAOelzmloq6HE/ynWiTeSwvOnPm0Id/z2OG9R3dIjyD98/
tU5s0ffFFDe4Co0UT18Rks7sUWfpFom7cLSppFBL9QRlmhgQOjQC6V6Hlr2rIj0k
oYH3yP7yrvlkwJS4ovG3+CbNEQ5b4IjrWMNXYtMmWBmQ+Va4bh5EeaQOyhU8WQch
V/gWXMk7MulpV0aTnml6AncIkDIvcmsKIU3C+b1L6gF7vMk7A3rxDpyH8vKBYd/g
97wWIn6XVWYWod9NmfOW7B6uyd8qq4SMVe2tF2sKgcpz2ZdHQhXa9+ZB5BEkQZ5S
pFalL1J53f7aW59eQ3DqlWdlL53D0XX8+3rN8Gr58KGCtocw5hGV4pQhreOCYndk
ypFbN+VHw4/bvvC2RnHBCUj4FBm0QN3PRLVt9DyWOthau14Hiyfb+ePgG+J1ANBo
AWHuqFckOdoc+deXR487
=7qzi
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
