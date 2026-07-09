Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A71339708
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609382; cv=none; b=Rc3K+mlMmxgM0zxisAW4D9ob9cJN45a7Ucez1Ksx81BwxKoqHvLYYzGJ8fwCgx6zD0m2HwKUlxQH0e5b9P0+Q07Qjb65kCczf/504ImZ5oBoztR59YUX/ZhTuM/4BI3HnGWRroAgi3WOVF6dlYbIn3yQmedivLZWgZtNriy98GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609382; c=relaxed/simple;
	bh=35aZAkEec1mqGdc7KaCpDOZV8ahaarylBoPlmcyfWT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxaTttcac2qZ8fflc5lnDJbkwfPFZPHxHSjNO/kKsPniwPaiDvki58AppkFLIQrHR/sZomIvT7vUTAs2QjCQZRsh2wH7VyGfNuClDzxhPLnNRYHiDiwcSndM8mfUsy4CVauw7xutumjLHHf8RNlpPJtxnBkCuuYqfuLV0kZbznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so3423880a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609379; x=1784214179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o8A38Q0CzB2zKsBTRsMuUjW//3gRc5GwSTxcbEWs/H0=;
        b=dZLElTseVH+DuQf+vaLyeYhG0wZLG2vTg0IjSfygNU30nk/Pr1JbWTs8J/NwtWjx3v
         RVt/yt1Xrqkz9VTskMlElFZH1wAMAojYY+LQb60RGLeohsFmMf6XypGldYGzXu0tnRGR
         IUdsfg3IOQniI0l2cmKKJFJawAxp/Zk9FkM7hBpD4pvltMI2FhOWrbTOJMJ3GqzCyIxr
         bKYNt1LA6VhyHMWisFo/xKnceHFLw1UU8h6Ov4T2QAv0p+C/7jIAPK3gn46GUgVoi0G9
         qstxRlYLYGu7i9VaPg4Ax0vl2wpNpC6rHOUOLsdOCRnnz5LcVX8T/T+hzd+x/lV+ADTU
         53xw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy1yBOS6fjYBkmICgiH+vBzNYMT1oPVtOp9Tr+uJtNk0UHzvQKCWBZd73o2Pl2No+Ym1xohiIF3Z7k2hm2s6Yh2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqSJT9tmHT4cGq9LMVWRRVd+4eA7no6WlSLLWX9qOq3AkPga8V
	KOHhWIXNmNgavZ3ubyy3gJDmOMd2w9XmPb1LQJrXDH9U2SvjhbjAJhu7DajB0+jYwck=
X-Gm-Gg: AfdE7ckc07unSpzn4ubKacbyaHwShpBHyzVh/66faV4irz357Gxpk40V09stS/DjHT2
	3H5i/JALPBvnC+tNZmttRQzGv08zPeYFGnnb302OkGgsT00Eog8MkWJxk3dsUGbP1hC9OVrVAF+
	TLDx9AqnNZ7YQrJ/3slS8jq7bXn9/I3sCxcno2jwIu/BXJeUf6DEdqSQ3Gqvhk74uvy0+pZKAAa
	Mf+K7I8XxqN+PwkrZKU3YQOSht91pMXp5huEBgTwsebXcVVd5TJ7oFDgSHrG8ATO+ysSyAVWkyB
	C/tcPX8oEnJOdNq0ow1Dd7ozBYJPJOq4KVQtVcGkKRTGCDE0uv8rv8KI2bl8pjEV1+CGKYibkdN
	P/znwlu3VajkVtbZn5X6kGm3irotGfFGvyQjmPCHqBUGp+zPhAyc4OzqohQHcvTNBya4Ugb4AzC
	fCnITLMDcAvkhxnRMDBfCWyEYo5IaPn1lAqzMQkiDB4/Bhr7s3afouozjxZniL
X-Received: by 2002:a05:6402:3591:b0:69a:9355:d1c8 with SMTP id 4fb4d7f45d1cf-69ab44e3f12mr3387928a12.42.1783609378945;
        Thu, 09 Jul 2026 08:02:58 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ba3a8ad52sm1525504a12.7.2026.07.09.08.02.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:02:51 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so3360352a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 08:02:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/9sOKklH0y8Q+eLPxyhSyrJ1ARnzF2qO/tQtWmIkMJarNEX7zWtfaUDbJ03m2WVBG75gJVN+J1IakEICMEhEXMg==@vger.kernel.org
X-Received: by 2002:a05:6402:428a:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-69ab445ea87mr3175758a12.6.1783609364585; Thu, 09 Jul 2026
 08:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260708163311.222176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260708163311.222176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 17:02:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm+rUZ3um4Gp=vRiPfST=yRHcWebR4vf=EjDDOY4nJ0A@mail.gmail.com>
X-Gm-Features: AUfX_mwZn7h_J-NKdmMEPwufWjNmkA7n54fFSHEyd0HltN9FnLIY1Os7sG5RsDg
Message-ID: <CAMuHMdWm+rUZ3um4Gp=vRiPfST=yRHcWebR4vf=EjDDOY4nJ0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable PCIe
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 18:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the PCIE1 slot which is connected to PCIe0 channel.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Renamed the node name from pcie to pcie0.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
