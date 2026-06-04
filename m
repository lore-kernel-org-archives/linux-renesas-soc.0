Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698747B439
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577887; cv=none; b=HDzZKBt3pq6p51HsOSTqQftCcksM55kYRPs6Cn2QENCASSocILF11X/sCicXrHfidVJRsb6C7mhKQm4gOSgfAHLlFFnqklU/5lQllm9Fai9EHXCFumvRheJp2pbPL89XhFO3MuKZVw2gD4jxgGfZsTW2rbB9FNC34BiUAyB/CM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577887; c=relaxed/simple;
	bh=3BozIRFX0XVcRPh14qUSvxNfEz+3z1/4Q1ijWbUu76g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN+AIsvCkUBY/OI++riBWUFmRSeCvwUqQ8P5JFKXcgQSa7b9Ol/DvaEDRKGT0vco1oxUFrVV2x7YlfnjvoSu3i7icaW3/n0OIHkYDROJJJyDtuvqNOp8WgoMzfcz1w2IxQXk+rHNEEkZ7WMTTqy/ljGwme+mKaTA79bMf8idkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so204916137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577885; x=1781182685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+cgkG2XrmSprydcdZSXs4CV5HHl1wWqa+3ahlLHMPk=;
        b=BaexGgT9JHIGOh/eBGPdb8KejRQQshpwsm/8+wlr4FQz+9nVVRbSXt3KW+pnvi0xyU
         9cXP0PZBitDXsVG7QSjuYVOz1BNWMe1iUDca55KQssQCWIuUAGFPP1NuIOimrDMxjim0
         EzsRUvBr4IlYAZgXDlxEZrWMU0C0sT2gnPh+WR38RCfz43MkGpCUv40MkOP9GzHvq9Rd
         LJtBjzrv7ssrw+OaiY6Sxg9OQ0Tj+N6f0lZNZTjHLMwAtfsdYM8ySqU0eHZsmNkQchVs
         vxpsOU+HxFR2tUTpfmVwkw6puvbiUDo4nbHjCHTGeO3tikyVIjrXYE8jGCXmbwzAU15t
         bp7Q==
X-Forwarded-Encrypted: i=1; AFNElJ88AU37DbtFai1XDAJtycgsi2goWhFxCyX5AHnDTfIeMthf5poZUuohFfS4lzqb4qz/GT4gpkNbwiNNtDzT8Q6rOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysVodP69RF6shAzWLw1HSoqCA9Dasdu58W0N6v5vpd1gIIaBav
	OmuZ8cnbzMtyGKFrdqsOtadRyWsFuQcI/0mGxmqYXeGCanyLPKtnoxg8ixJEZ6pWL80=
X-Gm-Gg: Acq92OGyOFAtg3H6pnzp5FKWh9J88RyeXIlCnaVzWfS6EphitRdWYpVdjTNgYw+ty56
	Sdvm2mCMtF/igy/9JWCToQnNK5aI4PCsUKQQG9GoJk0f3bI2UWpZaB38GtYofXeVK9vBmCi18wy
	VsYg1UFboRoEwjGO6NddnIrMyy6825tn1/gdAbOVlyKNBPFOjeazz+f1x30QsaD9Y364OeZNkHy
	zi/535PlU0vKto+vUYLI4Zm9BNCW6tvrMlj9S70Vs7Wf2hVCYBjU5ym2uhyJPn9v9JiNFcV4GtM
	nZ7oRHZunnw9DPbcx5JgOk0TMyX0OlL5uRhAM2nEp2XPNiktEI5ekG5LiFISFcJkHo6WQC6jhCb
	TE/KuClILvQUPf9i7hkIAAYp2Omb+0huLEd+y7l2GsQWjGIiWJVF0w8hRKuE8t4XNltAuOZ3dJX
	CimEVzX+FUW4PdpRj11g1f+1lYYpl0fzDAbceURtQIGSRgqWPIqKzAycUrb2KEMJWZrmCFP/6w0
	4/7khbOaA==
X-Received: by 2002:a05:6102:3747:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-6ec2d7fdf2amr3841111137.9.1780577884753;
        Thu, 04 Jun 2026 05:58:04 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414115a93sm4370962241.9.2026.06.04.05.58.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:58:04 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9639a2d4c53so186446241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8LqWF/ZkL5H74EaK2dde+DsFF0znIyeh9EzsWOcgb3d34UX/d4hgPvxIfdsPT3iqfPY8+JpAmKAdeMM2sDPPEZeg==@vger.kernel.org
X-Received: by 2002:a05:6102:3ca0:b0:60f:ac13:c99 with SMTP id
 ada2fe7eead31-6ec4c6a7de4mr3907416137.29.1780577883424; Thu, 04 Jun 2026
 05:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603143340.162457-1-biju.das.jz@bp.renesas.com> <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:57:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpoZUcaFcX6t5BACbsPBmteWPvYQ6Fgg+U05fLtp5RKw@mail.gmail.com>
X-Gm-Features: AVVi8CeUJOt-NQH728msRWjz_l9ffseYZ5NXxBnD-eyJOnoWkw_RXypEGFc9mw4
Message-ID: <CAMuHMdVpoZUcaFcX6t5BACbsPBmteWPvYQ6Fgg+U05fLtp5RKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Add max-frequency for
 SDHI controllers
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 16:33, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add max-frequency property of 200MHz to the sdhi0, sdhi1, and sdhi2
> MMC controllers in the R9A09G047 SoC DTSI to define the maximum
> supported bus frequency.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
