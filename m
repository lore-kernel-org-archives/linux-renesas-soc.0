Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AF44E038
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389539; cv=none; b=lViAEyKqNtYoRxwBAY9asEXIqwjhG5GYoZSbvwkEqCi/mDLtsJWvkK4m6FSymR2nMAwyuUpvTHef0M8ycbBr7umtGfr8wdYY1QwC+uisQ0HfFk1YwgrqSNKCHZHiq3E7rd08ms+nUcoas8aKTg0V6aLdNmpy/0rWDAebPFCvP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389539; c=relaxed/simple;
	bh=alCv2i4afikLPEBE/ZSB/QPy8e/IVs00EB1s3dQO9nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUJ9yNchFNMme+yxay+J+u9UUI1cfIjDJC27kneV/kmgvnIFdTJLKxkmHubJ9HAC1NLoMKaXiaAsZ/4NE/E8rIz4kUIK5rGPlsc501q8Qc4osUsBCYoEDpbSt/QzbW35Ttz2zzFU5PJ4keKRkdtFVMop4truwtU3JU8pcbtMd8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso584328137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 05:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389536; x=1789994336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OYAVE9OAvj5W369HdyvqFVzrTYEbVyLELurCOBH65i0=;
        b=fHAPnkePWyisJPuBdvF+WSZgC84B3Fr8MSUETaFp13jAOqPphhaQ/VlND95+HkCfcE
         c2YFGdTJWkC0/A4vYqF5FSo+Snkzo2T8LBVeQrDnY8P694EEH3ESG9zF1icBTDSQ4FnX
         kp7jXyV1TcAeB/2Hf7Gb3bhXAwECsCmsIdEyFFstGKfSvz/Hh3Alb1Nn/k8pq8/PLMEw
         aF9RcayjqkcUd7u4F+Kb4vxWVvmV0VuIzpDIG+5uO5Oux/CHe+lHaGZ/XB8Wnq2+vwTn
         BYW8h5g9/fOozyzavSLrdFgKymmS3m7ZhriONWa0URkvO99HLB7VtxQj+3Lhx1Aan/wx
         VQaw==
X-Forwarded-Encrypted: i=1; AKwUvByARUr0jpyzieerNVcGI3/LH4sedxiwArbySWRHxRu8QCKxvz578ntXIsog+wW1llyd1khZWV9muKb/KDInbEGhDg==@vger.kernel.org
X-Gm-Message-State: AFuF++nubVoWxTNeBKDw3uP3cPbpcHJ2cAt4GNX2MN1dkpBwJ8x377c/
	3HtnemhWPUHdnVevaclD2ibCufyASvU8fzDusz4fY2i1m8OcSIoiJ1u839mjTMXV
X-Gm-Gg: AYBFou1FcrQJUjOEsJTiKD6xsGUhwXv7u8m4UIDKsVmnTs3gS7JjVyFRr5NGC1jEVvR
	x8pvenIkW9ahJWJKdHzG/VDQyrMZ7Zm0eAIzYIrYm++ftLEj1Vzq4zzSVluQm58xOgUU1RJvCCe
	N+hrC/icp7WqicR0c8QfI2p21iyvHGfgsJUNW+1YXuDkh3WlRQEaHXBDl2gAsCZDOkh4qoqby+9
	T2Q0kBjbrlpfEKsSQzGvUiNoJV0wpFNgCyxYU7YSURnY2H/2jy6xlzIed2/ksRuSrhhj82yfJvO
	nKqVqx2+LGj2jOmmRYGvdeKPoDYxpvBZfW68FoDGsN36oC+yPDStF8Aa+YADhWorOpz1cv07x+b
	2zixXg40rF1GsGIlV2lnGqN1f7bQZhARLG8adaK6MeNv7R76hFPWl8i0d8RdFrqh2ZPivDToyEf
	UD97PzO8gOW14PJC5FAMGxU29LxqG8KaqmFfmyfUE+krHWzQassEsPaP/zmR0qq5WJ+tyF2kIrF
	l1VZrE9mJc4w7jPbIsTJsi2wxSjo3V78CAqYEkgxp8A2bhP
X-Received: by 2002:a05:6102:c91:b0:79b:c51a:e5a with SMTP id ada2fe7eead31-79bc51a11a3mr980018137.0.1789389536006;
        Mon, 14 Sep 2026 05:38:56 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927eb824absm10218921137.8.2026.09.14.05.38.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so564219241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxUA5IyRN/2ZanOx7mhg/SGuMlfET/BOF7oBRvQ7TpmisNH/H5jdqrBNbd8TIcMqOx2lDiOFrCVZIzOHSBUvu0HWA==@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr1196005137.4.1789389535416; Mon, 14 Sep 2026
 05:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 14:38:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
X-Gm-Features: AcwNN1URkRSQsxTlCS1AkYCaZYHp_UGH2AcjGLEgcywIPONdLTrdjIQPHpbJFxk
Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] arm64: dts: renesas: r8a779f0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 19:59, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
