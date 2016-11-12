Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58099 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935102AbcKLCGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 21:06:21 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/3] tests: add hue area wraparound test for HGT
Date: Sat, 12 Nov 2016 04:06:26 +0200
Message-ID: <13106990.jD6746NgdK@avalon>
In-Reply-To: <20161004130915.28812-3-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se> <20161004130915.28812-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Tuesday 04 Oct 2016 15:09:14 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> One configuration for HGT histograms are where hue area 0 is wrapped

s/is/

> around the hue input value space (0-255), for example area 0 can cove=
r
> hue values above 220 but bellow 40. Hue area 0 is the only area which=


s/bellow/below/

> supports this mode where the areas lower limit uses a higher value th=
en

s/areas/area's/
s/then/than/

> it's higher limit hence the area wraparound the max hue value.

s/it's/its/
s/wraparound/wraps around/

I'll fix this while applying.

> Add a test to verify this works now that gen-image supports generatin=
g
> reference frames with wrapped around hue areas.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/vsp-unit-test-0018.sh | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.s=
h
> index 2b49b54..944f7ac 100755
> --- a/tests/vsp-unit-test-0018.sh
> +++ b/tests/vsp-unit-test-0018.sh
> @@ -31,6 +31,7 @@ test_histogram() {
>  test_main() {
>  =09test_histogram "0,255,255,255,255,255,255,255,255,255,255,255"
>  =09test_histogram "0,40,40,80,80,120,120,160,160,200,200,255"
> +=09test_histogram "220,40,40,80,80,120,120,160,160,200,200,220"
>  }
>=20
>  test_init $0 "$features"

--=20
Regards,

Laurent Pinchart
