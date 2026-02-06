Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5993A0E8D;
	Fri,  6 Feb 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382505; cv=none; b=THl85qvvGGogi7Nwl4gYCL8uvXjgO0sGF7lTFVZFRZgq/2LRYmWHu3j7unnHL+3Zkl55V1ElwBgAQc5GGh0vT9p87sP7HTLyoInTglEAH87LN/+v1lo56nexJuvBQQN3xoy6yNl3Eu9uSdpeiJBDZvLcj/qMwiayfrRGItjHz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382505; c=relaxed/simple;
	bh=aVRgoRgsehU7XYNVPv4gdtqcIK+atGxp/in72OP1h3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUeXhEqyxon+2ENjEErkMd0UhmOfhOoCHi/zX1lSpNLCj7FCV8jpZzKWO8cVRmyZHZhgyHfLkocNDYMQJZhlWirG/DYBUlI+G0H8VZvoGuylzqKj7czCPQR6O+EoELFLWkxe3CwpfRU4qioLo9aymvWuiPn04kQxGDOnToKsFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=r5CER6Z7; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="r5CER6Z7"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f6vFJ1B14z9vHD;
	Fri,  6 Feb 2026 13:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770382500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g1Ub/M7Q2aHFgZEO5za6zfELil2aq7KLjDRl8IPBzQ=;
	b=r5CER6Z7OaY7dy95J4hDFO0LPNjXzcX71Fm5txA7hFv12x/hReoBjwLm2q97lPSNkLek2R
	aXkHfG3QW/BZ9TdNaXAMzuHAqtMLslEMBpncFNB1RLcgt98II092ZNtEW0jgw1pogCGTkL
	XfhGJWJ0kEynwKHd7OVkrWPoZvkyGwVN4uY1NKrXkR+fYW+hlMIU00xCOju0zExwupF7/x
	hLfbpBYPEC9Jz9BC1XQ3tm2FVnWQq7ggz1UUlt3wDBaeB6dc6aExUs+arNedczlqD5fpFs
	c9KMsOly8crnutW/QT473K3S53wDaJn/suEFiczpnrHJkbB/fzfGbINp0q+Xiw==
Message-ID: <d2b78d9a-13ff-42a0-ad6a-2e4cd3a0332b@mailbox.org>
Date: Fri, 6 Feb 2026 13:52:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
 <DG7QBWUAL0WL.1VY49M9I8ZVH@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DG7QBWUAL0WL.1VY49M9I8ZVH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fny96356x6qz4ouoc99gwe1c18gbhxq3
X-MBO-RS-ID: d8e14fffe9be3de9274

On 2/6/26 9:18 AM, Luca Ceresoli wrote:

Hello Luca,

> Back to your patch, I don't have the hardware but LGTM and I'm not aware of
> any issues it might cause. Still it would be good if you could describe
> what goes wrong with current code.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Let me send a V2 with issue description.

-- 
Best regards,
Marek Vasut
