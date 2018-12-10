Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47079 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbeLJMzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:55:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id v15-v6so9472459ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 04:55:35 -0800 (PST)
Date: Mon, 10 Dec 2018 13:55:33 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2] media: i2c: adv748x: Fix video standard selection
 register setting
Message-ID: <20181210125533.GI17972@bigcity.dyn.berto.se>
References: <20181210122901.14600-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181210122901.14600-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Koji-san, Kieran(-san),

Thanks for your work.

On 2018-12-10 12:29:01 +0000, Kieran Bingham wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> The ADV7481 Register Control Manual states that bit 2 in the Video
> Standard Selection register is reserved with the value of 1.
> 
> The bit is otherwise undocumented, and currently cleared by the driver
> when setting the video standard selection.
> 
> Define the bit as reserved, and ensure that it is always set when
> writing to the SDP_VID_SEL register.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [Kieran: Updated commit message, utilised BIT macro]
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c | 3 ++-
>  drivers/media/i2c/adv748x/adv748x.h     | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index 71714634efb0..c4d9ffc50702 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -151,7 +151,8 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
>  					  int sdpstd)
>  {
>  	sdp_clrset(state, ADV748X_SDP_VID_SEL, ADV748X_SDP_VID_SEL_MASK,
> -		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
> +		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT |
> +		   ADV748X_SDP_VID_RESERVED_BIT);

Is this really needed? In practice the adv748x driver never touches the 
reserved bit and this special handling *should* not be needed :-)

  #define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)

The full 'user_map_rw_reg_02' register where the upper 4 bits are 
vid_sel subregister is read and masked. Then the value is updated with 
the new vid_sel value and written back.

However if this is needed or fixes a real bug I'm not against this 
change but in such case I feel the mask should be updated to reflect 
which bits are touched.

>  }
>  
>  static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index b482c7fe6957..778aa55a741a 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -265,6 +265,7 @@ struct adv748x_state {
>  #define ADV748X_SDP_INSEL		0x00	/* user_map_rw_reg_00 */
>  
>  #define ADV748X_SDP_VID_SEL		0x02	/* user_map_rw_reg_02 */
> +#define ADV748X_SDP_VID_RESERVED_BIT	BIT(2)	/* undocumented reserved bit */
>  #define ADV748X_SDP_VID_SEL_MASK	0xf0
>  #define ADV748X_SDP_VID_SEL_SHIFT	4
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
