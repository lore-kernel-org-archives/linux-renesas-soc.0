Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDED274B23
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779885969; cv=none; b=lCK7OCNApdGZCeXi0hGCwPDn8iucYV01d3a9Lc6lSrB0+D1UusW97KVL+RisA1ME+wn9Dum05uY+PrS6aU0AgqQfyl2MWZBu1K07Gv2hIv6piIyVCsADumQuEwr2cd+zXp0+V/c+tbzTOxz7YcekcoQ0uTN/8kubyoIzeIM8xr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779885969; c=relaxed/simple;
	bh=kqktGqpqwvczwM0VR2SPhNu80C/+HjpMr/FFlTiSoeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHuGraKkpamRQYDKn7qnvf3PJgZfg1Mb6vTG4zNzAZ/wYk84RxHtmT6oIEn0rmeISOkmkuuF/lTIjfkxK8SMyQoyUUyPXxII/iI2xoujDK/CQaK3rn3SupTO+x36SzMRl9DIuqnS0xpzF9q6/gdsGROqYYZ/OfQdP9C0WVe66zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-631466587e9so8775874137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885967; x=1780490767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxoZNqOSzYfBwMiwQrf9ojD/Y5NqNn7W22JpIB2VCXQ=;
        b=gq1FGP1uSs8GrtbpTV40Sw8i71oLNmcDVl94tsVAwEjJ8Nn2osG0B3zxzXX+QFsQ41
         Rl7oM/Lgzc4mPi+c/9y3gt2ifhUztO9JJ4aJuW/Om2H3eHZV4gAfgD+d5WTFJrlr92yh
         t+3uJDDJ39KhxW+N9IxlEXX0ZfpOi+3UKtXuwnxER28TNEEAeJIqz9SdJiIs2PSjyjAa
         SwB8xcgXh4/xsNz9Ijm5V/97qwB/rygQZ2Cd6y7ucYw6CVmt1i0E5tSGMRMqRUmP/lGH
         J89zGgsFyIUXY9BKyI80+actTRax4170m5cUyVSX4/KbtXP5nwwmWi6TK1JFnu6HDK/8
         FdmA==
X-Forwarded-Encrypted: i=1; AFNElJ/2aBVl3gRRmjIwK4+KckBYQIRFFDJN2LBGnlUh2rFVN1Fjz2LrAOvui+yvmKPmuhanh5mNJg2ly3SoAtGmbu/fjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySkyaILnZoZX32F6pEIVr1zPQpnYZtBbAgMwF4beMnSm0WpBYb
	KzC2h1CrmxglwqgZeqO1vQi7hvGaem/hXElxDp0DVrHfO+NXO0urnwtHMvJhz8WNegs=
X-Gm-Gg: Acq92OFfHHacrNQB10j74eItedfyHgOyl+m9xa6RhJmDUYDwPZpeln+XuiETBYfscV3
	M1Z9N96hRmUBVQZewJQbbCY0Bc/qdw8cuModlAblIvwUrEmqIf8Bf7LtzgA81b7XJ2/CULF9zJx
	dnF+1CWn22hsj0OlQ6plp+SpldiNv+NVakCafdAtLIRfaeHb/EdSgOXIIx962CInduXtU85JuI4
	1iMy6oAL2U/BFexCPIIxASvWAlBCDTJaV4qR7oNtkAA5JfdLsVcN6mZPyAIu5Big2+t3T6bD429
	J7RmEEbGA6Ao2OUZEfBsh9N50YkUL2q8k0xnIFY2DJHXbl44U1H+oP+khtt3q1J9jiDnCabRLYr
	oif6lCh8s7R+Ek3TeO8qB/DwXp2AGfd3hSWJwNQ06ehJ4DyKKbYrY6L+feL9mo396hAP9wAfmtR
	kdKAByearp7BwoRIsCAxFYZnoz+ghyKHWmmQ9btmRSk4bY+SgSXeN1nSPqlXW9Df+k0ehYbJee+
	2o=
X-Received: by 2002:a05:6102:15aa:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-67c7d9768c3mr13317531137.15.1779885966983;
        Wed, 27 May 2026 05:46:06 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9014bfsm15942023137.5.2026.05.27.05.46.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:46:06 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f70865797so7316969e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Xudh8vUxwlgdvZGK8ODyeeQPQDX3VV1D4aIZwmFg8Sw75LYavscqahsUNq+Yqs+mLjK1jW0bbja4JSc99jnvbMQ==@vger.kernel.org
X-Received: by 2002:a05:6122:2203:b0:56e:e80c:bb25 with SMTP id
 71dfb90a1353d-586649efacfmr12944471e0c.13.1779885965769; Wed, 27 May 2026
 05:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:45:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqiHE06_pw3dJ00f30ohSuT_Hv_k7SoK9bACeDqE6i0A@mail.gmail.com>
X-Gm-Features: AVHnY4LUPp8GTEwUz2koHfZTdHXj-kQ8ZH0SWOlUn5c1woQCDpOdaxSIe2lwISM
Message-ID: <CAMuHMdUqiHE06_pw3dJ00f30ohSuT_Hv_k7SoK9bACeDqE6i0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/V2H, RZ/V2N, and RZ/G3E support two optional external audio clock
> inputs (AUDIO_CLKB and AUDIO_CLKC) that can be used by the Audio Clock
> Generator (ADG) to derive internal audio clocks. The third ADG input
> (AUDIO_CLKA) is fed internally by the AUDIO_EXTAL pin and does not need
> a separate binding entry.
>
> Update the bindings to allow these optional clocks for all RZ/V2H family
> SoCs.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
