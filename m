Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D23EA968;
	Tue,  4 Aug 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809119; cv=none; b=rOEuLvCrC+v7HUKcQ3jNclZMzt/E0+1RqUsnDrA3b4oB9oBCYgdysDWWp1AwmC6fjTEkCbvPhaeqwbMFueIxvGWIVAeVD47jOh8O/6/FBJ9tl6k8nf2IGT+ix2yS0CQ5gyS4JK9sZ4EhodR2GZst73JOhAKhljDDg9Z5fRdriZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809119; c=relaxed/simple;
	bh=8fiD8nWiUVwd/x+SyaQpaIs+hRgIbpyvOrHtfFN/TCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sx/ktUNmz7Tf5EkXi7//iQX0eITZOvZlfxzi7SKf5lV7fqZ2/FO1ouyln/QGXcaKVv8VFaIxlDHfElzzgfAqUjFDIQrKsKPw069trBWEu2OurgSS80BPWxM3qChurQwuOIJeFy+VKmETWgGjEA6Dv5xIN/4GNUnbuOwdK0qGcb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e9a57b248fa811f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dd7ecca3-b7e9-45c0-bb37-b3d54beaefda,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c29357f5de0ac24fcdbfb197eb598461,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e9a57b248fa811f1aa26b74ffac11d73-20260804
X-User: lilinmao@kylinos.cn
Received: from [10.0.2.15] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1602212097; Tue, 04 Aug 2026 10:05:06 +0800
Message-ID: <aa2c46b4-4fc9-416f-8855-ae6ba61eeb8b@kylinos.cn>
Date: Tue, 4 Aug 2026 10:05:03 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: rcar-isp: Fix VSPX reference leaks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803090553.4082161-1-lilinmao@kylinos.cn>
 <anCZxVjPo_zfFcEq@zed>
From: Linmao Li <lilinmao@kylinos.cn>
In-Reply-To: <anCZxVjPo_zfFcEq@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo,

在 2026/8/3 21:43, Jacopo Mondi 写道:
> Hello Linmao Li
>
> On Mon, Aug 03, 2026 at 05:05:52PM +0800, Linmao Li wrote:
>> of_parse_phandle() and of_find_device_by_node() both acquire references,
>> but the ISPCORE probe never releases them. The device node reference is
>> leaked immediately, and the VSPX device reference is leaked on probe
>> failures and on driver removal.
>>
>> Drop the node reference once the platform device has been looked up and
>> release the device reference with a devm action.
>>
>> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
>> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
>> ---
>>   drivers/media/platform/renesas/rcar-isp/core.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
>> index f3dc52c136120..8dafffdd8de68 100644
>> --- a/drivers/media/platform/renesas/rcar-isp/core.c
>> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
>> @@ -781,6 +781,13 @@ int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd)
>>   	return 0;
>>   }
>>
>> +static void risp_core_put_device(void *data)
>> +{
>> +	struct device *dev = data;
>> +
>> +	put_device(dev);
>> +}
>> +
>>   static int risp_core_probe_resources(struct rcar_isp_core *core,
>>   				     struct platform_device *pdev)
>>   {
>> @@ -820,9 +827,15 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>>   		return -ENODEV;
>>
>>   	vspx = of_find_device_by_node(of_vspx);
>> +	of_node_put(of_vspx);
> I was about to suggest to declared of_vspx as:
>
> 	struct device_node *of_vspx = __free(device_node) = NULL;
>
> But maybe it is not necessary since there's a single call place for
> of_node_put().
Agreed. The node is only used to look up the platform device and its
reference is dropped immediately afterwards, so I kept the explicit
of_node_put() to make the lifetime obvious.
>
>
>>   	if (!vspx)
>>   		return -ENODEV;
>>
>> +	ret = devm_add_action_or_reset(&pdev->dev, risp_core_put_device,
>> +				       &vspx->dev);
>> +	if (ret)
>> +		return ret;
>> +
> For my education: what are the drawbacks of using
> devm_add_action_or_reset() instead of releasing core->vspx on probe
> failures and _remove() ?
Explicit cleanup would work as well. I used a devm action to avoid
duplicating the put_device() across the probe error paths and the
remove path.

After the VSPX reference has been acquired, risp_core_probe_resources()
can still fail in vsp1_isp_init(), clk_prepare_enable() or
rppx1_create(). risp_core_probe() clears core->base on those failures,
so risp_core_remove() returns early without performing any cleanup. An
explicit implementation would therefore need a common error path in
addition to the put_device() in remove.

The drawbacks of the devm action are the additional devres allocation
and the less explicit release ordering. There is also a longer
reference lifetime in the optional-ISPCORE case: if rppx1_create()
fails with -ENODEV, the parent driver treats the ISP core as absent and
continues probing successfully, so the action is not unwound and the
VSPX reference is retained until the parent device is removed. This is
harmless, but explicit cleanup would release it earlier.

The action is registered after the reset, clock and IRQ devres, so its
put_device() runs before those are released due to the LIFO ordering.
There is no dependency between them.

I chose devm to keep the cleanup centralized, but I can switch to an
explicit error path if you prefer.

Thanks,
Linmao
>
> Thanks
>    j
>
>>   	/* Attach to VSP-X */
>>   	core->vspx.dev = &vspx->dev;
>>
>>
>> base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
>> --
>> 2.25.1
>>
>>
