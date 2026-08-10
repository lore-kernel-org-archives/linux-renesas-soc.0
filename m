Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328821CC5A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368737; cv=none; b=m018Ee9l7+GXAxUr7nPl6oZrrP1pHQS4aMEv+7T5yQprjmYIltdYy4MghdLvRRcHMn+QkZLo7/bZ6berW8vw5YztEJZRENkUEK14HF2aKk2VSXeEAK6V+I9+dD8h1HjxlMHeWPuAV9JEVmq9E1dhCGvasWyxXQQBmhuNpQuL3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368737; c=relaxed/simple;
	bh=Aep+teDJlwbf0Y5ec1cKht5bwgrOwhUqVAOQe+YdTw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drdqbJWZr1Mqk3Q9/k2R/tdOS5vt9hEZK+h51ktROWdDn9/o19eIW5Tgowo9mrlPPejzlZRysvtALCAH0NAJd6+F87i+xJNMP/R4BJzPDhnVQSt4mYWvkCo3ZFfRhtBNo9BGmeatJD0HRR08v65bPijc6PCRXR2jEow6jzB+BWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-745497ac8fcso306084137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368735; x=1786973535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAYkmwu6egPfLeSsRRfY8GI/sUgVMT8KKlBPc0rkkQ4=;
        b=tKcObIGJ7FX0XueBGPWyCWPOJyaIHHrujE+J921sxwiqzV0IGNEDy/b4yk8Xr0/VZ3
         60y2oOLcj/gOVAEpX6XvrENk+6IC+lO4cfiq5SM2eZ2xWma4m1/8l7rIz4Kn1kS9VG5Y
         +u+tHIka0fKYSlLJU0M8hLzXkjqeKsCmDq10p7BTShe2kVnGmym2H+yt6u4rvi1PgBMT
         LwT22vsjm/Wylb+U4lx6E+RsALMjhDno2CXB/YyLQ7lXnFfFLCOyQw8806c6FBzmkZhk
         bZApN0n/42q23LKph9R4CeA3I0TQHAbjBNyUS87l5NLYpr1xhsEnT3YLbavoYwAzIfLT
         GKcw==
X-Forwarded-Encrypted: i=1; AHgh+RoSPejXYmA9NEgnNA94TrNR5ipvSn3RdUjkdVKFUZEm2rlSFkzTiVrvBcvtpSfXrIzd8tQ7p0re2LUmqGBfKHpLqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/2GWOcxWNyG2yM9nJ+N4imN1dvba0C+52R1XYjEwGUZ4z5DC
	yriqSjTJQOV+SVgU+H3D82Zw1V34hHaUEYstEaH2zpF2JUC7FTe7y7YcLHEWKHlP
X-Gm-Gg: AR+sD13amDShsV2zMAqS8oXU3WuDF40XRa4JhG8j7ulPjp27lWJVtXVv7Jw+7LDfj+E
	TXBUpmulrzycdNoR6Rp6wYASifI8RwTPVZglnL69ARjC/zHXMZjNW9Rw79MjLZ6IGp/LljHXK34
	KT1E0Om27vb5CJGpVqs3i0YyrJOipO62nEGfhzZ56pInMNU2qBTgz6XikVOgkD5qcodBrogWvcT
	IcFFa8PI5FJMvORCEElu/N014sllLbickDiOMHU2LhqqfRhmDU3caMzwkfansXdI7zQbxrqc+1A
	1WTMzon2IX4waXtl4nJzDuIsxD/RLpXONG9kHoCU7y/GRcIIaUncJ9Lcfj+pet28uvO1amhoDhY
	RL1p2FaF9RpBgNhZAEQ5kRM7WJYwd/jG1r7LL/5VXSOII38kgBfI5H5RUwA+buXwclMcpKUIig1
	0Vo94kLSN9DotbCyu/UdochzCkBlyFgtBY53eGgJCRrTrmglAbujgxuuEwdGtf1xjUKuRXjtukh
	FkHwR39SDU2bwpKu2zlIeZ82A==
X-Received: by 2002:a05:6102:41a3:b0:739:626d:4473 with SMTP id ada2fe7eead31-764e1236bf4mr4370271137.0.1786368735427;
        Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303b72bsm3325978241.8.2026.08.10.06.32.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-979ec61bb02so389647241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrzOgpE1rDzWZLHNyj2mcJD/eCDzYr7z7ENrAllAFzACoc+VNtTfl1nLCNB2riH3Yp/cbncgqeNmJAKSMs9IeldQA==@vger.kernel.org
X-Received: by 2002:a05:6102:5129:b0:745:31e9:f3d9 with SMTP id
 ada2fe7eead31-764e42f6f3bmr4278378137.1.1786368734822; Mon, 10 Aug 2026
 06:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVURU+FEKk+6veDCm=hyO+G+5=nRrY-7gO=9WHdCWgNdA@mail.gmail.com>
X-Gm-Features: AUfX_mzYGDDJkWYPMaKDK6-tLiUYUuFIuNBGVT1WGjCUgRjPIFMG82sWBjDm4aY
Message-ID: <CAMuHMdVURU+FEKk+6veDCm=hyO+G+5=nRrY-7gO=9WHdCWgNdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 23:03, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct a few white-space issues, like using tab after ':' character or
> spurious space before '{', which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
