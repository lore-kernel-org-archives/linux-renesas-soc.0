Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882A42A792
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636147; cv=none; b=Ak72g/lrCTEJ27xxHXW8jJawrnaTvEirV2JTXYZ3TeOQkr8gjwg/HLHeBnyeIk5lSrui9z9shvG6WGxDCx0yAkqHu3ym6L3JoykqbSDy9cprLtUXjEivpc4eb7d7cTGU9Y1l/14Nv7sErSPfnI0p5uSqx6HWRDwn/XfNWz0QmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636147; c=relaxed/simple;
	bh=GsMvELF4opNDWlGTEpj8mpTFySqFsau7fk/PwQYpXII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig2BHzGATyo3ngZBSqf3/77LBSMOu0tkbrLCFrEGOk18LDTi1b3fyPinCTcrxa6VFChqFR5vOz2P8sGf3PpKQblu5QdH61y2+aCa5H0GLHc1SarnrM6gZOyThvfIxj0KSYwh/lZgz2kKobLiNi4r7zNUXgj+2GGU/G2Xdd90yE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so2603457a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636139; x=1787240939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBt/Jg+qpyyE8AdxLGWQ3O9/mbvgjD10TBEWdEpAJOw=;
        b=p3K2H8ZrumVRDAhDyH6VLAusrnryR5FFXJbSVzXpSGKOPJ/9Y5KIYiVxIIWoTqkeV9
         HVV0RHSB8fedSxEXZMV4ZFr6gKrBUWA5iSa5rVh3Tgn52pqjXQ92mRKuPUs0cFQbHipb
         Oc9URJmUPAkQXGzsdM6zIx/t6C1oO4LRLSYixw/YQoL/igrST/8JiToJpaiOY7ZbU6+L
         cgePiXh0jaZU9jno466en0HfureZ5RO01pdefkZ7hS0KDtH/KHd1rHtBbXzOKjqhUu0t
         MaEyQCltqfoJetT/0QOb7dkneyb18ThX6dj7FHjqO5e9X7QOzD1Yzg8UkOS+KVwYOKRc
         VewA==
X-Forwarded-Encrypted: i=1; AHgh+RpOk4IRRfGvFm7iJWlVPhM47c4BJQ6WzlVlWB2AlA80cLK/afqIv62hCWKkABv8Ys4nqeEO4l8UGzk+ndR5PtScww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxZuWjxjnjO5eOv4eM2xDObUT8xcFExsyQAqhyjll7dc6waya
	3EUjXX5bMBy9OfA9lI6Vxtp6mQv8gwUOQx1FP8Y2JkT+mpqVBnWjqqwEWXm9BJOqrtI=
X-Gm-Gg: AR+sD10621zKioXd+ZaS7To4oxlzePmbsjq9tRBexpfJNJNATzeV1c2lSY/Om+PyLU+
	WKcVgjsfVaONcvQvl9OrHdb40Q/h2eks4pl6yItSul7pSvMxDjfVqvOuSyX/iUUdrNDXjbnDI+c
	G5W3CHE7NNVS9Pv3vl1BnymtrC7FWDCuwKzyo42u03mQvfr9mxZB/hvoVWk2qpDIMOHzqV5FpDx
	Apm9rjT/PS+90Ml+okQG9KQc8ygVYMz5WBlEjkwBb1ay59Tizc7BGpkh58gvQv09Pai1bb/OXRx
	Hdwq5IC5/jnh4e1XYdOkLyZMrttk7nqNUr4AskDYJ9qLvdKLWiNiDubT7hFtSJr6HVrCiM1TkF+
	elHd+pqFfF7ks5Pxt0Acnncz7L5/jCt4KS82PZEWxxq1S9N2Y69RQgeJE+0T19MDh8Y9y6HDCP4
	K7GPaeemo9xeaVBCfUuC4ofoYbuTOY+cjvEF1zTcwbKgVd/d7Ik3+gRd7Wq16xpw9Ia5fpAH3Eb
	bC00y48bjiOePgo4vIvikoZTA==
X-Received: by 2002:a05:6402:2552:b0:6a1:2400:baea with SMTP id 4fb4d7f45d1cf-6a3806228dfmr2361107a12.10.1786636139532;
        Thu, 13 Aug 2026 08:48:59 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f8cbc83sm1106346a12.25.2026.08.13.08.48.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3500626a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKZIIQNPFfLqLICjtmRUUT1Z+yv3PGUlR/6yzy+twspUEgRIFkPlr2YBUUMNWis/AbhjMeaTDIFf6DFI/xGZcKPA==@vger.kernel.org
X-Received: by 2002:a05:6402:20db:b0:6a1:2863:ad84 with SMTP id
 4fb4d7f45d1cf-6a38062323dmr2974868a12.11.1786636136389; Thu, 13 Aug 2026
 08:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:48:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
X-Gm-Features: AUfX_mzi3GOWB6cpfoDeWmlHrS4hYhgS8E2rVsGg-6r06p1J_56QOvXSHTzn4Fc
Message-ID: <CAMuHMdWznqK2oeyX1WmtryYCz2wBH8wZ5c2H2_ShMDvrfO+C8w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:37, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
> Enable I3C.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
