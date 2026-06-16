Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061D442DFF2;
	Tue, 16 Jun 2026 11:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609412; cv=none; b=suOr0xOGcCu/ubFpdfyzu5ozVApBBJr6hGV4nLBwKv5GuJtVQ0r8xOquqQt7LbLb4x4ldEJb1+jxyZOURDeoUYE50lKMR2rVw7rhIOAg5pOm2N6fAxevEX0/BAZubg0weSO/gEei5KWiT/cM/Ao4WWituidXRiyGUhBrFS+Qw3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609412; c=relaxed/simple;
	bh=uvt/khiKnY0w7AFUK02f421WBxCy63o7mYkFHLvkdwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCi4uD/2hLteb7VVvs8nICoprwdCd5UYSMchnQOP8CjevNRbIqTln9ci8Tx9ukdK0KWrsA7gLXdh+/ncaY+K1rJz5XbWTFTaYPZLpi3xuwVd8AjALh0x058FsuG1hW6wF+Esuk3HUtRwGd+mYWETzSSMpUGBOAvsnPe9x8yVr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRvWDjN3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRvWDjN3"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB5F28FA;
	Tue, 16 Jun 2026 13:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781609375;
	bh=uvt/khiKnY0w7AFUK02f421WBxCy63o7mYkFHLvkdwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cRvWDjN3CLJSkspt4A7gX2iskxTwTiueK63g/RifWavGwv3zcSpNYnWJ29POhCX8P
	 S/2tjDINWJV45800xqADpDqqqDDCIwcaFEe+Wj9FDeBEUL7jOCmqHePXcl4pymHIhb
	 FfYdlHfuOvJ37Ileq9p5BG5715Br5PJbySgQPstU=
Message-ID: <174a5210-8f77-4bd6-b091-ed5cc1ab899d@ideasonboard.com>
Date: Tue, 16 Jun 2026 14:30:05 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] media: rcar-csi2: Add .get_frame_desc op
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
 <20260318211654.GJ716464@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260318211654.GJ716464@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/03/2026 23:16, Laurent Pinchart wrote:
> On Wed, Mar 11, 2026 at 03:53:19PM +0200, Tomi Valkeinen wrote:
>> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
>>
>> We also implement a fallback for the case where the upstream subdevice
>> does not implement .get_frame_desc. It assumes a single stream with VC =
>> 0 and DT based on the configured stream mbus format.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index ad62c95c8f9a..b8baf7c65e90 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>   	return 0;
>>   }
>>   
>> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>> +					 unsigned int pad,
>> +					 struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct v4l2_subdev_route *route;
>> +	const struct rcar_csi2_format *format;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret = 0;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	if (state->routing.num_routes != 1) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	route = &state->routing.routes[0];
>> +
>> +	if (route->source_pad != pad) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>> +					   route->sink_stream);
>> +	if (!fmt) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	format = rcsi2_code_to_fmt(fmt->code);
>> +	if (!format) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	fd->num_entries = 1;
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +	fd->entry[0].stream = route->source_stream;
>> +	fd->entry[0].pixelcode = fmt->code;
>> +	fd->entry[0].bus.csi2.vc = 0;
>> +	fd->entry[0].bus.csi2.dt = format->datatype;
>> +
>> +out:
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> +				struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> +	int ret;
>> +
>> +	if (WARN_ON(!priv->info->use_isp))
>> +		return -ENOTTY;
> 
> Why is that, can't the get frame desc operation be supported on Gen3 ?

It can, and it is, in this patch. The thing here is that 
rcsi2_get_frame_desc() is the implementation for 
v4l2_subdev_pad_ops.get_frame_desc(). On gen4, csisp calls it, but on 
gen3, there's no one to call it as on gen3 the csi2 does the demuxing.

So the above check is just a "yell if our drivers do a totally wrong thing".

>> +
>> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
>> +	if (ret == -ENOIOCTLCMD)
>> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
> 
> A dev_warn_once() would be good here, to get people to fix the source
> device driver.

Perhaps at some point, but do we want to add it already?

Hmm, actually, this will go away with Sakari's series that adds 
framework level fallback handling, so I think warning now about a thing 
that is no longer a thing in the future serves no purpose.

  Tomi

>> +	return ret;
>> +}
>> +
>>   static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>>   	.enable_streams = rcsi2_enable_streams,
>>   	.disable_streams = rcsi2_disable_streams,
>>   
>>   	.set_fmt = rcsi2_set_pad_format,
>>   	.get_fmt = v4l2_subdev_get_fmt,
>> +
>> +	.get_frame_desc = rcsi2_get_frame_desc,
>>   };
>>   
>>   static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>
> 

