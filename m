Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4FE41DE06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097518; cv=pass; b=lxpVN9KaQL7niDUbgNJPELvovaqcf1qFnBJvFi4PBzrZPp6GgdEzKuVNkkU7ZkA43gvWylCS2+3fGJMsScGqc4Goc9SpeEALkQw3Q3aIJDK4hjd6S1HGtaGTZqkIz0eFr3ZkXlbMoe8TNmtOo4h+qRGD8Q8hw8m8QaMKt3ToPig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097518; c=relaxed/simple;
	bh=LYtR3cATtrhaKdCXad9h6EF4UUKN0gTzzGTF5dGZBeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FK1sVx+0oZvoBUyDZvTlv3NHjW/3T8vRaC4+PWcVQR4DMAVRGx742pDKXyzbCGoqDBrPwscTFnm1+jbPeOjV09FYWlkwrD1J4NtXs7h8eiGHCKT1m1lIuf/sttR+NTiya1VIiT3njEj+nUXIVgrbdHykJ/QSu7W7mvBSE8jCN8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHl09hA6; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHl09hA6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfff5f88dbso46211635ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 03:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786097516; cv=none;
        d=google.com; s=arc-20260327;
        b=NFSGfsiYStbMOqvLXxRAcVTrKEhjrVEW7tAjfgwSKZX7GW7ou/v7i6nMFC1wQc9VVG
         lnC1ep8mUDpoVS8Q3PKwyWFp2PUt1vpunPNOaVojlOxrl0gGvhueUXfOZv6E40TItyB0
         NxhaTOv/CFdDq2Vi2yA4Ia5eUCSf9f86B4L8h9OGNiF/sDttmmFDrXd/R+ff15GKGfDw
         TXlwW4OQcSEhVsqq6bLCQTHd0A++HajTuQykaH8U8B6rXaw5IF9IoRw6qte8NuSIuJPo
         UqhU8al3hhcT4jynXHtXA3PMRqnwsVXz/CMaOk7WQRutKF4qSrCzPhVgD2a+CjI1toXv
         /kTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        fh=vLr3LbQqUmT0aIrrZRTwoYJOMW6ecjJabt8SDWe9vKo=;
        b=QbeumyyjP24uWyuqNfIuGxL+UpLGI5GRnVvd2dFuLD9WwR3t5C4+dTwYYzyn9mxThO
         iaxVYF5x1Qd8JtX51Lv1W69Oy7USfGmJVDlni2BoM5SEpXeE2SFaADmvf+6RsY18qPl7
         MH/ErnqZL+succtLziY5dEXVzkN+TZz6IheIqBvu1Zl2r4f+qo9GoXd4keMVoRNGgXch
         UI5eMW6FKYAyAIDFPdJOPXG2OKXPA57YKlMPxHuzxPTKvFEjdmmgtUkZ2DGY9NmDjdIH
         oXRT5BN7vaVVpugpzWxzICRl9wfVMhg5QM1ZXh1zQslgykYZi/8mcO4xfJ4A0XS8t3CT
         EX4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097516; x=1786702316; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        b=kHl09hA69BOi9OCrx5SGLQ6HCDhoe8SpT/RknkyCHZbZyiS2BhTHk6yKLBehEj6h+8
         JJLPh4XXibIL6KwpqQdFEqrjgVf3sBsqXiL8toR7T7n1AtbQnH7HbS33d48No9dkVqV9
         zKe2qNM9FUsK1lnRAHdu34GobxYiesHeo4wDnDVpc0o+jqF4ttIIKrkQz05J1YD39gYS
         AGwBqRPegwDnEivMAZYnZv5+mjP/3/IdfANq/Rc/jr6/orfxt6StB4CKgGw9HTWKz9aq
         CCUDXhTc1ejcTBireY/yY08UBXxZjpl7xh89/lHSanaDwoJt6qZG/Cp+ypzdDsdPZ05x
         e+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097516; x=1786702316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        b=ZzbevwrTSIkykb14+5w3JdgLpBm0BetgRCa7E9JoTnKTIwnhyT2pK7Ph9V6ik5fqVW
         N1DTldhWYD8GeY05yrIQUTOib0E/bfWkTXGql6hPokV0n8dr6BAGIpPY7WUds54a5p0T
         cE/Dz+vK+t7FXn86TXvG1tHRP++xGODxgvguSi22hq709R888MGHmRy1JBXfpPraGBLH
         E1l5LtpKG4oVvy3askPKORYFW7pIXkDaLWoanyBOsEq4VKDvu7JGEyuRw9nfplN8mgxv
         b4R8QMmAqC7hR/SBZU2yziDqWdcEve89kpp/pbCH4cFMskfundwY0NtKgvyzr7EWHHOB
         R+AA==
