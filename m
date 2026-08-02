Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E2194C98
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Aug 2026 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785640310; cv=pass; b=A3AqrxZsa+toUJv4Bs64Tl1b1h05u4k+2mK8K4q/8mZ2JG9cOVI3FUEuHz4MiS6MDSEd0Afl4hBi0x19lNWQLX8nDXxoHwT/FnHdSLr9A5UC36ppte6x+bnukj5Xlx0g2cqhOYvDnVjM5ujBGneHfXEVEb1w3h6bIYxSqvJSRUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785640310; c=relaxed/simple;
	bh=h/qPNbFzuWh+d9q8xOJUsBHHg8cmlcEFMBu7sZocerM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vA8xOQFE2UWfyu5tlCowg8lVRFcjK6BLN/k2v9i48l/INdQTHuW1LLuyWaURsviis8jetBu9Gm1o8syQ/K1OHmtaQtfjiljxzHG3reD7Aa46/qC6kGW8BQ8cMATFq+ZOMwhB+j3UB4NXAPzqGnrUDny+FP/R8MDJJwwhEbw+0To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4TjMDOE; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4TjMDOE"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160cba3944so137017966b.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 20:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785640307; cv=none;
        d=google.com; s=arc-20260327;
        b=jHYS7GhDVw+3Kdo7Wqz59AIPRHiWNFOV1jv7n+eWA0CyQMw0XHlZVLLCSy3fjtwfSt
         lvMYiC7Bu/43zyyMH0LKy493kLZyOUGyUJu8uBG7qegbUXUXIF4sbJ9/RmFjmpHrStp/
         dQy0dzAnBuTX5D3KcmqPd65vHZbHR4xKugqlKKREJysd5/a7OO2b/ErXPc2jjH0FdGcp
         qxEoe5XjVdr0ZEhB/fNVJ8UEc8e0n7q4duU2MhXUr414GCmjmf82NqWIaEDRTU+2WNdJ
         IHa2raPPxFBNEuozboAJ2BqWw5wD72RdXE5dUefKy7JfEdIYPYpiu7XVj2OAg3TCW0Z3
         UsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        fh=/YSkVAltSXRNEeBl3D7ctMXuyQyZ7HLCI1dMX6MjU8k=;
        b=OqepEVj2zqlLfaZTGWs2B2gLWbcg7/zI7tqYpHTsGDwfruHqsUc/UENP77W8GUeUIy
         wjamv/6w/ubdpRvKwn+hR4A4I66odNTVLuN8gn5xTYTGTDjByvpU3ZSNprVNfT7wYTGh
         jWYUuejwbWmIRCR5Svj23q6EwYx9RqjjVY/D4JlE7o+6VquDwvCP0fpj0wlV6F7H+j5W
         LNDuk99fWMAAo9welDiYuJz07Eo85QSy9TCYu6yy6kRAZUxrUpsbI0yP7kZ7geLPUZnQ
         1BjQ/YV+nctUHSyT1R7nq7QaOI4kzc0ferEU0XkO/6WtAxz4c7sRjcwlmas5A59QldwV
         WmpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785640307; x=1786245107; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        b=O4TjMDOEmS6pyMPSkwks2y9sHNkqT63FDsWuHoFfYw39SG54OcTdFKI6F1mRZESwHi
         UWxUrw1LT9JeOil82KahPV5/nGhoONpK3XhzHBHSXcp+EtD3Hj0smaKEmW5Pq9DanEzY
         QVWNXGz3ncBjC1jPCr8AWMqDSxiPiaRtGJ+bwgkxAcIX9KsFJcvFFlPfn1HcgtiX2icI
         e8UoFZXzqew8Ijm3ftCqmfrK80K8ta0lE9YEUIUWQlYb2frOdZpieJUdbdJuUFRwStla
         SdSC6IhGa8dbTwWpQcSBzEytd/5ykOJWbMwZO3iyXrrtlZu3uT/xdfMgKoMEGpsQ7+EG
         K8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785640307; x=1786245107;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c7i9JdeVJzDWpjjDEXDdnp2erjUKykrkBMYRh4KI/Og=;
        b=ckMsEzsS1ioMdXRn9S97imk/AlaRnpWlpgGt7AM5jB/92sIQ3XyJ3l6ANjWKYJMo2L
         Xg5/h6LbkrMlN9OISCNhGi2ISusbMM8/yNumYL2uSuvnLPHeDMEUgxOFopTMzWoRHiH2
         9xjbW+Hzm3DvdE4IrGG1iSMaRaEqnuyeuHK/vZXWsbovB6VrZ9Sp5Fr0cCgWUIOalztr
         dqaONl2xVfxLyALYgnkFZ/wKua3bSFAHQRpIDGwGjr/zB9lRsb2etL5UWNI2OijoGtNh
         D6L1VbBqXALHyFBVBGmMFnZIPqfWqw7Mfc/IAz46743Hece/854RckJoYzvXjV/Us8TR
         ayXw==
