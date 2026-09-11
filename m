Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E804A0F12
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143419; cv=none; b=thl2y3ja06k47V+Y9gONRQ+HtJLJFk8mytZfHKOpBQ7La0HPMkJQ1sZ6M0bBfcO0F4n14CGbpShGXSTQaGVQaj0CQa5v7TXf6oaMYt/fUvJmvURczgc48MtLR8CPBuXI1nmVvSmau1MvmzY4Vo00gcqLakyTakrPcVDde2L53lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143419; c=relaxed/simple;
	bh=mxpi19EOjxdBUAzei54rrsJVGo4hFRd2kd655zqmusY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JA+7z7Uz5RJklfUS3W2ogPDd1A3DZjfBnim7q/QgklXpKarP3eVguRnvJvbW3aM+lqq4N2ki0KYRSj9uJuF5BFtlPyV/A077dYcmt1UYnJBkmaoMxtYkqgc+RwieWZqS9coObySrKAxmlQnSAcBI8zVe4zYsppxT5QjFJwqTb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iRsWDExf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iRsWDExf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so1111545e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2026 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789143415; x=1789748215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEScTZKIB90XpkBNEHwOjr8hKNAnt7HkPQnGxzbxNrY=;
        b=iRsWDExf9BVHkfv7FnqI+lVabQZBW5Z7CtI4AkM8jihPCI+ewbrjNwZgm6Lc2LHj+Q
         ONVjlpIAj9LJfXHhbQUPNequS0AJq6VzRcIMyreuf8NVPkJiPrKPFC2riVZX3oV4znvb
         yhENWniP1TvcVfb5pN/2EKk3AmRlr0wVvBVmzDfW7GP+9WoD+DxoViEujb11Oj9FhRqj
         7c+XRkxNmGdlvl3whYltT6+wCDjnB84suiVDvaQifiuVUzC+VAOw7HPDT/hfBquTWiJ+
         Xm6EbKCNyyb8KD55DNL6BwP61wCuKKulFhaXHaD5gmhaOy2xBZcKqifnc6CUwPhhZa4q
         CNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143415; x=1789748215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEScTZKIB90XpkBNEHwOjr8hKNAnt7HkPQnGxzbxNrY=;
        b=O4X8eXT1YktmnENCo/xkOyAO8pExWvtNXOt37vlHh6Ej0XnOAXN1dJ9wUNCsnCOt5q
         /bfk/cpeLngPWSeS4ggXWfBPl2gxlLKS7WbRdLExpgwbLzeQsrSRTzBz3JxF6kUCxmwE
         uqUGBYeGKuJWdjvDzEyNnmXKEeDhbrUVAxUkr1cqd9WSiMNV+wbh2ty/JM7jX0GTf5tT
         6ooooBklRzp8cBpMAh25BipuPhMruROmjB1TgXWiyO2N52syvPImruh87CHlxfn6XpoD
         rkgkQ8gPo2KTHgNbloYYVx6LFPurPHnKZkPma8JP/HMUx6ccLU2NGP5979LKbIbCJwaX
         HfqA==
X-Forwarded-Encrypted: i=1; AKwUvBzEr0u+0NkBN1I3rQ3CO3Amt0w3MNOSNUIk4k1vU60oRb5uFezS1RYay0kF6lOPpXDzgyqKKgf9kdJP78mjOgM24w==@vger.kernel.org
X-Gm-Message-State: AFuF++n15I9LLv0OxNXUVAX4/qAe6RffE7S172yU6RYfCvXukvkZo2o6
	3QAampofhxAzeEC5pL4lNhHkS3RSEcjycTSFQb0QAdsSunWUF7mfS/Tbfm4mEILBJjQ=
X-Gm-Gg: AYBFou1ud4pby0QVKGpW975qh6FVHirrOeHHKRw2XBd99kt9L1ho+UptPBUOe9UZsho
	pBoIiKhGRI8kjirM6f6xX023Wk9SONv2TA7i3kmnQker0DZEkqhWLYlfX8ojoq19Om9cjOnayYe
	msT0/8bi/+F02VpO7Mkd3vfTiXOIEBRhMrR4gO5JnLBnoNISt5BAs/9P0t1A4flKKYhOXwZ0Lk1
	8Pdl6Lu1pSkvPM9bpSW6PGs0G6TpXjYbWyh9CfZLIPxd68m3LOykT+mcGEV+VinFzl3EvC0BfUS
	TLdI3e5+eaAmjQPQIGnZ5iDN2rWoPfcJFhTsGf7mYkEaPKtHeUtKxJUU64/8OFZUiRnpEkEiSfs
	pCMCHrrZSAir7mIrLzg4cnYlnM2dEv7nKteEBxUUpHYcBe7nY6eQUsCoh0cbLgFCoUiw1kij3LS
	kiGaPf5yOPLuGkpwT9iU/3t9U2OTASDewtGuExtTuolSkgPmQaskcZhGtyo4a5UagDUHOdNquug
	7fc
