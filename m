Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98981401483
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548683; cv=pass; b=o4dr8rnv7pfvRAV4ofX6pOFU6EEKn88lmEmLg7GTX6eZrQ4hp99MSNXzsh/KME/RqnkjqE6crJTGT4/kcGY5qh/P8yLaI/Apr80qqsBA3HgaxOGLl4QXpzyO8DNdjoLFxTJ1ve1w62WJM2qHLX+EwXfIO2+AvaFMoGSy4XKbTkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548683; c=relaxed/simple;
	bh=U3MDi5hJMY6ca1k0390hq0Y/jmz8ekEa4Ii9/SfAqSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRKZtwYsT/makgslhtPf+yC+6GCm8uMfflWQ8d3WhGgkI0kXBcmTOfkw0HvCeiDvNVU0WyYGi1Onglu7wPRXJSpuZJae4140jz6TVet7M85zyQWaQ6lGxCpEKTA/YsZnDIN2rjxFRskiJBpdOUrPQLclDy2Tp7JPBDzD99QSAe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJQ4dr34; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJQ4dr34"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so7288415f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 04:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784548677; cv=none;
        d=google.com; s=arc-20260327;
        b=dF+SD80lWSfi+eK/DuQmdJfGiDSp8tSysevey8sY9oNUiqsrXxrAWg+FstJ7SpdJiH
         Thay7hyRmQrG67O8XbkqlM4vhUkUGLp/v5qIzoxmfbalPav8RF1qUDk2M9NyhS3j2ZsA
         HL741CcBn0fAL6rvnSM/f3ZbWK2BYTnz85UnNS/yTuIwwAzhWa/ePu4kUzatH3paXev2
         20XGaxgUnn0vmPvIboN/iJ8qtJ5ys09uGkYCzNthsiO4n+YbCrQ1jUOdSeSgM+WXPAcx
         T+Uq+kwSBE3P3UqaXH2KLhs6Yf9/BAtWlEW7cBQUvJeJW3BHAAwuDZJ0WYJM8qZV0ZH2
         zS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U3MDi5hJMY6ca1k0390hq0Y/jmz8ekEa4Ii9/SfAqSE=;
        fh=eQm5zKmUJqicL1tMaz5iqDifxOnxe+m9bStm13g9/fQ=;
        b=C4TCHLTcnp1y9SJum/wISY2Y+08axC/Npznw/TynHODy8YjlM8vujMY5RqrGnBRPHG
         Q7FIrULbjjbDKUMqBOfJGc0yt6Bvx9Uetb67M5at4xQn9csG6RLILdtx2CxiucPZXBWa
         56LfcDVsIjZfdtJ4miz96NvrSEhEvBU6d2Fo+kXWSapGhRlEJ993kBDteFCY5US+W8pV
         qfggSGDgQvkowu67c+gJuNMiWM6bN/Ca9pyBoZxkCZfhkYMvkrCIxsKgiGL91+GwpK9j
         3QXIwmeBh1BeZCO3ovGtg57iaFgfI/MPeXJUhkpeVsivxIk7I/+WQNxJ1YHVgC1qUYnP
         7vtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784548677; x=1785153477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U3MDi5hJMY6ca1k0390hq0Y/jmz8ekEa4Ii9/SfAqSE=;
        b=nJQ4dr34PzaYP8GBe2B31BqvIATjvjUKZaTPb7C35cNrTZpdq7SAbLJ4NCKZmNntbR
         XdTF23GnVsZVCjpa72RZSuAqyceabRqS2mUaOcTvlnTcXMQFsdw3zmB70/uQ/eX0FlEo
         sZydQs0EoxOhDr6uZjn0TPO9Tois1sTD17hk4lzyEBeApJLaxCSsUMU+WZwCSaahDMQF
         +KScP5B5uf/+rJLbVuxMBuGhEy4Uyr7E9ZSfWiAZdcEsyXMDX4JSVjerahSnIMJqEy1b
         ucHtfvCjV7WT7F3PXZEBEjEP4RsxrmzEHBg2vWlR/LLV5Uv2t4JFfgWFGKs21emXCdtM
         y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784548677; x=1785153477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3MDi5hJMY6ca1k0390hq0Y/jmz8ekEa4Ii9/SfAqSE=;
        b=Jxrv8WOCV5JtM9vVXBIbn/kbMPoBMy0hrDoDaGpqtYZQaDkN6itPeHYRE+cWTGNaED
         OLhzziXDixYBcFrRFUgTkkibYyeinQg7B07/onQLzoFmi+slQd88+JL2MZHdqCSuL5qp
         zKjhOXgPTQ0vTa67u5tlzVCnZjoTiXNci734k5YDvZQ/s8bmgaMukVV2+yZ34gqfUnhu
         6ubRewzkVmtTQJwfFrJciQineFDPh52mPsN+BQrFwxGXwLKZQNOYJyrfeZ7cYdn7GSgA
         GbLygsrhx9Fbyfu06wTloBhiFxyALRmrEUxVq6+jNZmoXRRzB7gMBj7M6MVKRxtnGCZg
         ERZA==
