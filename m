Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679949429A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397307; cv=none; b=Pgi4bZgugaWGTkMsisXvGLq0YTKIErIrDdCsjNaGtvNyaYlRa0TNF5zOBwsORxnvZZDtCHXVyDsvCejkju8WCeO71UwmOTOVkwjpnXUpRZjnPh5zubHdoNeCQ6yMVT6pCBWDVCtSKqenZi0z6gHCEKr4BrLGzwGGxIbay2vsqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397307; c=relaxed/simple;
	bh=QfENBpcHhADpjfd53lUe0RxsDEJq18op5rWidDM1g4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiNSPJuwCtAjRUigMoTooHEdjitjSI4vwBp/gmmVsFbjew8B+x7Xfu6oz+DIWKKD0m+x2gv7zhy+NLZ0gYmxzTrGkGf9SqPPXJG2h4bFKiL7jEijaVzJd7+0tIniLbXbKiNMC7hqdngOQboWLq3X4Kc/bLyU5hCX9sZ/RbzQD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso243180e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 01:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397305; x=1793002105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=botmgDWh3QU3uykH2zSrPm6okwvbkqaZK5yti63bokk=;
        b=wxw/fdnJXnefK08Y8iMH9P6+EpXw+7GJJr9gArdv+tPwQXy1bYwlF3XTxBHeR/DT/b
         dSCqSGaWKteqOVs1EYlp4VUJulCmRU1SIOIuQATgRh9UE1c666AHSAOlWmSHccqTzLeb
         aSjJXARybNsA4YLBbkYCGIPAFCUCweGQVh6IX48tlkny2xt/A26qJqCZSOy9+e7r0STJ
         IDuxJSxk2ThXtqEzuCYRui3P433AmwOfUEqgM3I4FLgNW7uzPQrXkOJEf0H+KQIKhH4c
         oWDCi2VLxewLpLGXB3ibV5//YDL+nfLATXkvu5iDI+/j8p0bhtKTbvKqit3A5BlVUppJ
         anYA==
X-Forwarded-Encrypted: i=1; AKwUvByZ+MfrEYYm5i7gZeA9MXAWkPwRferulXE7MXh4dyo0zwiP8JgV7oGZyPycIrvaa0CXgtIZQ42xKksyjl/Z8jEYjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5nHB5FYom5aSfAS4l8PD9ahhmjyGFDYgRRafkfhOiGhnhirCh
	Cr6ANS7JEGAUQTNwcq72uOvdxVfcFxBNEkiFQCAQyfngLRVExp4+rsD3/PZv5kWA
X-Gm-Gg: AYBFou2DAO3v0/+R4evj6F09+jIo8LGJ5ACpchvJMWzyBbXTMUFVjAFhmS6FcWHS825
	/XH/ndaBK2XucB+kjE2EH8FreF/V8TtftINU/wP2PBZg7vL+mc0DdT0aBihHIBmS0ifiBD16Kqx
	GRYGvqVKvZWfuLmfcJUppePvy07pKWDzedkrThdw6ANug7WCb3SHuWDrye+eDuTySsnaFT3LWvS
	0GNLcOYuVUc1xPxP4IMJ/CQycQL2I2Lcz116TxVgQlQNbiba1D9210+KfEh+TQnV70qJ9RKZ0+T
	5SEvBVE2Ukvac3bdqPRJTtk+AFcU7F8oENNq9hPrKEC07hR0sXA220MblsP2Vawfc+6rGVoddeD
	eVZX1QlQ3GBlJzxG6ppWqBddRRsouIfyXupQUd/sOv7wRc3woXkusOfXvXbh2lQDWzKSP4bjwcq
	HWFoAF90BH2CypGX34ONofKzaHMq9dMAJ+FuAQ34ppHY4d+/bBTJe/BcZe8cSPnxXhD2WFWDKV0
	7J6mcaAZEFjKPvKoVH6WaSffG3MYHKYskYqJughWzkqQjM=
X-Received: by 2002:a05:6122:8616:b0:5ea:a173:65f4 with SMTP id 71dfb90a1353d-5eaaa414d44mr2640297e0c.11.1792397304717;
        Mon, 19 Oct 2026 01:08:24 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eacd020162sm1613302e0c.10.2026.10.19.01.08.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:08:23 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so393621241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 01:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwEsipdJQK8HILBObu9ZnRY9zAueOmPpuURs8lhiM41vKI1FBLkMxnKBRMCEysze+xe8aFVi+q5Z/OmZ5hmWRZYw==@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:7a1:f980:e934 with SMTP id
 ada2fe7eead31-7cc369c0d0bmr1772093137.16.1792397302431; Mon, 19 Oct 2026
 01:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019022717.511096-1-artem122novak@gmail.com>
In-Reply-To: <20261019022717.511096-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 10:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
X-Gm-Features: AclHuK_PpER2TShAXTflyONo_n8Icmw2EzWmH61DvSpoBwL56FzjhvRFzzvqUgE
Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
To: cacioandpepe <artem122novak@gmail.com>
Cc: daniel.lezcano@kernel.org, robh@kernel.org, geert+renesas@glider.be, 
	tglx@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Mon, 19 Oct 2026 at 04:27, cacioandpepe <artem122novak@gmail.com> wrote:
> From: Artem Novak <artem122novak@gmail.com>
>
> The Renesas SH7305 includes a three-channel Timer Unit (TMU).
> Add its compatible string to the Renesas TMU Device Tree binding.
>
> This is an RFC because SH7305 TMU0 Device Tree support is still
> under review.
> Feedback on the proposed binding would be appreciated.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -21,6 +21,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,sh7305-tmu  # SH7305

renesas,tmu-sh7305 (+ sorted alpabetically)

>            - renesas,tmu-r8a73a4  # R-Mobile APE6
>            - renesas,tmu-r8a7740  # R-Mobile A1
>            - renesas,tmu-r8a7742  # RZ/G1H

Probably SH7305 does not support module reset, so "resets"
should be excluded, cfr. the proposed bindings for SH7750:
https://lore.kernel.org/3b3f41148158aa146f06a40aeb5b23c8611b1895.1716965617.git.ysato@users.sourceforge.jp/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
