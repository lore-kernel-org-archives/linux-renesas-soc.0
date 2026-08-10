Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B56F3D9DB0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370530; cv=none; b=t43S/ThJOUu/0XG9MgBmZ/YefX8YyoBAEYDN1ewgUByPQQf4Ik3rsrm1yRrFuazKsoKmmDA+XId1blnCNevNOP878ePtxg1PUKeyeZDOzXn6ZVIrMyCKsBpnyvMPkoEXX65f5uMoGx2pPV0jyXuHw5HExO5sDDzlHOg1SOdyefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370530; c=relaxed/simple;
	bh=+49H72wzW6N8bjn12Wyc5oS2Vh9uUPL5RjM5Gza56wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5raIxZ/RrGL0aKuV7WIO8wgD0XfhMXfCCclpTREG4Xsz4fvwQP9mjYWNz/OTHVRsYi6pmAzFOCO2nm7LwECp3rva8xjAsMMxxVcY7DtrYEqu24UhDd9NOwi1jbabOAZY+LynGR8KNJkRaIJoyZBC3MeK1UZYylA2vqj5z2igLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee4399c423so1147196a34.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370528; x=1786975328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmACebBfyQcjcArQc12qo4s2Hk/XInMFxhT8kxQZcwU=;
        b=mlillDJGPcEHnwgKi1+vypR9fMARyCjW8MDaqHPSI87nJuNdeUa0mN6uAxlkJUbGdb
         TLkJjfHcNFePOdODei8JxOnHlw3rw0OJ3vfj6miUCLQ+J/FWhx4o8GWPoieRa8NoYgr4
         QIIu790w3eQI30SpNZqfeG7IYZ192+1bXTtKRzZj7X7ktlngSyhSk32vV5dzvfaai/bM
         em+JStTVNOBu+ECcbQmKgo5p8vmydRpnMF2X8wV06isKFtoaTQyHdwSGRvnOq/fH3eOK
         sgZemEuh8m26M+2qH7BPrlLFcWQZirg5cXo80z4JXoh7mBL1Du1vVYTBsqYgQ2Tw6SgY
         OniA==
X-Forwarded-Encrypted: i=1; AHgh+RqWZvQS2Cc8EIHxMNOdkRBjt81S61S/H643IDYgg4/dWDun1ntffoU5DzEF7raPpnnwxVVK3QC63USCA9pnmwoaLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqqhX9OF6/v5mBoAA5XlRxUkMYxOfiJP1EsuOrfFt/WkE0OYc
	OqBJGxLxUaE32nQTyZdyVTH5ibRXiCcBgLvRSJn2/CX4niP9CB0mUAmxNlc4vnGj
X-Gm-Gg: AR+sD133VsP1BI5f5TfcnBlVzWuAM0oYhvQhQusgD219Hs13l0lTsLYw9rOqKgPZwjH
	YarG/bE5exAv3neBzgRUuDysls+vyiHRp+9Kjn+0FRNaQvNmMMHRh21oRnJ+0nfTjrgMK1r56XP
	ZbNrOt0Pg6MhbInBKLMVrQsEO7CfRrly5Mr+in0DpnAWnmfQpPFVRnf58o9sD6wgmyWctDmsNQ8
	xbtT85H4VHmHrR2ZDSrPHafADpbBeRFlaFDzuSJ5cDcMVxgHzn0PBOCx0Bv/6dUWTZ+qwJ/PdKr
	219yiItjXHkO0oiz6VrOtnSqz0wU7hNkifnkuJAnw41IbvnizzXMlTAPEEcsGXCBc6OSsJzpSI5
	IjYBVXEK95dDxutn1MUAZ96Oi+4Q5TiPAqAmU+Voqtgjyv7Y0diQGky87H0Z/VNGTEcxasN0p+Z
	8K6Q6txdIZIi2pdT/q9e6TELa4LfuZXDVApnSXnrPruCCX/1Q9i5qGTvlDoeUy9RuiEXJXadWH0
	ctzSbkkSo9sRP7zrFyAVLQu1w==
X-Received: by 2002:a05:6830:3783:b0:7dc:4a43:fb5c with SMTP id 46e09a7af769-7f34ded3fdcmr19107593a34.11.1786370527798;
        Mon, 10 Aug 2026 07:02:07 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b806fb3sm7506388a34.25.2026.08.10.07.02.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:02:07 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b026020b92so800971eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoCfq260byvkNBnL7v9LFGhHB7wWEpvLM/jvn5XEMq89sXUPHIrIR3FFICh4qfXbcRA5W6mmGYOwW+tvLh1s6I8pA==@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:739:5cfb:50f6 with SMTP id
 ada2fe7eead31-7634d10fb7fmr9198315137.11.1786370137779; Mon, 10 Aug 2026
 06:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com> <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
X-Gm-Features: AUfX_myvCDbZrLeq5_AkwBFoQaj9KuC2_xzwhuBv4cnxNXwsS1wJ2BykJXirplM
Message-ID: <CAMuHMdXcCDcPiQh9DEL7ujWSCQCvqMZHatWZhHha-2-JBo4oKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1
 clock frequency to 1 MHz
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 3 Aug 2026 at 15:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On the SMARC carrier board I2C1 only carries the DA7212 audio codec.
> Override the 100 kHz SoC default with 1 MHz.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

According to the DA7212 documentation, it supports 3.4 MHz, too.
But given the I2C bus is also exposed on PMOD, GPIO, and M2 connectors,
1 MHz is probably the safer value.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
