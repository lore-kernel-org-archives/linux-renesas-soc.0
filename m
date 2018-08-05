Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50845 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbeHEKTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 06:19:37 -0400
Date: Sun, 5 Aug 2018 10:15:43 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 09/14] dt-bindings: arm: Document Renesas R-Car
 M3-N-based ULCB board
Message-ID: <20180805081543.GH4528@w540>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-10-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="it/zdz3K1bH9Y8/E"
Content-Disposition: inline
In-Reply-To: <20180804231114.21420-10-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--it/zdz3K1bH9Y8/E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Helle Eugeniu,

On Sun, Aug 05, 2018 at 01:11:09AM +0200, Eugeniu Rosca wrote:
> In harmony with ATF and U-Boot outputs [1] and [2], the new board is
> based on M3-N revision ES1.1 and the amount of memory present on SiP
> is 2GiB, contiguously addressed.

Not sure why the amount of installed system memory is relevant for
this commit..

>
> [1] BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21
>     BL2: PRR is R-Car M3N Ver.1.1
>
> [2] U-Boot 2015.04-00295-*
>     CPU: Renesas Electronics R8A77965 rev 1.1
>     ---8<----
>     DRAM:  1.9 GiB
>     Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
>     ---8<----
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index f391dba10574..2f3494a0107c 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -106,6 +106,8 @@ Boards:
>      compatible = "renesas,lager", "renesas,r8a7790"
>    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>      compatible = "renesas,ulcb", "renesas,r8a7796"
> +  - M3-N ULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))

Other documented ULCB description entries in this file are
H3ULCB and M3ULCB, so for consistency you should add M3NULCB, which
isn't that nice.

Imo, or you either replace "[H|M]3ULCB" with "[H|M]3 ULCB" in other
entries and you keep your "M3-N ULCB" here, which is nicer (you could
do that in patch 2).

Or maybe could you consider doing what has been done for
Salvator-x(s), which do not have the SoC model name in the entry description
at all (but please wait for others to comment before doing something
like that):

        - Salvator-X (RTP0RC7795SIPB0010S)
          compatible = "renesas,salvator-x", "renesas,r8a7795"
        - Salvator-X (RTP0RC7796SIPB0011S)
          compatible = "renesas,salvator-x", "renesas,r8a7796"
        - Salvator-X (RTP0RC7796SIPB0011S (M3-N))
          compatible = "renesas,salvator-x", "renesas,r8a77965"
        - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)
          compatible = "renesas,salvator-xs", "renesas,r8a7795"
        - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)
          compatible = "renesas,salvator-xs", "renesas,r8a7796"
        - Salvator-XS (Salvator-X 2nd version, RTP0RC77965SIPB012S)
          compatible = "renesas,salvator-xs", "renesas,r8a77965"

This would then be
        - ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
          ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
          compatible = "renesas,ulcb", "renesas,r8a7795
        - ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0)
          compatible = "renesas,ulcb", "renesas,r8a7796"
        - ULCB (R-Car Starter Kit Pro, RTP0RC77965SKBX010SA00 (M3-N ES1.1))
          compatible = "renesas,ulcb", "renesas,r8a77965"

Thanks
   j

PS: why the r8a7795-es1 version of Salvator-X is not listed? I assume
it has a different part number than the ES2.0 one, as ULCB with es1
does.


> +    compatible = "renesas,ulcb", "renesas,r8a77965"
>    - Marzen (R0P7779A00010S)
>      compatible = "renesas,marzen", "renesas,r8a7779"
>    - Porter (M2-LCDP)
> --
> 2.18.0
>

--it/zdz3K1bH9Y8/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbZrIvAAoJEHI0Bo8WoVY81kcP/RqLXkN86NCu8lC/0161tjHD
24Oer1xs1esTIrfHRm+yQJO/TKuFNgLzLkTmTGW9upsCYc3FfMoHmswFHNiBFrgx
uM+lAOyYF3fjTtq7RrZuEwFm5wAOpFbVU+HHdAZnWc9ZaObbgNsudUeixQPkxRGv
eYYVfbueFp4uZ2dWnPyNE++TAiHGu47mZ6575Ba1s3R7EpnWDcIM7gM7IsR2oGIO
0916F5R752HN78FHMpi6u0Kx4LMNczxyOm7DkJgJH9g11Co8/t8LixnX4ftlnpYa
EdCOZGRjTX6PWETYRVC9huixZQ/UZbzrOhd0y4O6SehYPJ38BcD3qzZuVkNF4PhB
duDCZK1gOSwslCc8t/KiPIqd4FzZQsN8el2PY4ZEO0cDX3RlO6+Ln6rQomJys7Wz
fYJIelAfciOukvvihwZ0kT4owOX9WuSL+HFF7ptCEVEMHv3ikVt4acNYpG5vM9WY
LX2gKBL4I9GCk5vnEgjne0yc6rdL4ldpvNYXxBGM8otOo9YymsKWErvU9S7WgKuV
n8e9vSI4NDatfovyU0hLiAl/CpztXdM4L5IIP3836FOVs+mtMgZ6+U1yNc2jYR7u
cG4dxmPS16hbcY41I4PN6vxlmtbqYzBRuHs8nXCjppigJeGKuxu7txPY+tx+xDGq
KcpxVRMvWudidjdVQEfJ
=hVQE
-----END PGP SIGNATURE-----

--it/zdz3K1bH9Y8/E--
