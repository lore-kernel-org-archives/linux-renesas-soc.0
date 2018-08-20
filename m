Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33664 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbeHTW1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 18:27:51 -0400
Date: Mon, 20 Aug 2018 21:10:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/7] mmc: uniphier-sd: add UniPhier SD/eMMC controller
 driver
Message-ID: <20180820191059.udbyty2yktu2muac@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
 <1534403799-10594-5-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oyivyxqte7qvu2cc"
Content-Disposition: inline
In-Reply-To: <1534403799-10594-5-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--oyivyxqte7qvu2cc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 04:16:36PM +0900, Masahiro Yamada wrote:
> Here is another TMIO MMC variant found in Socionext UniPhier SoCs.
>=20
> As commit b6147490e6aa ("mmc: tmio: split core functionality, DMA and
> MFD glue") said, these MMC controllers use the IP from Panasonic.
>=20
> However, the MMC controller in the TMIO (Toshiba Mobile IO) MFD chip
> was the first upstreamed user of this IP.  The common driver code
> for this IP is now called 'tmio-mmc-core' in Linux although it is a
> historical misnomer.
>=20
> Anyway, this driver select's MMC_TMIO_CORE to borrow the common code
> from tmio-mmc-core.c
>=20
> Older UniPhier SoCs (LD4, Pro4, sLD8) support the external DMA engine
> like renesas_sdhi_sys_dmac.c.  The difference is UniPhier SoCs use a
> single DMA channel whereas Renesas chips request separate channels for
> RX and TX.
>=20
> Newer UniPhier SoCs (Pro5 and later) support the internal DMA engine
> like renesas_sdhi_internal_dmac.c  The register map is almost the same,
> so I guess Renesas and Socionext use the same internal DMA hardware.
> The main difference is, the register offsets are doubled for Renesas.
>=20
>                         Renesas      Socionext
>                         SDHI         UniPhier
>   DM_CM_DTRAN_MODE      0x820        0x410
>   DM_CM_DTRAN_CTRL      0x828        0x414
>   DM_CM_RST             0x830        0x418
>   DM_CM_INFO1           0x840        0x420
>   DM_CM_INFO1_MASK      0x848        0x424
>   DM_CM_INFO2           0x850        0x428
>   DM_CM_INFO2_MASK      0x858        0x42c
>   DM_DTRAN_ADDR         0x880        0x440
>   DM_DTRAN_ADDREX        ---         0x444
>=20
> This comes from the difference of host->bus_shift; 2 for Renesas SoCs,
> and 1 for UniPhier SoCs.  Also, the datasheet for UniPhier SoCs defines
> DM_DTRAN_ADDR and DM_DTRAN_ADDREX as two separate registers.
>=20
> It could be possible to factor out the DMA common code by introducing
> some hooks to cope with platform quirks, but this patch does not touch
> that for now.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Without docs and HW I cannot really review the driver, but it looks good
and it makes sense to me to keep it seperate and not factor out more
SDHI stuff. Thus:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--oyivyxqte7qvu2cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7EkMACgkQFA3kzBSg
KbaTaBAAi7JYmeywy0jK9w3AZI5hFyH53f9TaKPGO3WXOk2rJkXRGsl47K4GTjr6
ds0JZoWpI0GaRFZslz2WOCl91qBTOOfENET3s+YUBJc8ToNOOJlOGOcjF1M54Vxa
Hjri1q9qnVoHLSmOVIOoeGSZKVOmlsmJP7k4EJU2upTLgMj5w0/43FnPX+DyXwPf
SaRw4u29UXGdWnTE012ZuM6zeQZIBrxVerChi5L6uK7aftjinanbBLPU9K8JiE7P
c4AJqfCbqO/aFikmSP9QDumqpqodcbwnyK/rZxAyYO8+8Pf9kYvwSLsGsHrIP8i3
5arOvGT05gjMb4wESX/pFjSURB9MkbLC49r0xY1NHsVD0HpC1QdnX/Q1YbfmHJdw
wNUAuUdU++5h3ppk1ZeVPrnLVDyypljQa66fCIb1hCpx/Pt5p8FEIsE53IGh0hA4
Fp7V7dP1KJn2RGFs3JZ8AbZiSTajAbRRhRCwcxUTZ0Q3K9/cTyzQV7YfdXi4FRMV
DSYt62XEekBrWT+HABLdTbFFyCkDpo2+jLPZtvt23VJ+EXFBKZ76ohqhbE6Bzqe7
K7Aam0/qio77Ks/jhD07pbyqzhcchix1VKfK1HUcsMKshv2i0tESwn4ePslgMtpF
TksilRZ24iyrhaey+z/rxWpdt3Izw9EAO78QQEWI3/VquzEEK+A=
=2lQ9
-----END PGP SIGNATURE-----

--oyivyxqte7qvu2cc--