X-Forwarded-Encrypted: i=1; AHgh+RqLlnNDPBaLqCXC7XwlT9QFX3msYO7K6NIDBA886pHud8NaX4EWtRj3KSiWn5eTeps1FpokZ7JgI3D0PwLACk5+hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygyO680h6m8aRZAHg4+cpXabGYS8FypbdfaSus2tw8CYV0Vn8g
	ubRXOgkhrGR1qfOOB78SdWqGL0wIXZh7jHVB/VJRHj1bxVfJ/JDcQmoxYGA0UrYi98A+Y84Kesb
	7MUh7WCEpoZCMZ9uBh/r8cG1MpZzTtAtqAsP7BpU=
X-Gm-Gg: AR+sD10PLVuke1Z44uavh9mmRjjOkkoP8IFPaqgZNI7JO0e8in8h4GzcuCfmmT7p+f0
	ictdX1R/A+AGR6tP5/G5VfY5m06Ppw2Sqe+J40a7p7f50kFih4YbDU9kQfQnOG3yzFhkaeoBSOQ
	DIz1UStfY7lwvLQ8wgySFVAuYuBxngp9628GEldX4Onr9+dQS19FxjKu2TNvsxqQs2ECUPxgJnM
	QFm83zb4nw6WUMZ/7bgJUrOKxNn8kzc14dP4IvOHwcwSMXw/ipl+lbftqxolJ6DDvT2+HrkmwGi
	gPpgHEj6Kxj6D4SF/yQ7YjdbVMRTUgE4v2Bdu+CwsVaOAFjBziPMKWZb2g==
X-Received: by 2002:adf:e010:0:10b0:474:cd60:1154 with SMTP id
 ffacd0b85a97d-47f6232c9c2mr11371166f8f.41.1784548676698; Mon, 20 Jul 2026
 04:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715222417.2997712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2a5439f1-11e3-4194-a1b8-f00d0a8333b5@sirena.org.uk> <CA+V-a8vdrhnZs+1WyVxWJ7Vr+2A2_3zsw1z6bNUqvGi4OGHH0g@mail.gmail.com>
 <0c5248e0-4141-498a-ba01-e6c4225b28ac@sirena.org.uk>
In-Reply-To: <0c5248e0-4141-498a-ba01-e6c4225b28ac@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:57:30 +0100
X-Gm-Features: AUfX_mwFG40CBE6m7kuvfozDrhqMm7gmP9rkxoPyUwFPflVTPvbFZFy_oEFc730
Message-ID: <CA+V-a8u+Pjgvqprt6kupDc-A4ewMS=B3SqSQ85jwg7EYV4hGQg@mail.gmail.com>
Subject: Re: [PATCH 6/7] spi: spi-rpc-if: Implement 200ms runtime PM
 autosuspend delay
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Jul 20, 2026 at 12:51=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jul 20, 2026 at 12:45:29PM +0100, Lad, Prabhakar wrote:
> > On Sat, Jul 18, 2026 at 2:14=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > On Wed, Jul 15, 2026 at 11:24:16PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > > Enable and configure the runtime PM autosuspend infrastructure duri=
ng
> > > > the controller probe sequence to safeguard chunked flash operations=
.
>
> > > Acked-by: Mark Brown <broonie@kernel.org>
>
> > Since there is no strict dependency between the rpc-if core driver and
> > spi-rpc-if patches, Krzysztof asked about the patch order/routing.
>
> > Is it OK with you if this SPI patch goes via the memory subsystem tree
> > along with the rest of the series?
>
> That's what an ack menas, though if there's no actual dependency I could
> just take it.
>
Got it, thanks!

Please go ahead and take this SPI patch through the SPI tree. I'll
split the series for v2 and send the remaining core rpc-if patches
through the memory tree via Krzysztof.

Cheers,
Prabhakar
