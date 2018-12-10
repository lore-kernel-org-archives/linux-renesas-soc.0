Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58360 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbeLJObT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 09:31:19 -0500
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] media: i2c: adv748x: Fix video standard selection
 register setting
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <20181210122901.14600-1-kieran.bingham+renesas@ideasonboard.com>
 <20181210125533.GI17972@bigcity.dyn.berto.se>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <262d2daf-eb5b-26ec-aba0-19f5101758a7@ideasonboard.com>
Date: Mon, 10 Dec 2018 14:31:14 +0000
MIME-Version: 1.0
In-Reply-To: <20181210125533.GI17972@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On 10/12/2018 12:55, Niklas Söderlund wrote:
> Hi Koji-san, Kieran(-san),
> 
> Thanks for your work.
> 
> On 2018-12-10 12:29:01 +0000, Kieran Bingham wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> The ADV7481 Register Control Manual states that bit 2 in the Video
>> Standard Selection register is reserved with the value of 1.
>>
>> The bit is otherwise undocumented, and currently cleared by the driver
>> when setting the video standard selection.
>>
>> Define the bit as reserved, and ensure that it is always set when
>> writing to the SDP_VID_SEL register.
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> [Kieran: Updated commit message, utilised BIT macro]
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/media/i2c/adv748x/adv748x-afe.c | 3 ++-
>>  drivers/media/i2c/adv748x/adv748x.h     | 1 +
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
>> index 71714634efb0..c4d9ffc50702 100644
>> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
>> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
>> @@ -151,7 +151,8 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
>>  					  int sdpstd)
>>  {
>>  	sdp_clrset(state, ADV748X_SDP_VID_SEL, ADV748X_SDP_VID_SEL_MASK,
>> -		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
>> +		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT |
>> +		   ADV748X_SDP_VID_RESERVED_BIT);
> 
> Is this really needed? In practice the adv748x driver never touches the 
> reserved bit and this special handling *should* not be needed :-)


Excellent observation. I somehow assumed we were doing a straight write
here.


>   #define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)
> 
> The full 'user_map_rw_reg_02' register where the upper 4 bits are 
> vid_sel subregister is read and masked. Then the value is updated with 
> the new vid_sel value and written back.
> 
> However if this is needed or fixes a real bug I'm not against this 
> change but in such case I feel the mask should be updated to reflect 
> which bits are touched.

The mask is defined as:

#define ADV748X_SDP_VID_SEL_MASK        0xf0

Which indeed covers only the VID_SEL bits, and ensures that the reserved
bit is left alone.

If the hardware initialises this bit, then it will remain set. If not -
then the bit will remain unset. I think that's perfectly acceptable for
an undocumented bit, so lets drop this patch.

--
Regards

Kieran



> 
>>  }
>>  
>>  static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
>> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
>> index b482c7fe6957..778aa55a741a 100644
>> --- a/drivers/media/i2c/adv748x/adv748x.h
>> +++ b/drivers/media/i2c/adv748x/adv748x.h
>> @@ -265,6 +265,7 @@ struct adv748x_state {
>>  #define ADV748X_SDP_INSEL		0x00	/* user_map_rw_reg_00 */
>>  
>>  #define ADV748X_SDP_VID_SEL		0x02	/* user_map_rw_reg_02 */
>> +#define ADV748X_SDP_VID_RESERVED_BIT	BIT(2)	/* undocumented reserved bit */
>>  #define ADV748X_SDP_VID_SEL_MASK	0xf0
>>  #define ADV748X_SDP_VID_SEL_SHIFT	4
>>  
>> -- 
>> 2.17.1
>>
> 
