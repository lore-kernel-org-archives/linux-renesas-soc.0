Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA1334676F;
	Tue,  2 Jun 2026 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400959; cv=none; b=TAqHUGIq2qzlyBbO4lTp8R78Aw/0REI604KX99ZLiQ3Ix/aLeYvQK8NUOJ1py/Fn02N7h7L3unGjyIXQ/cAAZfX7R0ZVbjbW4+SKLzXnjiFvDAY3L6QU5e/AZb7p6rdzbmc4npVq9fthqN7qyIKd3gcguGbNoRSoDsErDzQWl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400959; c=relaxed/simple;
	bh=BPaQXDX9DfioE/lo/6/O84iTu0gb9JOE47FAzI78Yo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eu/McjtU+amvnYdSkcxSpezA7qlqqdkqgpSxzvhdhTWd4qyQxSoxRVBoZ0SgaTD0v2CM9ERXhuC6lI8LOFr7QIgyW3cmdmlMFy9dIPq1e7tsVGB/2eki3P1qbxkLgusfjAGMYkGRAZvbbGtgNzSi7ImY+hemvciSQ+sLWW1vpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3587D1F00893;
	Tue,  2 Jun 2026 11:49:16 +0000 (UTC)
Message-ID: <343031b7-f011-4c27-a1d6-a84b31ab30ce@tuxon.dev>
Date: Tue, 2 Jun 2026 14:49:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: renesas: Add runtime PM support
To: Claudiu Beznea <claudiu.beznea@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-18-claudiu.beznea@kernel.org>
 <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
 <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/23/26 13:23, Claudiu Beznea wrote:
>>> +    i3c->dev = &pdev->dev;
>>> +    pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
>>> +    pm_runtime_use_autosuspend(&pdev->dev);
>>> +    ret = devm_add_action_or_reset(&pdev->dev, 
>>> renesas_i3c_dont_use_autosuspend,
>>> +                       i3c->dev);
>>
>> do you cleanup resource in renesas_i3c_dont_use_autosuspend(), look likes
>> needn't it.
> 
> According to documentation at [1] this is necessary.
> 
> [1] https://elixir.bootlin.com/linux/v7.1-rc4/source/Documentation/power/ 
> runtime_pm.rst#L616

Actually, the cleanup helper of devm_pm_runtime_enable() takes care of this, 
thus I'll be removing the renesas_i3c_dont_use_autosuspend().

Thank you,
Claudiu

