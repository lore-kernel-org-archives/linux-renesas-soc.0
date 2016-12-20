Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45604 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754784AbcLTNUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 08:20:39 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 04/13] drm: Add data mirror bus flag
Date: Tue, 20 Dec 2016 15:21:07 +0200
Message-ID: <2022101.xOBCGyn98G@avalon>
In-Reply-To: <127f384d92291ce5d9447b763340432c@agner.ch>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1945420.2ppkyQgY5N@avalon> <127f384d92291ce5d9447b763340432c@agner.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Stefan,

Thank you for the review.

On Tuesday 20 Dec 2016 14:01:46 Stefan Agner wrote:
> On 2016-12-18 21:31, Laurent Pinchart wrote:
> > Hi Stefan and Thierry,
> > 
> > As the author and suggester of the other bus flags, could you please
> > review this patch ?
> 
> It looks to me like an appropriate use case for the flag. One remark
> below:
>
> > On Saturday 19 Nov 2016 05:28:04 Laurent Pinchart wrote:
> >> The flag indicates that data is mirrored on the bus. The exact meaning
> >> is bus-type dependent. For LVDS buses it indicates that the seven data
> >> bits that transmitted in a clock pulse are sent in slots 6 to 0 order.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> >> ---
> >> 
> >>  include/drm/drm_connector.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >> index ac9d7d8e0e43..5c1dda236760 100644
> >> --- a/include/drm/drm_connector.h
> >> +++ b/include/drm/drm_connector.h
> >> @@ -159,6 +159,8 @@ struct drm_display_info {
> >> 
> >>  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
> >>  /* drive data on neg. edge */
> >>  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> >> 
> >> +/* data is mirrored on the bus */
> >> +#define DRM_BUS_FLAG_DATA_MIRROR	(1<<4)
> 
> Sounds like a bit endianness issue. I am wondering is if "mirror" is a
> good term. Can we name the possible orderings? How about:
> 
> DRM_BUS_FLAG_DATA_MSB_TO_LSB
> DRM_BUS_FLAG_DATA_LSB_TO_MSB

LVDS display buses send pixels in RGB666 or RGB888 as follows.

- "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
  [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.

Slot	    0       1       2       3       4       5       6
	________________                         _________________
Clock	                \_______________________/
	  ______  ______  ______  ______  ______  ______  ______
DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><

- "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
  specifications. Data are transferred as follows on 4 LVDS lanes.

Slot	    0       1       2       3       4       5       6
	________________                         _________________
Clock	                \_______________________/
	  ______  ______  ______  ______  ______  ______  ______
DATA0	><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
DATA1	><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
DATA2	><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
DATA3	><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><

- "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
  Data are transferred as follows on 4 LVDS lanes.

Slot	    0       1       2       3       4       5       6
	________________                         _________________
Clock	                \_______________________/
	  ______  ______  ______  ______  ______  ______  ______
DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
DATA3	><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><


Mirroring flips slots 0 to 6, resulting in a sort of LSB to MSB transmission 
(I'm not sure I'd call that endianness though). I'm fine renaming the flag as 
you propose. Do we need two flags, or should we assume MSB to LSB by default 
and add a single flag ?

> >>  	/**
> >>  	 * @bus_flags: Additional information (like pixel signal polarity) for

-- 
Regards,

Laurent Pinchart
