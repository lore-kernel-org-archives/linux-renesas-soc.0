Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67316377561
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068146; cv=none; b=R72YVcDVZ4N9wvRUIMaUdilXOlTuPsBL6rTMv5zkm3HisOJlI0nouIj42hXanSTBPrK65sc21DvjRiPkILA2pYAS9H8wNP9Xj4lgU0X/R2mYa58xLiNREwjE+OLanPZmmYqHx4ZQNRDDJzGObTPWykI1sNYCuSbB4t8VwFjRW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068146; c=relaxed/simple;
	bh=BkhcnVftKdbXk7QyqJTW6ld5w2ThLg0FRlt/HdPNMfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pSLXmLqI7mXmSbXNKkGubxJkUFt255n63/RCtAOgGaFqkkbGyyBnQ4fB4VNeDt1uOpTuG19qneQGDdAyb0FV1SZ4lamx0NiDRz9sAWDZgg6OaNtTSqXjx0kkfeIrJdXUSedLmhQKwtI44M43nPtZckxx0OQk1B72k4N71ua910A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GI/RmeVD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GI/RmeVD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so2392735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jul 2026 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068141; x=1783672941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUXYNloFl5fvS4Rg2TDnJjQxrpMnsYaeEPEFyyaGAnY=;
        b=GI/RmeVDmWj5772yjPFyHbHiDzZUpMhhACjbgkNrl1MuK/Ys8CXvtWsdoExuhuSVer
         GVx5IZpZueR2rH2rX+rm7sCPRTnZhMdWFvF0OXEqd40lYjivaz/0E7vemlz6zSE1zKiB
         V7d2V/rSQxAydsTS/gzgHPxRFz5Kz1oqWwewVWP3FDHWGsOMBO7Kji8sUt46CdwvMO06
         4Zi/K8shhwCwlavypuRDtSl/xc1zzGD0wUgmuQrTov8vZgTBgIzAouFFbrHw1Nj+5zEC
         YaFeVK7fCg07YXb/+kMBknKoqbPM7w0EbhJtZXYPneGv4MdteIDLxf5NTWd6ix+C39NO
         rgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068141; x=1783672941;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUXYNloFl5fvS4Rg2TDnJjQxrpMnsYaeEPEFyyaGAnY=;
        b=rN6OiAfQIRSYRl8P1TBgwzTq6q6gXg2y1ToaykQVg3pWMLOK1stfv4ld2E7UbiVXg8
         pEbSFLOXQU6hixACo8z9wzcskmz790sB54QtAwlPNr88vYyp9Id2gRoacCb8Y97h7nKb
         GiPzawbgUuO8HJrOSQ6SeYHtMe8GIxJaw9Nw9ySxNyEjk68GiP702BPeYE/GkxbePGjx
         py4MKnyHI0i9xI1FX3tno46btOA4qSyiAyA+ocBy5/esQbKiWYu9vfhi4fk7axndZvMo
         Kbvzj4dY56Z8tk0GO0TlxEF0MJMmSdd37viTWaeAwYTZpw++Y3cxN2HMdIc3jKzBRBsV
         iGLg==
X-Forwarded-Encrypted: i=1; AFNElJ9A0SQrbclnM0Y2ZNkuX2fr39bvk1FGVQDYixlpXp3G6gioaPFHQUE13k+ye0LO1vbHZQKdtF6dsx5bmUUrdJeOhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRtp+MEfu9IskHVbq8xYC2aWKcRxsTfjj+LihKmA7I0yS644T
	Ge3y1JdDSQZbaEI8seyjZR+BBDD+JUqzKGfTGiAogqPYc8yuSneWvixFEMaqtLzuoJ8=
X-Gm-Gg: AfdE7clyXZfKWihch97UridBb7ObHwyZGGH/8Inof7Ad765khkI7muImlr40+KaHodq
	YRdGZtwcinkwC+7aF01ZhCU0F5Y1bYcVDrgUECtpj9GEaQfm857XC3yfhE1FzrDTYgs8cCbtogI
	gvuQ5wgOUPwwBXdiirK4T/LAG9gfr62Lg180U/84/Slsc6JxpVA4s5Ga9LxvA/BfsN+Oe0MmWgd
	BDgAawCqCKhiam+fhFOq1BvuVGITDGB8uEI0zIBQ2An0I1tQdwi5i7/SFbdNmGxJ4wOU7HzstiX
	d97SWFsBvXVZvfPCDoZEu97bywZl2AIaB+Y0moHpl5u7EMSfFjyAdtcL/W2apRVq5JFx04HbU2K
	2eOz9Hedk30X4mEzYuO4hWBTZ46u8Hx+IrLdS+hxIPLu+4S/j58F6uRVW9bsMFHZ1GjimdNmw6F
	/9mGRi6ogJ8lbxFFsyFYvnB/KigTYt/hsjqA==
X-Received: by 2002:a05:600d:c:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493c2b433dbmr119940725e9.16.1783068140862;
        Fri, 03 Jul 2026 01:42:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-0-b8929af5e951@linaro.org>
Subject: Re: [PATCH v4 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306813951.3165305.5039889497151829172.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:19 +0200
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

On Tue, 19 May 2026 10:09:02 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c04ecc893f07d001e484e6c420af19a970f755c
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil

