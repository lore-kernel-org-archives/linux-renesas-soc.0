Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56917 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756694AbcKKOxM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 09:53:12 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/3] gen-image: support overlapping hue areas for HGT frames
Date: Fri, 11 Nov 2016 16:53:15 +0200
Message-ID: <1698950.0rCCZ65UiF@avalon>
In-Reply-To: <20161004130915.28812-2-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se> <20161004130915.28812-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Tuesday 04 Oct 2016 15:09:13 Niklas S=F6derlund wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The HGT can operate with hue areas which are not directly adjoined. I=
n
> this mode of operation hue values which are between two areas are

s/which/that/g

> attributed to both areas with a weight for the final histogram.
>=20
> Add support to generate such histograms using gen-image which can be
> used to verify correct operation of the HGT. Previously gen-image cou=
ld
> only generate histograms with adjoined areas.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>
> ---
>  src/gen-image.c | 98 +++++++++++++++++++++++++++++++++++++++++++----=
-------
>  1 file changed, 79 insertions(+), 19 deletions(-)
>=20
> diff --git a/src/gen-image.c b/src/gen-image.c
> index 688f602..9cd5eb9 100644
> --- a/src/gen-image.c
> +++ b/src/gen-image.c
> @@ -1301,7 +1301,7 @@ static void histogram_compute_hgt(const struct =
image
> *image, void *histo, uint8_t rgb[3], hsv[3], smin =3D 255, smax =3D 0=
;
>  =09uint32_t sum =3D 0, hist[6][32];
>  =09unsigned int x, y, i;
> -=09int m, n;
> +=09unsigned int hist_n, hue_pos;
>=20
>  =09memset(hist, 0x00, sizeof(hist));
>=20
> @@ -1317,24 +1317,84 @@ static void histogram_compute_hgt(const struc=
t image
> *image, void *histo, smax =3D max(smax, hsv[1]);
>  =09=09=09sum +=3D hsv[1];
>=20
> -=09=09=09/* Find m and n for hist */
> -=09=09=09m =3D n =3D -1;
> -=09=09=09for (i =3D 0; i < 6  && m =3D=3D -1; i++)
> -=09=09=09=09if (hsv[0] >=3D hue_areas[i*2] && (hsv[0] <=3D=20
hue_areas[i*2+1]))
> -=09=09=09=09=09m =3D i;
> -=09=09=09for (i =3D 0; i < 32 && n =3D=3D -1; i++)
> -=09=09=09=09if ((hsv[1] >=3D 8*i) && (hsv[1] < 8 * (i+1)))
> -=09=09=09=09=09n =3D i;
> +=09=09=09/* Find n for hist */

How about "Compute the n coordinate of the histogram bucket" ?

> +=09=09=09hist_n =3D hsv[1] / 8;
>=20
>  =09=09=09/*
> -=09=09=09 * The HW supports a declining weight to be applied
> -=09=09=09 * when hue areas are not directly adjoined. This
> -=09=09=09 * test can not replicated this, the hue areas need
> -=09=09=09 * to be set without any gaps else the weights from HW
> -=09=09=09 * will be wrong. Max weight is 16.
> +=09=09=09 * Find position in hue areas which is greater than=20
the

s/which/that/

https://en.oxforddictionaries.com/usage/that-or-which

> +=09=09=09 * current H value. Special consideration is needed=20
for:
> +=09=09=09 *
> +=09=09=09 * - Values inside a hue area are inclusive, values=20
that
> +=09=09=09 *   are between two hue areas are exclusive.
> +=09=09=09 * - Hue area 0 can wrap around the H value space, for
> +=09=09=09 *   example include values greater then 240 but less

s/then/than/
s/but/and/

> +=09=09=09 *   then 30.
>  =09=09=09 */
> -=09=09=09if (m !=3D -1 && n !=3D -1)
> -=09=09=09=09hist[m][n] +=3D 16;
> +=09=09=09for (i =3D 0; i < 12; i++) {
> +
> +=09=09=09=09/* Special cases when area 0 wraps around */
> +=09=09=09=09if (hue_areas[0] > hue_areas[1]) {
> +
> +=09=09=09=09=09/* Check if pixel is inside the=20
wrapped area 0 */
> +=09=09=09=09=09if (hsv[0] > hue_areas[0] || hsv[0] <=3D=20
hue_areas[1]) {
> +=09=09=09=09=09=09hue_pos =3D 1;
> +=09=09=09=09=09=09break;
> +=09=09=09=09=09}
> +
> +=09=09=09=09=09/* Exclude first area point from=20
normal logic */
> +=09=09=09=09=09if (!i)
> +=09=09=09=09=09=09continue;
> +=09=09=09=09}
> +
> +=09=09=09=09/* Check if H is inside one of the hue areas=20
*/
> +=09=09=09=09if ((hsv[0] < hue_areas[i]) || (i % 2 &&=20
hsv[0] =3D=3D hue_areas[i])) {
> +=09=09=09=09=09hue_pos =3D i;
> +=09=09=09=09=09break;
> +=09=09=09=09}
> +
> +=09=09=09=09/* Check if H is larger then area 5 */
> +=09=09=09=09if (hsv[0] > hue_areas[11]) {
> +=09=09=09=09=09hue_pos =3D 0;
> +=09=09=09=09=09break;
> +=09=09=09=09}
> +=09=09=09}

What would you think about precomputing the hue pos values for hue valu=
es 0 to=20
255 and just indexing that table ? That should be faster at runtime, wi=
th an=20
additional memory consumption of 256 bytes, which seems quite negligibl=
e to=20
me. I can fix that as an additional patch.

> +
> +=09=09=09/*
> +=09=09=09 * Figure out which areas the current H value should=20
be
> +=09=09=09 * attributed to. If the H value is inside one of the
> +=09=09=09 * areas the max weight (16) is attributed to it else
> +=09=09=09 * the weight is split between them based on how close
> +=09=09=09 * the H value is to each area.
> +=09=09=09 *
> +=09=09=09 * If ''hue_pos'' are odd the H value is inside an

s/are/is/

> area and
> +=09=09=09 * it should be attributed the full weight to area=20
hue_pos/2
> +=09=09=09 * else it should be split between area hue_pos/2 and

s/area/areas/

> +=09=09=09 * hue_pos/2 - 1.
> +=09=09=09 */
> +=09=09=09if (hue_pos % 2) {
> +=09=09=09=09hist[hue_pos/2][hist_n] +=3D 16;
> +=09=09=09} else {
> +=09=09=09=09unsigned int hue1, hue2;
> +=09=09=09=09unsigned int length, width, weight;

I'd name the variable dist(ance) as it's not a length.

I can fix all this when applying, no need to resubmit.

> +
> +=09=09=09=09hue1 =3D hue_areas[hue_pos ? hue_pos - 1 : 11];
> +=09=09=09=09hue2 =3D hue_areas[hue_pos];
> +
> +=09=09=09=09/* Calculate the total width between the two=20
areas */
> +=09=09=09=09width =3D hue2 - hue1 + (hue1 > hue2 ? 256 : 0);
> +
> +=09=09=09=09/* Calculate the length to the right most area=20
*/
> +=09=09=09=09if (hue1 > hue2 && hsv[0] > hue1)
> +=09=09=09=09=09length =3D width - (hsv[0] - hue1);
> +=09=09=09=09else
> +=09=09=09=09=09length =3D abs(hsv[0] - hue2);
> +
> +=09=09=09=09/* Calculate weight and round up */
> +=09=09=09=09weight =3D (length * 16 + width - 1) / width;
> +=09=09=09=09/* Split weight between the two areas */
> +=09=09=09=09hist[hue_pos ? hue_pos/2 - 1 : 5][hist_n] +=3D=20
weight;
> +=09=09=09=09hist[hue_pos/2][hist_n] +=3D 16 - weight;
> +=09=09=09}
>  =09=09}
>  =09}
>=20
> @@ -1349,9 +1409,9 @@ static void histogram_compute_hgt(const struct =
image
> *image, void *histo, histo +=3D 4;
>=20
>  =09/* Weighted Frequency of Hue Area-m and Saturation Area-n */
> -=09for (m =3D 0; m < 6; m++) {
> -=09=09for (n =3D 0; n < 32; n++) {
> -=09=09=09*(uint32_t *)histo =3D hist[m][n];
> +=09for (x =3D 0; x < 6; x++) {
> +=09=09for (y =3D 0; y < 32; y++) {
> +=09=09=09*(uint32_t *)histo =3D hist[x][y];
>  =09=09=09histo +=3D 4;
>  =09=09}
>  =09}

--=20
Regards,

Laurent Pinchart