X-Forwarded-Encrypted: i=1; AHgh+RrQzuT7LUjMBLMJ0DLPexjVQCgBgJLuKEE/KoG1Bgql4sv/9ykGvFZaHvsb4OWlgfiAVvdnS1hcHkXpPGnyTzeu7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGmz7PTlE+QlhCGKVXcgS6HNw1gpI7eDJVV7Sw0RZlP7iVm31
	BtACXHyVaDr0rltNbbE0N8C4ptIGuGc6n8v1zXfiY0d16UDLR/SWzf8oo6iS1BUpqllGj55cp75
	UceoWYzUshVlbB6jYIfR0kjooi7tF5fw=
X-Gm-Gg: AR+sD12EWPPO1kMXm2unD8GLRTRSy6TWohpDUldPMpP/1G+fAcaba8nQJboGhvxqSk9
	Rl13xl5HIBtq4IsnN8zl7IB7hLfyp2nGv9mIE5WIhxyE+lwetScSCNStN0ig6xmUUcbQDc8OE2B
	tutMqQ+zcr3UFl7rezqRjHZyGX2Zg2PP5yF57CVLEjMAzin3N3JMQ0twUuPIjX6jh47oPSrmGDY
	C1u1HkW+BrCO/uM1/nokOzB1TTIikA6Dc48Fy9Cu0Xco0VcDVzxJUCiwgDzka2qIxfnKNOHWZS/
	ribSoBvpkJzkh9Fxnhvrk9JXeegu1YyeWq8YvYigd8hCmgKS/DrmaI2qxSU=
X-Received: by 2002:a17:907:a0a:b0:c16:318:34e3 with SMTP id
 a640c23a62f3a-c1fe7ee16b4mr409057166b.16.1785640307171; Sat, 01 Aug 2026
 20:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-8-coiaprant@gmail.com>
 <cfddb747-11d0-476d-8402-e0886cca582e@lunn.ch>
In-Reply-To: <cfddb747-11d0-476d-8402-e0886cca582e@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:11:40 +0800
X-Gm-Features: AUfX_mxry2V8YGgxr6fvsxNhCSaA_pBDCP69byM5eyulpGFZP2LcAYzvhwycRyM
Message-ID: <CALj3r0i1TCTgvm8FrJAJqmZgoJp61NCxc_xmVYaDFd-gh4H=7w@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] net: pcs: xpcs: add ANRESTART support for SGMII
 link recovery
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thanks for the careful review.

> This probably needs more wide spread testing. I would be afraid that
> if you kick off an AN cycle, you loose the link until it completes?
> You would of noticed that on your hardware, but other hardware
> obviously behaves differently...

The trigger condition is: link is down AND an_complete is set. This means
auto-negotiation has already completed (or completed with failure), but
the link is still down. In this state, the hardware will not restart AN
on its own on RK3568, so the link stays dead forever. Kicking ANRESTART
here is the only way to recover.

For a working link (link up), state->an_complete may still be set, but
the function returns earlier at the "if (state->link)" check, so
ANRESTART is never triggered on an active link. This should not cause
unexpected link loss on any hardware.

Regarding testing:
- Jiawen Wu has tested this on Wangxun NICs and reported no regression
  (Tested-by tag included in the patch).
- On RK3568 (Photonicat board), this fixes the SGMII link recovery issue.

I agree that wider testing is beneficial, and I'm open to running more
tests on different platforms if needed. However, given the condition is
strictly limited to "link down + an_complete", the risk of disrupting an
already-working link is minimal.

Thanks,
Coia
