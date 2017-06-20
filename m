Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49337 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750925AbdFTHrq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:47:46 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 03/12] media: i2c: mt9m111: Skip chid identification
Date: Tue, 20 Jun 2017 10:48:21 +0300
Message-ID: <3719659.Y7GHEXHMmq@avalon>
In-Reply-To: <1497891889-8038-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org> <1497891889-8038-4-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Monday 19 Jun 2017 19:04:40 Jacopo Mondi wrote:
> Reads of chip identification code (both on registers 0x00 and 0xff)
> always return 0x00.

This shouldn't be the case. It might mean that your I2C master controller 
doesn't handle reads correctly. I don't think this patch is correct.

> Skip chip identification to have the device complete probing.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/mt9m111.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 72e71b7..8e86d51 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -890,31 +890,12 @@ static struct v4l2_subdev_ops mt9m111_subdev_ops = {
>  static int mt9m111_video_probe(struct i2c_client *client)
>  {
>  	struct mt9m111 *mt9m111 = to_mt9m111(client);
> -	s32 data;
>  	int ret;
> 
>  	ret = mt9m111_s_power(&mt9m111->subdev, 1);
>  	if (ret < 0)
>  		return ret;
> 
> -	data = reg_read(CHIP_VERSION);
> -
> -	switch (data) {
> -	case 0x143a: /* MT9M111 or MT9M131 */
> -		dev_info(&client->dev,
> -			"Detected a MT9M111/MT9M131 chip ID %x\n", data);
> -		break;
> -	case 0x148c: /* MT9M112 */
> -		dev_info(&client->dev, "Detected a MT9M112 chip ID %x\n", 
data);
> -		break;
> -	default:
> -		dev_err(&client->dev,
> -			"No MT9M111/MT9M112/MT9M131 chip detected register 
read %x\n",
> -			data);
> -		ret = -ENODEV;
> -		goto done;
> -	}
> -
>  	ret = mt9m111_init(mt9m111);
>  	if (ret)
>  		goto done;

-- 
Regards,

Laurent Pinchart
