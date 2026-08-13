Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265E2BCF4C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613091; cv=none; b=XG2pXmd43q/m2a1swvG0WgBYCokjcIFDmhQb7eDMrFUMMBJbOa6uBjinmHD47TB3vmx/VggX1dVU37VLTBhlCQKafaE/VNFfXnFYFPuDmwm3+qaYbNE3ekvHu0osRoIfxTeEspItbA7hNn6RV+AroXe7ikGVl1jqAFMWCVq1XJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613091; c=relaxed/simple;
	bh=jd48x0JDaMadZvGCtOW40fgYj3SqSfl6jVqR/YltFCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxwoqCWAZ+7A1f9Bw4gjLM7nZphFfUulWXZ+M/XEpSdJIPOwL+DooE7aJOjlK9KOcVUaZEza3NPmzHldFTylEtMBoum+EV4bDK2chQ27TR4VbBZTc/e83s0PdIDoBpnPIFIDK0+O06lzbX5zJtlUmbcd1o5AyhVwGYAOuGlU/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-979fd43810dso484268241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613089; x=1787217889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTzoQkw/EdhxE8XX/iXjCk7UuKhM31vDtUCV7Bto21I=;
        b=Cuz3AsywUEofjuLFlCnoVtm2YeJA2qTsv29CDWOseye7YtEaq1A7YPvIEXZ1luIUMj
         XEZeMeRm3H5QH662by8LDcvjHlfCZJ7UfCYVq7w3FSLX7ikewhgbqKeqoWjJr0a9d8gZ
         DA9mDMJ0fjmYFp/Q+btKF3ve2IyR7npTFI7v25brWn1LB8ElApsf9Nqu5h1FQCr3Mc4C
         +VodEpZ0OBVzAOuTcqXdlu6Jow6WVTXIGjNa7JF7d3O5jxLTTQ5d4exxEfrE1jNTzPVv
         EnC0Kst4dhnBRxxDyrt8YayhP5k771DA8l9LCIl1o2Ag6EmhYRoPIqcz+8bAUUEZfB2x
         I7CQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWpdNuolS5L3MnTDawf+X1EnpxbsZTMwxsFjUJjekz/gqkCMUiHo9GsrV/mfBbBXVWkf7D87ZzZRl1IIv9+2KakA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFqCmtEzpjfRcbiMcUFqmSNSiP3L9sqLnYv+FTLOh5pfUOs66
	0i2baS7eh/VALYfjuVyizEizfTLOt0OD/djAmW0b/E7MrrjUhqbMEiSdtXiLW0A4
X-Gm-Gg: AR+sD10WLX74cvAb4SRn0xuLpcR00R9jsh6+aOkFJcjQfphLgEOWDYrAV6pUMeRxrZw
	zXrhUu99hgeWFvuf0rJWd5sDVGtm3AF22Z2vfqbPDHyce6SnQyQCmpy1Qn9++xGBcu8u6HgE+XO
	i9lyd2j9k9F1806HdpiMdCeOZP0Uox9LdTwSbP03WjY5L1N5b2dMSLRdM113yI9EvLwzT27I74g
	dmVPTxoSepXGonNdF8CQXD4hytc8/Vtk+AxsnSWc5Z31arLKPXIJFcqfMKgHT/yvd1qnzv4Z1QV
	fDBF9hbe59QcRRTTkAYUr1VbrEsu6yl62+WmIKdbCk6asfDSLdb5rWTtX6FBynxe0BzSzaxLvr1
	hCkq1AgT/90ISRqYWAW131OQo3/RhmFRSsaQ4gyodJ1z00G3FxyQPAJk/rKfi38XnKtXpIyM+YA
	32XwK/PIJKe/nDetKj0Bf9ouSOQMfsnLOF56u3NT0k6vCWkF54HSaddSJ6W5vyV7Iy+GwUozXr6
	tVJqMbs6aG+ki/AXt6yw9BoTDdDD3A=
X-Received: by 2002:a05:6102:8090:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-76db1f5d38amr1092261137.0.1786613088798;
        Thu, 13 Aug 2026 02:24:48 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5f312sm617688241.9.2026.08.13.02.24.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:24:48 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-765c077b5c1so548795137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3ZnRmjwi464v8iKfMMIMAaFQjB8bfRiRzICR2e6OfaEug+FB8tPKX+xunzEnBf0gqJY9Uy4f6/SWvLNonqoH8rA==@vger.kernel.org
X-Received: by 2002:a05:6102:1485:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-76db7b91137mr1053786137.11.1786613087765; Thu, 13 Aug 2026
 02:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQKmDQz=V6oa-7HC6NNUTzYUddOrCmHMaRXvHSBrF9pQ@mail.gmail.com>
X-Gm-Features: AUfX_mxIUL2dSfgpmaEW9n5O8N-uwqoJgDk0_CZpOV-32gxYiS60Hp8O10qmVn4
Message-ID: <CAMuHMdUQKmDQz=V6oa-7HC6NNUTzYUddOrCmHMaRXvHSBrF9pQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
