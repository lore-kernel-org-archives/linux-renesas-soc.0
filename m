Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08F3126C2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063341; cv=none; b=mF/GJ1s3Nwf+7j9IxF2Ili2CTlF8zdtzWy7CWc5FyzfHH71lSxPN5IrbXm4WhWDdhZ6gdmeLJngAnNgzdE6PUeLJvQziAjLIJbbA/d4auSoV3DSc4OqdGzSSUY5RrPYc7TO7xXyvrmX11yVmhLk7ifr6iAe/T7wgPoqsAwBLE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063341; c=relaxed/simple;
	bh=mie0nTDpXVpzdLJv114Gdf8KQXJnlkj43PK47MND8r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGsun0B3e7kxhD85WevchEVeMR27y/VRSF7YY7R6SlwAyYtUYNhlTx9JCP5CzL0lzWIqwwRsx8ofoDHctPqHye1v38jLPwJGM4+mdRefKuxxgzSW8h568zNv5ZcTI2H7g9R5a64WEwhwG62P3b5XRZhdleuVREGNAZTZlji9MHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso725692966b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 07:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063338; x=1787668138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Thf+EPoHrsWTegx4PKx5P1+Bl2bUkRvVPDASspkr+Vc=;
        b=kri8eoHviM5i/rcJP8B939kTlYQ725pOF2So5oKvSpj9cNgYj5BOwXHtlWStnsA1Hu
         IZYTkWw5rq9CXJWClsS7jLj2DWMvem4sEwM7asO1jgMfWWcQd7PPqZdbxS3kl3y5UPH5
         cBDoyOrT1Obbo8/JjbENTs6sCtTswN27C+qsWo7nL0PwvJLmRsR8j1mm1ozTfx7SyaOq
         ShGhS3uleWiTaIPs+itlwwULeK4fDMTrh9dubAHgvxEAX3Wv1bdNmHTUWhodg8TOFmoG
         n7HMZ13khNaKraT/pZvyfBoycO7+mzZlbDhWP0qSQWRThCeUoKn99TmfUIIaLDiDjWbO
         Hh+g==
X-Forwarded-Encrypted: i=1; AHgh+RqxKX6H3IEQ48rnF60TWabHmLaLqZJWkeo1XdVBMVTlqcjcUugEjk1Rjt+0pfivnJdlZB/3TdQ3dk/Dp+QOWgsUtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFAQCMWEfozq+YCOErHel0FeHZaEeVG9gIHw5rTcRZlqIIiIl
	7LBwWnbt5AFPyggk9RHrH/cUlUuMMO0G+lcEOlZyQyLTZFLxpAua9HdBsHEF1q2+usc=
X-Gm-Gg: AR+sD10sY/DTJdccbU1WqyyBw7v9tgM7lZsxETDz+V3xap7vhK4RbdBylvariXroH2e
	wsg/ysSgai/q1RKIR9PKkqyTf67SGhJsekpa5k1IWLw0d/Rokuea+c6oO76jf1NvhQk3qkQ36Z0
	c+fs8lXekPUfrsUoa6AQhFPfo1zq/lPeoc4LBXoG5xxN7mfIbPIFz3EH1EDPGTzAJ1CeyvQtzuB
	UDT6j+BD3c3fipkfUDi4Q1hORcAOG4OTtXGwCUEfuBZA8tsX5iNHfzBzAyHZ0XKkfocpGgDm9vE
	2QXYC4DojggBmsokvT6cZ6af2gDTEQRplTDhP8Pto96TTqWsqb8En9sHC4QHDGsYV9RYUvNSpi6
	3tctF7KNlqJ9nqoB4lKO9OIUE6TLN5qGfnP7V26m0hIPCGBGP7Na+6YXitbRrvOsuqqYKmHzynj
	GDfvZoBC7X5dEqn4Yedt4TKYOsq1BvTqg0rWg+jp8nOCKHdI/zNsXtdhmvzhyng/xKFL55L8RMN
	Tayk+I7HHgE73DAa5OCZ2483Q==
X-Received: by 2002:a17:907:d48c:b0:c15:f65a:43a8 with SMTP id a640c23a62f3a-c21885d7227mr560134066b.12.1787063337993;
        Tue, 18 Aug 2026 07:28:57 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3f8545570sm84850a12.1.2026.08.18.07.28.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:28:57 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso6819498a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 07:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoK9FyGyVnNF9izW1rU1vxwynO2vXG/ip+Dr1MjtA2vSg0FX9LZW9mvX1Mexf+o2haq+dAfwmMZel/R5zBAwgIBng==@vger.kernel.org
X-Received: by 2002:a05:6402:e85:b0:6a3:edb6:2228 with SMTP id
 4fb4d7f45d1cf-6a3edb6285cmr3102580a12.17.1787063337203; Tue, 18 Aug 2026
 07:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_A4A9EBA18AE8212574B59C8001217FC12A09@qq.com>
In-Reply-To: <tencent_A4A9EBA18AE8212574B59C8001217FC12A09@qq.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 16:28:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSpmZuDPDzfCzvKbts+=a=savqD_mpf82TS6XyZkZu=g@mail.gmail.com>
X-Gm-Features: AcwNN1VFrPk04Bohn1UQSujmmF4EIHRApBL1V6XFH-gGP58HhymsZ-nEzcsLZu8
Message-ID: <CAMuHMdUSpmZuDPDzfCzvKbts+=a=savqD_mpf82TS6XyZkZu=g@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-rzv2m: fix runtime PM cleanup
To: Jiawen Liu <1298662399@qq.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiawen,

Thanks for your patch!

On Tue, 18 Aug 2026 at 15:21, Jiawen Liu <1298662399@qq.com> wrote:
> Update rzv2m_i2c_probe() for the confirmed driver lifecycle defect.
>
> Keep the change limited to the concrete operation shown in the final
> patch.

Please write a better patch description.

> Signed-off-by: jiawen <1298662399@qq.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
