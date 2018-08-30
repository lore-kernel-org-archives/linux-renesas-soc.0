Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbeH3UP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 16:15:26 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] drm: rcar-du: Write ESCR register per channel
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>
References: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
 <1534922509-15197-3-git-send-email-jacopo+renesas@jmondi.org>
 <88cc862b-cb07-8b1d-63ca-08f0c67f2337@ideasonboard.com>
Message-ID: <dcf2c007-c4e6-e82b-cb3c-cee6f6a8af1d@ideasonboard.com>
Date: Thu, 30 Aug 2018 17:12:29 +0100
MIME-Version: 1.0
In-Reply-To: <88cc862b-cb07-8b1d-63ca-08f0c67f2337@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On 30/08/18 17:00, Kieran Bingham wrote:
> Hi Jacopo,
> 
> On 22/08/18 08:21, Jacopo Mondi wrote:
>> The ESCR registers offset definition is confusing, as each channel is
>> equipped with an ESCR register instance, but the names suggest only ESCR and
>> ESCR2 are taken into account.
>>
>> Rename the offsets to a name that includes the channels they apply to, and
>> write them to each channel with 'rcar_du_crtc_write()'.
>>
>> Cosmetic patch, no functional changes intended.
> 
> Noted, ...
> 
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +--
>>  drivers/gpu/drm/rcar-du/rcar_du_regs.h | 4 ++--
>>  2 files changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> index 5454884..714c1fc 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -294,8 +294,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>>  		}
>>  	}
>>  
>> -	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? ESCR2 : ESCR,
>> -			    escr);
>> +	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);

>>  	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
>>  
>>  	/* Signal polarities */
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> index 9dfd220..ebc4aea 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>> @@ -492,8 +492,8 @@
>>   * External Synchronization Control Registers
>>   */
>>  
>> -#define ESCR			0x10000
>> -#define ESCR2			0x31000
>> +#define ESCR02			0x10000
>> +#define ESCR13			0x01000
> 
> Assertion failed at:
>  ASSERT(ESCR2 == ESCR13)
> 
> This looks intentional ?
> but that makes this a bit more than a cosmetic change?

Aha - sorry - I see.

It looks like the '0x3' from '0x31000' was providing the offset into the
group I assume.


I'm surprised an equivalent offset wasn't removed from the ESCR02.

But I assume this is handled by the change of "rcar_du_crtc_write() ->
rcar_du_group_write()"?

Regards

Kieran



> 
> 
> 
> 
>>  #define ESCR_DCLKOINV		(1 << 25)
>>  #define ESCR_DCLKSEL_DCLKIN	(0 << 20)
>>  #define ESCR_DCLKSEL_CLKS	(1 << 20)
>>
> 
