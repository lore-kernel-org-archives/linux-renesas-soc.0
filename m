Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42C03B6BEB;
	Mon, 17 Aug 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952560; cv=none; b=H0bsP6QfE9oo1Z6DvO82YjFOw2Qn7ie8PeZjeYhMTja3EV5xmHZhtp+6I2HARjgOnEG1+9Mk5zA71vOQPtuRCGiVLQFQNTccM2lPqM8CB1nWf2FRWX/vq7LJ22GCtUlrhUFu+N0j+ueEmW3ihBDNv1nB1RZldrZvtIFsudJdDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952560; c=relaxed/simple;
	bh=byqE+02g/4UCtnCZebe7aWfevoFQwvy0pDMshcd2zbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J46fM19Ojx97poB9C8Aa98ut9s7F2PBN7vL7OGRnzreTD3yjA2rUCKl/nsHGCLP4FP42LZ+JvX6h8PZ+3y1k1LbnrTJ5e7R6MwdDM3SsaF+gz3eivU0hNvQBE2eZWynd3khtP/3MVhyeXv3yrfQiFEsqOk2P/jF7DF2DPJ7Xj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/dr3avs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/dr3avs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B381F000E9;
	Mon, 17 Aug 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786952558;
	bh=qT2yF0faTkPR5ST2LgRX7fG1uocE5gd79N8AzmJ0fhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D/dr3avspgTLyOXH3DNYNYYFRTZr97wbzFT0314TKUmqNdoNFX+chhYdkqg/htvqA
	 nJrSYrw4l9oFPX2ukSJrUct+yQMCKOBgDFr65Eck2EbBvMT989WTl7aZrl50D2P6jW
	 QXmF5f0f2BdsVdf0XaqpHqLcahBJPgcO034wM63bqQBt5dwxBKInHjnNCtCeilGPbs
	 eqaa3PIBq1U+LH11E+328Q3+kBARwanGIrqipuTi4nXsVyCjJzHYIfC8yrqhd3/cvp
	 Dn8wzfxHp19mTWNYTT2TqzlavbHxUMfU55YDVOtm3ql0wwmiCg317jLor3tHpVIvQi
	 iTMLAytSmj0NQ==
Date: Mon, 17 Aug 2026 09:42:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry
 Pi Touch Display 2
Message-ID: <20260817-whimsical-fictional-dove-89b3d6@quoll>
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>

On Sun, Aug 09, 2026 at 09:58:50PM +0200, Marek Vasut wrote:
> Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
> The panel is based on the Ilitek ILI79600A controller.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../display/panel/ilitek,ili79600a.yaml       | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> new file mode 100644
> index 0000000000000..0a3baffef293e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili79600a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI79600A based MIPI-DSI panels
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - raspberrypi,dsi-10inch
> +      - const: ilitek,ili79600a

Binding looks exactly like boe,tv101wum-nl6, so either properties are
copy-pasted without checking in datasheet or this does not need new
binding file.


Best regards,
Krzysztof

