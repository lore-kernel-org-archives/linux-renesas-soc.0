Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630553CAE9C;
	Tue,  5 May 2026 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965787; cv=none; b=TXPeRmVZ3EbOhD2Eb7uUGoAHAWTIp5JSYM+04uLhCGhXQJ2gbQ76C4QEamg6Ef/dmo640SKofsKI0YmL//UfSbPzqN4x9GjFpsn1cBoIritd/pq/rNWmdSeBikjBoE2TqHAjHyitB8q+QHuXlyfrI819jufdMIUJe5mFhdd98hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965787; c=relaxed/simple;
	bh=3BtQrd+NUk0P1mGoJXaCFFD0wXEpuR2Jz+eNtx6jV/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgTTaCTFUlpD5Kl0XktQGJCZ2ar+7BQY/44O3Q5Lm8kewkDsJvaQu0BJMQ7VioeMORSTblI7KUBXIWlFiO+paydWwURvp9hEGMHTCazelP8NhK6haZDJ5Qs3qtasG6VCIx1sBbfNR3K7Zt0VfTh5QVLv00UEPzDTBhnPpZfOuc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK/tRHoj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK/tRHoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85C3C2BCB4;
	Tue,  5 May 2026 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965787;
	bh=3BtQrd+NUk0P1mGoJXaCFFD0wXEpuR2Jz+eNtx6jV/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KK/tRHojvi0M8VolIkN2K06EyOE+Kvg5JsWZqDZNod4JhuRIuiuSaxaoYMsNsZXMv
	 j1KwX4FraJ11JXTtzpXvLOQ/nRWuyobpMmDsffawPH33etDbgY1cNB7HcUFid0oWcf
	 /0DzJBlhXDIkWQRyFvQgeQ8W429l3H3O95jGFFI+vDOZ9+oMP713/DpDojd1La6bel
	 SJOHb/Q4oRjGQKVcZL8rP1n2jcsdAyxPjVs5PjuaRd0s/zFD343cAZdsNHehUGgxbO
	 iGqhmN8RXSROnFt2A7zptIHHmgvhWtapwcPGtNpyb/8irl32VbwPXNbwXMtmKL0cre
	 Dn5Y7KDXs3fLg==
Date: Tue, 5 May 2026 09:23:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Message-ID: <20260505-tunneling-antique-degu-1dfc60@quoll>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
 <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-1-9f61cf24aebf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-1-9f61cf24aebf@linaro.org>

On Mon, May 04, 2026 at 10:02:05AM +0200, Neil Armstrong wrote:
> Document the Renesas R63419 based dual-DSI video mode Display Panels found
> in the Ayaneo gaming handled devices.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/panel/renesas,r63419.yaml     | 97 ++++++++++++++++++++++
>  1 file changed, 97 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

