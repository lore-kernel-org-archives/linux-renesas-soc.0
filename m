Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D7387370;
	Mon,  2 Mar 2026 21:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487396; cv=none; b=ed90Iq6aK2LegUq3N6VqcO25JFFZGl7DvrzAAvjaMbJT7vPruLcm7bkDteOrhHKNdRUfdxHTQ8QNjogL0g8wideDvvZb24lu8i0+v19Eg8aBatlkvOQOMRfY0gE3VbEaglh0gKDi/EpALnqdLulEzaIXGzHa7WJyZ+ueY32HO/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487396; c=relaxed/simple;
	bh=CIEoBXHCJ76kSea54cMTELyN/mzDF1o5Ox+1TS/cuog=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BntCF/hbYViNBZbC4n4wU9ICV0Egg1k89oZwpMjar/pKV01LEGxoHZX/PRXS+FSmXLq5Lt8PKQGdGo/uqkSwf0O98bUWlu+QddebrXQLlKWZJd6/iOC7qHQUB/ynpzgb3rvsBChfwvxuNqNJURvsYQfx3wC9iH17jx/0KMjrJaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g8binp1B; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g8binp1B"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fPsgt0pvnz9tKY;
	Mon,  2 Mar 2026 22:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772487386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXP5HByZgpWXOadj65K+b4WjwczLufrOVq0rj1pxL0k=;
	b=g8binp1BIJ129DLylC7ERdS4lGffHozoeSG78ZBOH2qed7QfdLVLvTe5MdQjbIgR6J3G92
	gbbURl0O0x7bTjBo6rmpMBByMHneMRLOZWCYwyfFDWrbN5f6skEbQVKoOFwzV38o8gvCP1
	UYnMUZjKlklKsitIeEFBz5RfiHiDVcW8mzSu+jynMCRSQ1XKoePtShXH13muL4R0n9kwc0
	hoJr1DkBs5Pgc1KttGYUMfe9lbzsgPVo6wCSERGzBVO4K1u9ThZbxKEC+D8wPSnFAY/Etz
	70vzr5zew+Plffv4YhvvvF1oDdruSVcVvNFIRT5mw+5HWsdtAnCyY/mwMRRvcw==
Message-ID: <6f172d61-e421-44dc-b160-d885ef023e67@mailbox.org>
Date: Mon, 2 Mar 2026 22:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
From: Marek Vasut <marek.vasut@mailbox.org>
To: dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <bd453972-529b-42bc-8b8d-41afd1f5008d@mailbox.org>
Content-Language: en-US
In-Reply-To: <bd453972-529b-42bc-8b8d-41afd1f5008d@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ewhkgmccxo9sxio3dkgo377cxtuek6u8
X-MBO-RS-ID: d09f634b006e52e5133

On 2/6/26 12:49 PM, Marek Vasut wrote:
> On 1/15/26 3:45 AM, Marek Vasut wrote:
>> Update drm_of_get_data_lanes_count_ep() return value documentation
>> to match the drm_of_get_data_lanes_count() return value documentation.
>> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
>> drm_of_get_data_lanes_count() and therefore returns the same error
>> codes.
>>
>> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and 
>> drm_of_get_data_lanes_ep")
>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   drivers/gpu/drm/drm_of.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index 4f65ce729a473..cfd0518174de8 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>>    *
>>    * Return:
>>    * * min..max - positive integer count of "data-lanes" elements
>> - * * -EINVAL - the "data-mapping" property is unsupported
>> - * * -ENODEV - the "data-mapping" property is missing
>> + * * -ve - the "data-lanes" property is missing or invalid
>> + * * -EINVAL - the "data-lanes" property is unsupported
>>    */
>>   int drm_of_get_data_lanes_count_ep(const struct device_node *port,
>>                      int port_reg, int reg,
> 
> 
> Is anything missing here or can this be applied ?

Can this be applied now ?
