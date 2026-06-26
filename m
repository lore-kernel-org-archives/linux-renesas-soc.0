Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DF30D3FA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480077; cv=none; b=eWPjh3uTQCwGI/zxeneMSKB3anSayl0LenWQ73cvmVv38L4RJdnBz9n4dmKZqT693T7p7/8xYW29naD10bsaXOAZsm2fVJ1ACvvDbtlYGW5YRGaDmX7P17l4sv/LZbaREMI302bRd6SZTL5cQzz1oRgMIyq3FXaXiIMVT/2s6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480077; c=relaxed/simple;
	bh=BmHJUIMl03bo3cur4LADSXTy4zaBjOxIh5/Huf4taX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eORrGv5eCSGWQo4sA31vjfTQw35HnDyp0QIN7TsijFzq0SlnDHbGlcB0RnvKugALGSBShHCCy785FAqrkb3ZPDP3cG9w14ZYRHBNbLc8OwLS4CcwlUmAbrxAMW6VOnPovpo3ZZvUEav+lBODoLLXs3CLSkllgElvvbWyMwlQ35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkaYQaS6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkaYQaS6"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aea3da0072so78838e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480071; x=1783084871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=PkaYQaS6PtmcNg1ur2Q/BR/QedyX1N3Dty2vObF9dIlIOv/32BWyw4VLapTh/7vy6q
         KmQDxuUB70vZp4SZxNaudmPmv3HIm8FJojdTss5xyPZ4O+PqJ50CQxDNKE8IVrMDmwjC
         3qRlyGwyn0DLecjux0Vx3Z4fi71hgXeIBji+cF3Up7CR1Mg4EzeMUggl63Wh/ITTmT5c
         AeFtBOjjZc96BFIGgApe30vZrrwFksucZZqLh+5oI7pXAHzrj8e9itE4WfG9AWakRrlB
         QxYECNIxvQ18efG2Erw188LaeJy32xxA4y/e6bpN/MJryxvhRDvY3IqgADXadHkpsvOk
         9X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480071; x=1783084871;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=M1woRc0SgDe0kma8+YTLkX2NsyhpCvjCmi/1fQXtP8SKBN/81bDRAknZ2QmGeJyNT2
         14qsEV1WjGMd7I1Sq5mZeds1Jb9EnQJHU0t0iMvRyyvTgHzK6YieQu3nyim60hR0ExNs
         tQFwZ42vHqHhTH/+a+ds/vbHeatQJtA6hdCBFkuDYp3kJXOq95mGrVgBk0UDEYogPJNQ
         sMi4m1Y3mu4jhvuREG1U3+sNns5VMjPGoXI5stSM73Vo9o5VBiJzQl1JHB6bzJztbnHR
         HWfVN5KPXEFUE1whnIxfIKwmBxWwcox3YT/1WkbPLfJIieWhqEychCQg7JPBUMqCW9EU
         wpjg==
X-Forwarded-Encrypted: i=1; AHgh+RpGt1Iw1/+7QDaaA8+jT4jIfVCaj67pT1s6b8DqW0xbxqzV/a6+psOhvpHkYQIodev/2gujro6nM26Nu4v/UaQJGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqN81Ff+e5G+s+F632GtC433HKwwP19RgSsMwE0cgBT79iDCWh
	ZMnu2z6xFqMg50wZU0IoKLyFt07g8OraKC8eS/TqNlfLAUtCQ/5+idZAfXQ3uSxjy68=
X-Gm-Gg: AfdE7cnIWufe3bT40FnSk7P22CKk0TRkHk/lz01yBQIh5V+xUITzmOFbrjWhW/CwY/Q
	4duZLevJtpEj7+vihlrbKXMWVy3IVbYjJRwPfITX4cA/4uqAfCvwXr+iQ46ajyxEvnBbf8U9ktw
	kP4lzNVZH6jY1JqR4RZF2IH2iUYw0YgaKSXMCXrCJXfFV1xTwon5E9Od6gYMzZwzwn4lHQsFW1S
	AxwWDvakW6E/gqBTMventc5vTmj46xqqXlCJTCddTkhz+LadR83KRcWSIo/4Pjm0jHL5y6PIwcH
	LmL8efVKWyBHStYx707Ixe9jLLwxakiBhIDdDi/2RxRR8lO/p8dshpL+0GY68oiefOJMlQQo3XI
	RgpxsXieXgS6fzkrpSewfFmDB6LDWvdHvDiHyZkIQ6qhc16xTqT1c3onvXzdZvOOwU1flDKfmsj
	CZh7rweAzul5KRtAMjNxpmJK3RMoj15oqBujk/tcPmGIQwmqD90eU1JszoTxliz9dFUdJ4C6gxL
	hUNiw==
X-Received: by 2002:a05:6512:1252:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5aea1f3c156mr1200847e87.2.1782480071016;
        Fri, 26 Jun 2026 06:21:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad695859b4sm3327909e87.72.2026.06.26.06.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:10 -0700 (PDT)
Message-ID: <d14af4aa-f791-4aac-9d49-ace834952257@linaro.org>
Date: Fri, 26 Jun 2026 16:21:08 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video interface
 devices
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
> 
> This allows avoiding hardcoded constants in device tree sources.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
