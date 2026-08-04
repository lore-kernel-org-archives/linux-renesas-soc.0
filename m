Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BB3890E0;
	Tue,  4 Aug 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835853; cv=none; b=gXdkHBluH/UX5wwHEdSBfZyQkgjkkJ3JMC3YLNjdH/M6SXvY3M4eQmwXE7ZKl7J+P5ZTHVCdB11z53lvMfFLO8eUUNPmEVlMAMV3xNJMkbo77OmHK+P0cvmzP4GnNqEaW0Vu8XtvcjuTSmrt4Dko1BwoU5C215zmITOOIZc4jDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835853; c=relaxed/simple;
	bh=zKGfyb0XAItW/ZF/44ekxmOpvAJmBSKi6fslkbHsklM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=K2NZuDC4kD+agPk4zYoJAtXGP7zjsywBxkBR4+sTvxSFIEUxSKqiLJ9DB1CTKYdc1NPYklfCDDgCoikl3HHSHhu59P1Oek3YahGOriRQczxLrp6tyIAJ/Q3J4oN/F46ozvZAVs9l8l0CugiJropJQI2axVSvZVEV0Lv9l7bDei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 275d692a8fe711f1aa26b74ffac11d73-20260804
X-CID-CACHE: Type:Local,Time:202608041705+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:26563bed-3b8b-41a4-97fb-4bafefa6e28e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4f3a03141d7c79f92dc26ff513a7e1b0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 275d692a8fe711f1aa26b74ffac11d73-20260804
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 809947026; Tue, 04 Aug 2026 17:30:38 +0800
Message-ID: <c1449f71-b516-4184-b224-052d2e0a46e6@kylinos.cn>
Date: Tue, 4 Aug 2026 17:30:35 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
 rcar_gen3_phy_usb2_remove due to race condition
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d265021fb7fe432e32eedbe9e075fb041c15cbe6.1785830417.git.xiaopei01@kylinos.cn>
 <TY3PR01MB1134664317D6A75D8230DB51B86D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <63160e2f-8566-4a2f-b0fe-ba97603df78b@kylinos.cn>
 <TY3PR01MB1134613500284ECC47AE1B1D686D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <TY3PR01MB1134613500284ECC47AE1B1D686D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/4 17:08, Biju Das 写道:
> 
> 
>> -----Original Message-----
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>> Sent: 04 August 2026 10:05
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>;
>> vkoul@kernel.org; neil.armstrong@linaro.org; geert+renesas@glider.be; magnus.damm
>> <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org; linux-phy@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in rcar_gen3_phy_usb2_remove due to
>> race condition
>>
>>
>>
>> 在 2026/8/4 16:34, Biju Das 写道:
>>> Hi Pei Xiao,
>>>
>>> Thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>>> Sent: 04 August 2026 09:02
>>>> Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
>>>> rcar_gen3_phy_usb2_remove due to race condition
>>>>
>>>> In rcar_gen3_phy_usb2_probe, &channel->work is bound with
>>>> rcar_gen3_phy_usb2_work. rcar_gen3_phy_usb2_irq can schedule this
>>>> work on system_wq via rcar_gen3_device_recognition(), and the role sysfs store can also schedule it
>> via rcar_gen3_init_for_host() / rcar_gen3_init_for_peri().
>>>>
>>>> If we remove the device, rcar_gen3_phy_usb2_remove makes cleanup and
>>>> the memory allocated for channel with devm_kzalloc() is released by
>>>> the devm cleanup after the remove callback returns, while the work
>>>> mentioned above may still be pending or running. The sequence of operations that may lead to a UAF bug
>> is as follows:
>>>>
>>>> CPU0                                      CPU1
>>>>
>>>>                                           | rcar_gen3_phy_usb2_irq
>>>>                                           | rcar_gen3_device_recognition
>>>>                                           | rcar_gen3_init_for_host
>>>>                                           | schedule_work(&ch->work)
>>>> rcar_gen3_phy_usb2_remove                 |
>>>> device_remove_file(&pdev->dev,            |
>>>>                    &dev_attr_role)        |
>>>> // remove returns                         |
>>>> // devm cleanup: free_irq,                |
>>>> // kfree(channel)                         |
>>>>                                           | rcar_gen3_phy_usb2_work
>>>>                                           | // use ch
>>>> (use-after-free)
>>>>
>>>> Fix it by disabling the OTG interrupts, so the IRQ handler cannot
>>>> schedule new work, and canceling the work before the remaining cleanup in rcar_gen3_phy_usb2_remove
>> and the devm release of channel.
>>>>
>>>> Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in
>>>> interrupt")
>>>> Assisted-by: Codex:deepseek-v4-flash
>>>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>>>> ---
>>>>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
>>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> index 9a45d840efeb..fa0e680a4b91 100644
>>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> @@ -1067,8 +1067,16 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)  {
>>>>  	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
>>>>
>>>> -	if (channel->is_otg_channel)
>>>> +	if (channel->is_otg_channel) {
>>>> +		/* Disable OTG interrupts so the IRQ handler cannot
>>>> +		 * schedule new work.
>>>> +		 */
>>>> +		rcar_gen3_control_otg_irq(channel, 0);
>>>> +
>>>>  		device_remove_file(&pdev->dev, &dev_attr_role);
>>>> +
>>>> +		cancel_work_sync(&channel->work);
>>>
>>> What about pending wq that is still about execute after
>>> "device_remove_file(&pdev->dev, &dev_attr_role);" ?
>> Hi Biju,
>>   I don't understand what you mean. cancel_work_sync is exactly what catches this kind of pending work —
>> it either cancels the work that hasn't run yet, or waits for the one that is currently running to finish,
>> and it is placed right.
>>  Could you explain it in more detail?
> 
> Assume you removed the file, and before cancel_work_sync(), the WQ get scheduled
> will it result in UAF bug mentioned in the commit message.
> 
The rcar_gen3_phy_usb2_work only uses chan. If you call
device_remove_file(&pdev->dev, &dev_attr_role) before
cancel_work_sync(&channel->work), it does not lead to a UAF.

On the contrary, if you call cancel_work_sync(&channel->work) first, the
sysfs node has not been removed yet. When the sysfs node is written to
(via store) again, it will schedule the work once more, rendering the
cancel_work_sync call ineffective.
> Maybe??
> 
> rcar_gen3_control_otg_irq(channel, 0);
> cancel_work_sync(&channel->work);
> device_remove_file(&pdev->dev, &dev_attr_role);
> 
> Cheers,
> Biju
> 
> 
> 
> 
>>
>> Thanks！
>> Pei.
>>
>>   > after device_remove_file.
>>
>>> Cheers,
>>> Biju
>>>
>>>> +	}
>>>>  }
>>>>
>>>>  static int rcar_gen3_phy_usb2_suspend(struct device *dev)
>>>> --
>>>> 2.25.1
>>>>
> 

