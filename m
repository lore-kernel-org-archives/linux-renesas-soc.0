Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39699 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbeINNJ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 09:09:56 -0400
Date: Fri, 14 Sep 2018 09:56:35 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] dt-bindings: display: renesas: du: Document
 r8a77990 bindings
Message-ID: <20180914075635.GI11509@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+9faIjRurCDpBc7U"
Content-Disposition: inline
In-Reply-To: <20180904121027.24031-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--+9faIjRurCDpBc7U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Sep 04, 2018 at 03:10:12PM +0300, Laurent Pinchart wrote:
> Document the E3 (r8a77990) SoC in the R-Car DU bindings.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index caae2348a292..9de67be632d1 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -16,6 +16,7 @@ Required Properties:
>      - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>      - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
> +    - "renesas,du-r8a77990" for R8A77990 (R-Car E3) compatible DU
>      - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
>
>    - reg: the memory-mapped I/O registers base address and length
> @@ -63,6 +64,7 @@ corresponding to each DU output.
>   R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
>   R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
>   R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
> + R8A77990 (R-Car E3)    DPAD 0         LVDS 0         LVDS 1         -
>   R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1         -

Thanks,

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>
>
> --
> Regards,
>
> Laurent Pinchart
>

--+9faIjRurCDpBc7U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbm2mzAAoJEHI0Bo8WoVY80hsP/2MDLSl7+8AmiKtU/1y5bk+d
PJCGU1L3ORZkFtuY1eObwfWKn9g51iriB3jqv0O/+6s9GMk8fHqykGY5UUu8Yf0B
iVfo2RJS2JAH01mkh24DUV6dQXVWgdq22oT1HMNIl0YbjZ95BSLkWeaDwjZUYo6E
JNObPfzh+IxdnMoPFJhc145gV90dSYScxU9qqvqm8hsqx+keXHzKv7Tb1hWehmkR
Rs+yaW13jh1FeF60BoB1eaEC39gneLcscefYw+8M+R2rx1BBD4SJyGOmXezTy/42
yaD/Q95qYo958Cz6JkLvuIz/gW5LRDILr2Flzknzib4iNOmzlLXkApNEqQzcaM1K
f33YW2nQR776j/W77mM/2HHrqAtRFAEBBBRVBbIpXWWEI05iyX3Inrac87luu60D
1p+Gmspb+H0KTuqD0JTrZs71aqWq4/9ZBaNQ0ITn7wXwcPno+rptq61P0snN/2XS
NcChgcd/npTv02fCLivm9a2K9AznIbs+ZbfC1Ss32/7fUGsSN5gvyUZ+Ew/Skd8P
5JYdypGh8iIxTlCQVjkP6Gyy1W3+cIk7hwBKL+pw/b70e7Z/Zry3H+bkJD8LuCsa
XyucLKt+L6QoaUZQ3VwGqaMCY+3V6KjKrEQKWJte87VS7mS/qSiDouQq1FlND8hn
g7tNUBpd9JQpu8Ht1MFQ
=Dtbv
-----END PGP SIGNATURE-----

--+9faIjRurCDpBc7U--
