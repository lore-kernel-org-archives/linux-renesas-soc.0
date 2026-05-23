Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2922371876;
	Sat, 23 May 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532017; cv=none; b=QIxEj9oCh+nZLduJTdEVmKPU56DsGDqlrVv57HD0mFFsdxotdIWGYZYF+8YIOjtY+Vfvf18vxWnsRDlfVdZ+uqGNt816T4IpJaADAEEcs9sDiVFslPSsUi86nfs3wKrMQTVmZ5wBFQb5N1ahBzvlWhpFgn5I+OTS8estgXjsNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532017; c=relaxed/simple;
	bh=+5t9nJEuNRZ+RXImPsKSt24OOfiWO3O6+ZbC3GZF2Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8w5JWQpD7jG8lzC9Kn/J73OvQUUEGsKYyAEdm7R40nr/NDzChC1YJCRGwMbxYrB9rMvdOBsPHEIoA2yAF6Csu2FQtLyqcRKrydXELIc8Aj+aLiZ1c8SRBN7stGDtxKf1rzpIvwniSNScx02zqu7bfHDuYUDlJl+fOF/tH4UFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrLr9Kuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrLr9Kuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38DE1F000E9;
	Sat, 23 May 2026 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779532015;
	bh=DnxFsIvB4g+whV8WLOQGnh517IDcreGsHFMmjC/hnIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TrLr9KujNLXmyJniRJxaOWwPima5ERnM7C4gOH8fl0rNrjrBjgpDm9/VuAPPfL5Ce
	 tIdLGeozB5gP11ecku+iQRorhJfBo5FPgR/6CoG8IsaFRytIcs1nK8nYTjnTqW+pMA
	 dZC0qJRSlFk9mEex6k2lXI4B7xQDTIWrj+0sxw2GuBu3/5bEi65NJNyv6AgOaBSsBr
	 7igedV7M4VL+RuVFHFvF26Nq8oTl/z4n/HRXB5rMeMgmEVwLSlLpVXrQ69XLFr8DOi
	 pksJ+P5OtfMUIK9mhB+r4yqCa/xOfQhadcc75Qb6XrIyBMjLT/bfki+pFHWcY1ssFL
	 zWaYTAbYTPduQ==
Message-ID: <05db9476-7f26-4d90-b79c-5a4fa1de0f01@kernel.org>
Date: Sat, 23 May 2026 13:26:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] i3c: renesas: Use reset_control_bulk_{assert,
 deassert}()
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-10-claudiu.beznea@kernel.org>
 <ahCsOZ74txWyp0OO@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCsOZ74txWyp0OO@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/26 22:19, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:07PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
>> suspend and resume paths to simplify the code.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/i3c/master/renesas-i3c.c | 30 +++++++++++++-----------------
>>   1 file changed, 13 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index d32646deb69f..e5963270d6e5 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
>> @@ -1414,24 +1414,22 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>>   static int renesas_i3c_suspend(struct device *dev)
>>   {
>>   	struct renesas_i3c *i3c = dev_get_drvdata(dev);
>> +	struct reset_control_bulk_data resets[] = {
>> +		{ .rstc = i3c->presetn },
>> +		{ .rstc = i3c->tresetn },
>> +	};
> 
> Suppose it is also used in probe funciton. can move these into renesas_i3c
As explained in patch 06/07 is either this way or complicate other code paths. 
Please let me know the preferred approach.

-- 
Thank you,
Claudiu

