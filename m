Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC524BA9F4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446241; cv=none; b=nBDDGLHY6CBsuuE5ZV1JptQJwPFR+1wT17LTqY+4EtJAO2Ik+FzOUEhAXHVCIp+A1vR6SNQvm3V1+CDP/CPQwuoItYDo9JpSGvZyYvY2yIZP/tFRMzO84ktIn6W+HpRDiAVbzWnOhw4DuGC4RhEC1WfBwxNRoq0dK5Us9dl7Niw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446241; c=relaxed/simple;
	bh=EgTf7s6p/OpuqItVOOUp/ztuxNWO+Z2wO2pMRh0VkAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPAjiGXktFD5Df7DdTsgT/IWs55zpRzGer0JHhuxsTYeFCmWW2q4sjvAffieoWfae8VqQbwPSK1ymd3KF37RQWtvYpqyDfzUoVfSkJ8aDrQriMBS9hm0WEhe552tfvqy2DjwNIyS5dpIdSSpjcwxe56NcAH/XWXALL2hlx81xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3647004a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 07:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446234; x=1789051034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WCO6Njy+SVScNEjKtjF/KEIv67GhBtMhWY5Oh8v9s5s=;
        b=M3MTnsOtb/+lu+SiIwUOGAFYAef0Ga6fWun0XQtJo3hU27nT1lP7lh7e5M66TsE31G
         ij289jjis4zhvJm9WwizkhRdjmPFcj+lvInSI5Lx10zhStcv5Kh7HB8LNx4XZQwZGYKn
         AMwIhewe7lelIp4FSuNHxjZXs1a4N0hHZxaDTMyh5Sr22wn4tbJHRMNHyYoo/5EfAs76
         A7EajPYEgLyJY+lG8aZr5TdKBxctKLdvzMTq+YbQBKFKeut3sv9gLO8YHj9L10EYvBl0
         gGt0To7A/EGwoSo/kTfCxpezkvFvDahWGmY0y/wBwVVACa7zILxshcWpnivJrvpt6No7
         yIgw==
X-Forwarded-Encrypted: i=1; AKwUvBzXDlTafFtcsNmCkDOi+VWkjzAxC4C4jxIcel+YtIffswox1g04qS5RPAjG7rAA3i/ui/1CpPn3enG/LaVppPiIww==@vger.kernel.org
X-Gm-Message-State: AFuF++m7vV5Qqv4DqX7IblbRKJFZxHgfe5KBcI2ILcjqSrVSRzKLav7T
	QEkHYXl3+U8ogpNEnQPgybHaG47d2JcyLSpACyclFAzqi1HbWSmzetRnCoAbwl1yLko=
X-Gm-Gg: AYBFou3sU/v5ovC/YlqcfjsUkHu+DIT9hh7kkeH54tzOrOXDRysRjI0d0HsO3BNiMQu
	k5IwepGUKAbZMCOOOKi53k4LetS14JRHzPwOygP9jJU3K/p2NUx5+0prfZra9pYmk+Tkhpauv3g
	3QkQhqithTggQuPV4bm5hn5DsJYRQme4qzNQr609Z1e9Riffadjyr6NBukW7K32rWvttf8WI/25
	jZceYTEAd0AHQIQzuBpJfD8uMDiyTG7DnHglGkSHd4LiZQaosUkt8ATSSGjpujvg2b0wULAgn+v
	M7OP2+9hC4dIBxIQCK+js0f921pTgmqLMbmaotX2elebhq4f1Oxw9TCF1iJ7WhPAC6Z++EeZHrL
	N3xfxNpMmd5t2nqJJoWTSyAA+McoN7wKJiR3wIbpmvHaW9Xs5aAbQYGegyXfuFvIda9qoHSJO17
	4P9acZrRO26OQlqDj9+wooavxV9zk3KIEBN+tbfb8YJJVbHcAj5+2pZKsNLa30/DIsbEN/AioGy
	SfoDLzONxxl4YRSndJRQA==
X-Received: by 2002:a05:6402:13c8:b0:6a6:32fa:1e9c with SMTP id 4fb4d7f45d1cf-6a7e565d4f9mr220840a12.20.1788446234062;
        Thu, 03 Sep 2026 07:37:14 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2430741a12.30.2026.09.03.07.37.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:37:12 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so3738296a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 07:37:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqLh6DfBsEgf6BvxA3mBJ9UNNgb5C5Ht1SJ8Pwniq43NGp+JhlrhgRp9buOV2RqZtsL07vLeaSHYomhiLVdLv0Wg==@vger.kernel.org
X-Received: by 2002:a05:6402:21d9:b0:6a6:54e7:2071 with SMTP id
 4fb4d7f45d1cf-6a7e5604c38mr260584a12.14.1788446231721; Thu, 03 Sep 2026
 07:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903133320.144245-1-biju.das.jz@bp.renesas.com> <20260903133320.144245-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260903133320.144245-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 16:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURMFo8WxiU5hWoPzJB=bqrAKaEqnss181hZo5MZPNFpQ@mail.gmail.com>
X-Gm-Features: AcwNN1VFbOkMZQ7k7yG1mxbk8AnGCfE-NTGC3-0u8uK9b0jPXfAHrXpyOz__lhA
Message-ID: <CAMuHMdURMFo8WxiU5hWoPzJB=bqrAKaEqnss181hZo5MZPNFpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 15:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
> PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
> some key differences:
>      - Has 3 clocks compared to 2 on other SoCs.
>      - Has a different set of reset signals
>
> Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped "or clock for L1 substate handling" from the description of pmu
>    clock
>  * Replaced enum->const for pmu clock

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
