Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECC4FB9A8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565086; cv=none; b=CL13iDyodOA2Wnt4SsM8McUhi4CmAox+2gn2b+ZW9Kg3VW6zlEfe+TLwhKhlRIk5asRn5sPZdZkM/N/8QHoHPc9d6W7gETW0f4IJdV+MlLJGKkmiMebDnxx6N62Gc24eTmJXBtHuPt4RvKbKd3UYIWRgwTAuyceQcnyzFewgs5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565086; c=relaxed/simple;
	bh=2sE36QpcrfvxXArJ8GEwh8xkTNR5ml6No1e+wSNTgZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlMwf2dLev+39UHrmSpuFtI0xGrikt1IZqlhPWxQGRZkVzAeLmjU9TFAGfth1AN82lq6GskIzGmwBnVDISLmT5HuFTx60LD/haJcz/mvGiUNzfRxAKN1MlcKnRHAYKldN+lahJUxTat5FXVS3BaMhY62wya6PLzWwdl/Nj6vAeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96e461feso279687241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565072; x=1790169872;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VX4C74fwnFsyoib4BzaTdWMpIPzbVi9atYccVkCkD1g=;
        b=rKyO/AxPhPiuVzupYMsGu4mvXPsGqwuY0BlBRDuKcqSG+Ka/LUGasKniM+c7nEw1L8
         V8fhdvLjKE6/RdjJQI9L+uDKe22yHAjP2A5ug6KQJpaDUitDwjWqK18Mr7QvWMiNRUdA
         pSeXnf02E3j2M6JVE5BcxNkkb99KeQH7HA2Pn/CndAGW9BGA6v8jmBdyi5i7tPxOTDpQ
         JQaP2KzBv8QzdwE1sHrPFwFkdZAstRDogFzcsXkZLP6rpQN2t620ANVsAkSGOXX/yRs8
         9915nWSaWlHA7HjAqqh06ixqpfwOz1i5HRIVKcHo2PtYw3hQgal3Iz0FFcTLIZsCzwic
         XWsA==
X-Gm-Message-State: AFuF++mq3N07gxv5UjaymhzdFE6ccQwBaWYI3bgUsM1xRVj5ZITk9N72
	DtU3UrwCfueQq+Bd94YMmlxgErJtxPc8n2xGTqz4zo653nNDfNr4VBkC21iO+4TRz6c=
X-Gm-Gg: AYBFou1lgP9NE4L10t2Jgiz+eCeXEi94HTRThkZiuDumyg2D6foex4+42FMfUtjoGwH
	5L0rxsxnhFFY6/nrXFQCVuMob+tInUYBElPAbemqburYp4TutoTv075JKt6ewuETEdiEgLsfO6R
	WQmr6u4x7M3UYDuXNa4cMH1nxFs0Kv0Mjpy1SVidKyXSGb5ySv/3vgNHJI3rfpj38aoM5RWkG5a
	4f8VLaHjgQt3lgCBAsls39pGgCcCvyMSEv/qjC6uF4cA9YxV0LWYfpizx2/IvB8RZYRinRwMQRs
	fUQCEzJojJd7sNzhs9Yp14nDa7EfU8gZ7zECitNOEb++/C2Sg284YsiqJ7LjYvNAzxsrFeDeasm
	fVSd/mOh0xLhLOsYyL4TJRUDQzAqrCb+C9VfALF0mV5VOLmHbS59fuJk4/wqYYWXA5sUJ7V9yQ7
	88B0jwoLXgy6oKcl0S8HFr25nmLABXyPeFBnjGtoZzYxJxldZ7A9VqFWgauCnzZeQ+W33uPH93F
	WZDwPrJk/2SJ0HLbiflksncAgHSwIkgvm+r
X-Received: by 2002:a05:6122:46a0:b0:5c8:2dc9:f8d2 with SMTP id 71dfb90a1353d-5c99aab580emr2565218e0c.0.1789565072340;
        Wed, 16 Sep 2026 06:24:32 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831526c151sm2526639241.10.2026.09.16.06.24.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:24:32 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso321312e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:24:32 -0700 (PDT)
X-Received: by 2002:a05:6122:21a5:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c99ada3e81mr2075973e0c.5.1789565071973; Wed, 16 Sep 2026
 06:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoGX-0m84OpGa+mYd2TiZTDC78FB0jfOf+G5wd-pAF8w@mail.gmail.com>
X-Gm-Features: AcwNN1Upz0AiTN6Fi0olgdVADB8csOI6lykesiycSiLGWDxtF2vw93S3VRE-mkw
Message-ID: <CAMuHMdUoGX-0m84OpGa+mYd2TiZTDC78FB0jfOf+G5wd-pAF8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: rtc: rzn1: add SoC names next to
 their IDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This helps maintaining because the numbers are easy to confuse.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
