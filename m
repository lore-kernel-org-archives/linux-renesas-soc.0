Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8042F6571;
	Fri,  6 Feb 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378524; cv=none; b=f2xgkfxFagNioxx9qoHg7DnEcEfR7w0swsDVeodeQYTEOlzjEVl0+7OYvVc4jL1d/CRVj7bN+aRoYjakinsoXnG9N2pZI0ek79vNZmbLYlkFIlgUl70MHPbH2g9VIk8jyPi5dnK6v2UeIez9T2ktAbrFlLq3mb+QJV3T7t6/6tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378524; c=relaxed/simple;
	bh=GPvpyrpBR8Z6rWSfBFtJ5gCU6aloazozc4rXxp0AOzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhRZ3kIl1DOE02P1pbPk7lbNSg0yMXAARAJ8sCELyvFJd4egTsiLu0YA/KiBzs+uTek0zqjBuyg9PtU2fIGaqf+swooc4O0KyFvjcJEm07KgI+z93fxQq3Ky1cus677eXIP3uTrN6VHddLXv0kgzcTK6wmyVOiyAptgtI1exJ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=glAf5kpN; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="glAf5kpN"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f6sml4PpWz9sGT;
	Fri,  6 Feb 2026 12:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770378519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvI4siTU8KLYE21eDySdcS4XJV/PDx+9McxS7rdud24=;
	b=glAf5kpNvJsQrX3wkQizqgcl7EqhET73QwE4zmVDjs8ogF9lDjD2WGn6A/sCAnBKNI1QzM
	ZKsRbzTrF9KctjNMILggT2zQHvcXtxI2/OSxzQ4OqvaB/RI5aog9VDeiCNoDTAi7gfwuh7
	ygPHXRG/7nLeAB/5Du+bKaDIDxvUmNFvGyUMjlwYQLWjYoo8cd02tkhL/2kEqrnVsSclel
	zX+UUL6F3GhzjltVxvGElXSACONZRdv2wu5FLlfuu0Lu11+2Z7foqXO3rVvB4UBnOHnklp
	6Q1+oEBmcw5nNlIIWIh+R+ZVggKvmz9xs+saq7vGXnEZURBLf5qwmmd5E7AWcw==
Message-ID: <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
Date: Fri, 6 Feb 2026 12:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: dri-devel@lists.freedesktop.org
Cc: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 84c76eacb8dc1122efd
X-MBO-RS-META: ybz1e11ur8a5cccb9omstkb1abh8b1hk

On 1/15/26 3:39 AM, Marek Vasut wrote:
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
> 
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
> 
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
> 
> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Is it OK to apply these two patches now ?
