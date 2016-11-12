Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58107 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965201AbcKLCIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 21:08:05 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 3/3] tests: add none adjoined hue areas test for HGT
Date: Sat, 12 Nov 2016 04:07:18 +0200
Message-ID: <1942403.EWoM0tXlBh@avalon>
In-Reply-To: <20161004130915.28812-4-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se> <20161004130915.28812-4-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday 04 Oct 2016 15:09:15 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The HGT can be configured in such a way that the 6 user configurable =
hue
> areas are not joined next to each other. In such cases a hue value
> outside of a hue area should be attributed with a weight to both its
> adjoining hue areas.
>=20
> Add a test to verify this works now that gen-image supports generatin=
g
> reference frames for none adjoined hue areas.

s/none/non/

I'll fix this when applying.

> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/vsp-unit-test-0018.sh | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.s=
h
> index 944f7ac..c0aba4b 100755
> --- a/tests/vsp-unit-test-0018.sh
> +++ b/tests/vsp-unit-test-0018.sh
> @@ -32,6 +32,9 @@ test_main() {
>  =09test_histogram "0,255,255,255,255,255,255,255,255,255,255,255"
>  =09test_histogram "0,40,40,80,80,120,120,160,160,200,200,255"
>  =09test_histogram "220,40,40,80,80,120,120,160,160,200,200,220"
> +=09test_histogram "0,10,50,60,100,110,150,160,200,210,250,255"
> +=09test_histogram "10,20,50,60,100,110,150,160,200,210,230,240"
> +=09test_histogram "240,20,60,80,100,120,140,160,180,200,210,220"
>  }
>=20
>  test_init $0 "$features"

--=20
Regards,

Laurent Pinchart
