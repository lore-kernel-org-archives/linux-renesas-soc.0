Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49348 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751732AbdFTHuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:50:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 04/12] media: i2c: mt9m111: Add source pad
Date: Tue, 20 Jun 2017 10:50:49 +0300
Message-ID: <2850479.zc574Vm8BG@avalon>
In-Reply-To: <1497891889-8038-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org> <1497891889-8038-5-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Monday 19 Jun 2017 19:04:41 Jacopo Mondi wrote:
> Add a single source pad to mt9m111 media entity.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/mt9m111.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 8e86d51..7e70969 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -141,6 +141,8 @@
>  #define MT9M111_MAX_HEIGHT	1024
>  #define MT9M111_MAX_WIDTH	1280
> 
> +#define MT9M111_MEDIA_PAD	1
> +
>  struct mt9m111_context {
>  	u16 read_mode;
>  	u16 blanking_h;
> @@ -215,6 +217,8 @@ struct mt9m111 {
>  	int power_count;
>  	const struct mt9m111_datafmt *fmt;
>  	int lastpage;	/* PageMap cache value */
> +
> +	struct media_pad pad;
>  };
> 
>  /* Find a data format by a pixel code */
> @@ -963,13 +967,23 @@ static int mt9m111_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		goto out_hdlfree;
> 
> +	mt9m111->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&mt9m111->subdev.entity, 
MT9M111_MEDIA_PAD,

The second argument is the number of pads, not a pad number. The macro name is 
quite confusing. Given that you use it once only, you can drop it and hardcode 
the value.

> +				     &mt9m111->pad);
> +	if (ret)
> +		goto out_hdlfree;
> +
>  	mt9m111->subdev.dev = &client->dev;
> +	mt9m111->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	mt9m111->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = v4l2_async_register_subdev(&mt9m111->subdev);
>  	if (ret < 0)
> -		goto out_hdlfree;
> +		goto out_mediafree;
> 
>  	return 0;
> 
> +out_mediafree:

Maybe out_media_cleanup ?

> +	media_entity_cleanup(&mt9m111->subdev.entity);
>  out_hdlfree:
>  	v4l2_ctrl_handler_free(&mt9m111->hdl);
>  out_clkput:
> @@ -982,6 +996,7 @@ static int mt9m111_remove(struct i2c_client *client)
>  {
>  	struct mt9m111 *mt9m111 = to_mt9m111(client);
> 
> +	media_entity_cleanup(&mt9m111->subdev.entity);
>  	v4l2_async_unregister_subdev(&mt9m111->subdev);
>  	v4l2_clk_put(mt9m111->clk);
>  	v4l2_ctrl_handler_free(&mt9m111->hdl);

-- 
Regards,

Laurent Pinchart
