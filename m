Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCC4432FD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611174; cv=none; b=qi0tgUbZ8hpIv4imiccafWS/uxT3d5/lckIrx0JWygfTRVFi4OzT7zTR7LiAap/OBG2Gv9zv1yEuT0SKFVmh9QwTjWzwfrWcuw+f4ZToUVfIlk5mtmgi0rj3NfKzV79r5mCOay7e+cQBv2huDt6AS/Tw0yPNEE0ckiJ086VKkMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611174; c=relaxed/simple;
	bh=wqe3WmzrY4ZpzNWzwSlqJUtTcYOGLXlIv9Kugo+5S64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPlj0SY3HOt3Zp4QHJT8k4BqAuVXEWg4xQEB6CiAGB8u4fM1Q7p/UWMEFTaa7l/drcz04SRyv3GZIbYV5ljm727wRoOLkrSTh9FwSDr3mPuGMgflYMNmz7yaI90v3SCNKvJFe/eBYsgdlt6X1ngAHSm++vlS7WUSZ/M9lgvjo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-76b3036d2d4so211994137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 01:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611171; x=1787215971;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vy/UbCFeeNu3PaVu0I6JLOsmvQPQwW9n0EehGyjoEeo=;
        b=Hv99a0sVUXTTM2TXVWrcvP3W1/CM74CoZhfjHWKFZ49t7zzJ9kA6lTT8tMftQXAQwG
         LvaPaSDjoTK4j2RTdQtsuMWIa8CdhkuE9GrGqHjcjqpcWPMAAIe7faTjHCLAB9M3+Jd8
         3gQ/0nsRQjusLcF6SIFaRBD+pJkbMD5d9wQWGaS4syhYhGeMV0tiKoTKeDrM0TaNU95U
         2Smm27qcNTm8WhmXQZwb2ztruYAIJ7X5qk2IDkjpklv5T/b035kaXfrsspe3F7Y2ymaf
         J1JQDm9Y1M0JUz3cvgdIAZYpjazp0Rq65gm58d0qQD84VDfxqYQg3v7Z9f9gtKX3IlY7
         zjKA==
X-Forwarded-Encrypted: i=1; AHgh+RqAK/im+tlUTkxWyujYx52MBGVz0e4bFWBuLPXNVFMS6aHqNsVeLZzwVqpKwfq3oIRwZBnEigf89Ap0lSspqPhcNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMLgYgIaVJknl01ayVIXF/8Z2BslwTRC6O7Hf1+4Efri9st28
	z7E/x05tAp2hUm11+CwjopshbJyLNDeFEAwdy/TqbFfN4gkDY6LV14j9kk+ZETQH
X-Gm-Gg: AR+sD13/HPE4YgpvPx6xovJnU630JK++zX8krLjfHz6nCHTYjBFUudvp/8pMH6oL0nQ
	nWR4UPXJkmO5/9d34TpL04SSuaDbV8OWvNKOOkvZbLLI2IuBxaLKjRHdycO5EZoBfygFAAEqdSy
	6iJx0XvjpvvBulF0BQSrOKXkiAIxDzioxkvNDpZ1xehqK70No+Tkm+Er2kSWpjOwOi7GtUbo0lq
	YbCTRD+ctVkfWs0Zbg6Hy4JL42etLHpkhr/Uh4EMT2r9BJfjJSuI1I6KAyi5vRt4zk/9+lED3tT
	fdTt4TmFL3Qshkq4YnGYAGykKD48e2leFFU9b2eajNRGdSmaG5a/vES1NUClF9K8JR8V/a+0ulU
	GrW7Xu4mkDbu0Os86QMdSO5BGMPZNH6gLaR2XhOFJG2qG6OT8WJWxUQ/slZ7C8fN5nP5jQhHnWM
	gIG9+7yap3Vs+z5mTs8TT7Ql7m6wMRtoCFZTCLrBsxVHJ+6yFboAiqk/vD4g2N/7yD5fPioQupg
	H8k6PUa20ZSjHfoA3+owhJsZw==
X-Received: by 2002:a05:6102:291e:b0:737:9003:ac54 with SMTP id ada2fe7eead31-76db1e40c66mr1274389137.0.1786611171284;
        Thu, 13 Aug 2026 01:52:51 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becb1cc4esm648036241.6.2026.08.13.01.52.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:52:50 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74ad03fa605so264795137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 01:52:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7BLLhYIXtzkLnQF8a1XFzDDv1rrEPRRnCvltfyX5lAoGaDz3/CRNYrjZT4iR2E/tcmXFyG9l+XDm8aY5h6IZeOA==@vger.kernel.org
X-Received: by 2002:a05:6102:1485:b0:738:9c30:2b7c with SMTP id
 ada2fe7eead31-76db5b7ee90mr1429147137.6.1786611169848; Thu, 13 Aug 2026
 01:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 10:52:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWefm4o+o1skM=-_-7S3QaJFhghxTZ-FcmG=vuFpz=MXw@mail.gmail.com>
X-Gm-Features: AUfX_mwjL-W35M2y6KFKKHilmi_r37CqYqL3tzuxXEaIqBzbpu7hLUaVfVScz-g
Message-ID: <CAMuHMdWefm4o+o1skM=-_-7S3QaJFhghxTZ-FcmG=vuFpz=MXw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the Mali-G31 GPU node to the SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
