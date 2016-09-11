Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
Subject: Re: [PATCH v3 09/10] v4l: fdp1: Fix field validation when preparing
 buffer
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
References: <1473287110-780-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1473287110-780-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <733020cd-f1b8-ff0c-0d95-1d205a67d38a@bingham.xyz>
Date: Sun, 11 Sep 2016 17:45:51 +0100
MIME-Version: 1.0
In-Reply-To: <1473287110-780-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/09/16 23:25, Laurent Pinchart wrote:
> Ensure that the buffer field matches the field configured for the
> format.

Looks OK and tests fine.

I think with the field 'serialiser' the driver didn't actually care what
the buffers put in were (as long as they were sequential) but it
certainly isn't a bad thing to verify they are what we were told they
would be :D

--
Reviewed-by: Kieran Bingham <kieran@bingham.xyz>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/rcar_fdp1.c | 40 +++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 480f89381f15..c25531a919db 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -1884,17 +1884,43 @@ static int fdp1_buf_prepare(struct vb2_buffer *vb)
>  
>  	q_data = get_q_data(ctx, vb->vb2_queue->type);
>  
> -	/* Default to Progressive if ANY selected */
> -	if (vbuf->field == V4L2_FIELD_ANY)
> -		vbuf->field = V4L2_FIELD_NONE;
> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +		bool field_valid = true;
> +
> +		/* Validate the buffer field. */
> +		switch (q_data->format.field) {
> +		case V4L2_FIELD_NONE:
> +			if (vbuf->field != V4L2_FIELD_NONE)
> +				field_valid = false;
> +			break;
> +
> +		case V4L2_FIELD_ALTERNATE:
> +			if (vbuf->field != V4L2_FIELD_TOP &&
> +			    vbuf->field != V4L2_FIELD_BOTTOM)
> +				field_valid = false;
> +			break;
>  
> -	/* We only support progressive CAPTURE */
> -	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type) &&
> -	     vbuf->field != V4L2_FIELD_NONE) {
> -		dprintk(ctx->fdp1, "field isn't supported on capture\n");
> +		case V4L2_FIELD_INTERLACED:
> +		case V4L2_FIELD_SEQ_TB:
> +		case V4L2_FIELD_SEQ_BT:
> +		case V4L2_FIELD_INTERLACED_TB:
> +		case V4L2_FIELD_INTERLACED_BT:
> +			if (vbuf->field != q_data->format.field)
> +				field_valid = false;
> +			break;
> +		}
> +
> +		if (!field_valid) {
> +			dprintk(ctx->fdp1,
> +				"buffer field %u invalid for format field %u\n",
> +				vbuf->field, q_data->format.field);
>  			return -EINVAL;
> +		}
> +	} else {
> +		vbuf->field = V4L2_FIELD_NONE;
>  	}
>  
> +	/* Validate the planes sizes. */
>  	for (i = 0; i < q_data->format.num_planes; i++) {
>  		unsigned long size = q_data->format.plane_fmt[i].sizeimage;
>  
> 

-- 
Regards

Kieran Bingham