X-Forwarded-Encrypted: i=1; AHgh+RpZbA4wFoxVjHDa2S6g6Dhgwelb5ixP6CTPlk4PFR/5yWlVRVohzscK+rVocpeOlspWeAziXNP0hki8y1MmKY2WbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEuklsfwhxtLQF1weHCMoSKDdDvntcZwNkxaS9BKMRjVJ3SEl
	5XK29B/9U51MSG6TDBdhOHaXOf+y8TRr8oJzHCh4gof/uv6/sRZvL7N/sgsLipCPfPM9MN/9DNs
	KyORYX4pDH1Gl4mvXWHEd0of0WmprZPo=
X-Gm-Gg: AR+sD13LPhJ+kFdz9YAwIotQALPFlaDX5jWYwsi05s6490uO6RcFKIAlK1Sf21j6vdT
	zLXejDafds4PW0o1CzTRNp65xUD2sWTt54mFKcawug3lMk1xP7gPPd86sDndYrB7yEau1P5GClg
	0L5oieHY9P1EPpCYc4sIbC4oO04jGSMJduChlp8jR5uJIGraLCYGFrH2qRjR2BVfXZ8lVS2eRSL
	Nx3o3968FYGm8yGdxFL2nyEGCRuno0zgnUSpgqjIb0Q1gOn3po/VXnbu7TnI28nVEVqV7AYAivg
	SM8/okdKD0/qmi9/R1RK6vIWck/rZB7x35fv8Ir92QaRQ1V8geEemUcGmvWGe5Jel7rxh4nYFsp
	JPKMsqMjvV3abJ3FPcmZYVzepdXt9JlYXgnF8WJpOSEgDvNT48a9Ziej2
X-Received: by 2002:a17:903:2290:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2d0ca78d505mr240111405ad.16.1786097516111; Fri, 07 Aug 2026
 03:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com> <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 17:11:44 +0700
X-Gm-Features: AUfX_mxB2Z6rKGI0C552xtBhSaQUfWGeTqpz5g_xI9L885nyvRhIV34A4nRBpYo
Message-ID: <CAABR9nF7sAT4C+W_qE8GVKhrtTjdm=DcpJH548RzFaYLuED+3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	niklas.soderlund@ragnatech.se, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thank you for your feedback.

> >                 irq = platform_get_irq_optional(pdev, i);
> > -               if (irq < 0)
> > +               if (irq < 0 && irq != -ENXIO)
> >                         return irq;
> >
>
> So the code may continue using -ENXIO as an interrupt number (and fail)?
>

Yes, you are right. We should probably handle it similarly to:
https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_thermal.c#L422
and only assign the IRQ when the return value is positive:
if (ret > 0)
   irq = ret;

> Why is this change needed at all?
> The caller of rcar_gen3_thermal_request_irqs() knows how to handle
> failures, as IRQs are optional.
>

Regarding the caller, I only found rcar_gen3_thermal_request_irqs()
being called here:
https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_gen3_thermal.c#L530
It does not appear to handle the error return there, so I don't think
the caller currently handles these failures explicitly.

Best regards,
Phuc
