Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0113.outbound.protection.outlook.com ([104.47.92.113]:61360
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726252AbeKHU6A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:58:00 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Joerg Roedel <joro@8bytes.org>
CC: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
Date: Thu, 8 Nov 2018 11:22:55 +0000
Message-ID: <TY1PR01MB1770B9A0AEF082A9CBF5B0E8C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <CAMuHMdUe=p42Bp6xgmvrNwPKs=VHUP2BezDBPPn9KgPawvOtgA@mail.gmail.com>
 <1535038384-27080-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1535038384-27080-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

Who is the best person to take this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 23 August 2018 16:33
> Subject: [PATCH v2 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching cod=
e
>
> Add support for RZ/G2M (R8A774A1) SoC IPMMUs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1-v2:
> * taken out IOMMU_OF_DECLARE
>
>  drivers/iommu/ipmmu-vmsa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 51af2c5..331562f 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -761,6 +761,7 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>  }
>
>  static const struct soc_device_attribute soc_rcar_gen3[] =3D {
> +{ .soc_id =3D "r8a774a1", },
>  { .soc_id =3D "r8a7795", },
>  { .soc_id =3D "r8a7796", },
>  { .soc_id =3D "r8a77965", },
> @@ -942,6 +943,9 @@ static const struct of_device_id ipmmu_of_ids[] =3D {
>  .compatible =3D "renesas,ipmmu-vmsa",
>  .data =3D &ipmmu_features_default,
>  }, {
> +.compatible =3D "renesas,ipmmu-r8a774a1",
> +.data =3D &ipmmu_features_rcar_gen3,
> +}, {
>  .compatible =3D "renesas,ipmmu-r8a7795",
>  .data =3D &ipmmu_features_rcar_gen3,
>  }, {
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
