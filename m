Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F23F871B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524554; cv=none; b=A2Ab6BIyrSmFy4AxWLJnkd9fWcPF8Bs1t2pt5iUIcqeHw5O7UJpVnFrG2MvL8b2lRkAVAsc20PCPRVEDNASFLZMd1pQ3Oi3birWDxVDX7YU52aNFrrxRXGvTb0QeaPZjXYfRJ38MptehBZX/tyGQhVyyQjagRQhLlONnvHSgDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524554; c=relaxed/simple;
	bh=vjaQgjeSeDSWekFLIKX6/r8ecgd8zwyE1GwfTXL4Nb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/IPL/N+x+V8xR/vS3u5tgZt2eTY0Im0bY+sqVvvd7abcIb2/IG+agIL9GZCNDRyvLVyhcTUTb5PA6o+BRna6I11Z43o4Xj9PHW0xV0VxFNgkVtuvvIbj8t9Ra85fYv9RGM+DPl3p6QkoA6Fpi6/2yEQIcUFF+SBP7u7XNxdsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so290637241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524552; x=1789129352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mDtuYgjcDY/xg58xIH9H2reGhfYioaWqgEAldYn7pM=;
        b=n6FfzELsOWuMK/mrRkrCysDDuwQ91D4Y7ftIYl1fzOoQ1TjYvpyACZLj11i2zlANuk
         DZpwgc0z54Zr2nQ+JNaLuxTaw6/ZkmzGwKN3iRNofGDpt/4apVJAY8RVF0rq4AMcO9SX
         6LOisrZmk2MU58mWdOgo6MtDMzxN6KrqXdtNqjJD0fdKEP22aJ0aB29o7qG2BYL7tWZR
         xDUuHW9EqGXR19vB9PzrJ65itPROe52yCFgkDlOJf6kXc/rXbPHj56pDP3aMuC2wkrea
         AuhZ/Fy1MrL6SBZJtSDrCO9Ump+OmhABSUEcYlhMPSTjRnTQh5QaCfSN42IBvR01ttmY
         vrnw==
X-Forwarded-Encrypted: i=1; AKwUvBy5MAu2vRxtxG/w2vHrdJG3aSOoEvdOAWQLvy1qYF+pxs1iidJq5i+uLM1C/MCpakhEgBdBjNl4GEkpqa1ClosZhA==@vger.kernel.org
X-Gm-Message-State: AFuF++lz6nwdSBo3+ALzi/0Eh4ltczM6zhyB+yrm8iI+IPva9C5uWCE7
	5yVDckX6GDX+/G7d214Dc75CFQBZE6YwQXitLTqGhL8b4zGDSPP13E+fVpXtJ3R2EbM=
X-Gm-Gg: AYBFou0oUBPua85UtdR53jBMmk5xY0gw9CakORuTZcF6RPTFZbCAKS8ouj2YR9gPkS7
	L84qxXYMVfLozOOlDkcSKU1EBmZwGHGpTxcak0Or6fPNIQIuJnrasCKilN9gy1oAGHXpjSA7u4b
	0/q8bzHKmre/lnjwlXaHSMJg0admogQnqIx2Ac97jmnB0PKHGxO1aIp99XYonDXcIMXsF6i50DL
	ispHQwjDpuymDmhCJJ16UaQGif86ZiNCKYrMWQlv44MCbNykguS7lC0TaupKHoPQSuvmELQp7jP
	pHJQYPPHSil2zzT6LnwXtqdJEnC++cs8rb+qvHu50zjkaONJJ4bkdxjv6SKZ7KoM21lrBAFY5Wa
	h4aPbGgXwgSvWDC2WPOnbXM9KcW2L9VxJsyqoKL0enW4YRNy/hgZHzeBeA20JUvmZo8zfJEv1r/
	U3LN9gQ8Q/yTmSAos9y5D+X/pG4fTuNjgsC+FBus63tFojmDXrPCbpJqqvuq8WH1wmmBUIaj8Sx
	fSUNKtP6ixuUedbGSlMfYUPVE2CmfbNMj7q
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr1442558137.11.1788524551703;
        Fri, 04 Sep 2026 05:22:31 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm1599095137.7.2026.09.04.05.22.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:22:30 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-75e2905c09aso201956137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHoesuv0lYVwl2Qx6FdIjfft/Ykm5bBJ6L5fSasac4XvGApJNt+5Hj+GnkOjPSU2YijJd/Od13ib0Pp+V/tSyS8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr1483195137.9.1788524549478; Fri, 04 Sep 2026
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-2-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:22:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
X-Gm-Features: AcwNN1VOyxrsSm03PmZn55Uovue1s6XEkpvSES0-J6cXzlUAe5_K8yXLbqCQsDU
Message-ID: <CAMuHMdVZ_X6rHoC5jjCRv1d5OT+YdCibKu_S3Ni++=Mow2_Efw@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow input-/output-disable
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> The list of allowed pinconf properties already includes input-enable and
> output-enable, but omits their -disable counterparts.
>
> Each pair controls the same bit. Where enable (set) is supported so is
> disable (clear).
>
> Add input-disable and output-disable to the list.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
