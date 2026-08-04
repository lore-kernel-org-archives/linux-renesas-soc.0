Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E2340A52;
	Tue,  4 Aug 2026 02:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785810352; cv=none; b=bWgtyfsqZlWktAJdAc9gzJPnSgfPESanG6GTF2YH71U1IeIrePqmWyTDj70ZUIePkhwoJrl1r44QwkkeNuTOwqtGyK7tWfv48VlDsSY5SXOcOcyqE+8o7vDkL050gCXrxhhdiYib5bSMc2jEn/jMn3KjpUpb80SoPxopBF2ewWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785810352; c=relaxed/simple;
	bh=Jza6+jff9Kdi+wX3YxFWxLHU02+M54ak+3usJfvv5k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScgxJIFGnLxCtFgWGGB1UbQBtX2QyDvy7MDWH4oC/dPyuLgXiC6nGQ4RL8u1Z9mRsUz+AxmjuBe1BVXfj72XMn5MeC0QxIuaU4Xkzk446NIRHEIZWMoTBpT3N78edbhM9pzwZKCwjc4o5pIija6kAVf/un17h+VdIxmroYx+sRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c85aadce8fab11f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b67c4e7d-da79-4bc9-902a-d5a322cec042,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9caca6cfa42617e6fddcd2198c509135,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c85aadce8fab11f1aa26b74ffac11d73-20260804
X-User: lilinmao@kylinos.cn
Received: from [10.0.2.15] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1419609134; Tue, 04 Aug 2026 10:25:38 +0800
Message-ID: <9a3881ad-0da6-4a47-b408-a2106f5a2f14@kylinos.cn>
Date: Tue, 4 Aug 2026 10:25:35 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rcar-isp: Release ISPCORE resources
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
 <20260803090553.4082161-2-lilinmao@kylinos.cn> <anChUtV090GkJ6VI@zed>
From: Linmao Li <lilinmao@kylinos.cn>
In-Reply-To: <anChUtV090GkJ6VI@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo,

在 2026/8/3 22:17, Jacopo Mondi 写道:
> Hi Linmao Li
>
> On Mon, Aug 03, 2026 at 05:05:53PM +0800, Linmao Li wrote:
>> v4l2_device_register() takes a reference to the parent device, but the
>> ISPCORE remove path never calls v4l2_device_unregister(). The reference
>> is therefore leaked whenever an ISPCORE is removed.
>>
>> Probe failures after rppx1_create() also return without destroying the
>> RPPX1 object.
>>
>> Unregister the V4L2 device and destroy the RPPX1 object on the
>> corresponding error paths, and unregister the V4L2 device during removal.
>> v4l2_device_unregister() also unregisters all attached subdevices, so it
>> replaces the narrower subdevice-only cleanup.
>>
>> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> The driver has not landed in any Linux release, but it has just been
> collected for the next merge window.
>
> If your patches get collected as part of the same cycle, I don't think
> there's any need for a Fixes tag ?

Agreed. I will drop the Fixes tags from both patches when respinning the 
series.


Thanks,
Linmao

>
>> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
>> ---
>>   drivers/media/platform/renesas/rcar-isp/core.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
>> index 8dafffdd8de68..923970fd7841f 100644
>> --- a/drivers/media/platform/renesas/rcar-isp/core.c
>> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
>> @@ -883,17 +883,23 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>>
>>   	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
>>   	if (ret)
>> -		return ret;
>> +		goto err_destroy_rpp;
>>
>>   	ret = risp_core_create_subdev(core);
>>   	if (ret)
>> -		return ret;
>> +		goto err_unregister_v4l2;
>>
>>   	mutex_init(&core->io_lock);
>>   	spin_lock_init(&core->lock);
>>   	INIT_LIST_HEAD(&core->risp_jobs);
>>
>>   	return 0;
>> +
>> +err_unregister_v4l2:
>> +	v4l2_device_unregister(&core->v4l2_dev);
>> +err_destroy_rpp:
>> +	rppx1_destroy(core->rpp);
>> +	return ret;
>>   }
>>
>>   void risp_core_remove(struct rcar_isp_core *core)
>> @@ -907,7 +913,7 @@ void risp_core_remove(struct rcar_isp_core *core)
>>   	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
>>   		risp_core_io_destroy(&core->io[i]);
>>
>> -	v4l2_device_unregister_subdev(&core->subdev);
>> +	v4l2_device_unregister(&core->v4l2_dev);
> As v4l2_device_unregister() unregister all subdevs of core->v4l2_dev,
> this seems correct to me.
>
> R-Car ISP is a little complicated, in the sense that the core->subdev
> gets registered by risp_cs_registered() which is the handler of the
> channel selector subdev .registered() callback, and to properly
> balance we should unregister it in the (not implemented)
> .unregistered() handler.
>
> However, as this is called as part of the driver's remove handler, and
> that's what we have at the moment, I guess this is ok
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
>>   	mutex_destroy(&core->io_lock);
>>   	rppx1_destroy(core->rpp);
>> --
>> 2.25.1
>>
>>
