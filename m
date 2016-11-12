Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33479 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935171AbcKLKbP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Nov 2016 05:31:15 -0500
Received: by mail-lf0-f46.google.com with SMTP id c13so28407400lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Nov 2016 02:31:13 -0800 (PST)
Date: Sat, 12 Nov 2016 11:31:11 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] gen-image: support overlapping hue areas for HGT
 frames
Message-ID: <20161112103111.GB3834@bigcity.dyn.berto.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
 <20161004130915.28812-2-niklas.soderlund@ragnatech.se>
 <1698950.0rCCZ65UiF@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1698950.0rCCZ65UiF@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the feedback.

On 2016-11-11 16:53:15 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Tuesday 04 Oct 2016 15:09:13 Niklas S�derlund wrote:
> > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > The HGT can operate with hue areas which are not directly adjoined. In
> > this mode of operation hue values which are between two areas are
> 
> s/which/that/g
> 
> > attributed to both areas with a weight for the final histogram.
> > 
> > Add support to generate such histograms using gen-image which can be
> > used to verify correct operation of the HGT. Previously gen-image could
> > only generate histograms with adjoined areas.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  src/gen-image.c | 98 +++++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 79 insertions(+), 19 deletions(-)
> > 
> > diff --git a/src/gen-image.c b/src/gen-image.c
> > index 688f602..9cd5eb9 100644
> > --- a/src/gen-image.c
> > +++ b/src/gen-image.c
> > @@ -1301,7 +1301,7 @@ static void histogram_compute_hgt(const struct image
> > *image, void *histo, uint8_t rgb[3], hsv[3], smin = 255, smax = 0;
> >  	uint32_t sum = 0, hist[6][32];
> >  	unsigned int x, y, i;
> > -	int m, n;
> > +	unsigned int hist_n, hue_pos;
> > 
> >  	memset(hist, 0x00, sizeof(hist));
> > 
> > @@ -1317,24 +1317,84 @@ static void histogram_compute_hgt(const struct image
> > *image, void *histo, smax = max(smax, hsv[1]);
> >  			sum += hsv[1];
> > 
> > -			/* Find m and n for hist */
> > -			m = n = -1;
> > -			for (i = 0; i < 6  && m == -1; i++)
> > -				if (hsv[0] >= hue_areas[i*2] && (hsv[0] <= 
> hue_areas[i*2+1]))
> > -					m = i;
> > -			for (i = 0; i < 32 && n == -1; i++)
> > -				if ((hsv[1] >= 8*i) && (hsv[1] < 8 * (i+1)))
> > -					n = i;
> > +			/* Find n for hist */
> 
> How about "Compute the n coordinate of the histogram bucket" ?
> 
> > +			hist_n = hsv[1] / 8;
> > 
> >  			/*
> > -			 * The HW supports a declining weight to be applied
> > -			 * when hue areas are not directly adjoined. This
> > -			 * test can not replicated this, the hue areas need
> > -			 * to be set without any gaps else the weights from HW
> > -			 * will be wrong. Max weight is 16.
> > +			 * Find position in hue areas which is greater than 
> the
> 
> s/which/that/
> 
> https://en.oxforddictionaries.com/usage/that-or-which

Thanks, you learn something new everyday. I'm truly grateful for this 
kind of feedback.

> 
> > +			 * current H value. Special consideration is needed 
> for:
> > +			 *
> > +			 * - Values inside a hue area are inclusive, values 
> that
> > +			 *   are between two hue areas are exclusive.
> > +			 * - Hue area 0 can wrap around the H value space, for
> > +			 *   example include values greater then 240 but less
> 
> s/then/than/
> s/but/and/
> 
> > +			 *   then 30.
> >  			 */
> > -			if (m != -1 && n != -1)
> > -				hist[m][n] += 16;
> > +			for (i = 0; i < 12; i++) {
> > +
> > +				/* Special cases when area 0 wraps around */
> > +				if (hue_areas[0] > hue_areas[1]) {
> > +
> > +					/* Check if pixel is inside the 
> wrapped area 0 */
> > +					if (hsv[0] > hue_areas[0] || hsv[0] <= 
> hue_areas[1]) {
> > +						hue_pos = 1;
> > +						break;
> > +					}
> > +
> > +					/* Exclude first area point from 
> normal logic */
> > +					if (!i)
> > +						continue;
> > +				}
> > +
> > +				/* Check if H is inside one of the hue areas 
> */
> > +				if ((hsv[0] < hue_areas[i]) || (i % 2 && 
> hsv[0] == hue_areas[i])) {
> > +					hue_pos = i;
> > +					break;
> > +				}
> > +
> > +				/* Check if H is larger then area 5 */
> > +				if (hsv[0] > hue_areas[11]) {
> > +					hue_pos = 0;
> > +					break;
> > +				}
> > +			}
> 
> What would you think about precomputing the hue pos values for hue values 0 to 
> 255 and just indexing that table ? That should be faster at runtime, with an 
> additional memory consumption of 256 bytes, which seems quite negligible to 
> me. I can fix that as an additional patch.

Yes I think that would be an improvement, both for runtime speed and 
code readability.

> 
> > +
> > +			/*
> > +			 * Figure out which areas the current H value should 
> be
> > +			 * attributed to. If the H value is inside one of the
> > +			 * areas the max weight (16) is attributed to it else
> > +			 * the weight is split between them based on how close
> > +			 * the H value is to each area.
> > +			 *
> > +			 * If ''hue_pos'' are odd the H value is inside an
> 
> s/are/is/
> 
> > area and
> > +			 * it should be attributed the full weight to area 
> hue_pos/2
> > +			 * else it should be split between area hue_pos/2 and
> 
> s/area/areas/
> 
> > +			 * hue_pos/2 - 1.
> > +			 */
> > +			if (hue_pos % 2) {
> > +				hist[hue_pos/2][hist_n] += 16;
> > +			} else {
> > +				unsigned int hue1, hue2;
> > +				unsigned int length, width, weight;
> 
> I'd name the variable dist(ance) as it's not a length.
> 
> I can fix all this when applying, no need to resubmit.

Thanks. If you get overloaded or some other issues emerge let me know 
and I will do what I can to help out.

> 
> > +
> > +				hue1 = hue_areas[hue_pos ? hue_pos - 1 : 11];
> > +				hue2 = hue_areas[hue_pos];
> > +
> > +				/* Calculate the total width between the two 
> areas */
> > +				width = hue2 - hue1 + (hue1 > hue2 ? 256 : 0);
> > +
> > +				/* Calculate the length to the right most area 
> */
> > +				if (hue1 > hue2 && hsv[0] > hue1)
> > +					length = width - (hsv[0] - hue1);
> > +				else
> > +					length = abs(hsv[0] - hue2);
> > +
> > +				/* Calculate weight and round up */
> > +				weight = (length * 16 + width - 1) / width;
> > +				/* Split weight between the two areas */
> > +				hist[hue_pos ? hue_pos/2 - 1 : 5][hist_n] += 
> weight;
> > +				hist[hue_pos/2][hist_n] += 16 - weight;
> > +			}
> >  		}
> >  	}
> > 
> > @@ -1349,9 +1409,9 @@ static void histogram_compute_hgt(const struct image
> > *image, void *histo, histo += 4;
> > 
> >  	/* Weighted Frequency of Hue Area-m and Saturation Area-n */
> > -	for (m = 0; m < 6; m++) {
> > -		for (n = 0; n < 32; n++) {
> > -			*(uint32_t *)histo = hist[m][n];
> > +	for (x = 0; x < 6; x++) {
> > +		for (y = 0; y < 32; y++) {
> > +			*(uint32_t *)histo = hist[x][y];
> >  			histo += 4;
> >  		}
> >  	}
> 

-- 
Regards,
Niklas S�derlund
