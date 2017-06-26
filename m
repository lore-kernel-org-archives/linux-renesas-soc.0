Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:34799 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751855AbdFZNTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 09:19:33 -0400
Date: Mon, 26 Jun 2017 15:19:24 +0200
From: jmondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 03/12] media: i2c: mt9m111: Skip chid identification
Message-ID: <20170626131924.GA11157@w540>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-4-git-send-email-jacopo+renesas@jmondi.org>
 <3719659.Y7GHEXHMmq@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3719659.Y7GHEXHMmq@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Jun 20, 2017 at 10:48:21AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Monday 19 Jun 2017 19:04:40 Jacopo Mondi wrote:
> > Reads of chip identification code (both on registers 0x00 and 0xff)
> > always return 0x00.
>
> This shouldn't be the case. It might mean that your I2C master controller
> doesn't handle reads correctly. I don't think this patch is correct.

Indeed this patch was not meant for inclusion (as it is part of an RFC series)
but I still fail to read the chip identifier even when using a tool to
sniff the bus or talk directly to the chip (I'm using bus pirate
for this purpose).

What puzzles me is that I get back reads from some registers that match the
defaults reported by the data sheet, while other registers return
meaningful values but different from what I have indicated as defaults
in the sensor manual, while chip identifier reads always back as 0x00.

I am pasting some examples down here of some interactions with the
chip using bus pirate serial control console [1]

I wonder if I am working with a different chip revision from the one
the driver and the datasheet have as reference, but it really seems
unlikely to me..

Thanks
   j


[1]
** Read register 0x106: expected value 0x700E -> got it!
I2C>[0x90+0xf0+0x00+0x1]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0xF0 ACK
WRITE: 0x00 ACK
WRITE: 0x01 ACK
I2C STOP BIT
I2C>[0x90+0x06+[0x91+rr]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0x06 ACK
I2C START BIT
WRITE: 0x91 ACK
READ: 0x70
READ:  ACK 0x0E
NACK
I2C STOP BIT

** Read register 0x108: expected value 0x0080 -> got 0xc800
I2C>[0x90+0xf0+0x00+0x1]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0xF0 ACK
WRITE: 0x00 ACK
WRITE: 0x01 ACK
I2C STOP BIT
I2C>[0x90+0x08+[0x91+rr]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0x08 ACK
I2C START BIT
WRITE: 0x91 ACK
READ: 0xC8
READ:  ACK 0x00
NACK
I2C STOP BIT

** Read Chip ID: expected value 0x143a -> got 0x0000
I2C>[0x90+0xf0+0x00+0x0]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0xF0 ACK
WRITE: 0x00 ACK
WRITE: 0x00 ACK
I2C STOP BIT
I2C>[0x90+0x00+[0x91+rr]
I2C START BIT
WRITE: 0x90 ACK
WRITE: 0x00 ACK
I2C START BIT
WRITE: 0x91 ACK
READ: 0x00
READ:  ACK 0x00
NACK
I2C STOP BIT

>
> > Skip chip identification to have the device complete probing.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/mt9m111.c | 19 -------------------
> >  1 file changed, 19 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> > index 72e71b7..8e86d51 100644
> > --- a/drivers/media/i2c/mt9m111.c
> > +++ b/drivers/media/i2c/mt9m111.c
> > @@ -890,31 +890,12 @@ static struct v4l2_subdev_ops mt9m111_subdev_ops = {
> >  static int mt9m111_video_probe(struct i2c_client *client)
> >  {
> >  	struct mt9m111 *mt9m111 = to_mt9m111(client);
> > -	s32 data;
> >  	int ret;
> >
> >  	ret = mt9m111_s_power(&mt9m111->subdev, 1);
> >  	if (ret < 0)
> >  		return ret;
> >
> > -	data = reg_read(CHIP_VERSION);
> > -
> > -	switch (data) {
> > -	case 0x143a: /* MT9M111 or MT9M131 */
> > -		dev_info(&client->dev,
> > -			"Detected a MT9M111/MT9M131 chip ID %x\n", data);
> > -		break;
> > -	case 0x148c: /* MT9M112 */
> > -		dev_info(&client->dev, "Detected a MT9M112 chip ID %x\n",
> data);
> > -		break;
> > -	default:
> > -		dev_err(&client->dev,
> > -			"No MT9M111/MT9M112/MT9M131 chip detected register
> read %x\n",
> > -			data);
> > -		ret = -ENODEV;
> > -		goto done;
> > -	}
> > -
> >  	ret = mt9m111_init(mt9m111);
> >  	if (ret)
> >  		goto done;
>
> --
> Regards,
>
> Laurent Pinchart
>
