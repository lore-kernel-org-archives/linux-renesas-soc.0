Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0131E840
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258372; cv=none; b=QJ6y0DYPHjXKmK5+7EzSAkkY/AxNwsXznVv2TW9qPbj6T3xz57Y0rBlryVvyK+gaVpI3lwIBrx54nJKvHUW0s0h/kcRlI12dGJ5/wIi1w7jELuZFpc70DU8XB15VJvxxFOk0XrnT8BdI+DjfWXYlx4nu6zZpBqWvq33zBehZFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258372; c=relaxed/simple;
	bh=2xDfb2Al+hXfazTjwcsYYYFYI7kZoADbOaOKtPhYA0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kNgdIiYtI7ZP0ho5U+QcL1L9b1RLfcKyaW5jJat8DXkwC1sGZj1632gf19LkJlX+jLa4uLZz8hASiMMA91NW/7vWSNkCEYaH2CjmAoo5oSE9bjVtvVMBWpxYF0Jol//phvkhCOuTjrheii0G6lNCScQlWHWpmh02JKYvNwq+XIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O46g7lew; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O46g7lew"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1390171f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258369; x=1790863169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bjiz5fcvqLF+AelQDc1eUMc5aT1mzQ/HKFsPWrKukUg=;
        b=O46g7lew6DPUnKzEJXk7+IkCfHr9r5jCIiRs8g2qvDyJSKA/uO3JUgf1pXe6rpNZKf
         +ABMhZgzFHC+mb3C2xZ9zzEwnzPU6hJQaKIz9m6swa0zLpskWUA/oDxsU/g5VkhPi70j
         N5qrzuKecArBTIkACGwO6o071mBwYyKQXd7eTSnhglfPnfAbL1JAgVFeKXrRsEedffeo
         y56QC5KAcMWDfquewtM2068wthiWvblgF+a8w2yIzWgi9l3rkiE6xPL0SRUFg+daQ9Pp
         QDqqoUgzP3f7LYxS0dqnhl0iT1zI/PgLbaTZXkUoaute0ELBRbWGfZoC7OGEORdnDNDb
         oggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258369; x=1790863169;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bjiz5fcvqLF+AelQDc1eUMc5aT1mzQ/HKFsPWrKukUg=;
        b=xDQeCEl9lBQpj/hWM1hgFZUjjgdVg3hCLIkajTtxfrI8i54Unt8Lf8qKrCt5Oxg41X
         M46HUbTYeOadIJSNWDRfTSDCyCkboBdgpRN5ZDdBJeovpId5Hq6AKZCPGiYINArdnfiz
         c1KI3ls3OfP33QKKMYxOsacLFMbyKQzHIvblV3C34Ue1A/Ta24zyyR6evnl+0mobXhmC
         iAa9qiCVgDSWobzZaYMoikCfM1jvu+lbwAxmt0kqKEPzAJZlA3mBX0WfZsvc50+cj8ub
         RrQrIzVSiPi1k9RAZep29X1f3RLLUhVg2LDXjN2q0SRym8LlG/96OrNtGVVHDyGBXiKG
         ZzFg==
X-Forwarded-Encrypted: i=1; AKwUvBxFl8aYRI+EK0Z98f++N1Kl34rjFP9AxTxcWy2cPjWtAafmCNs1427FTkhNL7DCeGPzCE79gVg0kwPxRX/VwfqIxg==@vger.kernel.org
X-Gm-Message-State: AFuF++kp2Q5RnEGekgQToJYtFcA66ebmmAVR5C2E4mBHKy1/CZq0PRgh
	IkuWSrwsX65WGDPTza8v6CPVpQYoEk3dV8z7GlyI8pp926CAo3qO401CtN8ioo/X/xk=
X-Gm-Gg: AYBFou1E9cCT9zpmWe7FzHEuymwJ+ZeO+N1gcIVLKdLBqrgvrjGj3DybVSZkF7+Yc7Y
	Ggv3MVl/hRdXtFb0ftDffJG3X5iY3TPTSlVy1rXqmawxYAx16A8PXGy4JofLnNNpYILVnj+S3Dr
	RoNgCPQNMetobchVHyMePBqqoWgKloC4zmeiFLn95hgdn6Ec/TLgmqZ++oIIeEdcuxBeXTtWkNF
	920mA8WXZ8FoH8UHVNXAAE6PUTh6pc/OtG+z58yIkIoWamw0o5qRuT/n6CsSbHEQGAHhwaBZCPl
	iRM4fbLvJJAvkkg/ue5ONgD/jx324X4/1sRqBH3Xhbl0OnOOItfttvtkTFVPEDRJpqc7PEC/E/2
	wSEqDy8ocJNXM/J1VCkJKrdXyK7Ii72gelKhJErwtUB6/jCQcUNQL34V94V0jdbXkea9juyWANN
	lViY2O8pmudY2ZiXz+t15hLjRh8X3cMJHD174BhCeHkjklviogGuYGCOqavd85F0wZMqEd/Lmer
	cFTUzGOOF+M3icc4dKO
X-Received: by 2002:a05:6000:238a:b0:487:84:96d7 with SMTP id ffacd0b85a97d-48871974f03mr4191954f8f.53.1790258368630;
        Thu, 24 Sep 2026 06:59:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document 10"
 Raspberry Pi Touch Display 2
Message-Id: <179025836777.3234093.12909071047594857987.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Thu, 10 Sep 2026 20:18:42 +0200, Marek Vasut wrote:
> Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
> The panel is based on the Ilitek IL79600A controller.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Document 10" Raspberry Pi Touch Display 2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e40d71fa231fc510c87c92cfe40f60f18eaafa61
[2/4] drm/panel: ilitek-ili9882t: Make enable GPIO optional
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/803d7e465616d2822deb10ec3bf8952e49ffd6ba
[3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/20f01db1545252cf81a39202920d0b032fb4501a
[4/4] drm/panel: ilitek-ili9882t: Add support for Ilitek IL79600A-based panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/481b38467000602761215ba4a196e89f58248055

-- 
Neil

