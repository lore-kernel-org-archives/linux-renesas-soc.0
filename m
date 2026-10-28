Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180838;
	b=L3dECRjjR3M6YO+0f2j+oUfFsTkTtDXS3QEwFDx28ZnZjyQTXHKyIuGRcqjYdaZqnKUD
	 Zwe+0FFJ1imhBlS5ZoTUu3IuQYYw3NbMwD7CbQgYxrfmg5OV03o8u91cKo2I7lNXgvFBP
	 7uF30+X14z3FHwF6Mk+VIFfQY1c1lySXDJNJXJpvtr+uh7mn1fRJQMVKNrwxEgnAq1D6h
	 XyrFWLcn4pbUss/Bhwj4SbHfDeALOh0SeukXAFCMAzUYhfav7SIFq+l/Ya2byuvNib1xo
	 R/sgf1rLZy8/rtAwxjQpgbHpFJ4LQc7Z72TwDth2qNAzEdKqwC+K4rfZIoZLbnsBgeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180838;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	b=vC/QDh74iQGA30g5J5MKPQwqEzqw1D9UW/+044zNrV/wBNBKfYSRiN3i2wXEFj9RXRlI
	 2s6HaLrBxYv/aRby1bQZjcxHMiev3iBjaKs3q9KoxALdTxclSB1W2DSJppUtyBwhfmPQx
	 D3WB64UWVoi/L9d1P9vz8CplX38Km5hoMhYsbHGKvOa3fqvJonRLXY3QxnJGr+11UzVIZ
	 qZlUPN8kL52Cwu8aJsFjL4A9PKFMEqgrQwWgfQYPVyV7wRAW6ilWTcfFCfYMbl6VYZpXk
	 7MOQgq/POlazI02Qx8YGg4aw3i4jBdE2Qsj9ZAAW3GqyNvYfXFDFIvqO7m6WBqx7l9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EaQ/uJCb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B62606A31F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaQ/uJCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E433E1F031EB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180836;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EaQ/uJCbnWPXlHtr5OchiT406Hq3ckTH12cvHcaO0eg76LUu6zZYqp2I+ZblwuK4G
	 2y9GB87LiAGcjLyDz+TAXxojKPvNn5cDnX7AX2KtBg/52nk5plIi3MZbZSNZaqzdgl
	 hwDgZtycuoKdchx4iyzhEccJvEpOXakE/BG6yAH/P160raDXwi35gICZofQ12jklux
	 DvT3GhUW2o4PI8rImduLewy47S8RuBZJRK2O9JWLVli3KMV1c+64q9bhsc0pP0NxSs
	 S2SL6kIjUXCPkKwg6yLinabNr0PR4vgOsQ/eyT/5tVkecqDyEe559M1V/3/3l2W8PD
	 IOZ3Lk20BwfNQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab53a99771so5596941fa.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:47:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6oS5rIdyi6m5LlDYgGrvz4mvK6lNCZ5yyDvoZ11rb0z450giPLx212/O2O7GEfN/3A3oGD90p2PdFgRcDSIpclA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlTFEKlNWd8ccdrCN2ME86LmwO71Z3oJROFIjocd3QwdoVZEsa
	jV7KOQgYICz8TLhTv0nbplhL77Vl6RRIPZNNQKeqC6Fe8n+G1vqGA/03NGwIlfC8P5zQhp1tQml
	cpuYoqSyJr9yAG2F+rOoK3C/egfVlizjITGjOoQ2F+A==
X-Received: by 2002:a05:651c:210e:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3ac9cf74f2bmr4236611fa.6.1793180835578; Wed, 28 Oct 2026
 02:47:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
Date: Wed, 28 Oct 2026 02:47:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGosVAQO6GwGuzhCeB4_YYSDAdlMHAhkY-OLVFYNCMrxDS4lJ3KzFIGQ
Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
<geert+renesas@glider.be> said:
> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

This sound like a fix? Can you add the Fixes tag? Is this patch independent
from the rest?

Bart
