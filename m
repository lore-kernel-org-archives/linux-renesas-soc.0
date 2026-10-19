Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05355CE74
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419351; cv=none; b=kh6mW4+sd4cosbrDu8YOOkJbNRsny+M2KGUCzpJn4+ZVH/FbRtgeIRRVlmNSRCsq/0ZeZWWPwBb/EDcusjFfHNkr9THZraTYexn6Ve1Sf4ShhmOZHWQtODOgBxUwXn6SoKRbMaF+UwmCEehKBGFQX21pLSoTLMh1sKQ8vLVmIOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419351; c=relaxed/simple;
	bh=Bw5159SWZK0MfXRnp1tl8h36EKMSwk4lSrReIomW8O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kG+ZyqJxnWjA195kBjazsrSOpe9azVJuEIPfvdWvI8XaE1SqsepOy4oEElVKx1V+Pfw2lE/LtREWxMQefXsN38Tg63d2n8yxzOmouWuxIP3KlwBVT/4a2ubpyKBHsA6NiPKq1OHqoto9JdsVCbaHNKoH6TfksAFIYd4dCPBV4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c4818e4165so2152756137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419348; x=1793024148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gTsMBv+BX/aLxxsbc3oBL3K2Qt4xiXtXHE4nz5I9X0E=;
        b=imIU4yYHyHUpPMIZis+cXRBu7JbzT0iJ7yb2srQeirjEAgbAJ9PD57fOI6rz0ublRK
         yF4vMmG2aygFkuqYmWC9yJfCzbrmTv5/UWu1CtQbsz7BP802yF7lV1EP5fWvJUtI1cRV
         nI40YC+OZfQNLWl+1wk1ukDhpot65mZDUctElMh/Jjwmg9A3Ocm/EGqyxFP9rhCTbUiz
         l/GbZ7b7FCmofuw9fqlPW3krHir3W1BEdHaOVjwHwq0GYhfj0YNPi+ccMYC0Ox6u0Qkw
         zRMlKHYAiflFyC/AdtOu0+xSe6MruSP/eivUpHDWoPg5Jx3qRKqFw6hVqrTSEd0jblWZ
         HoQg==
X-Forwarded-Encrypted: i=1; AKwUvBzCXers1Ryx1O8Y7HXBwJjivSKuoGicXPw71IuHvDGOcteetrxSlKIWY0pOH08iSNsY/OtkPeNXQDcH3mOlYtfBzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKoi3TxGreubk+p6C29S80OSYBwDnmw4pNkNTxSBZxZrOwIl/Cm
	SmIdSy9z2n/DKSCa87prFIRs6aqmlMOmbhMLEuIa/gAYV/0BPQ0M8kz3JIfUOEeusX0=
X-Gm-Gg: AYBFou2X28ryA/MgDwIz4E/bWR1qTdCla1AbwNhQ8nlXbAKVh3tc+nA6Fgdq9DWCfEb
	QwB1O0dj77yXpaGuqDD2fR/SvJdCD+KYgCBJh62CPGwtv6yPqbw1wWmNhIFqxEzMPJ8enm9B+r8
	klt9I+bcK+FfdEazy883Kn+bjIyzIYuUMwmscQP1yr+5sr4EA0RJj5j4WNt5DqpNrowc8y5/DoM
	lLPzLnHLISzisPsplBaL9BzAEU8IuJHJyKC5Vjay6JgPxGWTnySC2/rfrCJHjIrDf1HsihSJw0u
	Im1YGEuarBGUQNQIQYBKp80Rpn5JZoGKe1RFNqENZf5lU+IfL25tYEVq/ynHDwNvQy/s01QscDo
	aR0PcSj/MLLc8w0bSDtavlRHhteWs/CZ190kWrZpjXuyAHpBlIKLiRsUabP9H2ma5N2w2eD0K8N
	oRt1cRMZnS2oG6wgRmhczEt+e4R5Smv/ahVVDmdmWeSmWi5L2PvyjY2na1PvouFVC8vYp8icD9d
	9Z6Hp+L4TpnxNIHvJZCayO/tChM0WNHQ0yA
X-Received: by 2002:a05:6102:258a:20b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7cc182ac610mr2096167137.43.1792419348657;
        Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb384048sm250855241.9.2026.10.19.07.15.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so3042820241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxyTjWBDZTGeB4IcOq1AbkxXlmURgdNPfdK4HlDs0PW4TP1T6HTcLL6Q2DuV2dMUWD1gQU/sI1XLEupTrdx96dWA==@vger.kernel.org
X-Received: by 2002:a05:6102:75a:b0:7ba:7a64:5946 with SMTP id
 ada2fe7eead31-7cc1823be8bmr2159864137.35.1792419347856; Mon, 19 Oct 2026
 07:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001082225.125956-1-herve.codina@bootlin.com> <20261001082225.125956-4-herve.codina@bootlin.com>
In-Reply-To: <20261001082225.125956-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:15:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
X-Gm-Features: AclHuK91kcP9qOZ_DEuR872u-j2nw4CzwPaKsUs5BANpggKtpgKKO3z0eBpg8xs
Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] ARM: dts: r9a06g032: Add support for timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 10:22, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available. Each
> block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers. Each timer has its own interrupt line.
>
> Describe those timers blocks.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