X-Received: by 2002:a05:600c:c178:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49e61a15c31mr119640575e9.14.1789143415254;
        Fri, 11 Sep 2026 09:16:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62231360sm50771265e9.4.2026.09.11.09.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:16:53 -0700 (PDT)
Message-ID: <42c0a43e-df20-48c2-882a-bd8e81fffd85@tuxon.dev>
Date: Fri, 11 Sep 2026 19:16:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] phy: renesas: rcar-gen3-usb2: Avoid long delay in
 atomic context
To: Pavel Machek <pavel@nabladev.com>,
 Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
References: <20260716183246.3183877-1-claudiu.beznea+renesas@tuxon.dev>
 <ap_o-T5GGMFGYZ4v@duo.ucw.cz>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ap_o-T5GGMFGYZ4v@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Pavel,

On 9/8/26 13:52, Pavel Machek wrote:
> Hi!
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> To address this, release the spin lock before sleeping for 20 ms as
>> required by the HW manual and reacquire it afterwards. To avoid other
>> threads entering the critical section and configuring the HW while the
>> software is waiting for the OTG initialization to complete, introduce the
>> otg_initializing variable alongside the otg_init_done wait
>> queue. Any
> 
> This is quite complex.

I agree. I tried to keep the current driver capabilities and adjust it for the 
long delay.

> How is this solved in mainline?

What do you mean by "How is this solved in mainline?" ? This patch is intended 
for mainline.

> 
>> To avoid failures when multiple PHYs call struct
>> phy_ops::rcar_gen3_phy_usb2_init() simultaneously, and the PHY responsible
>> for initializing the OTG either fails or deinit quiqly and another PHY
>> takes over the PHY init role), the code waiting for the
>> channel->otg_init_done wait queue retries up to NUM_OF_PHYS times.
> 
> And more complexity.
> 
> Example of the code is quoted below, and we are returning EBUSY to
> userspace if it tries to change role at the wrong time. Not great.
> 
> As far as I understand, the initialization on needs to be done
> once.

Yes.

> Instead of exposing /sys interfaces before hardware is ready,
> and then doing complex dance when /sys is accessed, could we
> initialize hardware in rcar_gen3_phy_usb2_probe or something?

It may be achievable, I haven't tried, but that would involve, at least, 
enabling PHY related stuff that consumes power at times this may not be needed.

> 
> Looking at the code:
> 
>          /* If current and new mode is the same, this returns the error */
>          if (cur_mode == new_mode)
>                  return -EINVAL;
> 
> this should probably just return success? (EINVAL is certainly wrong
> error code here.)

Things could be improved, indeed. This is however code that was present in this 
driver before this patch.

Thank you,
Claudiu

> 
> Best regards,
> 								Pavel
> 
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -392,26 +408,58 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>>   	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
>>   	bool is_b_device;
>>   	enum phy_mode cur_mode, new_mode;
>> +	int retries = NUM_OF_PHYS;
>> +	unsigned long flags;
>> +	int ret = -EIO;
>>   
>> -	guard(spinlock_irqsave)(&ch->lock);
>> +	spin_lock_irqsave(&ch->lock, flags);
>>   
>> -	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
>> -		return -EIO;
>> +	if (!ch->is_otg_channel)
>> +		goto unlock;
>> +
>> +	while (retries-- && ch->otg_initializing) {
>> +		spin_unlock_irqrestore(&ch->lock, flags);
>> +
>> +		ret = wait_event_timeout(ch->otg_init_done, !ch->otg_initializing,
>> +					 USB2_OTG_INIT_TIMEOUT);
>> +		ret = ret ? 0 : -ETIMEDOUT;
>> +		if (ret && !retries)
>> +			goto exit;
>> +
>> +		spin_lock_irqsave(&ch->lock, flags);
>> +	}
>> +
>> +	/* If another thread started a new initialization just return -EBUSY. */
>> +	if (ch->otg_initializing) {
>> +		ret = -EBUSY;
>> +		goto unlock;
> ...
>> @@ -1007,6 +1226,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>   		return ret;
>>   
>>   	spin_lock_init(&channel->lock);
>> +	init_waitqueue_head(&channel->otg_init_done);
>>   	for (i = 0; i < NUM_OF_PHYS; i++) {
>>   		channel->rphys[i].phy = devm_phy_create(dev, NULL,
>>   							channel->phy_data->phy_usb2_ops);
> 

