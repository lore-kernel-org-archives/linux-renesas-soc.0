Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59400 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbeLJI6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 03:58:41 -0500
Date: Mon, 10 Dec 2018 09:58:39 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RESEND] ARM: dma-mapping: update comment about handling
 dma_ops when detaching from IOMMU
Message-ID: <20181210085839.GA1087@kunai>
References: <20181015105517.28032-1-wsa+renesas@sang-engineering.com>
 <20181209215154.GB5856@kunai>
 <CAMuHMdVpRYSCyho4n2R8p2s4WV1bXv8MM4VbMA9NVJjwT_rHzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpRYSCyho4n2R8p2s4WV1bXv8MM4VbMA9NVJjwT_rHzg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> Probably you should contact Russell's patch system, instead of Russell's
> human email instance, cfr. Documentation/arm/README

I didn't do this so far because rmk's patch tracker says "please submit
all patches to the linux-arm-kernel mailing list for community review
prior to submission here."

But hey, you reviewed it, maybe this will do :)

Thanks,

   Wolfram


--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwOKroACgkQFA3kzBSg
KbZhIg//U8D/6eZansCo8ThWXiqp8T4e50lcEamX74ldFvAXP0GRW0+tE5L64JcR
BetFEQXY2gpfSGWLXunupNbJiAeX6PET46aa3p46NDqHbcTLF7asP8s0xLAOLQmh
qIaAB6DROsnf8HYS40SSYvNkA7dZhXcfG/SS/BK/B21M3B3apvUpsz8Jv9+poDiQ
OJirDHdN+93xCjkP0fFvA+f7tRXTzlfThzZpOfkxk/g8B34nB8DEVcKjE0LejRu8
cJDPxMLSBPnoXH/7Jmy85RtMArDu52K7l8MMUgYeAEATIqG6v39MeF/55asED/MU
KFbHYKDBVe7XiAP27eXOkFCWavP1SIfMZehN+vEPD+yLA7CxSskWkfJ1leIZIQIX
Qy/Ld+2ryBiWPXB8H5MFSeiqSMY99sb6c/zX2RsDBQisnYGGY/mqFIWgos0/Cdxy
t1jEsNPbLbgY9GV5zTuXLb7jTAX8G7YERa47N30z91hlvwvftcfxmjFqPMyO/to2
dGr6dChChOq7pw+A1TnjtrrQ9fu9ytuvdQDryXqovOp0K1IJqsJjfcapZY6JTIgj
23hsuGSiVa4jPlYRbv83T3d2JAoCTNM3plQLjhsy5YR1o8WffdfZHFCvd+cdaXUR
MOIPxPAKQ2tbaciWB5Q6msSiY0ZbGj6sgRgDxwDoC0FEfCaSc28=
=Sthe
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
