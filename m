Return-Path: <linux-media-owner@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: vsp1: Document max_width restriction on UDS
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20180914142652.30484-1-kieran.bingham+renesas@ideasonboard.com>
 <20180914142652.30484-2-kieran.bingham+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <07c61a65-51fd-f01a-2f96-d9eac1e7c098@cogentembedded.com>
Date: Fri, 14 Sep 2018 19:56:37 +0300
MIME-Version: 1.0
In-Reply-To: <20180914142652.30484-2-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 09/14/2018 05:26 PM, Kieran Bingham wrote:

> The UDS is currently restricted based on a partition size of 256 pixels.
> Document the actual restrictions, but don't increase the implementation.
> 
> The extended partition algorithm may later choose to utilise a larger
> partition size to support overlapping partitions which will improve the
> quality of the output images.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/vsp1/vsp1_uds.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
> index 75c613050151..e8340de85813 100644
> --- a/drivers/media/platform/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/vsp1/vsp1_uds.c
> @@ -342,6 +342,14 @@ static unsigned int uds_max_width(struct vsp1_entity *entity,
>  					    UDS_PAD_SOURCE);
>  	hscale = output->width / input->width;
>  
> +	/*
> +	 * The maximum width of the UDS is 304 pixels. These are input pixels
> +	 * in the event of up-scaling, and output pixels in the event of
> +	 * downscaling.
> +	 *
> +	 * To support overlapping parition windows we clamp at units of 256 and

   Partition.

> +	 * the remaining pixels are reserved.
> +	 */
>  	if (hscale <= 2)
>  		return 256;
>  	else if (hscale <= 4)

MBR, Sergei
