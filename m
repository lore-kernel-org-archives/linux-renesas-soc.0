Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C763749E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164552; cv=none; b=Rowz6irMzMlCh08NFlSAr1NWFwxPKRYQqm7V0V2R+imn8uPSd4pBBWjjGn8mZENVQZBGvfR6ceiiGHnFiPm3+oEHlTCKgrgmmvlUQ5bAuF4iHGsjGbpYw4YON6aweWHZtjBIU5sORiLuIQlY+HVoxDGGFNETQrm+/Ds3t/gt+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164552; c=relaxed/simple;
	bh=cdUu+2P+AtFzsdIyFUxyBK0BNNipSTAuWCzqPtH9ZDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfCeLlJGpzjhUGsww5a2koHTeDZxq8HEejr0IP3tE1pYcFs3vbSHuJouB7MMeRwFn/QO7/RVm/4TAslPPMaO+x9ppVpraDhYtd7xbrYtFTR/p8SgcwdHDKAwgtoJpXXw4sULut/AcGa74gw6DjOk0PUDhmfeZkOjDUUt8MXz4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aab5dae09fso777762a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164536; x=1790769336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/j7x66zXOrBYdEe6fVcwfenLhVDHg3t8DyPsU453Nk=;
        b=Oe7UEXRF0gqbk25XCTK8Frv4MM1r+3T8Re4cFkYDW+eFVtbyZ0q5Gw1L2Cu52C41n4
         /jOuNoy4aXvLmzQEFz+u31jEXat9lnlhVRyafjCx7j5Z6SZsY3fdexsXBx4UAMQJs9vP
         kwxwbVBy9zh4Xj3S9Es+fRDeYfdm5RmKOXROQL2ltLaesgasShbfTb5GhGBBfGXhwVA2
         B/o+IFkkYdAe8osFVFFGurlVaMvd2Kouc7QuOfi8Et1PwQ9AJHw6o9yO44qbyjyuuYjh
         i34bK9VXwM4Rz8ikg8wVcu7QkefwvKrKjGI9vb6tPIG8zf9tXFzyPEVJwQoUjc9IXmA/
         TTDA==
X-Forwarded-Encrypted: i=1; AKwUvBzAlEdD64x1ZKozIyAii4CwZzn98y0Dinho170/317Clc7WFSosbfF7LN7hRw3JEKvj3vkqgvZCY+gMN6MAmWWpcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mZJuEYiAyE/ANOuiaa1bke2XWmOXLTaRbW+XIMP1DvcrDB2cm8
	oKOVPJEBvbVwArEtN8dkoXUsTvzUoPeweB12n/nQjXVkvij+KRJI3YEUwmyZkNwa3tg=
X-Gm-Gg: AYBFou3L5QaMaHFqGvFAk22v1b34c3vbRGdd1wSNhwAFfXE6g73tJa2CvwWchXaa5Wk
	nzjPkyAEpcwXq2oPwOY/dZ7vvlEFLEMkYtd2OhUORAy+wSjqJjrgyj29y0z3DmTnGFHHVCp/LzS
	oicG/x41j/U9JZ/CeE42Fji5IJQaKmp2AAWVd81lOm60veSJc4ptqGxHuTATfZtxHZvCciPacuG
	uP4SvVPGIi+JAowIDidtt4h9WfVie/CWkrIk9Up53gJtUx6ZfvdYldFiaaPwXSkiIvGGxWhpsP6
	6MpdsI/0hOTM//rlY8PVR9J+LPI/v0ZBquaO8r3enppMty2C4rGQwerNFm1wkbUkkJsBmVujySg
	JdylSPf+ccchbJMaAAIPtf4YTcWv9VF2mRmBoc9bpmlB3po9Izo7wom+LaNs/A5RpwGf7EXgDvy
	nLWYGF5nK4AhR1SZGPfapokkI3CL84fBmLoXnpdV2Oa/6CIBzWwb1VPF18+FotxaK8RSBGUAkAk
	iAQZIQzbvJhsSnVTeRgVCIXi/c7OX+menR2RA==
X-Received: by 2002:a05:6402:21d8:b0:6a7:f18b:a309 with SMTP id 4fb4d7f45d1cf-6aab3b523b9mr1830715a12.16.1790164535858;
        Wed, 23 Sep 2026 04:55:35 -0700 (PDT)
Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com. [74.125.228.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eadd4sm1528009a12.1.2026.09.23.04.55.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:55:34 -0700 (PDT)
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1308706a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvSPcs16CiJoB+fMavg7++RLxeh3EIp4J7hxiPhV2WcFgdPbqDxyS9xr4hDBeDtk1SUUTs8PRAhYMUEeIdvR/WcA==@vger.kernel.org
X-Received: by 2002:a05:6402:23c7:b0:6aa:9fd4:987a with SMTP id
 4fb4d7f45d1cf-6aab3b985dcmr1953506a12.20.1790164534610; Wed, 23 Sep 2026
 04:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:55:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
X-Gm-Features: AclHuK9-osA0MxsPMPyeNE-WDoQrmvKbRa3ko9lUZaESlIsKhQY66FTC8uoGLsg
Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 main board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for the HiHope RZ/G2M v3.0 (a.k.a. R8A774A3) SoC main
> board.
>
> The RZ/G2M v3.0 SoC main board is similar to the RZ/G2M v1.3 SoC main
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. I2C, GPIO
> and sound) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Dropped bootargs from chosen.
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC main board
> + *
> + *Copyright (C) 2026 Renesas Electronics Corp.

Missing space, as pointed out by Sashiko.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
