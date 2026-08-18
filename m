Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878746EC62
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058426; cv=none; b=R/ueMhM0jxk4kQ5ekVplEk2wyzvOvuoUZuoR49iy8gg8M67G62LDDIRjufB0ejl1hBSSzakPHBExQBvhTxrpY5NVY0z3lH7zlu9VwNKRlevIjcrS2KNAUr0akKRWRozDM1+eAg6l5zYzL4LEug+y+jCvLRD5miqLigCPWiTaKYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058426; c=relaxed/simple;
	bh=Lr2w9IXbYxpbFpQSuAKStGPPX8TW/VF+EciAbzTXQiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fux4b58+urW2EV8emOWVk6k/Rg8ldJtbP4i5pxydVMg4DXSJp4el+sFBiBlK9Cfm5ecL8WEg8YdHqLiHxlrOh225RPLPAgIhGpZeM5ziC7oBel9Qdh6m0K31yM2vjqhOgt+9dxYO0Ssv29mu27NE9rlQGK/3StpItfFmXCu1pG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso6812758a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 06:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058423; x=1787663223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fBVB3ojX0XqGX6y8ulL4F2m4TqvrNnncf78A4xqUgHA=;
        b=jSnS30RPzqZvCEgX/1IN521yCDCzf7hW4jE77I/B6tfyOWDcOn6YWOU+RnVeSjUfwI
         WLO63fRsa+Equ+VHS9PCMmyUk8YkgSqsmgQD9UFQpTtQdeUA8RTCGAkomP/JNvvh8Q1/
         TIJ0IV6Fxm+txgJioeTzK1sX6zLyKQigntTc7jZLcuRHoHNU+Bd4p1eHWWE2z4f9CRXK
         9RX7QtSIvO06mfvrEobpTx1Xy1LGi+LOjri26cNhed1gF5Hs+x5k3fWuimnYkrkOuQG1
         m9m78eNzs27T+SdckyTUF0kqITDf7v9r9XyQcKsYEuEWKLmWedcE4po79JNa/xVmwiAb
         8hDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9YSvp7V8ZDWjOHoD1eo0K0Cx1jWla20ealhmhEf6slEvhAjw6ok/XRINn0/q9yk/XKjXYIw168Y4VZSZNbN9+Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLDwP5LO//RgbxViPhLHlTUpLwuop/2Lpb8xnODwbCJCLfLbY
	kS8qJG8MWp2+PVowF8RjnP2O1PaCsNrGlMr7BFSVfFpQB+21Cdr7O4wuPo4X7gNn1N8=
X-Gm-Gg: AR+sD12dxFjYvnS29g2i77pEqfGW6zDxQT2GVlFcAYCejfRn07RDS1JylForjBXOEL3
	4wUEAwfEw4ZBogmv+kHZ0wQqlWyD8mMCKVx2QGk2ai8llnrp9dnFLo0ArgRyTc+yx5ydlmYvWNr
	TC839jzzX7Grc9ftPE1lk1VaBDkteCZZzcA+/8E/UISN8h+NUJB//0rF1u6wtWXfEVjKJbA3xLa
	u+WzU/lZC6jaF9MF4dZ5tHPwIEh7mQufDbv4NwkWoZUWNf+UJwNz82MTZVqTEUWU+ekx1LtLy+t
	wEKG0Jx3Te5QFMcbrGN3xTUSpHG9Jewj4riA5A2r9mesjoADvMFKA2AWbQCVgOgBYdZVqD0U30R
	Ct3FHwLCZkbW/8/uYPdAfFB39N68Qnaur+9zCz2tOJZ+J3m+B+mB6nytUo0+doi4Vb204EHlBIj
	yZDdA42DiGgSHsG5A6Bv5ULvzZ2ipYz0FR7/5PjKcM3nbObAeiWZtImfOW0goOolAWDG74tMoEr
	m6bqe5onp7WY/8Rf/k6Mfb+gA==
X-Received: by 2002:a05:6402:540e:b0:6a3:69b7:924b with SMTP id 4fb4d7f45d1cf-6a38a9123cdmr14644448a12.2.1787058422766;
        Tue, 18 Aug 2026 06:07:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859717bsm1770730a12.23.2026.08.18.06.07.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:07:01 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so4536904a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 06:07:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoN/OlbyPrQBdWBu50VT6vadUCIclGmKwWz4678/pWXWAIn5siT5N7479h8l2+pAq+U0VDtexcvussjL/TCu4VsVQ==@vger.kernel.org
X-Received: by 2002:a05:6402:249c:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a38a926287mr16210086a12.6.1787058420304; Tue, 18 Aug 2026
 06:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2EBD0396FF7A54CAD61F16E942D2E8FA3A0A@qq.com>
In-Reply-To: <tencent_2EBD0396FF7A54CAD61F16E942D2E8FA3A0A@qq.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 15:06:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKDLSKJcHaKdn3Vigi8YDLCLnNSwgwimDBymqWf2yjng@mail.gmail.com>
X-Gm-Features: AcwNN1UxeX0gJVCFIuYBZOc1kAkUVD16y3L5ZDWVp7YzSofvA4LIsWhA_juMV68
Message-ID: <CAMuHMdVKDLSKJcHaKdn3Vigi8YDLCLnNSwgwimDBymqWf2yjng@mail.gmail.com>
Subject: Re: [PATCH] net: renesas: rswitch-main: fix runtime PM cleanup
To: Jiawen Liu <1298662399@qq.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jiawen,

Thanks for your patch!

On Tue, 18 Aug 2026 at 14:44, Jiawen Liu <1298662399@qq.com> wrote:
> From: jiawen <1298662399@qq.com>
>
> Update renesas_eth_sw_probe() for the confirmed driver lifecycle defect.
>
> Keep the change limited to the concrete operation shown in the final
> patch.

Please write a better patch description.

>
> Signed-off-by: jiawen <1298662399@qq.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
