Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA5136F90A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164563; cv=none; b=VbBmRhaDUiAqcalNTZhNgVxpKXIuqXW6L4MB2DVEcEE1QnNLODVWCmtIS4xFOL7ccNJdvEyjDAFkGm45rzu2ujCoKbfOaa0q5H3eM8l8FXVkddsl+KB5F7r72St5Cj+HzfdQSNkl+6/LFFQyiVDtMYx94BYApIo9CuGm5b0KVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164563; c=relaxed/simple;
	bh=N3TVIW3IoPJ5aqKXJxvhtdjPvgHzwg4Wp2iCFFQhCL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMyteAdiPKQhbU/rL8uYAUIR77G+shoxwDQyiE4iGH5LScqVHyvsSAvurNtslzHyv+8V2IEA0QFkqqWjQFyd6m/nXrEytIvYh5qkSKhoqUabBHoDrnYL7KOLUTB3A8NAVgF+3n5UZzknCxtf7Qz7K5YG5841VQn3F1aZ1Xep5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so2519975137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164561; x=1781769361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QWA/oASaoEGszjXXYseH4EEvJ11J7t3dPdy+riQNNw=;
        b=VWoqQhxal5DkIzEzDx69/0TIiAsSwFMNsPJ8EU2YKguRLGpOhizqR81fzN8hetZqg9
         4Piw3iwmXU8e2m77Ey+D8bZuDkjvleONV/IZw7T2FglUTpSFDtfNL6Deawj9k2xBvFoW
         E/mOMsoSJbDJTj3546tuD+aGptTMPfE3ymQu9RvC5azjvQsnZVkcha8fxMf/opB97VqE
         kUqwKA1NV/sRINOVOn2oATMDwLm5S5pWjgtLp/OSp+1iRK+YUzHnyiP+66Axh6TcztRj
         s3PZ2yWdaU8bqB3xgSX11P39ofXxVN5gqcDw+qxhFdjWcXJ7MNtrAFxPI6CN6QXaTFvx
         ipfg==
X-Forwarded-Encrypted: i=1; AFNElJ8Bkr56ymbmHIw4wYOppKzW/GMXeja+Tk7CzBpJpa/TWrc2vOYHbZWPf/UDEMQYJe1y3zRrCR0Axs6/LcugkZBXiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJoEuoyAQzGKGCgyINy15woPdPQcyVmtSbMxVSo4Pd12DBoWx
	a0PJAKK3FzR/8bXe4Q5NA1/FntS+OyspCYEhZScEB3cjSlwJsHelsAbQTH6Q4dNyt7w=
X-Gm-Gg: Acq92OEO9E8YNqm6F84I7GCdxtAfvjgw7lfBrkv6rAE3Ivkd1bbtnJjYUDliTWXWq0y
	/kSNAUIo8iFOU7Iso0aR5tkJhUhJ9rSQQhv/UMIZxwQbgIBu6SJSjrgcHJzAETiMqLYvrKnmiz7
	uWeMbOk3YDKPMHTRb5UfBak57xay0US/6n+RKTTh3WGb85eTh3HuoieRyv7WJMLes3/RPDStPRF
	NLx7I7gdeqbwsxjnzapqwX1mUtSF1CndWkYg80K35TuMd+tCjKtL0bNrXZU6prZ2JAxNUCQJfp7
	H4QOlR3XHC+OoYU1p6mbnLEf6oKo8do1z40+dn0RFUhAdNOx6W8vnOb1fqCbIrG/1qKZQBi2xO3
	N/Qi1D43Xb54qn/a5XojH6Van6BFZ1h/1tqP5zH/xglo9ZN2Bqc02GGBQ8yZrpUwnecNQFJxnBP
	tTQtPCQNBFATQBu9Jn+a9MFPulsj6QBcz2+55iFZzSfxh1oL2Ra5PLcHCM5QPRyiDAb+3Pf61Xs
	CPSTkLpcw==
X-Received: by 2002:a05:6102:3709:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-71d5d395ca7mr389435137.6.1781164560949;
        Thu, 11 Jun 2026 00:56:00 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71d900c44e9sm488635137.2.2026.06.11.00.55.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:59 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so2519967137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 00:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Xh3Gbp8J93aXqs1SzGTb265X3suTwsB2HSawXS5QsjEIbo0YYeZDYyRrQR5PWmalvH+DCPvoslOPp+gYO2yAwMg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e02:b0:6d3:aad5:6d2d with SMTP id
 ada2fe7eead31-71d5f2c9e58mr483488137.18.1781164558613; Thu, 11 Jun 2026
 00:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org> <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
X-Gm-Features: AVVi8Cc4jIWBETm4Ynpi7szi6_VsDVkjFdXWa9mml-KaDUYCZmOXsqOLYp1ugKQ
Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3NULCB with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
